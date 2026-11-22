package app.bardo.letterboxd.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.database.Cursor;
import android.net.Uri;
import android.os.Binder;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.security.MessageDigest;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Puerta entre Bardo y la Letterboxd parcheada. Lee datos y, solo para la
 * watchlist y el diario, también escribe (watchlistAdd / watchlistRemove / log).
 *
 * Bardo llama con {@code ContentResolver.call("content://app.bardo.letterboxd.bridge", metodo, arg, null)}
 * y recibe un Bundle: {@code ok} (boolean) y {@code json} (la respuesta de la API de Letterboxd,
 * serializada por la propia app) o {@code error}.
 *
 * Métodos:
 * <pre>
 *   ping                      estado: sesión iniciada, versión de la app y del parche
 *   film            tmdb:603  ficha resumida (trae el id de Letterboxd, «LID»)
 *   filmStatistics  tmdb:603  nota media, histograma y recuentos
 *   myRelationship  tmdb:603  tu relación: vista, nota, me gusta, watchlist
 *   friends         tmdb:603  qué han hecho tus amigos con la película
 *   logEntry        id        un registro del diario con su reseña
 *   watchlist       [cursor]  una página (100) de tu watchlist, resumida; extras «member» = otro miembro
 *   watchlistAdd    tmdb:603  añade la película a tu watchlist
 *   watchlistRemove tmdb:603  la quita
 *   me                        el miembro de la sesión (nombre, avatar)
 *   reviewStats     id        me gusta y comentarios de una reseña
 *   log             tmdb:603  crea un registro en el diario; extras «jsonB64» = cuerpo de la API en base64
 *                             (diaryDetails, review, tags, rating, like), sin filmId
 *   logDryRun       tmdb:603  igual, pero solo valida el cuerpo y lo devuelve: no publica nada
 *   logDelete       id        borra un registro del diario (el «Deshacer» de Bardo)
 *   tags            [texto]   tus etiquetas de diario que empiezan por el texto (vacío: las tuyas)
 *   events                    acciones hechas DENTRO de Letterboxd y aún no recogidas por Bardo
 *                             (guardar o quitar de la watchlist, marcar vista, registrar, puntuar)
 *   eventsAck       marca     borra las acciones recogidas hasta esa marca de tiempo
 *   topPositions              posición en el Top oficial de hasta 100 películas a la vez;
 *                             extras «ids» = ids de TMDB separados por comas
 *   watched         [cursor]  una página (100) de TUS películas vistas, de la más reciente a la
 *                             más antigua, con tu nota y la fecha: {"items":[{tmdb,r,w}],"next"}
 *   setLibrary                Bardo deja aquí qué películas hay en su servidor (extras «ids» =
 *                             ids de TMDB separados por comas): «Dónde verlo» muestra Bardo en
 *                             ellas sin preguntar nada a Bardo. Solo se guarda en el móvil.
 *                             Extras «recent» (nivel 5): las últimas añadidas al servidor, de la
 *                             más nueva a la más antigua, para la fila «Recién llegado a Bardo»
 *                             del inicio. Solo ids de TMDB: nada del servidor sale de Bardo.
 *   diary           [cursor]  una página (100) de TU diario de un año (extras «year»), del
 *                             registro más reciente al más antiguo, RESUMIDA y solo películas:
 *                             {"items":[{id,tmdb,n,y,d,rw,r,l,rev,t,avg,top,p,run}],"next"}.
 *                             Cada registro trae ya la nota media de Letterboxd («avg») y la
 *                             posición en el Top («top»): no hace falta pedir nada más.
 *   member          usuario   el id (LID) de un miembro a partir de su nombre de usuario, con
 *                             la búsqueda de la app: {"id","username","displayName"}. Para leer
 *                             su watchlist con «watchlist» (extras «member» = ese id)
 * </pre>
 * El argumento admite {@code tmdb:<id>} o un LID directamente.
 *
 * No toca credenciales: usa el cliente de API de la app (LetterboxdAPIManager), que añade él
 * solo la sesión del usuario. Todo va por reflexión, así que compila sin clases de Letterboxd.
 *
 * Quién puede llamar: solo Bardo (nombre de paquete Y firma) y adb (para probar). Ver
 * {@link #callerAllowed}.
 */
@SuppressWarnings("unused")
public final class BardoBridgeProvider extends ContentProvider {

    private static final String TAG = "BardoBridge";
    private static final long TIMEOUT_SECONDS = 25;

    private static final Set<String> ALLOWED_PACKAGES = new HashSet<>();

    static {
        ALLOWED_PACKAGES.add("io.github.trvnce.bardo");
        ALLOWED_PACKAGES.add("io.github.trvnce.bardo.dev");
    }

    /**
     * SHA-256 de los certificados que firman Bardo: el de Google Play (App Signing) y el de las
     * builds de desarrollo. Sin esto, cualquier app instalada con el nombre de paquete de Bardo
     * (si Bardo no está) podría leer y tocar la cuenta de Letterboxd del usuario.
     */
    private static final Set<String> ALLOWED_CERTS = new HashSet<>();

    static {
        ALLOWED_CERTS.add("db13b5cd6a0146d7f223682174a1bdf183e72a0cea280483d480e46b83bed467"); // Play
        ALLOWED_CERTS.add("e77135065b2bbc1a3c8492051bf220b4d8a5dc98f93de2da9ef062c70dd069e4"); // dev
    }

    /** tmdb:603 → LID. Los ids no cambian: vale para toda la vida del proceso. */
    private static final Map<String, String> LID_CACHE = new ConcurrentHashMap<>();

    @Override
    public boolean onCreate() {
        return true;
    }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        Bundle out = new Bundle();
        try {
            if (!callerAllowed()) {
                out.putBoolean("ok", false);
                out.putString("error", "caller-not-allowed");
                return out;
            }
            String json;
            if ("ping".equals(method)) {
                json = ping();
            } else if ("film".equals(method)) {
                json = toJson(filmsByExternalId(require(arg)));
            } else if ("filmStatistics".equals(method)) {
                json = toJson(callApi("getFilmsAPI", "filmStatistics", lid(require(arg))));
            } else if ("myRelationship".equals(method)) {
                json = toJson(callApi("getFilmsAPI", "myRelationshipToFilm", lid(require(arg))));
            } else if ("friends".equals(method)) {
                json = toJson(callApi("getFilmsAPI", "friendRelationships", lid(require(arg))));
            } else if ("logEntry".equals(method)) {
                json = toJson(callApi("getLogEntriesAPI", "getLogEntry", require(arg)));
            } else if ("watchlist".equals(method)) {
                String member = extras == null ? null : extras.getString("member");
                json = watchlistPage(member == null ? null : require(member),
                        arg == null || arg.isEmpty() ? null : requireCursor(arg));
            } else if ("logDelete".equals(method)) {
                callApi("getLogEntriesAPI", "deleteLogEntry", require(arg));
                json = "{\"deleted\":true}";
            } else if ("me".equals(method)) {
                json = toJson(currentMember());
            } else if ("events".equals(method)) {
                json = pendingEvents();
            } else if ("eventsAck".equals(method)) {
                json = ackEvents(Long.parseLong(require(arg)));
            } else if ("tags".equals(method)) {
                Object member = currentMember();
                String memberId = String.valueOf(member.getClass().getMethod("getId").invoke(member));
                json = toJson(arg == null || arg.isEmpty()
                        ? callApi("getMembersAPI", "autocompleteLogEntryTags", memberId)
                        : callApi("getMembersAPI", "autocompleteLogEntryTags", memberId, requireTagInput(arg)));
            } else if ("reviewStats".equals(method)) {
                json = toJson(callApi("getLogEntriesAPI", "getReviewStatistics", require(arg)));
            } else if ("log".equals(method) || "logDryRun".equals(method)) {
                // En base64: el cuerpo es JSON y así viaja sin problemas de escapado.
                String encoded = extras == null ? null : extras.getString("jsonB64");
                String body = encoded == null ? null : new String(
                        android.util.Base64.decode(encoded, android.util.Base64.DEFAULT),
                        java.nio.charset.StandardCharsets.UTF_8);
                String logLid = lid(require(arg));
                Object request = logRequest(logLid, body);
                if ("log".equals(method)) expect("watched", logLid, true);
                json = "log".equals(method) ? toJson(createLogEntry(request)) : toJson(request);
            } else if ("topPositions".equals(method)) {
                json = topPositions(requireIds(extras == null ? null : extras.getString("ids"), 100));
            } else if ("watched".equals(method)) {
                json = watchedPage(arg == null || arg.isEmpty() ? null : requireCursor(arg));
            } else if ("diary".equals(method)) {
                json = diaryPage(requireYear(extras == null ? null : extras.getString("year")),
                        arg == null || arg.isEmpty() ? null : requireCursor(arg));
            } else if ("setLibrary".equals(method)) {
                json = setLibrary(requireIds(extras == null ? null : extras.getString("ids"), 50000),
                        extras == null || !extras.containsKey("recent") ? null
                                : requireIds(extras.getString("recent"), 100));
            } else if ("member".equals(method)) {
                json = memberByUsername(requireUsername(arg));
            } else if ("watchlistAdd".equals(method) || "watchlistRemove".equals(method)) {
                boolean add = "watchlistAdd".equals(method);
                Object request = Class.forName("com.letterboxd.api.model.WatchlistUpdateRequest")
                        .getConstructor(boolean.class).newInstance(add);
                String watchlistLid = lid(require(arg));
                expect("watchlist", watchlistLid, add);
                json = toJson(callApi("getMeAPI", "watchlist", watchlistLid, request));
            } else {
                out.putBoolean("ok", false);
                out.putString("error", "unknown-method");
                return out;
            }
            out.putBoolean("ok", true);
            out.putString("json", json);
        } catch (Throwable t) {
            Throwable cause = t instanceof InvocationTargetException && t.getCause() != null
                    ? t.getCause() : t;
            Log.w(TAG, "call " + method + " falló", cause);
            out.putBoolean("ok", false);
            out.putString("error", cause.getClass().getSimpleName() + ": " + cause.getMessage());
        }
        return out;
    }

    // ---------------------------------------------------------------------------------------------
    // Quién llama
    // ---------------------------------------------------------------------------------------------

    /**
     * Solo Bardo: el UID que llama tiene que ser un paquete de Bardo FIRMADO con uno de sus
     * certificados (el nombre solo no basta: si Bardo no está instalado, otra app podría usarlo).
     * Y adb (UID de shell o root), que ya tiene acceso al dispositivo.
     */
    private boolean callerAllowed() {
        int uid = Binder.getCallingUid();
        if (uid == Process.myUid() || uid == Process.SHELL_UID || uid == Process.ROOT_UID) {
            return true;
        }
        Context context = getContext();
        if (context == null) return false;
        String[] packages = context.getPackageManager().getPackagesForUid(uid);
        if (packages == null) return false;
        PackageManager pm = context.getPackageManager();
        for (String name : packages) {
            if (ALLOWED_PACKAGES.contains(name) && signedByBardo(pm, name)) return true;
        }
        return false;
    }

    private static boolean signedByBardo(PackageManager pm, String packageName) {
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                for (String hex : ALLOWED_CERTS) {
                    if (pm.hasSigningCertificate(packageName, hexToBytes(hex),
                            PackageManager.CERT_INPUT_SHA256)) {
                        return true;
                    }
                }
                return false;
            }
            @SuppressWarnings("deprecation")
            PackageInfo info = pm.getPackageInfo(packageName, PackageManager.GET_SIGNATURES);
            @SuppressWarnings("deprecation")
            Signature[] signatures = info.signatures;
            if (signatures == null) return false;
            MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
            for (Signature signature : signatures) {
                if (ALLOWED_CERTS.contains(toHex(sha256.digest(signature.toByteArray())))) {
                    return true;
                }
            }
        } catch (Exception e) {
            Log.w(TAG, "No se pudo comprobar la firma de " + packageName, e);
        }
        return false;
    }

    private static byte[] hexToBytes(String hex) {
        byte[] out = new byte[hex.length() / 2];
        for (int i = 0; i < out.length; i++) {
            out[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2), 16);
        }
        return out;
    }

    private static String toHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) sb.append(String.format("%02x", b));
        return sb.toString();
    }

    // ---------------------------------------------------------------------------------------------
    // Llamadas a la API de la app
    // ---------------------------------------------------------------------------------------------

    private String ping() throws Throwable {
        boolean signedIn = false;
        try {
            // El gestor de API sabe si hay sesión aunque la app aún no haya cargado la cuenta
            // (CurrentMemberManager está vacío en un proceso recién arrancado por esta llamada).
            Object manager = manager();
            signedIn = Boolean.TRUE.equals(manager.getClass().getMethod("isUserSignedIn").invoke(manager));
        } catch (Throwable t) {
            Log.w(TAG, "No se pudo leer el estado de sesión", t);
        }
        String version = "";
        Context context = getContext();
        if (context != null) {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            version = info.versionName == null ? "" : info.versionName;
        }
        return "{\"bridge\":" + BRIDGE_LEVEL + ",\"signedIn\":" + signedIn
                + ",\"version\":\"" + version.replace("\"", "") + "\""
                + ",\"patchVersion\":\"" + BuildConfig.PATCH_VERSION + "\"}";
    }

    /**
     * Lo que sabe hacer el puente (no es la versión publicada del parche: esa va en
     * «patchVersion», sacada del {@code version} de gradle.properties). 2: topPositions, watched, setLibrary y la nota en
     * los eventos. 3: diary (el diario de un año, para el Wrapped). 4: member (de nombre de
     * usuario a id, para leer la watchlist de otro miembro). 5: «recent» en setLibrary (fila
     * «Recién llegado a Bardo» del inicio). Bardo lo lee en el ping para no pedir lo que un
     * parche viejo no sabe hacer.
     */
    private static final int BRIDGE_LEVEL = 5;

    /** Nombre de usuario de Letterboxd: letras, dígitos y «_», corto. */
    private static String requireUsername(String name) {
        if (name == null || name.isEmpty() || name.length() > 40) {
            throw new IllegalArgumentException("usuario vacío o demasiado largo");
        }
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);
            if (!(Character.isLetterOrDigit(c) || c == '_')) {
                throw new IllegalArgumentException("usuario no válido");
            }
        }
        return name;
    }

    /** usuario → LID con la búsqueda de la app; solo vale la coincidencia exacta. */
    private static final Map<String, String> MEMBER_CACHE = new ConcurrentHashMap<>();

    private static String memberByUsername(String username) throws Throwable {
        String key = username.toLowerCase(java.util.Locale.ROOT);
        String cached = MEMBER_CACHE.get(key);
        if (cached != null) return cached;
        Object api = api("getSearchAPI");
        Class<?> paramsClass = Class.forName("com.letterboxd.api.SearchApi$SearchQueryParams");
        Constructor<?> primary = null;
        for (Constructor<?> c : paramsClass.getDeclaredConstructors()) {
            Class<?>[] t = c.getParameterTypes();
            // (cursor, perPage, input, searchMethod, include, …), sin la máscara sintética.
            if (t.length >= 5 && t[0] == String.class && t[1] == Integer.class
                    && t[2] == String.class && t[4] == java.util.List.class
                    && !t[t.length - 1].getName().endsWith("DefaultConstructorMarker")) {
                primary = c;
            }
        }
        if (primary == null) throw new NoSuchMethodException("SearchQueryParams(…)");
        Object[] args = new Object[primary.getParameterTypes().length];
        args[1] = Integer.valueOf(20);
        args[2] = username;
        java.util.List<Object> include = new java.util.ArrayList<>();
        include.add(Class.forName("com.letterboxd.api.model.SearchResultType$MemberSearchItem")
                .getField("INSTANCE").get(null));
        args[4] = include;
        primary.setAccessible(true);
        Object params = primary.newInstance(args);

        Class<?> paramsInterface = Class.forName("com.letterboxd.api.SearchApi$ISearchQueryParams");
        Object response = null;
        for (Method m : api.getClass().getMethods()) {
            Class<?>[] types = m.getParameterTypes();
            if (m.getName().startsWith("search-") && !Modifier.isStatic(m.getModifiers())
                    && types.length == 2 && types[0] == paramsInterface) {
                response = await(api, m, params);
                break;
            }
        }
        if (response == null) throw new NoSuchMethodException("SearchApi.search(ISearchQueryParams)");
        Object items = response.getClass().getMethod("getItems").invoke(response);
        if (items instanceof java.util.List) {
            for (Object item : (java.util.List<?>) items) {
                if (item == null || !item.getClass().getName().endsWith("MemberSearchItem")) continue;
                // AbstractSearchItem$MemberSearchItem envuelve el MemberSearchItem en getValue().
                Object result = item;
                try {
                    result = item.getClass().getMethod("getValue").invoke(item);
                } catch (NoSuchMethodException ignored) {
                    // Ya es el MemberSearchItem.
                }
                if (result == null) continue;
                Object member = result.getClass().getMethod("getMember").invoke(result);
                if (member == null) continue;
                Object name = member.getClass().getMethod("getUsername").invoke(member);
                if (name == null || !username.equalsIgnoreCase(name.toString())) continue;
                Object id = member.getClass().getMethod("getId").invoke(member);
                Object display = member.getClass().getMethod("getDisplayName").invoke(member);
                String json = "{\"id\":" + quote(String.valueOf(id))
                        + ",\"username\":" + quote(name.toString())
                        + ",\"displayName\":" + (display == null ? "null" : quote(display.toString()))
                        + "}";
                MEMBER_CACHE.put(key, json);
                return json;
            }
        }
        return "null";
    }

    /** Ids de TMDB separados por comas: solo dígitos y comas, y como mucho {@code max}. */
    private static String[] requireIds(String ids, int max) {
        if (ids == null || ids.isEmpty()) return new String[0];
        if (ids.length() > max * 9) throw new IllegalArgumentException("demasiados ids");
        for (int i = 0; i < ids.length(); i++) {
            char c = ids.charAt(i);
            if (!(Character.isDigit(c) || c == ',')) throw new IllegalArgumentException("ids no válidos");
        }
        String[] out = ids.split(",");
        if (out.length > max) throw new IllegalArgumentException("demasiados ids");
        return out;
    }

    // ---------------------------------------------------------------------------------------------
    // Top oficial, tus vistas y la biblioteca de Bardo
    // ---------------------------------------------------------------------------------------------

    /** {@code {"items":[{"tmdb":"238","pos":18}]}}; {@code pos} null si no está en el Top. */
    private static String topPositions(String[] tmdbIds) throws Throwable {
        StringBuilder json = new StringBuilder("{\"items\":[");
        if (tmdbIds.length == 0) return json.append("]}").toString();
        Set<String> ids = new HashSet<>();
        for (String id : tmdbIds) {
            if (!id.isEmpty()) ids.add("tmdb:" + id);
        }
        Object response = filmsQuery(ids, ids.size(), null, false);
        Object items = response.getClass().getMethod("getItems").invoke(response);
        boolean first = true;
        if (items instanceof java.util.List) {
            for (Object film : (java.util.List<?>) items) {
                if (film == null) continue;
                String tmdb = tmdbOfFilm(film);
                if (tmdb == null) continue;
                Object pos = film.getClass().getMethod("getTopFilmsPosition").invoke(film);
                if (!first) json.append(',');
                first = false;
                json.append("{\"tmdb\":").append(quote(tmdb))
                        .append(",\"pos\":").append(pos == null ? "null" : pos.toString()).append('}');
            }
        }
        return json.append("]}").toString();
    }

    /**
     * Una página de TUS vistas, de la más reciente a la más antigua, RESUMIDA:
     * {@code {"items":[{"tmdb":"603","r":4.5,"w":"2026-11-16T…"}],"next":"cursor"}}.
     * {@code r} es tu nota (null sin nota) y {@code w}, cuándo la marcaste vista.
     */
    private static String watchedPage(String cursor) throws Throwable {
        String me = myMemberId();
        Object response = filmsQuery(null, 100, cursor, true);
        StringBuilder json = new StringBuilder("{\"items\":[");
        Object items = response.getClass().getMethod("getItems").invoke(response);
        boolean first = true;
        if (items instanceof java.util.List) {
            for (Object film : (java.util.List<?>) items) {
                if (film == null) continue;
                String tmdb = tmdbOfFilm(film);
                if (tmdb == null) continue;
                Object rating = null;
                Object when = null;
                Object relationships = film.getClass().getMethod("getRelationships").invoke(film);
                if (relationships instanceof java.util.List) {
                    for (Object rel : (java.util.List<?>) relationships) {
                        if (rel == null) continue;
                        Object member = rel.getClass().getMethod("getMember").invoke(rel);
                        Object memberId = member == null ? null
                                : member.getClass().getMethod("getId").invoke(member);
                        if (memberId != null && !me.equals(memberId.toString())) continue;
                        Object relationship = rel.getClass().getMethod("getRelationship").invoke(rel);
                        if (relationship == null) continue;
                        rating = relationship.getClass().getMethod("getRating").invoke(relationship);
                        when = relationship.getClass().getMethod("getWhenWatched").invoke(relationship);
                        break;
                    }
                }
                if (!first) json.append(',');
                first = false;
                json.append("{\"tmdb\":").append(quote(tmdb))
                        .append(",\"r\":").append(rating == null ? "null" : rating.toString())
                        .append(",\"w\":").append(when == null ? "null" : quote(when.toString()))
                        .append('}');
            }
        }
        Object next = response.getClass().getMethod("getNext").invoke(response);
        json.append("],\"next\":").append(next == null ? "null" : quote(next.toString())).append('}');
        return json.toString();
    }

    // ---------------------------------------------------------------------------------------------
    // El diario de un año (Wrapped de Bardo)
    // ---------------------------------------------------------------------------------------------

    /** Un año de cuatro cifras razonable; nada más llega a la API. */
    private static Integer requireYear(String year) {
        if (year == null || year.length() != 4) throw new IllegalArgumentException("año no válido");
        for (int i = 0; i < 4; i++) {
            if (!Character.isDigit(year.charAt(i))) throw new IllegalArgumentException("año no válido");
        }
        int value = Integer.parseInt(year);
        if (value < 1990 || value > 2100) throw new IllegalArgumentException("año no válido");
        return Integer.valueOf(value);
    }

    /** Getter sin argumentos por reflexión; {@code null} si el objeto es null. */
    private static Object get(Object target, String getter) throws Throwable {
        return target == null ? null : target.getClass().getMethod(getter).invoke(target);
    }

    /**
     * Una página de TU diario de {@code year} ({@code GET /log-entries?member=yo&year=…
     * &where=HasDiaryDate&sort=Date}), RESUMIDA y solo con los registros de películas:
     * <pre>
     * {"items":[{"id":"…","tmdb":"603","n":"The Matrix","y":1999,"d":"2026-03-14","rw":false,
     *            "r":4.5,"l":true,"rev":false,"t":["cine"],"avg":4.21,"top":null,"p":"https://…",
     *            "run":136}],"next":"cursor"}
     * </pre>
     * {@code d} es la fecha del diario; {@code r}, tu nota de ese registro (null sin nota);
     * {@code avg}, la nota media de Letterboxd y {@code top}, la posición en el Top oficial.
     */
    private static String diaryPage(Integer year, String cursor) throws Throwable {
        Object api = api("getLogEntriesAPI");
        Class<?> paramsClass = Class.forName("com.letterboxd.api.LogEntriesApi$GetLogEntriesQueryParams");
        Constructor<?> ctor = paramsClass.getDeclaredConstructor();
        ctor.setAccessible(true);
        Object params = ctor.newInstance();
        setField(params, "member", myMemberId());
        setField(params, "year", year);
        setField(params, "perPage", Integer.valueOf(100));
        if (cursor != null) setField(params, "cursor", cursor);
        setField(params, "sort", Class.forName(
                "com.letterboxd.api.model.GetLogEntriesSort$Date").getField("INSTANCE").get(null));
        Set<Object> where = new HashSet<>();
        where.add(Class.forName(
                "com.letterboxd.api.model.LogEntryWhereClause$HasDiaryDate").getField("INSTANCE").get(null));
        setField(params, "where", where);

        Class<?> paramsInterface = Class.forName("com.letterboxd.api.LogEntriesApi$IGetLogEntriesQueryParams");
        Object response = null;
        for (Method m : api.getClass().getMethods()) {
            Class<?>[] types = m.getParameterTypes();
            if (m.getName().startsWith("getLogEntries-") && !Modifier.isStatic(m.getModifiers())
                    && types.length == 2 && types[0] == paramsInterface) {
                response = await(api, m, params);
                break;
            }
        }
        if (response == null) {
            throw new NoSuchMethodException("LogEntriesApi.getLogEntries(IGetLogEntriesQueryParams)");
        }

        StringBuilder json = new StringBuilder("{\"items\":[");
        Object items = get(response, "getItems");
        boolean first = true;
        if (items instanceof java.util.List) {
            for (Object entry : (java.util.List<?>) items) {
                if (entry == null) continue;
                Object film;
                try {
                    film = get(entry, "getFilm");
                } catch (NoSuchMethodException e) {
                    continue; // registro de serie, temporada o episodio
                }
                if (film == null) continue;
                Object diary = get(entry, "getDiaryDetails");
                Object date = get(diary, "getDiaryDate");
                if (date == null) continue;
                String tmdb = tmdbOfFilm(film);
                if (tmdb == null) continue;

                Object rating = get(entry, "getRating");
                Object review = get(entry, "getReview");
                Object average = get(film, "getRating");
                Object top = get(film, "getTopFilmsPosition");
                Object releaseYear = get(film, "getReleaseYear");
                Object runTime = get(film, "getRunTime");
                String poster = posterUrl(get(film, "getPoster"));

                if (!first) json.append(',');
                first = false;
                json.append("{\"id\":").append(quote(String.valueOf(get(entry, "getId"))))
                        .append(",\"tmdb\":").append(quote(tmdb))
                        .append(",\"n\":").append(quote(String.valueOf(get(film, "getName"))))
                        .append(",\"y\":").append(releaseYear == null ? "null" : releaseYear.toString())
                        .append(",\"d\":").append(quote(String.valueOf(get(date, "getValue"))))
                        .append(",\"rw\":").append(Boolean.TRUE.equals(get(diary, "getRewatch")))
                        .append(",\"r\":").append(rating == null ? "null" : rating.toString())
                        .append(",\"l\":").append(Boolean.TRUE.equals(get(entry, "getLike")))
                        .append(",\"rev\":").append(review != null)
                        .append(",\"t\":").append(tagsJson(entry))
                        .append(",\"avg\":").append(average == null ? "null" : average.toString())
                        .append(",\"top\":").append(top == null ? "null" : top.toString())
                        .append(",\"p\":").append(poster == null ? "null" : quote(poster))
                        .append(",\"run\":").append(runTime == null ? "null" : runTime.toString())
                        .append('}');
            }
        }
        Object next = get(response, "getNext");
        json.append("],\"next\":").append(next == null ? "null" : quote(next.toString())).append('}');
        return json.toString();
    }

    /** Las etiquetas de un registro, como las escribió el usuario: {@code ["cine","vose"]}. */
    private static String tagsJson(Object entry) {
        StringBuilder json = new StringBuilder("[");
        try {
            Object tags = get(entry, "getTags2");
            if (tags instanceof java.util.List) {
                boolean first = true;
                for (Object tag : (java.util.List<?>) tags) {
                    Object display = get(tag, "getDisplayTag");
                    if (display == null) display = get(tag, "getTag");
                    if (display == null) continue;
                    if (!first) json.append(',');
                    first = false;
                    json.append(quote(display.toString()));
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "No se pudieron leer las etiquetas de un registro", t);
            return "[]";
        }
        return json.append(']').toString();
    }

    /** El póster más pequeño que dé al menos 300 px de ancho (o el mayor que haya). */
    private static String posterUrl(Object image) {
        try {
            Object sizes = get(image, "getSizes");
            if (!(sizes instanceof java.util.List)) return null;
            String best = null;
            int bestWidth = 0;
            for (Object size : (java.util.List<?>) sizes) {
                Object url = get(size, "getUrl");
                Object width = get(size, "getWidth");
                if (url == null || !(width instanceof Integer)) continue;
                int w = (Integer) width;
                boolean better = best == null
                        || (bestWidth < 300 && w > bestWidth)
                        || (w >= 300 && w < bestWidth);
                if (better) {
                    best = url.toString();
                    bestWidth = w;
                }
            }
            return best;
        } catch (Throwable t) {
            return null;
        }
    }

    private static final String LIBRARY_KEY = "library";
    private static final String RECENT_KEY = "recent";
    private static volatile Set<String> library;
    private static volatile java.util.List<String> recent;

    /** Cambia cada vez que Bardo deja una biblioteca o unos recientes nuevos. */
    private static volatile long libraryStamp = System.currentTimeMillis();

    /** @param recentIds {@code null} = Bardo no los manda (versión anterior): no se tocan. */
    private String setLibrary(String[] tmdbIds, String[] recentIds) throws Throwable {
        Set<String> set = new HashSet<>();
        StringBuilder stored = new StringBuilder();
        for (String id : tmdbIds) {
            if (id.isEmpty() || !set.add(id)) continue;
            if (stored.length() > 0) stored.append(',');
            stored.append(id);
        }
        java.util.List<String> recentList = null;
        if (recentIds != null) {
            recentList = new java.util.ArrayList<>();
            for (String id : recentIds) {
                if (!id.isEmpty() && !recentList.contains(id)) recentList.add(id);
            }
        }
        Context context = getContext();
        if (context != null) {
            android.content.SharedPreferences.Editor editor =
                    context.getSharedPreferences(EVENTS_PREFS, Context.MODE_PRIVATE).edit()
                            .putString(LIBRARY_KEY, stored.toString())
                            .putLong(LIBRARY_KEY + "At", System.currentTimeMillis());
            if (recentList != null) editor.putString(RECENT_KEY, join(recentList));
            editor.apply();
        }
        library = set;
        if (recentList != null) recent = recentList;
        libraryStamp = System.currentTimeMillis();
        WATCHLIST_ON_SERVER.clear();
        return "{\"count\":" + set.size() + "}";
    }

    private static String join(java.util.List<String> ids) {
        StringBuilder out = new StringBuilder();
        for (String id : ids) {
            if (out.length() > 0) out.append(',');
            out.append(id);
        }
        return out.toString();
    }

    private static android.content.SharedPreferences bridgePrefs() throws Throwable {
        Context context = (Context) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        return context == null ? null
                : context.getSharedPreferences(EVENTS_PREFS, Context.MODE_PRIVATE);
    }

    /**
     * Las últimas películas añadidas al servidor de Bardo (ids de TMDB, la más nueva primero),
     * según lo último que dejó Bardo. Vacía si nunca las mandó.
     */
    static java.util.List<String> recentOnServer() {
        java.util.List<String> list = recent;
        if (list != null) return list;
        list = new java.util.ArrayList<>();
        try {
            android.content.SharedPreferences prefs = bridgePrefs();
            String stored = prefs == null ? "" : prefs.getString(RECENT_KEY, "");
            for (String id : stored.split(",")) {
                if (!id.isEmpty()) list.add(id);
            }
        } catch (Throwable t) {
            Log.w(TAG, "No se pudieron leer los recientes de Bardo", t);
        }
        recent = list;
        return list;
    }

    static long libraryStamp() {
        return libraryStamp;
    }

    /**
     * ¿Está esta película (id de TMDB) en el servidor de Bardo? Lo consulta «Dónde verlo».
     * Usa lo último que dejó Bardo con setLibrary; sin datos, nunca.
     */
    static boolean isOnServer(String tmdb) {
        if (tmdb == null) return false;
        Set<String> set = library;
        if (set == null) {
            set = new HashSet<>();
            try {
                Context context = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
                if (context != null) {
                    String stored = context.getSharedPreferences(EVENTS_PREFS, Context.MODE_PRIVATE)
                            .getString(LIBRARY_KEY, "");
                    for (String id : stored.split(",")) {
                        if (!id.isEmpty()) set.add(id);
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "No se pudo leer la biblioteca de Bardo", t);
            }
            library = set;
        }
        return set.contains(tmdb);
    }

    // ---------------------------------------------------------------------------------------------
    // Filtro «En Bardo» de la watchlist y fila del inicio
    // ---------------------------------------------------------------------------------------------

    private static final long ON_SERVER_TTL_MS = 10 * 60 * 1000L;
    private static final int MAX_WATCHLIST_PAGES = 30;

    /** memberId → (cuándo, LIDs de su watchlist que están en el servidor, en su orden). */
    private static final Map<String, Object[]> WATCHLIST_ON_SERVER = new ConcurrentHashMap<>();

    /**
     * LIDs de la watchlist de {@code memberId} que están en el servidor de Bardo, en el orden de
     * la watchlist, como mucho {@code max}. Lee la watchlist entera (100 por página) y la
     * recuerda 10 min. Bloquea: nunca desde el hilo principal.
     */
    static java.util.List<String> watchlistOnServer(String memberId, int max) throws Throwable {
        if (memberId == null) memberId = myMemberId();
        Object[] cached = WATCHLIST_ON_SERVER.get(memberId);
        if (cached != null && System.currentTimeMillis() - (Long) cached[0] < ON_SERVER_TTL_MS) {
            @SuppressWarnings("unchecked")
            java.util.List<String> lids = (java.util.List<String>) cached[1];
            return lids.size() > max ? lids.subList(0, max) : lids;
        }
        java.util.List<String> lids = new java.util.ArrayList<>();
        String cursor = null;
        for (int page = 0; page < MAX_WATCHLIST_PAGES; page++) {
            Object response = watchlistResponse(memberId, cursor);
            Object items = response.getClass().getMethod("getItems").invoke(response);
            if (items instanceof java.util.List) {
                for (Object film : (java.util.List<?>) items) {
                    if (film == null) continue;
                    if (isOnServer(tmdbOfFilm(film))) {
                        lids.add(String.valueOf(film.getClass().getMethod("getId").invoke(film)));
                    }
                }
            }
            Object next = response.getClass().getMethod("getNext").invoke(response);
            if (next == null) break;
            cursor = next.toString();
        }
        WATCHLIST_ON_SERVER.put(memberId, new Object[]{System.currentTimeMillis(), lids});
        return lids.size() > max ? lids.subList(0, max) : lids;
    }

    /** Tus cambios de watchlist dentro de Letterboxd invalidan el cruce. */
    private static void forgetWatchlistOnServer() {
        WATCHLIST_ON_SERVER.clear();
    }

    /**
     * Las películas de Letterboxd de unos ids de TMDB (hasta 100), en el MISMO orden que la
     * lista (las que Letterboxd no conoce se omiten). Bloquea: nunca desde el hilo principal.
     */
    static java.util.List<Object> filmsByTmdb(java.util.List<String> tmdbIds) throws Throwable {
        java.util.List<Object> out = new java.util.ArrayList<>();
        if (tmdbIds.isEmpty()) return out;
        Set<String> ids = new java.util.LinkedHashSet<>();
        for (String id : tmdbIds) ids.add("tmdb:" + id);
        Object response = filmsQuery(ids, ids.size(), null, false);
        Object items = response.getClass().getMethod("getItems").invoke(response);
        Map<String, Object> byTmdb = new java.util.HashMap<>();
        if (items instanceof java.util.List) {
            for (Object film : (java.util.List<?>) items) {
                if (film == null) continue;
                String tmdb = tmdbOfFilm(film);
                if (tmdb != null) byTmdb.put(tmdb, film);
            }
        }
        for (String id : tmdbIds) {
            Object film = byTmdb.get(id);
            if (film != null) out.add(film);
        }
        return out;
    }

    /** Póster de una película de la API (para pintarlo en la fila del inicio). */
    static String posterOf(Object film) {
        return filmPosterUrl(film);
    }

    static String tmdbOf(Object film) {
        try {
            return tmdbOfFilm(film);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String myMemberId() throws Throwable {
        Class<?> cmm = Class.forName("com.letterboxd.letterboxd.services.CurrentMemberManager");
        Object manager = cmm.getField("INSTANCE").get(null);
        Object id = cmm.getMethod("getMemberId").invoke(manager);
        if (id == null) {
            for (Method m : cmm.getMethods()) {
                if (m.getName().startsWith("loadMemberAccount-") && m.getParameterTypes().length == 1) {
                    await(manager, m);
                    break;
                }
            }
            id = cmm.getMethod("getMemberId").invoke(manager);
        }
        if (id == null) throw new IllegalStateException("sin sesión en Letterboxd");
        return id.toString();
    }

    private static String require(String arg) {
        if (arg == null || arg.isEmpty() || arg.length() > 64) {
            throw new IllegalArgumentException("argumento vacío o demasiado largo");
        }
        for (int i = 0; i < arg.length(); i++) {
            char c = arg.charAt(i);
            if (!(Character.isLetterOrDigit(c) || c == ':')) {
                throw new IllegalArgumentException("argumento no válido");
            }
        }
        return arg;
    }

    // ---------------------------------------------------------------------------------------------
    // Acciones del usuario dentro de Letterboxd (para replicarlas en la watchlist de Plex)
    // ---------------------------------------------------------------------------------------------
    //
    // Los parches insertan una llamada a estos métodos al principio de las funciones de la API
    // que guardan o quitan de la watchlist, marcan como vista o registran. Aquí solo se ANOTA
    // la acción (película y estado) en las preferencias de la app; Bardo las recoge con «events»
    // la próxima vez que se abre y las repite en Plex. Nada sale del dispositivo.

    private static final String EVENTS_PREFS = "bardo_bridge";
    private static final String EVENTS_KEY = "events";
    private static final int EVENTS_MAX = 300;
    private static final Object EVENTS_LOCK = new Object();

    /** Escrituras que hace el propio puente: no son acciones del usuario y no se anotan. */
    private static final Set<String> EXPECTED = ConcurrentHashMap.newKeySet();

    /** LID → id de TMDB (para devolver las acciones con el id que entiende Bardo). */
    private static final Map<String, String> TMDB_CACHE = new ConcurrentHashMap<>();

    private static void expect(String type, String lid, boolean on) {
        EXPECTED.add(type + ":" + lid + ":" + on);
    }

    /** MeApi.watchlist(filmId, WatchlistUpdateRequest). */
    public static void onWatchlist(String filmId, Object request) {
        try {
            Object on = request.getClass().getMethod("getInWatchlist").invoke(request);
            if (on instanceof Boolean) {
                forgetWatchlistOnServer();
                record("watchlist", filmId, (Boolean) on);
            }
        } catch (Throwable t) {
            Log.w(TAG, "onWatchlist", t);
        }
    }

    /** MeApi.watch(filmId, WatchUpdateRequest). */
    public static void onWatch(String filmId, Object request) {
        try {
            Object on = request.getClass().getMethod("getWatched").invoke(request);
            if (Boolean.TRUE.equals(on)) record("watched", filmId, true);
        } catch (Throwable t) {
            Log.w(TAG, "onWatch", t);
        }
    }

    /** FilmsApi.updateMyRelationshipToFilm(filmId, FilmRelationshipUpdateRequest). */
    public static void onRelationship(String filmId, Object request) {
        try {
            Object inWatchlist = request.getClass().getMethod("getInWatchlist").invoke(request);
            if (inWatchlist instanceof Boolean) {
                forgetWatchlistOnServer();
                record("watchlist", filmId, (Boolean) inWatchlist);
            }
            Object watched = request.getClass().getMethod("getWatched").invoke(request);
            if (Boolean.TRUE.equals(watched)) record("watched", filmId, true);
            // rating es un Nullable de la API: null = sin cambios, Nullable$Null = quitar la
            // nota (no se replica), Nullable$Some = la nota nueva.
            Object rating = request.getClass().getMethod("getRating").invoke(request);
            Double value = ratingOf(rating);
            if (value != null) record("rating", filmId, true, value);
        } catch (Throwable t) {
            Log.w(TAG, "onRelationship", t);
        }
    }

    /** LogEntriesApi.createLogEntry(…, LogEntryCreationRequest): registrar = vista (y nota). */
    public static void onCreateLog(String unused, Object request) {
        try {
            Object filmId = request.getClass().getMethod("getFilmId").invoke(request);
            if (filmId == null) return;
            record("watched", filmId.toString(), true);
            Object rating = request.getClass().getMethod("getRating").invoke(request);
            if (rating instanceof Number && ((Number) rating).doubleValue() > 0) {
                record("rating", filmId.toString(), true, ((Number) rating).doubleValue());
            }
        } catch (Throwable t) {
            Log.w(TAG, "onCreateLog", t);
        }
    }

    /** La nota de un {@code Nullable$Some}; null en cualquier otro caso. */
    private static Double ratingOf(Object nullable) {
        if (nullable == null || !nullable.getClass().getName().endsWith("Nullable$Some")) return null;
        try {
            for (Method m : nullable.getClass().getMethods()) {
                if (m.getParameterTypes().length == 0 && m.getName().startsWith("get")
                        && !m.getName().equals("getClass")) {
                    Object v = m.invoke(nullable);
                    if (v instanceof Number && ((Number) v).doubleValue() > 0) {
                        return ((Number) v).doubleValue();
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "No se pudo leer la nota", t);
        }
        return null;
    }

    private static void record(String type, String lid, boolean on) throws Throwable {
        record(type, lid, on, null);
    }

    private static void record(String type, String lid, boolean on, Double rating) throws Throwable {
        if (lid == null || lid.isEmpty()) return;
        if (EXPECTED.remove(type + ":" + lid + ":" + on)) return; // lo hizo el puente
        Context context = (Context) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        if (context == null) return;
        synchronized (EVENTS_LOCK) {
            android.content.SharedPreferences prefs =
                    context.getSharedPreferences(EVENTS_PREFS, Context.MODE_PRIVATE);
            org.json.JSONArray old = new org.json.JSONArray(prefs.getString(EVENTS_KEY, "[]"));
            org.json.JSONArray events = new org.json.JSONArray();
            // La última acción sobre la misma película y tipo sustituye a la anterior.
            for (int i = Math.max(0, old.length() - EVENTS_MAX + 1); i < old.length(); i++) {
                org.json.JSONObject e = old.getJSONObject(i);
                if (type.equals(e.optString("t")) && lid.equals(e.optString("lid"))) continue;
                events.put(e);
            }
            org.json.JSONObject event = new org.json.JSONObject()
                    .put("t", type).put("lid", lid).put("on", on)
                    .put("at", System.currentTimeMillis());
            if (rating != null) event.put("r", rating.doubleValue());
            events.put(event);
            prefs.edit().putString(EVENTS_KEY, events.toString()).apply();
        }
    }

    /** {@code {"events":[{"type","tmdb","on","at"}],"upTo":marca}} con el id de TMDB resuelto. */
    private String pendingEvents() throws Throwable {
        Context context = getContext();
        if (context == null) return "{\"events\":[],\"upTo\":0}";
        org.json.JSONArray stored;
        synchronized (EVENTS_LOCK) {
            stored = new org.json.JSONArray(context
                    .getSharedPreferences(EVENTS_PREFS, Context.MODE_PRIVATE)
                    .getString(EVENTS_KEY, "[]"));
        }
        org.json.JSONArray out = new org.json.JSONArray();
        long upTo = 0;
        for (int i = 0; i < stored.length(); i++) {
            org.json.JSONObject e = stored.getJSONObject(i);
            long at = e.optLong("at");
            String tmdb;
            try {
                tmdb = tmdbOfLid(e.getString("lid"));
            } catch (Throwable t) {
                // Sin red para identificar la película: se deja para la próxima vez, y con
                // ella las posteriores (se recogen en orden).
                Log.w(TAG, "No se pudo identificar una película de una acción", t);
                break;
            }
            upTo = Math.max(upTo, at);
            if (tmdb == null) continue; // sin id de TMDB: no se puede replicar
            org.json.JSONObject event = new org.json.JSONObject().put("type", e.optString("t"))
                    .put("tmdb", tmdb).put("on", e.optBoolean("on")).put("at", at);
            if (e.has("r")) event.put("rating", e.optDouble("r"));
            out.put(event);
        }
        return new org.json.JSONObject().put("events", out).put("upTo", upTo).toString();
    }

    private String ackEvents(long upTo) throws Throwable {
        Context context = getContext();
        if (context == null) return "{\"left\":0}";
        synchronized (EVENTS_LOCK) {
            android.content.SharedPreferences prefs =
                    context.getSharedPreferences(EVENTS_PREFS, Context.MODE_PRIVATE);
            org.json.JSONArray old = new org.json.JSONArray(prefs.getString(EVENTS_KEY, "[]"));
            org.json.JSONArray left = new org.json.JSONArray();
            for (int i = 0; i < old.length(); i++) {
                org.json.JSONObject e = old.getJSONObject(i);
                if (e.optLong("at") > upTo) left.put(e);
            }
            prefs.edit().putString(EVENTS_KEY, left.toString()).apply();
            return "{\"left\":" + left.length() + "}";
        }
    }

    /** Id de TMDB de una película a partir de su LID ({@code null} si no tiene). */
    private static String tmdbOfLid(String lid) throws Throwable {
        String cached = TMDB_CACHE.get(lid);
        if (cached != null) return cached.isEmpty() ? null : cached;
        Object film = callApi("getFilmsAPI", "getFilmDetails", lid);
        String tmdb = tmdbOfFilm(film);
        TMDB_CACHE.put(lid, tmdb == null ? "" : tmdb);
        return tmdb;
    }

    private static String tmdbOfFilm(Object film) throws Throwable {
        Object links = film.getClass().getMethod("getLinks").invoke(film);
        if (!(links instanceof java.util.List)) return null;
        for (Object link : (java.util.List<?>) links) {
            if (link == null) continue;
            Object type = link.getClass().getMethod("getType").invoke(link);
            Object value = type == null ? null : type.getClass().getMethod("getValue").invoke(type);
            if ("tmdb".equals(value)) {
                Object id = link.getClass().getMethod("getId").invoke(link);
                return id == null ? null : id.toString();
            }
        }
        return null;
    }

    /** Lo que se está escribiendo en el campo de etiquetas: corto y sin caracteres de control. */
    private static String requireTagInput(String input) {
        if (input.length() > 60) throw new IllegalArgumentException("texto demasiado largo");
        for (int i = 0; i < input.length(); i++) {
            if (Character.isISOControl(input.charAt(i))) {
                throw new IllegalArgumentException("texto no válido");
            }
        }
        return input;
    }

    /** El miembro de la sesión, cargando la cuenta si la app aún no lo ha hecho. */
    private static Object currentMember() throws Throwable {
        Class<?> cmm = Class.forName("com.letterboxd.letterboxd.services.CurrentMemberManager");
        Object manager = cmm.getField("INSTANCE").get(null);
        Object member = cmm.getMethod("getCurrentMember").invoke(manager);
        if (member == null) {
            for (Method m : cmm.getMethods()) {
                if (m.getName().startsWith("loadMemberAccount-") && m.getParameterTypes().length == 1) {
                    await(manager, m);
                    break;
                }
            }
            member = cmm.getMethod("getCurrentMember").invoke(manager);
        }
        if (member == null) throw new IllegalStateException("sin sesión en Letterboxd");
        return member;
    }

    /**
     * Construye el LogEntryCreationRequest con el deserializador de la propia app, a partir del
     * cuerpo JSON de la API. El filmId lo pone el puente (ya resuelto a LID), nunca quien llama.
     */
    private static Object logRequest(String lid, String body) throws Throwable {
        if (body == null || body.isEmpty() || body.length() > 20000) {
            throw new IllegalArgumentException("cuerpo vacío o demasiado largo");
        }
        org.json.JSONObject object = new org.json.JSONObject(body);
        object.put("filmId", lid);
        // Todas las claves presentes (aunque sea a null): el deserializador puede exigirlas.
        for (String key : new String[]{"diaryDetails", "review", "tags", "rating", "like",
                "commentPolicy", "privacyPolicy"}) {
            if (!object.has(key)) object.put(key, org.json.JSONObject.NULL);
        }
        Class<?> requestClass = Class.forName("com.letterboxd.api.model.LogEntryCreationRequest");
        Object companion = requestClass.getField("Companion").get(null);
        Object serializer = companion.getClass().getMethod("serializer").invoke(companion);
        Class<?> jsonClass = Class.forName("kotlinx.serialization.json.Json");
        Object json = jsonClass.getField("Default").get(null);
        for (Method m : jsonClass.getMethods()) {
            Class<?>[] types = m.getParameterTypes();
            if (m.getName().equals("decodeFromString") && types.length == 2 && types[1] == String.class) {
                return m.invoke(json, serializer, object.toString());
            }
        }
        throw new NoSuchMethodException("Json.decodeFromString");
    }

    /** {@code createLogEntry(null, request)}: el primer parámetro (opcional) se deja por defecto. */
    private static Object createLogEntry(Object request) throws Throwable {
        Object api = api("getLogEntriesAPI");
        for (Method m : api.getClass().getMethods()) {
            if (!Modifier.isStatic(m.getModifiers())) continue;
            String n = m.getName();
            if (!n.startsWith("createLogEntry-") || !n.endsWith("$default")) continue;
            Class<?>[] types = m.getParameterTypes();
            // (api, String, LogEntryCreationRequest, boolean, Continuation, int máscara, Object)
            if (types.length != 7 || types[1] != String.class || !types[2].isInstance(request)) continue;
            // Máscara: bit 0 (el String) y bit 2 (el boolean) por defecto; el cuerpo, el nuestro.
            Object[] args = {api, null, request, Boolean.FALSE, Integer.valueOf(1 | 4), null};
            return awaitStatic(m, args, 4);
        }
        throw new NoSuchMethodException("LogEntriesApi.createLogEntry$default");
    }

    /** Un cursor de paginación de la API: opaco, pero corto y sin caracteres raros. */
    private static String requireCursor(String cursor) {
        if (cursor.length() > 200) throw new IllegalArgumentException("cursor demasiado largo");
        for (int i = 0; i < cursor.length(); i++) {
            char c = cursor.charAt(i);
            if (!(Character.isLetterOrDigit(c) || c == ':' || c == '=' || c == '-' || c == '_' || c == '.')) {
                throw new IllegalArgumentException("cursor no válido");
            }
        }
        return cursor;
    }

    /**
     * Una página de la watchlist de un miembro (por defecto, el de la sesión), RESUMIDA: el
     * JSON completo de 100 películas no cabe en una transacción de Binder (1 MB).
     * Devuelve {@code {"items":[{"lid","tmdb","name","year"}],"next":"cursor"}}.
     */
    private static String watchlistPage(String memberId, String cursor) throws Throwable {
        Object response = watchlistResponse(memberId, cursor);
        StringBuilder json = new StringBuilder("{\"items\":[");
        Object items = response.getClass().getMethod("getItems").invoke(response);
        boolean first = true;
        if (items instanceof java.util.List) {
            for (Object film : (java.util.List<?>) items) {
                if (film == null) continue;
                String tmdb = tmdbOfFilm(film);
                Object year = film.getClass().getMethod("getReleaseYear").invoke(film);
                String poster = filmPosterUrl(film);
                if (!first) json.append(',');
                first = false;
                json.append("{\"lid\":").append(quote(String.valueOf(film.getClass().getMethod("getId").invoke(film))))
                        .append(",\"tmdb\":").append(tmdb == null ? "null" : quote(tmdb))
                        .append(",\"name\":").append(quote(String.valueOf(film.getClass().getMethod("getName").invoke(film))))
                        .append(",\"year\":").append(year == null ? "null" : year.toString())
                        .append(",\"poster\":").append(poster == null ? "null" : quote(poster))
                        .append('}');
            }
        }
        Object next = response.getClass().getMethod("getNext").invoke(response);
        json.append("],\"next\":").append(next == null ? "null" : quote(next.toString())).append('}');
        return json.toString();
    }

    /** Una página (100) de la watchlist de un miembro (por defecto, el de la sesión), tal cual. */
    private static Object watchlistResponse(String memberId, String cursor) throws Throwable {
        if (memberId == null) {
            Class<?> cmm = Class.forName("com.letterboxd.letterboxd.services.CurrentMemberManager");
            Object manager = cmm.getField("INSTANCE").get(null);
            Object id = cmm.getMethod("getMemberId").invoke(manager);
            if (id == null) {
                // Proceso recién arrancado por esta llamada: la app aún no ha cargado la cuenta.
                for (Method m : cmm.getMethods()) {
                    if (m.getName().startsWith("loadMemberAccount-") && m.getParameterTypes().length == 1) {
                        await(manager, m);
                        break;
                    }
                }
                id = cmm.getMethod("getMemberId").invoke(manager);
            }
            if (id == null) throw new IllegalStateException("sin sesión en Letterboxd");
            memberId = id.toString();
        }
        Object api = api("getMembersAPI");
        Class<?> paramsClass = Class.forName("com.letterboxd.api.MembersApi$WatchlistQueryParams");
        Constructor<?> primary = null;
        for (Constructor<?> c : paramsClass.getDeclaredConstructors()) {
            Class<?>[] types = c.getParameterTypes();
            // El constructor principal: (id, cursor, perPage, …filtros…), sin la máscara sintética.
            if (types.length > 3 && types[0] == String.class && types[1] == String.class
                    && types[2] == Integer.class && types[types.length - 1] == Boolean.class) {
                primary = c;
            }
        }
        if (primary == null) throw new NoSuchMethodException("WatchlistQueryParams(…)");
        Object[] ctorArgs = new Object[primary.getParameterTypes().length];
        ctorArgs[0] = memberId;
        ctorArgs[1] = cursor;
        ctorArgs[2] = Integer.valueOf(100);
        primary.setAccessible(true);
        Object params = primary.newInstance(ctorArgs);

        Class<?> paramsInterface = Class.forName("com.letterboxd.api.MembersApi$IWatchlistQueryParams");
        Object response = null;
        for (Method m : api.getClass().getMethods()) {
            Class<?>[] types = m.getParameterTypes();
            if (m.getName().startsWith("watchlist-") && !Modifier.isStatic(m.getModifiers())
                    && types.length == 2 && types[0] == paramsInterface) {
                response = await(api, m, params);
                break;
            }
        }
        if (response == null) throw new NoSuchMethodException("MembersApi.watchlist(IWatchlistQueryParams)");
        return response;
    }

    /**
     * El póster más pequeño que dé al menos 230 px de ancho (se pinta en una rejilla de tres
     * columnas); {@code null} si la película no tiene.
     */
    private static String filmPosterUrl(Object film) {
        try {
            Object poster = film.getClass().getMethod("getPoster").invoke(film);
            if (poster == null) return null;
            Object sizes = poster.getClass().getMethod("getSizes").invoke(poster);
            if (!(sizes instanceof java.util.List)) return null;
            String best = null;
            int bestWidth = Integer.MAX_VALUE;
            for (Object size : (java.util.List<?>) sizes) {
                if (size == null) continue;
                Object url = size.getClass().getMethod("getUrl").invoke(size);
                Object width = size.getClass().getMethod("getWidth").invoke(size);
                if (url == null) continue;
                int w = width instanceof Number ? ((Number) width).intValue() : 0;
                if (best == null || (w >= 230 && w < bestWidth)) {
                    best = url.toString();
                    if (w >= 230) bestWidth = w;
                }
            }
            return best;
        } catch (Throwable t) {
            Log.w(TAG, "No se pudo leer el póster", t);
            return null;
        }
    }

    private static String quote(String value) {
        StringBuilder out = new StringBuilder("\"");
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c == '"' || c == '\\') out.append('\\').append(c);
            else if (c < 0x20) out.append(String.format("\\u%04x", (int) c));
            else out.append(c);
        }
        return out.append('"').toString();
    }

    /** Convierte «tmdb:603» en el id de Letterboxd; un LID se devuelve tal cual. */
    private static String lid(String id) throws Throwable {
        if (id.indexOf(':') < 0) return id;
        String cached = LID_CACHE.get(id);
        if (cached != null) return cached;
        Object response = filmsByExternalId(id);
        Object items = response.getClass().getMethod("getItems").invoke(response);
        if (!(items instanceof java.util.List) || ((java.util.List<?>) items).isEmpty()) {
            throw new IllegalStateException("Letterboxd no conoce " + id);
        }
        Object film = ((java.util.List<?>) items).get(0);
        String lid = String.valueOf(film.getClass().getMethod("getId").invoke(film));
        LID_CACHE.put(id, lid);
        return lid;
    }

    /** {@code GET /films?filmId=tmdb:603&perPage=1}, con el objeto de parámetros de la app. */
    private static Object filmsByExternalId(String externalId) throws Throwable {
        Set<String> ids = new HashSet<>();
        ids.add(externalId);
        return filmsQuery(ids, 1, null, false);
    }

    /**
     * {@code GET /films} con el objeto de parámetros de la app: por ids ({@code filmId}, hasta
     * 100) o, con {@code myWatched}, tus vistas de la más reciente a la más antigua.
     */
    private static Object filmsQuery(Set<String> ids, int perPage, String cursor, boolean myWatched)
            throws Throwable {
        Object api = api("getFilmsAPI");
        Class<?> paramsClass = Class.forName("com.letterboxd.api.FilmsApi$FilmsQueryParams");
        Constructor<?> ctor = paramsClass.getDeclaredConstructor();
        ctor.setAccessible(true);
        Object params = ctor.newInstance();
        if (ids != null) setField(params, "filmId", ids);
        setField(params, "perPage", Integer.valueOf(perPage));
        if (cursor != null) setField(params, "cursor", cursor);
        if (myWatched) {
            setField(params, "member", myMemberId());
            setField(params, "memberRelationship", Class.forName(
                    "com.letterboxd.api.model.FilmMemberRelationship$Watched").getField("INSTANCE").get(null));
            setField(params, "sort", Class.forName(
                    "com.letterboxd.api.model.FilmsSort$DateLatestFirst").getField("INSTANCE").get(null));
        }

        Class<?> paramsInterface = Class.forName("com.letterboxd.api.FilmsApi$IFilmsQueryParams");
        for (Method m : api.getClass().getMethods()) {
            Class<?>[] types = m.getParameterTypes();
            if (m.getName().startsWith("films-") && !Modifier.isStatic(m.getModifiers())
                    && types.length == 2 && types[0] == paramsInterface) {
                return await(api, m, params);
            }
        }
        throw new NoSuchMethodException("FilmsApi.films(IFilmsQueryParams)");
    }

    /**
     * Llama a {@code <api>.<nombre>-xxxx$default(api, id, …resto por defecto…)}: la variante
     * estática que Kotlin genera para los parámetros con valor por defecto. El sufijo «-xxxx»
     * cambia si cambia la firma, así que se busca por prefijo.
     */
    private static Object callApi(String apiGetter, String name, String id, Object... more)
            throws Throwable {
        Object api = api(apiGetter);
        for (Method m : api.getClass().getMethods()) {
            if (!Modifier.isStatic(m.getModifiers())) continue;
            String n = m.getName();
            if (!n.startsWith(name + "-") || !n.endsWith("$default")) continue;
            Class<?>[] types = m.getParameterTypes();
            // (api, String id, …, Continuation, int máscara, Object marcador)
            if (types.length < 5 + more.length || types[1] != String.class) continue;
            if (!types[types.length - 3].getName().equals("kotlin.coroutines.Continuation")) continue;
            boolean fits = true;
            for (int i = 0; i < more.length; i++) {
                if (!types[2 + i].isInstance(more[i])) fits = false;
            }
            if (!fits) continue;

            Object[] args = new Object[types.length - 1]; // sin la Continuation, que pone await()
            int continuationIndex = types.length - 3;
            int mask = 0;
            args[0] = api;
            args[1] = id;
            for (int i = 2; i < continuationIndex; i++) {
                if (i - 2 < more.length) {
                    args[i] = more[i - 2];
                } else {
                    args[i] = defaultFor(types[i]);
                    mask |= 1 << (i - 1);
                }
            }
            args[args.length - 2] = Integer.valueOf(mask);
            args[args.length - 1] = null;
            return awaitStatic(m, args, continuationIndex);
        }
        throw new NoSuchMethodException(apiGetter + "." + name + "$default");
    }

    private static Object defaultFor(Class<?> type) {
        if (type == boolean.class) return Boolean.FALSE;
        if (type == int.class) return Integer.valueOf(0);
        if (type == long.class) return Long.valueOf(0);
        if (type == double.class) return Double.valueOf(0);
        if (type == float.class) return Float.valueOf(0);
        return null;
    }

    /** {@code LetterboxdAPIManager.Companion.shared()} y de ahí la API pedida. */
    private static Object api(String getter) throws Throwable {
        Object manager = manager();
        return manager.getClass().getMethod(getter).invoke(manager);
    }

    private static Object manager() throws Throwable {
        Class<?> managerClass = Class.forName("com.letterboxd.letterboxd.api.LetterboxdAPIManager");
        Object companion = managerClass.getField("Companion").get(null);
        Method shared = null;
        for (Method m : companion.getClass().getMethods()) {
            if (m.getName().equals("shared") && m.getParameterTypes().length == 1) shared = m;
        }
        if (shared == null) throw new NoSuchMethodException("LetterboxdAPIManager.shared");
        Object manager = await(companion, shared);
        if (manager == null) throw new IllegalStateException("LetterboxdAPIManager sin iniciar");
        return manager;
    }

    private static void setField(Object target, String name, Object value) throws Exception {
        Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        f.set(target, value);
    }

    // ---------------------------------------------------------------------------------------------
    // Funciones suspend de Kotlin desde Java
    // ---------------------------------------------------------------------------------------------

    /** Llama a un método suspend de instancia cuyo último parámetro es la Continuation. */
    private static Object await(Object target, Method m, Object... args) throws Throwable {
        Waiter waiter = new Waiter();
        Object[] all = new Object[args.length + 1];
        System.arraycopy(args, 0, all, 0, args.length);
        all[args.length] = waiter.continuation();
        m.setAccessible(true);
        return waiter.result(m.invoke(target, all));
    }

    /** Igual, para un estático «$default»: la Continuation va en {@code continuationIndex}. */
    private static Object awaitStatic(Method m, Object[] argsWithoutContinuation, int continuationIndex)
            throws Throwable {
        Waiter waiter = new Waiter();
        Object[] all = new Object[argsWithoutContinuation.length + 1];
        for (int i = 0, j = 0; i < all.length; i++) {
            all[i] = i == continuationIndex ? waiter.continuation() : argsWithoutContinuation[j++];
        }
        m.setAccessible(true);
        return waiter.result(m.invoke(null, all));
    }

    /** Una Continuation hecha con Proxy, que entrega el resultado a quien espera. */
    private static final class Waiter implements InvocationHandler {
        private final CountDownLatch latch = new CountDownLatch(1);
        private volatile Object value;

        Object continuation() throws Exception {
            Class<?> type = Class.forName("kotlin.coroutines.Continuation");
            return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, this);
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Exception {
            String name = method.getName();
            if ("resumeWith".equals(name)) {
                value = args[0];
                latch.countDown();
                return null;
            }
            if ("getContext".equals(name)) {
                return Class.forName("kotlin.coroutines.EmptyCoroutineContext").getField("INSTANCE").get(null);
            }
            if ("hashCode".equals(name)) return System.identityHashCode(proxy);
            if ("equals".equals(name)) return proxy == args[0];
            return "BardoBridge.Continuation";
        }

        /** {@code returned} es lo que devolvió la llamada: el valor, o la marca de «suspendida». */
        Object result(Object returned) throws Throwable {
            if (returned != null && returned.getClass().getName()
                    .equals("kotlin.coroutines.intrinsics.CoroutineSingletons")) {
                if (!latch.await(TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
                    throw new IllegalStateException("Letterboxd no respondió en " + TIMEOUT_SECONDS + " s");
                }
                return unwrap(value);
            }
            return unwrap(returned);
        }
    }

    /** Deshace {@code kotlin.Result}: devuelve el valor o lanza su excepción. */
    private static Object unwrap(Object r) throws Throwable {
        for (int i = 0; i < 4 && r != null; i++) {
            String name = r.getClass().getName();
            if (name.equals("kotlin.Result$Failure")) {
                Field f = r.getClass().getDeclaredField("exception");
                f.setAccessible(true);
                throw (Throwable) f.get(r);
            }
            if (name.equals("kotlin.Result")) {
                Field f = r.getClass().getDeclaredField("value");
                f.setAccessible(true);
                r = f.get(r);
                continue;
            }
            // Cada llamada devuelve «XxxResponseStatus$<código HTTP>»: el 200 lleva el modelo
            // en getValue(); cualquier otro código es un fallo de la API.
            int status = name.indexOf("ResponseStatus$");
            if (status >= 0) {
                String code = name.substring(status + "ResponseStatus$".length());
                if (!code.startsWith("2")) {
                    throw new IllegalStateException("Letterboxd respondió HTTP " + code);
                }
                // Las respuestas sin cuerpo (p. ej. 204 al borrar) no tienen getValue().
                Method getValue;
                try {
                    getValue = r.getClass().getMethod("getValue");
                } catch (NoSuchMethodException e) {
                    return null;
                }
                r = getValue.invoke(r);
                continue;
            }
            break;
        }
        return r;
    }

    // ---------------------------------------------------------------------------------------------
    // JSON con el serializador de la propia app (kotlinx.serialization)
    // ---------------------------------------------------------------------------------------------

    private static String toJson(Object model) throws Throwable {
        if (model == null) return "null";
        Object companion = model.getClass().getField("Companion").get(null);
        Object serializer = companion.getClass().getMethod("serializer").invoke(companion);
        Class<?> jsonClass = Class.forName("kotlinx.serialization.json.Json");
        Object json = jsonClass.getField("Default").get(null);
        for (Method m : jsonClass.getMethods()) {
            Class<?>[] types = m.getParameterTypes();
            if (m.getName().equals("encodeToString") && types.length == 2 && types[1] == Object.class) {
                return (String) m.invoke(json, serializer, model);
            }
        }
        throw new NoSuchMethodException("Json.encodeToString");
    }

    // ---------------------------------------------------------------------------------------------
    // El resto de ContentProvider no se usa: todo va por call()
    // ---------------------------------------------------------------------------------------------

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}

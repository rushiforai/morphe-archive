package app.morphe.extension.tinder.patches;

import android.util.Log;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/**
 * Faz a página Tappy que contém a distância virar o primeiro slide do card de swipe.
 *
 * <p>Hook na entrada de {@code Ldon;->l(List<Limw>, Lrhw;, Lerw;, Function1)} (Tinder 17.41.0),
 * o método que transforma as páginas Tappy ({@code Limw}) nos slides ({@code Li5y}). Cada página
 * já traz o seu próprio NAME_ROW, então mover a página inteira mantém o nome em todos os slides.
 * As fotos ({@code Lumw.g}) não passam por aqui e continuam na ordem original.
 *
 * <p>Regras:
 * <ul>
 *   <li>Só age nos decks de swipe (MainCardStack e CuratedCardStack).</li>
 *   <li>Sem distância no perfil, devolve a mesma lista, sem alterar nada.</li>
 *   <li>Se a distância já está na primeira página, devolve a mesma lista.</li>
 *   <li>Nunca altera a lista recebida: devolve uma cópia reordenada. A ordem relativa das demais
 *       páginas é preservada (Bio continua antes de Passions) e nenhuma página fica vazia.</li>
 *   <li>Qualquer erro é engolido e a lista original é devolvida.</li>
 * </ul>
 *
 * <p>Mapa do bytecode (R8 17.41.0): {@code Limw.a/b/c} = listas top/nameInline/bottom de
 * {@code piw}; {@code piw} é {@code miw} (estático, campo {@code a} é um enum) ou {@code oiw}
 * (dinâmico, campo {@code a} é o {@code ys9} do servidor); {@code rhw.e} é o
 * {@code TappySource}. A distância é um pill dinâmico: o ícone ({@code hs9.b}) e o id do
 * elemento ({@code qiw.a}) valem "distance".
 */
@SuppressWarnings({"unchecked", "rawtypes"})
public final class TinderDistanceOrder {
    private static final String TAG = "TinderDistanceFirst";

    private static final String DISTANCE = "distance";

    /** Listas de Limw que podem conter o pill de distância: top (a) e bottom (c). */
    private static final String[] PAGE_LISTS = {"c", "a"};

    /** Campo de Limw/oiw/rhw que guarda o conteúdo / o TappySource. */
    private static final String ELEMENT_FIELD = "a";
    private static final String SOURCE_FIELD = "e";

    private static final String SOURCE_MAIN = "MainCardStack";
    private static final String SOURCE_CURATED = "CuratedCardStack";

    private static final int MAX_DEPTH = 8;
    private static final int MAX_NODES = 600;

    private TinderDistanceOrder() {}

    /**
     * @param pages as páginas Tappy ({@code List<Limw>}) que o Tinder vai transformar em slides
     * @param context o {@code Lrhw} do card, usado só para descobrir o TappySource
     * @return a lista que o Tinder deve usar: {@code pages} se nada mudou, ou uma cópia reordenada
     */
    public static List rotateEssentialsFirst(List pages, Object context) {
        try {
            if (pages == null || pages.size() < 2) return pages;

            String source = sourceOf(context);
            if (!SOURCE_MAIN.equals(source) && !SOURCE_CURATED.equals(source)) {
                Log.d(TAG, "ignorando origem " + source);
                return pages;
            }

            int index = indexOfDistancePage(pages);
            if (index <= 0) {
                Log.d(TAG, index < 0
                        ? "sem distancia neste perfil, mantendo a ordem"
                        : "distancia ja esta no primeiro slide");
                return pages;
            }

            List reordered = new ArrayList(pages);
            reordered.add(0, reordered.remove(index));
            Log.i(TAG, "pagina com distancia movida de " + index + " para 0 (" + source + ")");
            return reordered;
        } catch (Throwable t) {
            Log.w(TAG, "rotateEssentialsFirst falhou, mantendo a ordem original", t);
            return pages;
        }
    }

    /** Índice da primeira página com um pill de distância, ou -1. */
    private static int indexOfDistancePage(List pages) {
        for (int i = 0; i < pages.size(); i++) {
            if (pageHasDistance(pages.get(i))) return i;
        }
        return -1;
    }

    private static boolean pageHasDistance(Object page) {
        if (page == null) return false;
        for (String listField : PAGE_LISTS) {
            Object elements = readField(page, listField);
            if (!(elements instanceof Collection)) continue;
            for (Object element : new ArrayList((Collection) elements)) {
                // Estático (miw): o campo "a" é um enum, não tem pill. Dinâmico (oiw): "a" é o ys9.
                Object dynamic = readField(element, ELEMENT_FIELD);
                if (dynamic == null || dynamic instanceof Enum) continue;

                Scan scan = new Scan();
                walk(dynamic, 0, scan, new IdentityHashMap<Object, Boolean>());
                if (scan.distance) return true;
            }
        }
        return false;
    }

    private static String sourceOf(Object context) {
        Object source = readField(context, SOURCE_FIELD);
        return source instanceof Enum ? ((Enum) source).name() : null;
    }

    private static final class Scan {
        boolean distance;
        int nodes;
    }

    private static void walk(Object o, int depth, Scan s, IdentityHashMap<Object, Boolean> seen) {
        if (o == null || s.distance || depth > MAX_DEPTH || s.nodes++ > MAX_NODES) return;

        if (o instanceof String) {
            if (DISTANCE.equals(o)) s.distance = true;
            return;
        }
        if (o instanceof Number || o instanceof Boolean || o instanceof Character
                || o instanceof Enum || o instanceof Class) {
            return;
        }
        if (seen.put(o, Boolean.TRUE) != null) return;

        // Coleções primeiro: kotlin.collections.EmptyList também é uma Collection.
        if (o instanceof Collection) {
            for (Object e : new ArrayList((Collection) o)) walk(e, depth + 1, s, seen);
            return;
        }
        if (o instanceof Map) {
            for (Object e : new ArrayList(((Map) o).entrySet())) {
                Map.Entry entry = (Map.Entry) e;
                walk(entry.getKey(), depth + 1, s, seen);
                walk(entry.getValue(), depth + 1, s, seen);
            }
            return;
        }
        Class<?> c = o.getClass();
        if (c.isArray()) {
            if (c.getComponentType().isPrimitive()) return;
            int n = Array.getLength(o);
            for (int i = 0; i < n; i++) walk(Array.get(o, i), depth + 1, s, seen);
            return;
        }

        String name = c.getName();
        if (name.startsWith("java.") || name.startsWith("android.") || name.startsWith("androidx.")
                || name.startsWith("kotlin.") || name.startsWith("com.google.")) {
            return;
        }

        for (Class<?> k = c; k != null && k != Object.class; k = k.getSuperclass()) {
            for (Field f : k.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
                try {
                    f.setAccessible(true);
                    walk(f.get(o), depth + 1, s, seen);
                } catch (Throwable ignored) {
                }
                if (s.distance) return;
            }
        }
    }

    /** Lê um campo (público ou não) pelo nome; null se não existir ou falhar. */
    private static Object readField(Object target, String name) {
        if (target == null) return null;
        try {
            for (Class<?> k = target.getClass(); k != null && k != Object.class; k = k.getSuperclass()) {
                try {
                    Field field = k.getDeclaredField(name);
                    field.setAccessible(true);
                    return field.get(target);
                } catch (NoSuchFieldException ignored) {
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }
}

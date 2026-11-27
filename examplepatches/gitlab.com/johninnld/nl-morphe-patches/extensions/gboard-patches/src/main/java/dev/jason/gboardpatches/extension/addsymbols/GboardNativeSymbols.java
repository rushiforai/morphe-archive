package dev.jason.gboardpatches.extension.addsymbols;

import android.inputmethodservice.InputMethodService;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.Toast;

import dev.jason.gboardpatches.extension.sharedmodel.EditorSnapshot;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Uses Gboard's own expression keyboard for the optional symbol corpus. */
public final class GboardNativeSymbols {
    private static final String EMOTICON =
            "com.google.android.apps.inputmethod.libs.search.emoticon.EmoticonKeyboardM2";
    private static final String RECYCLER =
            "com.google.android.apps.inputmethod.libs.search.emoticon.EmoticonRecyclerView";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final List<String> RECENT = new LinkedList<>();
    private static Request pending;
    private static Active active;

    private static final class Request {
        final InputMethodService service;
        final EditorInfo editor;
        final InputConnection connection;

        Request(InputMethodService service, EditorInfo editor, InputConnection connection) {
            this.service = service;
            this.editor = editor;
            this.connection = connection;
        }
    }

    private static final class Active {
        final Object keyboard;
        final Request request;
        final Method toNativeList;
        final Method render;
        final Map<String, String> categories;
        final List<Integer> labels;

        Active(Object keyboard, Request request, Method toNativeList, Method render,
                Map<String, String> categories, List<Integer> labels) {
            this.keyboard = keyboard;
            this.request = request;
            this.toNativeList = toNativeList;
            this.render = render;
            this.categories = categories;
            this.labels = labels;
        }
    }

    private GboardNativeSymbols() {}

    static void open(InputMethodService service, Locale language) throws ReflectiveOperationException {
        if (service == null || !service.isInputViewShown()) return;
        if (language == null || !"en".equals(language.getLanguage())) {
            Toast.makeText(service, "Custom Symbols is available on English layouts.",
                    Toast.LENGTH_SHORT).show();
            return;
        }
        EditorInfo editor = service.getCurrentInputEditorInfo();
        InputConnection connection = service.getCurrentInputConnection();
        if (connection == null || editor == null
                || (editor.inputType & InputType.TYPE_MASK_CLASS) != InputType.TYPE_CLASS_TEXT) return;

        ClassLoader loader = service.getClass().getClassLoader();
        Class<?> keyboard = type(loader, "agoo");
        Class<?> request = type(loader, "agoq");
        Class<?> transition = type(loader, "aars");
        Class<?> event = type(loader, "adan");
        Object emoticon = field(keyboard, "g").get(null);
        Constructor<?> constructor = request.getDeclaredConstructor(keyboard);
        constructor.setAccessible(true);
        Object switchRequest = constructor.newInstance(emoticon);
        Object envelope = method(transition, "a", request).invoke(null, switchRequest);
        Object payload = field(transition, "b").get(envelope);
        Request activation = new Request(service, editor, connection);
        pending = activation;
        MAIN.postDelayed(() -> { if (pending == activation) pending = null; }, 2_000);
        try {
            method(type(loader, "afae"), "bT", event).invoke(service, payload);
        } catch (ReflectiveOperationException unavailable) {
            pending = null;
            throw unavailable;
        }
    }

    public static void enter(Object keyboard, EditorInfo editor) {
        Request request = pending;
        pending = null;
        active = null;
        if (request == null || editor == null || request.editor != request.service.getCurrentInputEditorInfo()
                || request.connection != request.service.getCurrentInputConnection()
                || editor.fieldId != request.editor.fieldId
                || !java.util.Objects.equals(editor.packageName, request.editor.packageName)) return;
        try {
            ClassLoader loader = keyboard.getClass().getClassLoader();
            Class<?> owner = type(loader, EMOTICON);
            Class<?> list = type(loader, "auaz");
            Method key = method(owner, "A", int.class);
            Map<String, String> categories = new LinkedHashMap<>();
            categories.put((String) key.invoke(keyboard, 0), "");
            String[] keys = GboardAddSymbolsDataset.CATEGORY_KEYS;
            for (int i = 0; i < keys.length; i++) {
                categories.put((String) key.invoke(keyboard, i + 1), keys[i]);
            }
            Object stock = field(type(loader, "tiq"), "a").get(null);
            if (!(stock instanceof List<?> labels) || labels.size() < keys.length + 1) return;
            List<Integer> retained = new ArrayList<>();
            for (Object label : labels.subList(0, keys.length + 1)) {
                if (!(label instanceof Integer id)) return;
                retained.add(id);
            }
            active = new Active(keyboard, request, method(list, "n", Collection.class),
                    method(owner, "I", type(loader, RECYCLER), list, String.class), Map.copyOf(categories),
                    List.copyOf(retained));
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            android.util.Log.w("GboardPatches", "Could not initialize native Custom Symbols");
        }
    }

    public static boolean active(Object keyboard) {
        return active != null && active.keyboard == keyboard;
    }

    public static void leave(Object keyboard) {
        if (active(keyboard)) active = null;
    }

    public static void clear() {
        active = null;
    }

    public static Object categoryResources(Object original) {
        Active state = active;
        if (state == null) return original;
        try {
            return state.toNativeList.invoke(null, state.labels);
        } catch (ReflectiveOperationException unavailable) {
            return original;
        }
    }

    public static String categoryLabel(android.content.Context context, int id) {
        Active state = active;
        int index = state == null ? -1 : state.labels.indexOf(id);
        if (index <= 0) return context.getString(id);
        String key = GboardAddSymbolsDataset.CATEGORY_KEYS[index - 1];
        return key.substring(0, 1) + key.substring(1).toLowerCase(Locale.ROOT);
    }

    public static boolean render(Object keyboard, Object recycler, String stockKey) {
        Active state = active;
        if (state == null || state.keyboard != keyboard || recycler == null) return false;
        String category = state.categories.get(stockKey);
        if (category == null) return false;
        try {
            Collection<String> symbols = category.isEmpty() ? RECENT :
                    GboardAddSymbolsDataset.symbolsFor(category);
            state.render.invoke(keyboard, recycler, state.toNativeList.invoke(null, symbols), stockKey);
            return true;
        } catch (ReflectiveOperationException unavailable) {
            android.util.Log.w("GboardPatches", "Could not render native Custom Symbols");
            return false;
        }
    }

    public static boolean insert(Object keyboard, Object value) {
        if (!active(keyboard)) return false;
        Request request = active.request;
        if (!(value instanceof String symbol) || symbol.isEmpty()
                || request.service.getCurrentInputEditorInfo() != request.editor
                || request.service.getCurrentInputConnection() != request.connection) return true;
        InputConnection connection = request.connection;
        try {
            if (connection.finishComposingText() && connection.commitText(symbol, 1)
                    && EditorSnapshot.allowed(request.editor)) {
                RECENT.remove(symbol);
                RECENT.add(0, symbol);
                if (RECENT.size() > 48) RECENT.remove(RECENT.size() - 1);
            }
        } catch (RuntimeException unavailable) {
            leave(keyboard);
        }
        return true;
    }

    private static Class<?> type(ClassLoader loader, String name) throws ClassNotFoundException {
        return Class.forName(name, true, loader);
    }

    private static Field field(Class<?> owner, String name) throws NoSuchFieldException {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    private static Method method(Class<?> owner, String name, Class<?>... parameters)
            throws NoSuchMethodException {
        Method method = owner.getDeclaredMethod(name, parameters);
        method.setAccessible(true);
        return method;
    }
}

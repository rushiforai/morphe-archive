package dev.jason.gboardpatches.extension.clipboard.search;

import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

/**
 * Reuses Gboard's "add clip" field (in-keyboard or popup) as the query field. Its save
 * callback is wrapped while a search is pending, so Done submits the query instead of saving
 * a clip; with no search pending the wrapper forwards to the native save unchanged.
 */
public final class GboardClipboardSearchBinding {
    // ~2 s of frames: the add-entry switch can go through a background hop first.
    private static final int INSTALL_ATTEMPTS = 120;

    private final Method openAddEntry, reload;
    /** Texts that turn the add-clip form into a search form. */
    public static final class Texts {
        final String title;
        final String action;
        final String hint;

        public Texts(String title, String action, String hint) {
            this.title = title;
            this.action = action;
            this.hint = hint;
        }
    }

    private final Method closePopup;
    private final Field controller, adapter, addEntry, addEntryType, saver, queryField, titleField,
            doneField, popup, popupField;
    private final Class<?> saverType;
    private final Object addEntryKind;

    public GboardClipboardSearchBinding(ClassLoader loader) throws ReflectiveOperationException {
        Class<?> keyboard = Class.forName(
                "com.google.android.apps.inputmethod.libs.clipboard.ClipboardKeyboard", false, loader);
        Class<?> addEntryKeyboard = Class.forName(
                "com.google.android.apps.inputmethod.libs.clipboard.ClipboardAddEntryKeyboard",
                false, loader);
        Class<?> clip = Class.forName("fpk", false, loader);
        Class<?> adapterClass = Class.forName("fqn", false, loader);
        Class<?> controllerClass = Class.forName("frc", false, loader);
        Class<?> popupClass = Class.forName("fpu", false, loader);
        Class<?> editField = Class.forName(
                "com.google.android.libraries.inputmethod.widgets.EditTextOnKeyboard", false, loader);
        Class<?> keyboardType = Class.forName("qch", false, loader);
        saverType = Class.forName("fqo", false, loader);
        if (!saverType.isInterface() || !saverType.isAssignableFrom(controllerClass)) {
            throw new NoSuchFieldException("Clipboard add-entry saver mismatch");
        }
        openAddEntry = method(keyboard, "N", void.class, clip);
        reload = method(adapterClass, "J", void.class);
        controller = field(keyboard, "b", Class.forName("frh", false, loader));
        adapter = field(keyboard, "c", adapterClass);
        addEntry = field(controllerClass, "e", addEntryKeyboard);
        addEntryType = field(controllerClass, "c", keyboardType);
        saver = field(addEntryKeyboard, "b", saverType);
        queryField = field(addEntryKeyboard, "a", editField);
        titleField = field(addEntryKeyboard, "e", TextView.class);
        doneField = field(addEntryKeyboard, "d", View.class);
        // Most layouts add clips in a popup over a text keyboard instead of the in-keyboard field.
        popup = field(controllerClass, "b", popupClass);
        popupField = field(popupClass, "d", editField);
        // Closes the popup and switches back to the clipboard, as Cancel does.
        closePopup = method(popupClass, "d", void.class);
        Field kind = Class.forName("fsd", false, loader).getDeclaredField("b");
        kind.setAccessible(true);
        addEntryKind = kind.get(null);
        if (!EditText.class.isAssignableFrom(queryField.getType())) {
            throw new NoSuchFieldException("Clipboard add-entry field is not an EditText");
        }
    }

    public boolean available(Object keyboard) throws ReflectiveOperationException {
        return controller.get(keyboard) != null;
    }

    /** Opens the add-entry keyboard as a query field; {@code view} schedules the hand-off. */
    public void open(Object keyboard, View view, Texts texts, Consumer<Throwable> report)
            throws ReflectiveOperationException {
        Object owner = controller.get(keyboard);
        if (owner == null) return;
        GboardClipboardSearch.begin();
        try {
            openAddEntry.invoke(keyboard, (Object) null);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            GboardClipboardSearch.clear();
            throw failure;
        }
        view.post(new Installer(owner, view, texts, report));
    }

    /** Clears the filter and reloads the visible list. */
    public void clear(Object keyboard) throws ReflectiveOperationException {
        GboardClipboardSearch.clear();
        Object list = adapter.get(keyboard);
        if (list != null) reload.invoke(list);
    }

    /** The keyboard switch is asynchronous: retry on later frames until the field is live. */
    private final class Installer implements Runnable {
        final Object owner;
        final View view;
        final Texts texts;
        final Consumer<Throwable> report;
        int attempts;

        Installer(Object owner, View view, Texts texts, Consumer<Throwable> report) {
            this.owner = owner;
            this.view = view;
            this.texts = texts;
            this.report = report;
        }

        @Override public void run() {
            try {
                if (!GboardClipboardSearch.pending()) return;
                if (!install()) {
                    if (++attempts < INSTALL_ATTEMPTS) view.postDelayed(this, 16L);
                    else GboardClipboardSearch.clear();
                }
            } catch (Throwable failure) {
                GboardClipboardSearch.clear();
                report.accept(failure);
            }
        }

        private boolean install() throws ReflectiveOperationException {
            return installPopup() || installKeyboard();
        }

        private boolean installPopup() throws ReflectiveOperationException {
            Object window = popup.get(owner);
            if (window == null) return false;
            Object field = popupField.get(window);
            if (!(field instanceof EditText text) || !text.isAttachedToWindow()) return false;
            // Layout order: title, field, Cancel, Save. Resource ids are obfuscated, so walk it.
            List<Button> buttons = new ArrayList<>();
            TextView label = collect(text.getRootView(), text, buttons, null);
            if (buttons.isEmpty()) return false;
            Button search = buttons.get(buttons.size() - 1);
            search.setText(texts.action);
            // The popup is rebuilt for every open, so this listener never outlives the search.
            search.setOnClickListener(clicked -> {
                try {
                    if (GboardClipboardSearch.submit(text.getText())) closePopup.invoke(window);
                } catch (Throwable failure) {
                    GboardClipboardSearch.clear();
                    report.accept(failure);
                }
            });
            if (label != null) label.setText(texts.title);
            text.setHint(texts.hint);
            return true;
        }

        /** Collects buttons in layout order and returns the first plain TextView (the title). */
        private TextView collect(View view, View field, List<Button> buttons, TextView title) {
            if (view instanceof Button button) {
                buttons.add(button);
            } else if (view != field && view instanceof TextView text && !(view instanceof EditText)) {
                if (title == null) title = text;
            } else if (view instanceof ViewGroup group) {
                for (int i = 0; i < group.getChildCount(); i++) {
                    title = collect(group.getChildAt(i), field, buttons, title);
                }
            }
            return title;
        }

        private boolean installKeyboard() throws ReflectiveOperationException {
            Object entry = addEntry.get(owner);
            if (entry == null || addEntryType.get(owner) != addEntryKind) return false;
            Object field = queryField.get(entry);
            Object stock = saver.get(entry);
            if (!(field instanceof EditText text) || !text.isAttachedToWindow() || stock == null) {
                return false;
            }
            if (!Proxy.isProxyClass(stock.getClass())) saver.set(entry, wrap(saverType, stock));
            if (titleField.get(entry) instanceof TextView label) label.setText(texts.title);
            if (doneField.get(entry) instanceof TextView done) done.setText(texts.action);
            text.setHint(texts.hint);
            return true;
        }
    }

    /** Wraps a save callback; only its 3-argument save is intercepted while a search is pending. */
    private static Object wrap(Class<?> type, Object target) {
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[] {type},
                (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "equals": return proxy == args[0];
                        case "hashCode": return System.identityHashCode(proxy);
                        case "toString": return "ClipboardSearchSaver";
                        default: break;
                    }
                    if (method.getDeclaringClass() == type && args != null && args.length == 3
                            && args[2] instanceof CharSequence query
                            && GboardClipboardSearch.submit(query)) {
                        return null;
                    }
                    try {
                        return method.invoke(target, args);
                    } catch (java.lang.reflect.InvocationTargetException failure) {
                        throw failure.getCause();
                    }
                });
    }

    private static Field field(Class<?> owner, String name, Class<?> type)
            throws NoSuchFieldException {
        Field value = owner.getDeclaredField(name);
        if (value.getType() != type) throw new NoSuchFieldException(owner.getName() + "." + name);
        value.setAccessible(true);
        return value;
    }

    private static Method method(Class<?> owner, String name, Class<?> result, Class<?>... params)
            throws NoSuchMethodException {
        Method value = owner.getDeclaredMethod(name, params);
        if (value.getReturnType() != result) {
            throw new NoSuchMethodException(owner.getName() + "." + name);
        }
        value.setAccessible(true);
        return value;
    }
}

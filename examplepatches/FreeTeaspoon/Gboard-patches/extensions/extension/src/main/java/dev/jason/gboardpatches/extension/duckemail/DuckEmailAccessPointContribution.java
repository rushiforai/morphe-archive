package dev.jason.gboardpatches.extension.duckemail;

import android.content.Context;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

public final class DuckEmailAccessPointContribution {
    public static final DuckEmailAccessPointContribution INSTANCE =
            new DuckEmailAccessPointContribution();
    public static final String TOKEN = "duck_email";

    private static volatile Handles handles;

    private DuckEmailAccessPointContribution() {
    }

    public Object extendOrderCatalog(Context context, Object original) {
        try {
            if (!DuckEmailRuntime.enabled(context)
                    || !(original instanceof Set<?> collection)) {
                return original;
            }
            Class<?> immutableCollection = Class.forName(
                    "wpa", false, original.getClass().getClassLoader());
            if (!immutableCollection.isInstance(original)) return original;
            List<String> values = copyStrings(collection);
            if (values.size() != collection.size() || values.contains(TOKEN)) return original;
            values.add(TOKEN);
            Method copy = immutableCollection.getDeclaredMethod("n", Collection.class);
            if (copy.getReturnType() != immutableCollection
                    || !Modifier.isStatic(copy.getModifiers())) return original;
            copy.setAccessible(true);
            return copy.invoke(null, values);
        } catch (Throwable ignored) {
            return original;
        }
    }

    public void register(Object controller, Context context) {
        try {
            if (controller == null || context == null
                    || !DuckEmailRuntime.enabled(context)) {
                return;
            }
            Context application = context.getApplicationContext();
            Context safeContext = application != null ? application : context;
            Handles active = handles(controller.getClass().getClassLoader());
            int icon = context.getResources().getIdentifier(
                    "ic_duck_email", "drawable", context.getPackageName());
            if (icon == 0) return;
            Object builder = active.descriptorBuilderFactory.invoke(null);
            active.builderTokenMethod.invoke(builder, TOKEN);
            active.builderIconResourceMethod.invoke(builder, icon);
            active.builderLabelTextField.set(builder, dev.jason.gboardpatches.extension.settings.GboardSettingsText.get(context,
                    dev.jason.gboardpatches.extension.R.string.gboard_duck_email_button));
            active.builderRunnableMethod.invoke(builder, new OpenAction(safeContext));
            Object descriptor = active.builderBuildMethod.invoke(builder);
            active.controllerRegisterMethod.invoke(controller, descriptor, false);
        } catch (Throwable failure) {
            android.util.Log.w("GboardPatches", "Duck email toolbar registration failed", failure);
        }
    }

    static List<String> copyStrings(Collection<?> values) {
        List<String> result = new ArrayList<>();
        if (values != null) {
            for (Object value : values) {
                if (value instanceof String stringValue && !result.contains(stringValue)) {
                    result.add(stringValue);
                }
            }
        }
        return result;
    }

    private static Handles handles(ClassLoader classLoader) throws Throwable {
        Handles current = handles;
        if (current != null && current.classLoader == classLoader) {
            return current;
        }
        synchronized (DuckEmailAccessPointContribution.class) {
            current = handles;
            if (current == null || current.classLoader != classLoader) {
                current = Handles.resolve(classLoader);
                handles = current;
            }
            return current;
        }
    }

    private static final class OpenAction implements Runnable {
        private final WeakReference<Context> contextReference;

        OpenAction(Context context) {
            contextReference = new WeakReference<>(context);
        }

        @Override
        public void run() {
            Context context = null;
            try {
                context = contextReference.get();
                DuckEmailRuntime.generate(context);
            } catch (Throwable ignored) {
                // Runtime handles failures without interrupting Gboard.
            }
        }
    }

    private static final class Handles {
        final ClassLoader classLoader;
        final Method descriptorBuilderFactory;
        final Method builderTokenMethod;
        final Method builderRunnableMethod;
        final Method builderBuildMethod;
        final Method builderIconResourceMethod;
        final Field builderLabelTextField;
        final Method controllerRegisterMethod;

        Handles(ClassLoader classLoader, Method descriptorBuilderFactory,
                Method builderTokenMethod, Method builderRunnableMethod,
                Method builderBuildMethod, Method builderIconResourceMethod,
                Field builderLabelTextField,
                Method controllerRegisterMethod) {
            this.classLoader = classLoader;
            this.descriptorBuilderFactory = descriptorBuilderFactory;
            this.builderTokenMethod = builderTokenMethod;
            this.builderRunnableMethod = builderRunnableMethod;
            this.builderBuildMethod = builderBuildMethod;
            this.builderIconResourceMethod = builderIconResourceMethod;
            this.builderLabelTextField = builderLabelTextField;
            this.controllerRegisterMethod = controllerRegisterMethod;
        }

        static Handles resolve(ClassLoader classLoader) throws Throwable {
            Class<?> descriptor = Class.forName("mtr", false, classLoader);
            Class<?> builder = Class.forName("mtm", false, classLoader);
            Class<?> controller = Class.forName("mwv", false, classLoader);
            Method descriptorBuilderFactory = method(descriptor, "c", builder, true);
            Method builderTokenMethod = method(builder, "l", void.class, false, String.class);
            Method builderRunnableMethod = method(builder, "q", void.class, false, Runnable.class);
            Method builderBuildMethod = method(builder, "a", descriptor, false);
            Method builderIconResourceMethod = method(builder, "i", void.class, false, int.class);
            Field builderLabelTextField = builder.getDeclaredField("d");
            if (builderLabelTextField.getType() != String.class
                    || Modifier.isStatic(builderLabelTextField.getModifiers())) {
                throw new NoSuchFieldException("mtm.d:String");
            }
            Method controllerRegisterMethod = method(
                    controller, "g", void.class, false, descriptor, boolean.class);
            builderLabelTextField.setAccessible(true);
            controllerRegisterMethod.setAccessible(true);
            return new Handles(classLoader, descriptorBuilderFactory, builderTokenMethod,
                    builderRunnableMethod, builderBuildMethod, builderIconResourceMethod,
                    builderLabelTextField,
                    controllerRegisterMethod);
        }

        private static Method method(Class<?> owner, String name, Class<?> result,
                boolean isStatic, Class<?>... parameters) throws ReflectiveOperationException {
            Method method = owner.getDeclaredMethod(name, parameters);
            if (method.getReturnType() != result
                    || Modifier.isStatic(method.getModifiers()) != isStatic) {
                throw new NoSuchMethodException(owner.getName() + "." + name);
            }
            method.setAccessible(true);
            return method;
        }
    }
}

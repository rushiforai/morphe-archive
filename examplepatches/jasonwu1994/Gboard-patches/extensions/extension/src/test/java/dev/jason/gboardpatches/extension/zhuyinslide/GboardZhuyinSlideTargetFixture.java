package dev.jason.gboardpatches.extension.zhuyinslide;

import android.content.Context;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public final class GboardZhuyinSlideTargetFixture {
    private static final String SOFT_KEY_VIEW_NAME =
            "com.google.android.libraries.inputmethod.widgets.SoftKeyView";
    private static final String SOFT_KEY_VIEW_INTERNAL_NAME =
            "com/google/android/libraries/inputmethod/widgets/SoftKeyView";
    private static final String POINTER_TRACKER_NAME = "pbl";
    private static final String[] TARGET_CLASS_NAMES = new String[] {
            "owd", "oth", "otk", "oud", "oti", "ovv", "ouc", "pbj", "pnp"
    };
    private static final FixtureClassLoader CLASS_LOADER = new FixtureClassLoader(
            GboardZhuyinSlideTargetFixture.class.getClassLoader(),
            buildSoftKeyViewClass(), buildPointerTrackerClass());
    private static final Class<?> SOFT_KEY_VIEW_CLASS = loadClass(SOFT_KEY_VIEW_NAME);
    private static final Class<?> METADATA_CLASS = loadClass("owd");
    private static final Class<?> POINTER_TRACKER_CLASS = loadClass(POINTER_TRACKER_NAME);

    private GboardZhuyinSlideTargetFixture() {
    }

    public static Object newSoftKeyView(Context context) throws Exception {
        return SOFT_KEY_VIEW_CLASS.getConstructor(Context.class).newInstance(context);
    }

    public static Object newPointerTracker() throws Exception {
        return POINTER_TRACKER_CLASS.getConstructor().newInstance();
    }

    public static Object metadata(int keyId, String primaryLabel, String pressText,
            String[] longPressTokens, String nativeSlideUp, String nativeSlideDown)
            throws Exception {
        return METADATA_CLASS.getMethod(
                "key", int.class, String.class, String.class, String[].class,
                String.class, String.class)
                .invoke(null, Integer.valueOf(keyId), primaryLabel, pressText,
                        longPressTokens, nativeSlideUp, nativeSlideDown);
    }

    public static void bind(Object view, Object metadata, long token) throws Exception {
        SOFT_KEY_VIEW_CLASS.getMethod("q", METADATA_CLASS, long.class)
                .invoke(view, metadata, Long.valueOf(token));
    }

    public static Object boundMetadata(Object view) throws Exception {
        return SOFT_KEY_VIEW_CLASS.getField("e").get(view);
    }

    public static void setResourceEntryName(Object view, int viewId, String resourceEntryName)
            throws Exception {
        ((android.view.View) view).setId(viewId);
        GboardZhuyinSlideFixtureResources.register(viewId, resourceEntryName);
    }

    static Object newDispatcher(Context context) throws Exception {
        Class<?> preferencesClass = loadClass("pnp");
        Object preferences = preferencesClass.getMethod("instance").invoke(null);
        return loadClass("pbj").getConstructor(Context.class, preferencesClass)
                .newInstance(context, preferences);
    }

    static void resetPreferences() throws Exception {
        loadClass("pnp").getMethod("reset").invoke(null);
    }

    static Object action(String actionName) {
        return enumValue(loadClass("oth"), actionName);
    }

    public static void setCurrentOwner(Object tracker, Object view) throws Exception {
        pointerField("m").set(tracker, view);
    }

    public static void setActions(Object tracker, String currentAction, String resolvedAction)
            throws Exception {
        Class<?> actionType = loadClass("oth");
        pointerField("currentAction").set(tracker, enumValue(actionType, currentAction));
        pointerField("resolvedAction").set(tracker, enumValue(actionType, resolvedAction));
    }

    static void setThrowOnResolve(Object tracker, boolean shouldThrow) throws Exception {
        pointerField("throwOnResolve").setBoolean(tracker, shouldThrow);
    }

    static Object exactAction(Object metadata, String actionName) throws Exception {
        Class<?> actionType = loadClass("oth");
        Method lookup = METADATA_CLASS.getMethod("h", actionType);
        return lookup.invoke(metadata, enumValue(actionType, actionName));
    }

    static Object actionPayload(Object action) throws Exception {
        Object[] entries = (Object[]) action.getClass().getField("d").get(action);
        return entries[0].getClass().getField("e").get(entries[0]);
    }

    private static Field pointerField(String name) throws Exception {
        return POINTER_TRACKER_CLASS.getField(name);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static Object enumValue(Class<?> enumClass, String name) {
        return Enum.valueOf((Class<? extends Enum>) enumClass.asSubclass(Enum.class), name);
    }

    private static Class<?> loadClass(String name) {
        try {
            return Class.forName(name, true, CLASS_LOADER);
        } catch (ClassNotFoundException exception) {
            throw new AssertionError(exception);
        }
    }

    private static byte[] buildSoftKeyViewClass() {
        ClassWriter writer = classWriter();
        writer.visit(Opcodes.V1_8, Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL,
                SOFT_KEY_VIEW_INTERNAL_NAME, null, "android/view/View", null);
        writer.visitField(Opcodes.ACC_PUBLIC, "e", "Lowd;", null, null).visitEnd();
        writer.visitField(Opcodes.ACC_PUBLIC, "f", "J", null, null).visitEnd();

        MethodVisitor constructor = writer.visitMethod(
                Opcodes.ACC_PUBLIC, "<init>", "(Landroid/content/Context;)V", null, null);
        constructor.visitCode();
        constructor.visitVarInsn(Opcodes.ALOAD, 0);
        constructor.visitVarInsn(Opcodes.ALOAD, 1);
        constructor.visitMethodInsn(Opcodes.INVOKESPECIAL, "android/view/View", "<init>",
                "(Landroid/content/Context;)V", false);
        constructor.visitInsn(Opcodes.RETURN);
        constructor.visitMaxs(0, 0);
        constructor.visitEnd();

        MethodVisitor bind = writer.visitMethod(
                Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL, "q", "(Lowd;J)Z", null, null);
        bind.visitCode();
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitVarInsn(Opcodes.ALOAD, 1);
        bind.visitMethodInsn(Opcodes.INVOKESTATIC,
                "dev/jason/gboardpatches/extension/toprowswipe/GboardTopRowSwipeRuntime",
                "patchIncomingSoftKeyMetadata",
                "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                false);
        bind.visitTypeInsn(Opcodes.CHECKCAST, "owd");
        bind.visitVarInsn(Opcodes.ASTORE, 1);
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitVarInsn(Opcodes.ALOAD, 1);
        bind.visitMethodInsn(Opcodes.INVOKESTATIC,
                "dev/jason/gboardpatches/extension/zhuyintoggle/"
                        + "GboardZhuyinTraditionalSimplifiedToggleRuntime",
                "patchIncomingSoftKeyMetadata",
                "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                false);
        bind.visitTypeInsn(Opcodes.CHECKCAST, "owd");
        bind.visitVarInsn(Opcodes.ASTORE, 1);
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitVarInsn(Opcodes.ALOAD, 1);
        bind.visitMethodInsn(Opcodes.INVOKESTATIC,
                "dev/jason/gboardpatches/extension/zhuyinslide/GboardZhuyinSlideRuntime",
                "patchIncomingSoftKeyMetadata",
                "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                false);
        bind.visitTypeInsn(Opcodes.CHECKCAST, "owd");
        bind.visitVarInsn(Opcodes.ASTORE, 1);
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitVarInsn(Opcodes.ALOAD, 1);
        bind.visitFieldInsn(Opcodes.PUTFIELD, SOFT_KEY_VIEW_INTERNAL_NAME, "e", "Lowd;");
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitVarInsn(Opcodes.LLOAD, 2);
        bind.visitFieldInsn(Opcodes.PUTFIELD, SOFT_KEY_VIEW_INTERNAL_NAME, "f", "J");
        bind.visitInsn(Opcodes.ICONST_1);
        bind.visitInsn(Opcodes.IRETURN);
        bind.visitMaxs(0, 0);
        bind.visitEnd();

        MethodVisitor resources = writer.visitMethod(
                Opcodes.ACC_PUBLIC, "getResources", "()Landroid/content/res/Resources;",
                null, null);
        resources.visitCode();
        resources.visitMethodInsn(Opcodes.INVOKESTATIC,
                "dev/jason/gboardpatches/extension/zhuyinslide/"
                        + "GboardZhuyinSlideFixtureResources",
                "instance", "()Landroid/content/res/Resources;", false);
        resources.visitInsn(Opcodes.ARETURN);
        resources.visitMaxs(0, 0);
        resources.visitEnd();
        writer.visitEnd();
        return writer.toByteArray();
    }

    private static byte[] buildPointerTrackerClass() {
        ClassWriter writer = classWriter();
        writer.visit(Opcodes.V1_8, Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL,
                POINTER_TRACKER_NAME, null, "java/lang/Object", null);
        writer.visitField(Opcodes.ACC_PUBLIC, "m", "L" + SOFT_KEY_VIEW_INTERNAL_NAME + ";",
                null, null).visitEnd();
        writer.visitField(Opcodes.ACC_PUBLIC, "currentAction", "Loth;", null, null).visitEnd();
        writer.visitField(Opcodes.ACC_PUBLIC, "resolvedAction", "Loth;", null, null).visitEnd();
        writer.visitField(Opcodes.ACC_PUBLIC, "throwOnResolve", "Z", null, null).visitEnd();

        MethodVisitor constructor = writer.visitMethod(
                Opcodes.ACC_PUBLIC, "<init>", "()V", null, null);
        constructor.visitCode();
        constructor.visitVarInsn(Opcodes.ALOAD, 0);
        constructor.visitMethodInsn(Opcodes.INVOKESPECIAL, "java/lang/Object", "<init>",
                "()V", false);
        constructor.visitInsn(Opcodes.RETURN);
        constructor.visitMaxs(0, 0);
        constructor.visitEnd();

        MethodVisitor owner = writer.visitMethod(
                Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL, "B",
                "(L" + SOFT_KEY_VIEW_INTERNAL_NAME + ";FFJI)V", null, null);
        owner.visitCode();
        owner.visitInsn(Opcodes.RETURN);
        owner.visitMaxs(0, 0);
        owner.visitEnd();

        MethodVisitor cancel = writer.visitMethod(
                Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL, "s", "(J)V", null, null);
        cancel.visitCode();
        cancel.visitInsn(Opcodes.RETURN);
        cancel.visitMaxs(0, 0);
        cancel.visitEnd();

        MethodVisitor reset = writer.visitMethod(
                Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL, "C", "()V", null, null);
        reset.visitCode();
        reset.visitInsn(Opcodes.RETURN);
        reset.visitMaxs(0, 0);
        reset.visitEnd();

        MethodVisitor current = writer.visitMethod(
                Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL, "i", "()Loth;", null, null);
        current.visitCode();
        current.visitVarInsn(Opcodes.ALOAD, 0);
        current.visitFieldInsn(Opcodes.GETFIELD, POINTER_TRACKER_NAME, "currentAction", "Loth;");
        current.visitInsn(Opcodes.ARETURN);
        current.visitMaxs(0, 0);
        current.visitEnd();

        MethodVisitor resolve = writer.visitMethod(
                Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL, "h", "(FFLoth;)Loth;", null, null);
        resolve.visitCode();
        Label returnConfigured = new Label();
        resolve.visitVarInsn(Opcodes.ALOAD, 0);
        resolve.visitFieldInsn(Opcodes.GETFIELD, POINTER_TRACKER_NAME, "throwOnResolve", "Z");
        resolve.visitJumpInsn(Opcodes.IFEQ, returnConfigured);
        resolve.visitTypeInsn(Opcodes.NEW, "java/lang/IllegalStateException");
        resolve.visitInsn(Opcodes.DUP);
        resolve.visitLdcInsn("fixture resolve failure");
        resolve.visitMethodInsn(Opcodes.INVOKESPECIAL, "java/lang/IllegalStateException",
                "<init>", "(Ljava/lang/String;)V", false);
        resolve.visitInsn(Opcodes.ATHROW);
        resolve.visitLabel(returnConfigured);
        resolve.visitVarInsn(Opcodes.ALOAD, 0);
        resolve.visitFieldInsn(Opcodes.GETFIELD, POINTER_TRACKER_NAME, "resolvedAction", "Loth;");
        Label returnResolved = new Label();
        resolve.visitInsn(Opcodes.DUP);
        resolve.visitJumpInsn(Opcodes.IFNONNULL, returnResolved);
        resolve.visitInsn(Opcodes.POP);
        resolve.visitVarInsn(Opcodes.ALOAD, 3);
        resolve.visitLabel(returnResolved);
        resolve.visitInsn(Opcodes.ARETURN);
        resolve.visitMaxs(0, 0);
        resolve.visitEnd();
        writer.visitEnd();
        return writer.toByteArray();
    }

    private static ClassWriter classWriter() {
        return new ClassWriter(ClassWriter.COMPUTE_FRAMES | ClassWriter.COMPUTE_MAXS) {
            @Override
            protected String getCommonSuperClass(String left, String right) {
                return "java/lang/Object";
            }
        };
    }

    private static final class FixtureClassLoader extends ClassLoader {
        private final byte[] softKeyViewClass;
        private final byte[] pointerTrackerClass;

        FixtureClassLoader(ClassLoader parent, byte[] softKeyViewClass,
                byte[] pointerTrackerClass) {
            super(parent);
            this.softKeyViewClass = softKeyViewClass;
            this.pointerTrackerClass = pointerTrackerClass;
        }

        @Override
        protected Class<?> findClass(String name) throws ClassNotFoundException {
            if (SOFT_KEY_VIEW_NAME.equals(name)) {
                return defineClass(name, softKeyViewClass, 0, softKeyViewClass.length);
            }
            if (POINTER_TRACKER_NAME.equals(name)) {
                return defineClass(name, pointerTrackerClass, 0, pointerTrackerClass.length);
            }
            if (isTargetClass(name)) {
                byte[] classBytes = readParentClassBytes(name);
                return defineClass(name, classBytes, 0, classBytes.length);
            }
            throw new ClassNotFoundException(name);
        }

        @Override
        protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
            if (!SOFT_KEY_VIEW_NAME.equals(name)
                    && !POINTER_TRACKER_NAME.equals(name)
                    && !isTargetClass(name)) {
                return super.loadClass(name, resolve);
            }
            synchronized (this) {
                Class<?> loaded = findLoadedClass(name);
                if (loaded == null) {
                    loaded = findClass(name);
                }
                if (resolve) {
                    resolveClass(loaded);
                }
                return loaded;
            }
        }

        private byte[] readParentClassBytes(String name) throws ClassNotFoundException {
            String resourceName = name.replace('.', '/') + ".class";
            InputStream input = getParent().getResourceAsStream(resourceName);
            if (input == null) {
                throw new ClassNotFoundException(name);
            }
            try {
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    output.write(buffer, 0, read);
                }
                return output.toByteArray();
            } catch (IOException exception) {
                throw new ClassNotFoundException(name, exception);
            } finally {
                try {
                    input.close();
                } catch (IOException ignored) {
                    // Fixture cleanup only.
                }
            }
        }

        private boolean isTargetClass(String name) {
            for (String targetClassName : TARGET_CLASS_NAMES) {
                if (targetClassName.equals(name)) {
                    return true;
                }
            }
            return false;
        }
    }
}

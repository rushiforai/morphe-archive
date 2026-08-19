package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/** Native Morphe settings content owned by Local Downloads. */
public final class LocalDownloadsSettingsContent implements Function3<Object, Object, Object, Unit> {
    private static final String[] NATIVE_SLIDER_CLASS_NAMES = {"sa.g6"};
    private static final String[] NATIVE_SLIDER_ICON_CLASS_NAMES = {"x0.d"};
    private final Object modifier;

    private LocalDownloadsSettingsContent(Object modifier) { this.modifier = modifier; }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new LocalDownloadsSettingsContent(modifier);
    }

    @Override public Unit invoke(Object scope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.nestedSection(
                composer,
                "Local Downloads",
                "Download selected movie and episode sources to local storage",
                true,
                (innerScope, innerComposer, innerFlags) -> {
                    if (!MorpheSettingsUi.beginComposition(innerComposer, innerFlags)) {
                        return Unit.INSTANCE;
                    }
                    boolean enabled = LocalDownloadsSettings.isEnabled();
                    MorpheSettingsUi.switchRow(
                            modifier,
                            innerComposer,
                            "Allow local downloads",
                            "Add Download to storage to title playback options",
                            enabled,
                            LocalDownloadsToggleAction.INSTANCE
                    );
                    if (enabled) {
                        renderStorageSlider(innerComposer);
                        MorpheSettingsUi.switchRow(
                                modifier,
                                innerComposer,
                                "Autoplay local storage when available",
                                "Use an exact downloaded copy when Play is pressed",
                                LocalDownloadsSettings.isAutoplayEnabled(),
                                LocalDownloadsAutoplayAction.INSTANCE
                        );
                        int count = LocalDownloadsRuntime.availableEntries().size();
                        MorpheSettingsUi.selectorRow(
                                modifier,
                                innerComposer,
                                "Downloads",
                                count + (count == 1 ? " item" : " items"),
                                LocalDownloadsManagerAction.INSTANCE
                        );
                    }
                    return Unit.INSTANCE;
                }
        );
        return Unit.INSTANCE;
    }

    private static void renderStorageSlider(Object composer) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Class<?> iconClass = Class.forName("h2.f", false, loader);
            Class<?> composerClass = Class.forName("e1.m0", false, loader);
            Method iconFactory = findNativeSliderIcon(loader, iconClass);
            iconFactory.setAccessible(true);
            Object icon = iconFactory.invoke(null);
            Method slider = findNativeSlider(loader, iconClass, composerClass);
            int percentage = LocalDownloadsSettings.freePercent();
            Function1<Object, Unit> onValue = value -> {
                if (value instanceof Number) {
                    LocalDownloadsSettings.setFreePercent(
                            LocalDownloadsSettings.percentageAtSliderIndex(
                                    ((Number) value).intValue()
                            )
                    );
                    MorpheSettingsUi.refresh();
                }
                return Unit.INSTANCE;
            };
            slider.invoke(null,
                    icon,
                    "Maximum usable selected storage",
                    LocalDownloadsSettings.sliderIndex(),
                    percentage + "%",
                    0,
                    LocalDownloadsSettings.sliderMaximum(),
                    1,
                    onValue,
                    LocalDownloadsStorageStats.caption(),
                    MorpheSettingsUi.noOp(),
                    true,
                    null,
                    composer,
                    0,
                    3072
            );
        } catch (Throwable error) {
            throw new IllegalStateException("Unable to render the Local Downloads storage slider", error);
        }
    }

    private static Method findNativeSlider(
            ClassLoader loader,
            Class<?> iconClass,
            Class<?> composerClass
    ) throws ReflectiveOperationException {
        for (String className : NATIVE_SLIDER_CLASS_NAMES) {
            Class<?> owner;
            try {
                owner = Class.forName(className, false, loader);
            } catch (ClassNotFoundException ignored) {
                continue;
            }
            for (Method candidate : owner.getDeclaredMethods()) {
                if (Modifier.isStatic(candidate.getModifiers()) &&
                        candidate.getReturnType() == Void.TYPE &&
                        matchesNativeSliderParameters(candidate.getParameterTypes(), iconClass, composerClass)) {
                    candidate.setAccessible(true);
                    return candidate;
                }
            }
        }
        throw new NoSuchMethodException("Native Nuvio storage slider method");
    }

    private static Method findNativeSliderIcon(
            ClassLoader loader,
            Class<?> iconClass
    ) throws ReflectiveOperationException {
        for (String className : NATIVE_SLIDER_ICON_CLASS_NAMES) {
            Class<?> owner;
            try {
                owner = Class.forName(className, false, loader);
            } catch (ClassNotFoundException ignored) {
                continue;
            }
            try {
                Method candidate = owner.getDeclaredMethod("v");
                if (Modifier.isStatic(candidate.getModifiers()) &&
                        candidate.getReturnType() == iconClass) {
                    candidate.setAccessible(true);
                    return candidate;
                }
            } catch (NoSuchMethodException ignored) {
                // A failed exact match must stop rendering for this supported Nuvio version.
            }
        }
        throw new NoSuchMethodException("Native Nuvio storage slider icon");
    }

    private static boolean matchesNativeSliderParameters(
            Class<?>[] parameters,
            Class<?> iconClass,
            Class<?> composerClass
    ) {
        return parameters.length == 15 &&
                parameters[0] == iconClass && parameters[1] == String.class &&
                parameters[2] == Integer.TYPE && parameters[3] == String.class &&
                parameters[4] == Integer.TYPE && parameters[5] == Integer.TYPE &&
                parameters[6] == Integer.TYPE &&
                Function1.class.isAssignableFrom(parameters[7]) &&
                parameters[8] == String.class &&
                Function0.class.isAssignableFrom(parameters[9]) &&
                parameters[10] == Boolean.TYPE && !parameters[11].isPrimitive() &&
                parameters[12] == composerClass &&
                parameters[13] == Integer.TYPE && parameters[14] == Integer.TYPE;
    }

    static boolean matchesNativeSliderParametersForTesting(Class<?>[] parameters) {
        return matchesNativeSliderParameters(parameters, parameters[0], parameters[12]);
    }
}

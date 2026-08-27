package app.morphe.extension.discord.bunny;

import java.io.IOException;

/** Semantic Bunny-owned JS bridge for launcher navigation and voice actions. */
final class BunnyAndroidIntegrationBundlePatch {
    private BunnyAndroidIntegrationBundlePatch() {}

    static String apply(String source) throws IOException {
        String patched = replace(source,
                "  var src_exports = {};\n",
                """
  var bunnyLauncherPendingTarget;
  var bunnyLauncherNavigationInFlight = false;
  var bunnyLauncherNavigationScheduled = false;
  var bunnyDiscordSettingsRouter;
  var bunnyLauncherRootNavigationUnsubscribe;
  var bunnyLauncherParentFocusUnsubscribe;
  var bunnyAndroidIntegrationInstalled = false;

  function bunnyFinishLauncherNavigation(target) {
    require_react_native().Linking.openURL(
      "bunny-morphe://launcher/ack-navigation?target=" +
      encodeURIComponent(target)
    ).then(() => {
      if (bunnyLauncherPendingTarget === target) {
        bunnyLauncherPendingTarget = void 0;
      }

      bunnyLauncherNavigationInFlight = false;
    }).catch(() => {
      require_react_native()
        .InteractionManager
        .runAfterInteractions(() => {
          requestAnimationFrame(() => {
            if (
              bunnyLauncherPendingTarget === target &&
              bunnyLauncherNavigationInFlight
            ) {
              bunnyFinishLauncherNavigation(target);
            }
          });
        });
    });
  }

  function bunnyRootNavigationReady() {
    var navigationRef;

    try {
      navigationRef =
        tabsNavigationRef?.getRootNavigationRef?.();
    } catch (_) {
      return false;
    }

    if (!navigationRef) {
      return false;
    }

    var ready = true;

    try {
      if (
        typeof navigationRef.isReady === "function"
      ) {
        ready = !!navigationRef.isReady();
      }
    } catch (_) {
      ready = false;
    }

    if (ready) {
      bunnyLauncherRootNavigationUnsubscribe?.();
      bunnyLauncherRootNavigationUnsubscribe = void 0;
      return true;
    }

    if (
      !bunnyLauncherRootNavigationUnsubscribe &&
      typeof navigationRef.addListener === "function"
    ) {
      bunnyLauncherRootNavigationUnsubscribe =
        navigationRef.addListener(
          "state",
          () => {
            var nowReady = true;

            try {
              if (
                typeof navigationRef.isReady ===
                "function"
              ) {
                nowReady =
                  !!navigationRef.isReady();
              }
            } catch (_) {
              nowReady = false;
            }

            if (!nowReady) {
              return;
            }

            bunnyLauncherRootNavigationUnsubscribe?.();
            bunnyLauncherRootNavigationUnsubscribe =
              void 0;

            bunnyScheduleLauncherNavigation();
          }
        );
    }

    return false;
  }

  function bunnyResetLauncherAttempt(target) {
    if (
      globalThis.__BUNNY_LAUNCHER_TARGET__ ===
      target
    ) {
      delete globalThis.__BUNNY_LAUNCHER_TARGET__;
    }

    delete globalThis.__BUNNY_LAUNCHER_ROW_DISPATCHED__;

    bunnyLauncherNavigationInFlight = false;
  }

  function bunnyClearParentFocusListener() {
    try {
      bunnyLauncherParentFocusUnsubscribe?.();
    } catch (_) {
    }

    bunnyLauncherParentFocusUnsubscribe =
      void 0;
  }

  function bunnyResetLauncherAttempt(target) {
    bunnyClearParentFocusListener();

    if (
      globalThis.__BUNNY_LAUNCHER_TARGET__ ===
      target
    ) {
      delete globalThis.__BUNNY_LAUNCHER_TARGET__;
    }

    delete globalThis.__BUNNY_LAUNCHER_ROW_DISPATCHED__;

    bunnyLauncherNavigationInFlight = false;
  }

  function bunnyGetParentSettingsNavigation() {
    return globalThis
      .__BUNNY_PARENT_SETTINGS_NAVIGATION__;
  }

  function bunnyGetParentSettingsRouteName() {
    var routeName =
      globalThis
        .__BUNNY_PARENT_SETTINGS_ROUTE_NAME__;

    return typeof routeName === "string" &&
      routeName.length > 0
      ? routeName
      : null;
  }

  function bunnyIsParentSettingsFocused() {
    var navigation =
      bunnyGetParentSettingsNavigation();

    var routeName =
      bunnyGetParentSettingsRouteName();

    if (!navigation || !routeName) {
      return false;
    }

    try {
      if (
        typeof navigation.isFocused ===
        "function"
      ) {
        return !!navigation.isFocused();
      }
    } catch (_) {
    }

    try {
      var state =
        navigation.getState?.();

      var currentRoute =
        state?.routes?.[state?.index];

      return currentRoute?.name === routeName;
    } catch (_) {
      return false;
    }
  }

  function bunnyCompleteAbsoluteDestination(
    target
  ) {
    bunnyClearParentFocusListener();

    if (
      bunnyLauncherPendingTarget !== target ||
      globalThis.__BUNNY_LAUNCHER_TARGET__ !==
        target
    ) {
      bunnyLauncherNavigationInFlight = false;
      return;
    }

    if (target === "settings") {
      delete globalThis.__BUNNY_LAUNCHER_TARGET__;
      delete globalThis.__BUNNY_LAUNCHER_ROW_DISPATCHED__;

      bunnyFinishLauncherNavigation(
        "settings"
      );

      return;
    }

    if (target !== "recovery") {
      bunnyResetLauncherAttempt(target);
      return;
    }

    var bunnyRowOnPress =
      globalThis
        .__BUNNY_SETTINGS_BUNNY_ONPRESS__;

    if (
      typeof bunnyRowOnPress !== "function"
    ) {
      bunnyResetLauncherAttempt(target);
      return;
    }

    globalThis.__BUNNY_LAUNCHER_ROW_DISPATCHED__ =
      true;

    Promise.resolve()
      .then(() => bunnyRowOnPress())
      .catch(() => {
        bunnyResetLauncherAttempt(target);
      });
  }

  function bunnyReturnToParentSettings(target) {
    var navigation =
      bunnyGetParentSettingsNavigation();

    var routeName =
      bunnyGetParentSettingsRouteName();

    if (!navigation || !routeName) {
      return false;
    }

    if (bunnyIsParentSettingsFocused()) {
      bunnyCompleteAbsoluteDestination(
        target
      );

      return true;
    }

    bunnyClearParentFocusListener();

    try {
      if (
        typeof navigation.addListener ===
        "function"
      ) {
        bunnyLauncherParentFocusUnsubscribe =
          navigation.addListener(
            "focus",
            () => {
              if (
                bunnyLauncherPendingTarget !==
                  target ||
                globalThis
                  .__BUNNY_LAUNCHER_TARGET__ !==
                  target
              ) {
                bunnyClearParentFocusListener();
                return;
              }

              bunnyCompleteAbsoluteDestination(
                target
              );
            }
          );
      }
    } catch (_) {
      bunnyLauncherParentFocusUnsubscribe =
        void 0;
    }

    try {
      /*
       * Target the exact parent Settings route captured from
       * Discord itself. Never popToTop().
       */
      if (
        typeof navigation.popTo ===
        "function"
      ) {
        navigation.popTo(routeName);
      } else if (
        typeof navigation.navigate ===
        "function"
      ) {
        navigation.navigate(routeName);
      } else {
        bunnyResetLauncherAttempt(target);
        return false;
      }
    } catch (_) {
      bunnyResetLauncherAttempt(target);
      return false;
    }

    if (bunnyIsParentSettingsFocused()) {
      bunnyCompleteAbsoluteDestination(
        target
      );
    }

    return true;
  }

  function bunnyProcessAbsoluteLauncherDestination() {
    var target =
      bunnyLauncherPendingTarget;

    if (
      target !== "settings" &&
      target !== "recovery"
    ) {
      return false;
    }

    if (
      globalThis.__BUNNY_LAUNCHER_TARGET__ !==
      target
    ) {
      globalThis.__BUNNY_LAUNCHER_TARGET__ =
        target;
    }

    return bunnyReturnToParentSettings(
      target
    );
  }

  globalThis.__BUNNY_PROCESS_LAUNCHER_DESTINATION__ =
    bunnyProcessAbsoluteLauncherDestination;

  function bunnyOpenLauncherDestination(target) {
    if (bunnyLauncherNavigationInFlight) {
      return true;
    }

    if (!bunnyRootNavigationReady()) {
      return false;
    }

    try {
      bunnyDiscordSettingsRouter ??=
        findByPropsLazy("openUserSettings");
    } catch (_) {
      return false;
    }

    if (
      typeof bunnyDiscordSettingsRouter
        ?.openUserSettings !== "function"
    ) {
      return false;
    }

    bunnyLauncherNavigationInFlight =
      true;

    globalThis.__BUNNY_LAUNCHER_TARGET__ =
      target;

    delete globalThis.__BUNNY_LAUNCHER_ROW_DISPATCHED__;

    /*
     * If Discord's parent Settings route already exists,
     * normalize to that exact route.
     */
    if (
      bunnyGetParentSettingsNavigation() &&
      bunnyGetParentSettingsRouteName()
    ) {
      if (
        bunnyProcessAbsoluteLauncherDestination()
      ) {
        return true;
      }
    }

    /*
     * Otherwise open parent Discord Settings once.
     * Its real render hook captures its exact route and resumes.
     */
    try {
      bunnyDiscordSettingsRouter.openUserSettings();
    } catch (_) {
      bunnyResetLauncherAttempt(target);
      return false;
    }

    return true;
  }
  function bunnyTryLauncherNavigation() {
    if (!bunnyLauncherPendingTarget) {
      return true;
    }

    if (bunnyLauncherNavigationInFlight) {
      return true;
    }

    return bunnyOpenLauncherDestination(
      bunnyLauncherPendingTarget
    );
  }
  function bunnyScheduleLauncherNavigation() {
    if (
      bunnyLauncherNavigationScheduled ||
      !bunnyLauncherPendingTarget ||
      bunnyLauncherNavigationInFlight
    ) {
      return;
    }

    bunnyLauncherNavigationScheduled = true;

    require_react_native()
      .InteractionManager
      .runAfterInteractions(() => {
        requestAnimationFrame(() => {
          bunnyLauncherNavigationScheduled = false;

          bunnyTryLauncherNavigation();
        });
      });
  }

  function bunnyRouteLauncherDestination(target) {
    if (
      target !== "settings" &&
      target !== "recovery"
    ) {
      return;
    }

    if (bunnyLauncherPendingTarget !== target) {
      bunnyLauncherPendingTarget = target;
      bunnyLauncherNavigationInFlight = false;
    }

    bunnyScheduleLauncherNavigation();
  }

  function bunnyPeekLauncherNavigation() {
    require_react_native().Linking.openURL(
      "bunny-morphe://launcher/peek-navigation"
    ).then((raw) => {
      var result =
        typeof raw === "string"
          ? JSON.parse(raw)
          : raw;

      bunnyRouteLauncherDestination(
        result?.target
      );
    }).catch(() => {});
  }

  function bunnyHandleIncomingLauncherShortcut(event) {
    var rawUrl =
      typeof event === "string"
        ? event
        : event?.url;

    if (
      typeof rawUrl !== "string" ||
      !rawUrl.startsWith(
        "bunny-morphe://shortcut/"
      )
    ) {
      return;
    }

    var operation =
      rawUrl
        .slice(
          "bunny-morphe://shortcut/".length
        )
        .split(/[?#]/)[0];

    if (operation === "safe-mode") {
      require_react_native().Linking.openURL(
        "bunny-morphe://launcher/request-safe-mode"
      ).catch(() => {});

      return;
    }

    var target =
      operation === "recovery-settings"
        ? "recovery"
        : operation === "settings"
          ? "settings"
          : null;

    if (!target) {
      return;
    }

    require_react_native().Linking.openURL(
      "bunny-morphe://launcher/request-navigation?target=" +
      encodeURIComponent(target)
    ).then(() => {
      bunnyRouteLauncherDestination(target);
    }).catch(() => {});
  }

  var bunnyVoiceBridge = {
    isVoiceConnected() {
      try {
        var store =
          findByProps(
            "getVoiceChannelId",
            "getSelfMute",
            "getSelfDeaf"
          );

        return !!store?.getVoiceChannelId?.();
      } catch (_) {
        return false;
      }
    },

    isMuted() {
      try {
        return !!findByProps(
          "getVoiceChannelId",
          "getSelfMute",
          "getSelfDeaf"
        )?.getSelfMute?.();
      } catch (_) {
        return false;
      }
    },

    toggleMute() {
      if (!this.isVoiceConnected()) {
        return;
      }

      try {
        findByProps(
          "toggleSelfMute",
          "toggleSelfDeaf"
        )?.toggleSelfMute?.();
      } catch (_) {
      }
    },

    isDeafened() {
      try {
        return !!findByProps(
          "getVoiceChannelId",
          "getSelfMute",
          "getSelfDeaf"
        )?.getSelfDeaf?.();
      } catch (_) {
        return false;
      }
    },

    toggleDeafen() {
      if (!this.isVoiceConnected()) {
        return;
      }

      try {
        findByProps(
          "toggleSelfMute",
          "toggleSelfDeaf"
        )?.toggleSelfDeaf?.();
      } catch (_) {
      }
    },

    disconnectVoice() {
      if (!this.isVoiceConnected()) {
        return;
      }

      try {
        findByProps(
          "selectVoiceChannel"
        )?.selectVoiceChannel?.(null);
      } catch (_) {
      }
    }
  };

  function bunnyRunVoiceNotificationAction(data) {
    if (!bunnyVoiceBridge.isVoiceConnected()) {
      return;
    }

    if (data?.operation === "toggle-mute") {
      bunnyVoiceBridge.toggleMute();
    } else if (
      data?.operation === "toggle-deafen"
    ) {
      bunnyVoiceBridge.toggleDeafen();
    } else if (
      data?.operation === "disconnect"
    ) {
      bunnyVoiceBridge.disconnectVoice();
    }
  }

  function bunnyInstallAndroidIntegration() {
    if (bunnyAndroidIntegrationInstalled) {
      return;
    }

    bunnyAndroidIntegrationInstalled = true;

    require_react_native()
      .AppRegistry
      .registerHeadlessTask(
        "BunnyVoiceNotificationAction",
        () => bunnyRunVoiceNotificationAction
      );

    require_react_native()
      .Linking
      .addEventListener(
        "url",
        bunnyHandleIncomingLauncherShortcut
      );

    require_react_native()
      .AppState
      .addEventListener(
        "change",
        (state) => {
          if (state !== "active") {
            return;
          }

          if (bunnyLauncherPendingTarget) {
            bunnyScheduleLauncherNavigation();
          } else {
            bunnyPeekLauncherNavigation();
          }
        }
      );

    bunnyPeekLauncherNavigation();
  }

  var src_exports = {};
""",
                "Bunny Android integration bridge");

        patched = replace(patched,
                "    var navigation2 = NavigationNative.useNavigation();\n    return /* @__PURE__ */ jsx(import_react_native16.ScrollView, {",
                """
    var navigation2 = NavigationNative.useNavigation();

    React.useEffect(() => {
      var target =
        globalThis.__BUNNY_LAUNCHER_TARGET__;

      if (
        target !== "settings" &&
        target !== "recovery"
      ) {
        return;
      }

      if (target === "recovery") {
        try {
          navigation2.push(
            "BUNNY_CUSTOM_PAGE",
            {
              title: "Recovery",
              render: () =>
                /* @__PURE__ */
                jsx(BunnyRecoveryPage, {})
            }
          );
        } catch (_) {
          bunnyLauncherNavigationInFlight = false;
          bunnyScheduleLauncherNavigation();
          return;
        }
      }

      delete globalThis.__BUNNY_LAUNCHER_TARGET__;
      delete globalThis.__BUNNY_LAUNCHER_ROW_DISPATCHED__;

      bunnyFinishLauncherNavigation(target);
    }, [navigation2]);

    return /* @__PURE__ */ jsx(import_react_native16.ScrollView, {
""",
                "Bunny launcher destination completion");

        patched = replace(patched,
                "    registerSection({\n      name: \"Vendetta\",\n      items: []\n    });\n  }\n",
                """
    registerSection({
      name: "Vendetta",
      items: []
    });

    bunnyInstallAndroidIntegration();
  }
""",
                "Bunny Android readiness installation");

        return patched;
    }

    private static String replace(
            String source,
            String anchor,
            String replacement,
            String label
    ) throws IOException {
        int first = source.indexOf(anchor);

        if (first < 0) {
            throw new IOException(
                    label + " anchor is missing"
            );
        }

        if (
                source.indexOf(
                        anchor,
                        first + anchor.length()
                ) >= 0
        ) {
            throw new IOException(
                    label + " anchor is ambiguous"
            );
        }

        return source.substring(0, first)
                + replacement
                + source.substring(first + anchor.length());
    }
}
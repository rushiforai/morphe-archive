package app.morphe.extension.discord.bunny;

import java.io.IOException;

/**
 * Bunny-owned Custom Branding settings UI.
 *
 * Android app branding and Bunny product branding are intentionally separate.
 * This page must never rename Bunny-owned settings or feature UI.
 */
/*
 * Third-party branding attribution
 *
 * Bunny core:
 *   Copyright (c) 2023 Team Vendetta
 *   Copyright (c) 2024 pylixonly
 *   BSD 3-Clause
 *
 * Vendetta core:
 *   Copyright (c) 2023 Team Vendetta
 *   BSD 3-Clause
 *
 * BunnyManager and VendettaManager are distributed under OSL 3.0.
 * Those licenses do not grant trademark rights.
 *
 * Seobject's Morphe Patches is an independent project. No affiliation,
 * sponsorship, endorsement, or ownership of third-party marks is claimed.
 */
final class BunnyBrandingBundlePatch {
    private BunnyBrandingBundlePatch() {}

    static String apply(String source) throws IOException {
        String patched = source;

        patched = replace(
                patched,
                """
  function BunnyRecoveryPage() {
""",
                """
  function bunnyBrandingCall(action, details) {
    var query =
      details
        ? "?" +
          Object.entries(details)
            .map(
              ([key, value]) =>
                encodeURIComponent(key) +
                "=" +
                encodeURIComponent(String(value))
            )
            .join("&")
        : "";

    return require_react_native().Linking.openURL(
      "bunny-morphe://launcher/branding-" +
        action +
        query
    ).then((raw) => {
      if (typeof raw !== "string") {
        throw new Error(
          "Custom Branding did not return a result."
        );
      }

      var result = JSON.parse(raw);

      if (result.status !== "success") {
        throw new Error(
          result.message ||
            "Custom Branding operation failed."
        );
      }

      return result;
    });
  }

  function BunnyCustomBrandingPage() {
    var navigation2 =
      NavigationNative.useNavigation();

    var [branding, setBranding] =
      React.useState(null);

    var [draftIcon, setDraftIcon] =
      React.useState("discord");

    var [draftName, setDraftName] =
      React.useState("discord");

    var [brandingBusy, setBrandingBusy] =
      React.useState(false);


    var restartPromptOpenRef =
      React.useRef(false);

    var refreshBranding =
      React.useCallback(() => {
        return bunnyBrandingCall(
          "status"
        )
          .then((result) => {
            setBranding(result);

            setDraftIcon(
              result?.iconMode ??
                "discord"
            );

            setDraftName(
              result?.appNameMode ??
                "discord"
            );
          })
          .catch((error) => {
            showToast(
              "Could not read Custom Branding: " +
                (
                  error?.message ??
                  String(error)
                ),
              findAssetId("Small")
            );
          });
      }, []);

    React.useEffect(() => {
      void refreshBranding();
    }, [refreshBranding]);

    var baselineIcon =
      branding?.iconMode ??
      "discord";

    var baselineName =
      branding?.appNameMode ??
      "discord";

    var selectedIcon =
      draftIcon;

    var selectedName =
      draftName;

    var brandingDirty =
      branding !== null &&
      (
        selectedIcon !== baselineIcon ||
        selectedName !== baselineName
      );

    var restartWithBranding = () => {
      if (brandingBusy)
        return;

      setBrandingBusy(true);

      bunnyBrandingCall(
        "apply",
        {
          icon: selectedIcon,
          name: selectedName
        }
      )
        .catch((error) => {
          setBrandingBusy(false);

          showToast(
            "Could not change app branding: " +
              (
                error?.message ??
                String(error)
              ),
            findAssetId("Small")
          );
        });
    };

    React.useEffect(() => {
      var unsubscribe =
        navigation2.addListener(
          "beforeRemove",
          (event) => {
            if (!brandingDirty) {
              return;
            }

            event.preventDefault();

            if (
              restartPromptOpenRef.current ||
              brandingBusy
            ) {
              return;
            }

            restartPromptOpenRef.current =
              true;

            openAlert(
              "BunnyBrandingRestartRequired",
              /* @__PURE__ */ jsx(
                AlertModal,
                {
                  title:
                    "Restart required",

                  content:
                    "Restart Bunny for your branding changes to take effect.",

                  actions:
                    /* @__PURE__ */ jsxs(
                      Stack,
                      {
                        children: [
                          /* @__PURE__ */ jsx(
                            AlertActionButton,
                            {
                              text:
                                "Restart",
                              variant:
                                "primary",
                              disabled:
                                brandingBusy,

                              onPress: () => {
                                restartPromptOpenRef.current =
                                  false;

                                restartWithBranding();
                              }
                            }
                          ),

                          /* @__PURE__ */ jsx(
                            AlertActionButton,
                            {
                              text:
                                "Cancel",
                              variant:
                                "secondary",
                              disabled:
                                brandingBusy,

                              onPress: () => {
                                restartPromptOpenRef.current =
                                  false;

                                setDraftIcon(
                                  baselineIcon
                                );

                                setDraftName(
                                  baselineName
                                );
                              }
                            }
                          )
                        ]
                      }
                    )
                }
              )
            );
          }
        );

      return unsubscribe;
    }, [
      navigation2,
      brandingDirty,
      brandingBusy,
      selectedIcon,
      selectedName,
      baselineIcon,
      baselineName
    ]);

    var iconOptions = [
      [
        "discord",
        "Discord",
        "Use the default Discord app icon."
      ],      [
        "bunny",
        "Bunny",
        "Use the Bunny app icon."
      ],
      [
        "bunny_manager",
        "Bunny Manager",
        "Use the Bunny Manager app icon."
      ],
      [
        "vendetta",
        "Vendetta",
        "Use the Vendetta app icon."
      ],
      [
        "vendetta_manager",
        "Vendetta Manager",
        "Use the Vendetta Manager app icon."
      ],

      [
        "brand_inverted",
        "Brand Inverted",
        "Use the Brand Inverted app icon."
      ],
      [
        "matte_dark",
        "Matte Dark",
        "Use the Matte Dark app icon."
      ],
      [
        "matte_light",
        "Matte Light",
        "Use the Matte Light app icon."
      ],
      [
        "brand_dark",
        "Brand Dark",
        "Use the Brand Dark app icon."
      ],
      [
        "pastel",
        "Pastel",
        "Use the Pastel app icon."
      ],
      [
        "pirate",
        "Pirate",
        "Use the Pirate app icon."
      ],
      [
        "camo",
        "Camo",
        "Use the Camo app icon."
      ],
      [
        "sunset",
        "Sunset",
        "Use the Sunset app icon."
      ],
      [
        "galaxy",
        "Galaxy",
        "Use the Galaxy app icon."
      ],
      [
        "y2k",
        "Y2K",
        "Use the Y2K app icon."
      ],
      [
        "cherry_blossom",
        "Cherry Blossom",
        "Use the Cherry Blossom app icon."
      ],
      [
        "beanie",
        "Beanie",
        "Use the Beanie app icon."
      ],
      [
        "gaming",
        "Gaming",
        "Use the Gaming app icon."
      ],
      [
        "circuit",
        "Circuit",
        "Use the Circuit app icon."
      ],
      [
        "holo_waves",
        "Holo Waves",
        "Use the Holo Waves app icon."
      ],
      [
        "blush",
        "Blush",
        "Use the Blush app icon."
      ],
      [
        "angry",
        "Angry",
        "Use the Angry app icon."
      ],
      [
        "manga",
        "Manga",
        "Use the Manga app icon."
      ],
      [
        "controller",
        "Controller",
        "Use the Controller app icon."
      ],
      [
        "mushroom",
        "Mushroom",
        "Use the Mushroom app icon."
      ],
      [
        "blurple_twilight",
        "Blurple Twilight",
        "Use the Blurple Twilight app icon."
      ],
      [
        "in_rainbows",
        "In Rainbows",
        "Use the In Rainbows app icon."
      ],
      [
        "midnight_prism",
        "Midnight Prism",
        "Use the Midnight Prism app icon."
      ],
      [
        "color_wave",
        "Color Wave",
        "Use the Color Wave app icon."
      ]
    ];

    var nameOptions = [
      [
        "discord",
        "Discord",
        "Use Discord as the Android app name."
      ],
      [
        "bunny",
        "Bunny",
        "Use Bunny as the Android app name."
      ],
      [
        "vendetta",
        "Vendetta",
        "Use Vendetta as the Android app name."
      ]
    ];

    var makeOptionRow = (
      kind,
      option,
      selected
    ) => {
      var [
        value,
        label,
        description
      ] = option;

      var active =
        value === selected;

      return /* @__PURE__ */ jsx(
        TableRow,
        {
          key:
            kind +
            "-" +
            value,

          label,

          subLabel:
            active
              ? "Selected - " +
                description
              : description,

          icon:
            kind === "icon"
              ? /* @__PURE__ */ jsx(
                  require_react_native().Image,
                  {
                    source: {
                      uri:
                        "bunny_branding_preview_" +
                        value
                    },
                    resizeMode:
                      "contain",
                    style: {
                      width: 48,
                      height: 48
                    },
                    resizeMode: "contain"
                  }
                )
              : /* @__PURE__ */ jsx(
                  TableRow.Icon,
                  {
                    source:
                      findAssetId(
                        active
                          ? "Check"
                          : "AppsIcon"
                      )
                  }
                ),

          onPress: () => {
            if (brandingBusy)
              return;

            if (kind === "icon") {
              setDraftIcon(value);
            }
            else {
              setDraftName(value);
            }
          }
        }
      );
    };

    return /* @__PURE__ */ jsx(
      require_react_native().ScrollView,
      {
        contentContainerStyle: {
          paddingHorizontal: 16,
          paddingTop: 12,
          paddingBottom: 32,
          gap: 16
        },

        children:
          /* @__PURE__ */ jsxs(
            require_react_native().View,
            {
              style: {
                gap: 16
              },

              children: [
                branding?.managed === false
                  ? /* @__PURE__ */ jsx(
                      TableRowGroup,
                      {
                        title: "STATUS",

                        children:
                          /* @__PURE__ */ jsx(
                            TableRow,
                            {
                              label:
                                "Branding resources are not installed yet.",

                              subLabel:
                                "The settings bridge is ready, but launcher aliases and preset artwork still need to be added to the APK."
                            }
                          )
                      }
                    )
                  : null,

                /* @__PURE__ */ jsx(
                  TableRowGroup,
                  {
                    title:
                      "APP ICON",

                    children:
                      iconOptions.map(
                        (option) =>
                          makeOptionRow(
                            "icon",
                            option,
                            selectedIcon
                          )
                      )
                  }
                ),

                /* @__PURE__ */ jsx(
                  TableRowGroup,
                  {
                    title:
                      "APP NAME",

                    children:
                      nameOptions.map(
                        (option) =>
                          makeOptionRow(
                            "name",
                            option,
                            selectedName
                          )
                      )
                  }
                ),

                /* @__PURE__ */ jsxs(
                  TableRowGroup,
                  {
                    title:
                      "ATTRIBUTION & LICENSING",

                    children: [
                      /* @__PURE__ */ jsx(
                        TableRow,
                        {
                          label:
                            "Bunny / Vendetta",

                          subLabel:
                            "Bunny core: Copyright (c) 2023 Team Vendetta; Copyright (c) 2024 pylixonly. Vendetta core: Copyright (c) 2023 Team Vendetta. Core software is distributed under the BSD 3-Clause License."
                        }
                      ),

                      /* @__PURE__ */ jsx(
                        TableRow,
                        {
                          label:
                            "Independent project notice",

                          subLabel:
                            "Seobject's Morphe Patches is independent and is not affiliated with, sponsored by, or endorsed by Bunny, Vendetta, Team Vendetta, pylixonly, or Discord. Bunny and Vendetta names, logos, and artwork remain the property of their respective rights holders. No trademark rights or ownership are claimed."
                        }
                      ),

                      /* @__PURE__ */ jsx(
                        TableRow,
                        {
                          arrow: true,
                          label:
                            "Bunny license",
                          subLabel:
                            "BSD 3-Clause",
                          onPress: () =>
                            require_react_native().Linking.openURL(
                              "https://github.com/bunny-mod/Bunny/blob/main/LICENSE"
                            )
                        }
                      ),

                      /* @__PURE__ */ jsx(
                        TableRow,
                        {
                          arrow: true,
                          label:
                            "Vendetta license",
                          subLabel:
                            "BSD 3-Clause",
                          onPress: () =>
                            require_react_native().Linking.openURL(
                              "https://github.com/vendetta-mod/Vendetta/blob/rewrite/LICENSE"
                            )
                        }
                      ),

                      /* @__PURE__ */ jsx(
                        TableRow,
                        {
                          arrow: true,
                          label:
                            "BunnyManager license",
                          subLabel:
                            "OSL 3.0 - no trademark license granted",
                          onPress: () =>
                            require_react_native().Linking.openURL(
                              "https://github.com/bunny-mod/BunnyManager/blob/main/LICENSE"
                            )
                        }
                      ),

                      /* @__PURE__ */ jsx(
                        TableRow,
                        {
                          arrow: true,
                          label:
                            "VendettaManager license",
                          subLabel:
                            "OSL 3.0 - no trademark license granted",
                          onPress: () =>
                            require_react_native().Linking.openURL(
                              "https://github.com/vendetta-mod/VendettaManager/blob/main/LICENSE"
                            )
                        }
                      )
                    ]
                  }
                )              ]
            }
          )
      }
    );
  }

  function BunnyRecoveryPage() {
""",
                "Bunny-owned Custom Branding page"
        );

        patched =
                insertCustomBrandingBeforeDeveloperSettings(
                        patched
                );

        return patched;
    }

    private static String replace(
            String source,
            String before,
            String after,
            String label
    ) throws IOException {
        int first =
                source.indexOf(before);

        if (first < 0) {
            throw new IOException(
                    label +
                    " anchor was not found"
            );
        }

        int second =
                source.indexOf(
                        before,
                        first + before.length()
                );

        if (second >= 0) {
            throw new IOException(
                    label +
                    " anchor was not unique"
            );
        }

        return source.substring(
                0,
                first
        )
                + after
                + source.substring(
                        first +
                        before.length()
                );
    }

    /**
     * Custom Branding belongs with general Bunny application controls, not
     * Recovery. Insert it immediately before Developer Settings and fail
     * closed unless that row is actually inside Miscellaneous.
     */
    private static String insertCustomBrandingBeforeDeveloperSettings(
            String source
    ) throws IOException {
        String[] developerMarkers = {
                "                label: Strings.DEVELOPER_SETTINGS,",
                "                label: \"Developer Settings\","
        };

        int developerIndex = -1;

        for (String marker : developerMarkers) {
            int first =
                    source.indexOf(marker);

            if (first < 0) {
                continue;
            }

            if (
                    source.indexOf(
                            marker,
                            first + marker.length()
                    ) >= 0
            ) {
                throw new IOException(
                        "Developer Settings row anchor was not unique"
                );
            }

            if (developerIndex >= 0) {
                throw new IOException(
                        "Multiple Developer Settings row shapes were found"
                );
            }

            developerIndex = first;
        }

        if (developerIndex < 0) {
            throw new IOException(
                    "Developer Settings row was not found"
            );
        }

        String rowStartMarker =
                "              /* @__PURE__ */ jsx(TableSwitchRow, {";

        int rowStart =
                source.lastIndexOf(
                        rowStartMarker,
                        developerIndex
                );

        if (rowStart < 0) {
            throw new IOException(
                    "Developer Settings TableSwitchRow start was not found"
            );
        }

        if (developerIndex - rowStart > 1600) {
            throw new IOException(
                    "Developer Settings row shape was unexpectedly large"
            );
        }

        int miscellaneousStrings =
                source.lastIndexOf(
                        "title: Strings.MISCELLANEOUS",
                        rowStart
                );

        int miscellaneousLiteral =
                source.lastIndexOf(
                        "title: \"Miscellaneous\"",
                        rowStart
                );

        int miscellaneousIndex =
                Math.max(
                        miscellaneousStrings,
                        miscellaneousLiteral
                );

        if (
                miscellaneousIndex < 0 ||
                rowStart - miscellaneousIndex > 5000
        ) {
            throw new IOException(
                    "Developer Settings is not inside the expected Miscellaneous group"
            );
        }

        String existingRowMarker =
                "subLabel: \"Change the Android app icon and app name.\"";

        if (
                source.indexOf(
                        existingRowMarker
                ) >= 0
        ) {
            throw new IOException(
                    "Custom Branding settings row already exists"
            );
        }

        String brandingRow =
                """
              /* @__PURE__ */ jsx(TableRow, {
                arrow: true,
                label: "Custom Branding",
                subLabel: "Change the Android app icon and app name.",
                icon: /* @__PURE__ */ jsx(TableRow.Icon, {
                  source: findAssetId("AppsIcon")
                }),
                onPress: () => navigation2.push("BUNNY_CUSTOM_PAGE", {
                  title: "Custom Branding",
                  render: () => /* @__PURE__ */ jsx(BunnyCustomBrandingPage, {})
                })
              }),
""";

        return source.substring(
                0,
                rowStart
        )
                + brandingRow
                + source.substring(
                        rowStart
                );
    }
}
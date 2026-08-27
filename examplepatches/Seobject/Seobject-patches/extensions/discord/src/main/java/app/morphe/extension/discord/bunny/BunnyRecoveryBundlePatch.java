package app.morphe.extension.discord.bunny;

import java.io.IOException;

/** Semantic patches against Bunny-owned plugin, persistence, and settings boundaries only. */
final class BunnyRecoveryBundlePatch {
    private BunnyRecoveryBundlePatch() {}

    static String apply(String source) throws IOException {
        String patched = source;

        patched = replace(patched,
                "  var src_exports = {};\n",
                """
  function bunnyRecoveryCall(event, details) {
    var query = details && typeof details === "object"
      ? "?" + Object.entries(details).map(([key, value]) => encodeURIComponent(key) + "=" + encodeURIComponent(String(value))).join("&")
      : "";
    return require_react_native().Linking.openURL("bunny-morphe://recovery/" + event + query).then((raw) => {
      var result = typeof raw === "string" ? JSON.parse(raw) : raw;
      if (!result || result.status === "error")
        throw new Error(result?.message ?? "Recovery operation failed");
      return result;
    });
  }
  function bunnyRecoverySignal(event, details) {
    return bunnyRecoveryCall(event, details);
  }
  var src_exports = {};
""",
                "Bunny Recovery native signal boundary");

        patched = replace(patched,
                "  function General() {\n",
                """
  function BunnyRecoveryHistoryPage({ kind }) {
    var navigation2 = NavigationNative.useNavigation();
    var [historyStatus, setHistoryStatus] = React.useState(null);
    var [historyBusy, setHistoryBusy] = React.useState(null);
    var [selectedIds, setSelectedIds] = React.useState([]);
    var isCrashHistory = kind === "crashes";
    var pageTitle = isCrashHistory ? "Recent Crashes" : "Previous Failed Starts";
    var selectionMode = selectedIds.length > 0;
    var refreshHistory = React.useCallback(() => bunnyRecoveryCall("status").then(setHistoryStatus).catch((error) => {
      showToast("Could not read Recovery history: " + (error?.message ?? String(error)), findAssetId("Small"));
    }), []);
    React.useEffect(() => {
      void refreshHistory();
    }, [refreshHistory]);
    var toggleSelected = (id) => {
      setSelectedIds((current) => current.includes(id) ? current.filter((value) => value !== id) : [...current, id]);
    };
    var selectFromLongPress = (id) => {
      setSelectedIds((current) => current.includes(id) ? current : [...current, id]);
    };
    var deleteSelected = () => {
      if (historyBusy) return;
      var ids = [...selectedIds];
      setHistoryBusy("delete-selected");
      Promise.all(ids.map((id) => bunnyRecoveryCall("delete-record", { kind, id }))).then(() => {
        showToast(ids.length === 1 ? "Recovery log deleted." : ids.length + " Recovery logs deleted.", findAssetId("Check"));
        setSelectedIds([]);
        return refreshHistory();
      }).catch((error) => {
        showToast(error?.message ?? String(error), findAssetId("Small"));
      }).finally(() => setHistoryBusy(null));
    };
    var exportSelected = () => {
      if (historyBusy) return;
      var ids = [...selectedIds];
      setHistoryBusy("export-selected");
      bunnyRecoveryCall("export-logs", { kind, ids: ids.join(",") }).then(() => {
        setSelectedIds([]);
      }).catch((error) => {
        showToast(error?.message ?? String(error), findAssetId("Small"));
      }).finally(() => setHistoryBusy(null));
    };
    React.useEffect(() => {
      navigation2.setOptions({
        title: selectionMode ? selectedIds.length + " selected" : pageTitle,
        headerRight: selectionMode ? () => /* @__PURE__ */ jsxs(import_react_native16.View, {
          style: { flexDirection: "row", gap: 8 },
          children: [
            /* @__PURE__ */ jsx(IconButton, {
              size: "sm",
              variant: "secondary",
              icon: findAssetId("DownloadIcon"),
              accessibilityLabel: "Export selected logs",
              disabled: !!historyBusy,
              onPress: exportSelected
            }),
            /* @__PURE__ */ jsx(IconButton, {
              size: "sm",
              variant: "secondary",
              icon: findAssetId("TrashIcon"),
              accessibilityLabel: "Delete selected logs",
              disabled: !!historyBusy,
              onPress: deleteSelected
            })
          ]
        }) : void 0
      });
      return () => navigation2.setOptions({ title: pageTitle, headerRight: void 0 });
    }, [navigation2, selectionMode, selectedIds.join("|"), historyBusy, kind]);
    var records = historyStatus ? (isCrashHistory ? historyStatus.recentCrashes ?? [] : historyStatus.failedStarts ?? []) : [];
    React.useEffect(() => {
      var retained = new Set(records.map((record) => record.id));
      setSelectedIds((current) => current.filter((id) => retained.has(id)));
    }, [historyStatus]);
    var recordGroups = records.map((record, index) => {
      var timestamp = record.timestamp > 0 ? new Date(record.timestamp).toLocaleString() : "Unknown time";
      var title = isCrashHistory ? (record.kind === "render" ? "Bunny render crash" : "Native crash") : "Failed start " + String(record.session ?? "");
      var summary = isCrashHistory
        ? [timestamp, record.message, record.plugin ? "Plugin: " + record.plugin : null].filter(Boolean).join(" • ")
        : [timestamp, record.message, record.plugin ? "Plugin: " + record.plugin : null].filter(Boolean).join(" • ");
      var details = isCrashHistory
        ? (record.stack || "No stack trace was captured.")
        : ["Session: " + String(record.session ?? "unknown"), record.plugin ? "Suspected plugin: " + record.plugin : "No plugin was conclusively attributed."].join("\\n");
      var selected = selectedIds.includes(record.id);
      var selectionProps = {
        disabled: !!historyBusy
      };
      return /* @__PURE__ */ jsx(import_react_native16.Pressable, {
        delayLongPress: 350,
        disabled: !!historyBusy,
        onLongPress: () => selectFromLongPress(record.id),
        onPress: selectionMode ? () => toggleSelected(record.id) : void 0,
        style: ({ pressed }) => ({ opacity: pressed ? 0.72 : 1 }),
        children: /* @__PURE__ */ jsxs(import_react_native16.View, {
          style: { position: "relative" },
          children: [
            /* @__PURE__ */ jsxs(TableRowGroup, {
              title: (isCrashHistory ? "Crash " : "Failed Start ") + String(index + 1),
              showDivider: false,
              children: [
                /* @__PURE__ */ jsx(TableRow, {
                  ...selectionProps,
                  showDivider: false,
                  style: selectionMode ? { paddingLeft: 48 } : void 0,
                  label: title,
                  subLabel: summary
                }),
                /* @__PURE__ */ jsx(TableRow, {
                  ...selectionProps,
                  showDivider: false,
                  style: selectionMode ? { paddingLeft: 48 } : void 0,
                  label: "Log details",
                  subLabel: details
                })
              ]
            }),
            selectionMode ? /* @__PURE__ */ jsx(import_react_native16.View, {
              pointerEvents: "none",
              style: { position: "absolute", left: 16, top: 30, bottom: 0, justifyContent: "center" },
              children: /* @__PURE__ */ jsx(TableCheckbox, {
                value: selected,
                checked: selected
              })
            }) : null
          ]
        })
      }, kind + "-group-" + record.id);
    });
    return /* @__PURE__ */ jsx(import_react_native16.ScrollView, {
      style: { flex: 1 },
      contentContainerStyle: { paddingBottom: 38 },
      children: /* @__PURE__ */ jsxs(Stack, {
        style: { paddingVertical: 24, paddingHorizontal: 12 },
        spacing: 16,
        children: historyStatus ? (recordGroups.length ? recordGroups : /* @__PURE__ */ jsx(TableRowGroup, {
          title: pageTitle,
          children: /* @__PURE__ */ jsx(TableRow, {
              label: isCrashHistory ? "No recent crashes" : "No failed starts",
              subLabel: "Recovery retains the five most recent records."
          })
        })) : /* @__PURE__ */ jsx(TableRowGroup, {
          title: pageTitle,
          children: /* @__PURE__ */ jsx(TableRow, { label: "Loading logs…" })
        })
      })
    });
  }
  function BunnyRecoveryPage() {
    var navigation2 = NavigationNative.useNavigation();
    var [recoveryStatus, setRecoveryStatus] = React.useState(null);
    var [recoveryBusy, setRecoveryBusy] = React.useState(null);
    var [restorePlan, setRestorePlan] = React.useState(null);
    var categoryActions = [["all", "All", "Include every portable Bunny category."], ["settings", "Bunny Settings", "Bunny settings and portable configuration."], ["plugins", "Plugins", "Plugin identities, enabled states, settings, and repositories."], ["themes", "Themes", "Themes, Theme Creator data, and portable backgrounds."], ["fonts", "Fonts", "Font configuration and portable font files."]];
    var refreshRecovery = React.useCallback(() => {
      return bunnyRecoveryCall("status").then(setRecoveryStatus).catch((error) => {
        showToast("Could not read Recovery status: " + (error?.message ?? String(error)), findAssetId("Small"));
      });
    }, []);
    React.useEffect(() => {
      void refreshRecovery();
    }, [refreshRecovery]);
    var runRecoveryAction = (busyKey, event, successText, details, afterSuccess) => {
      if (recoveryBusy) return Promise.resolve();
      setRecoveryBusy(busyKey);
      return bunnyRecoveryCall(event, details).then((result) => {
        if (result.status === "cancelled") return result;
        if (successText)
          showToast(successText, findAssetId("Check"));
        afterSuccess?.(result);
        return refreshRecovery().then(() => result);
      }).catch((error) => {
        showToast((error?.message ?? String(error)), findAssetId("Small"));
      }).finally(() => setRecoveryBusy(null));
    };
    var selectRestoreBackup = () => {
      if (recoveryBusy) return;
      setRecoveryBusy("restore-select");
      setRestorePlan(null);
      bunnyRecoveryCall("restore-backup").then((result) => {
        if (result.status === "ready")
          setRestorePlan(result);
      }).catch((error) => {
        showToast("Backup validation failed: " + (error?.message ?? String(error)), findAssetId("Small"));
      }).finally(() => setRecoveryBusy(null));
    };
    var confirmRestoreBackup = () => runRecoveryAction(
      "restore-apply",
      "restore-apply",
      "Backup restored. Reload Discord to apply it.",
      { token: restorePlan?.token ?? "" },
      () => setRestorePlan(null)
    );
    var cancelRestoreBackup = () => runRecoveryAction(
      "restore-cancel",
      "restore-cancel",
      null,
      { token: restorePlan?.token ?? "" },
      () => setRestorePlan(null)
    );
    var statusRows = recoveryStatus ? [
      /* @__PURE__ */ jsx(TableRow, {
        label: "Current mode",
        subLabel: recoveryStatus.safeMode
          ? "Temporary Safe Mode is active for this launch."
          : "Bunny started normally.",
        icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId(recoveryStatus.safeMode ? "ShieldIcon" : "Check") }),
        trailing: /* @__PURE__ */ jsx(Text, {
          variant: "text-md/normal",
          color: "text-muted",
          style: {
            minWidth: 84,
            flexShrink: 0,
            textAlign: "right"
          },
          children: recoveryStatus.safeMode ? "Safe Mode" : "Normal"
        })
      }, "recovery-current"),
      /* @__PURE__ */ jsx(TableRow, {
        arrow: true,
        label: "Previous failed starts",
        subLabel: recoveryStatus.failedStartCount > 0 ? "Open the retained failed-start logs." : "No failed Bunny startup is currently retained.",
        icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("RetryIcon") }),
        trailing: /* @__PURE__ */ jsx(TableRow.TrailingText, { text: String(recoveryStatus.failedStartCount ?? 0) }),
        onPress: () => navigation2.push("BUNNY_CUSTOM_PAGE", {
          title: "Previous Failed Starts",
          render: () => /* @__PURE__ */ jsx(BunnyRecoveryHistoryPage, { kind: "failed-starts" })
        })
      }, "recovery-failures"),
      /* @__PURE__ */ jsx(TableRow, {
        arrow: true,
        label: "Recent crashes",
        subLabel: recoveryStatus.crashCount > 0 ? "Open the retained Bunny render and native crash logs." : "No recent Bunny crashes have been recorded.",
        icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("Small") }),
        trailing: /* @__PURE__ */ jsx(TableRow.TrailingText, { text: String(recoveryStatus.crashCount ?? 0) }),
        onPress: () => navigation2.push("BUNNY_CUSTOM_PAGE", {
          title: "Recent Crashes",
          render: () => /* @__PURE__ */ jsx(BunnyRecoveryHistoryPage, { kind: "crashes" })
        })
      }, "recovery-crash-count"),
      recoveryStatus.lastHealthyAt > 0 ? /* @__PURE__ */ jsx(TableRow, {
        label: "Last healthy startup",
        subLabel: new Date(recoveryStatus.lastHealthyAt).toLocaleString(),
        icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("Check") })
      }, "recovery-last-healthy") : null,
      recoveryStatus.suspectedPlugin ? /* @__PURE__ */ jsx(TableRow, {
        label: "Suspected plugin",
        subLabel: recoveryStatus.suspectedPlugin,
        icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("ActivitiesIcon") })
      }, "recovery-suspected") : null,
      recoveryStatus.hasLastKnownGood ? /* @__PURE__ */ jsx(TableRow, {
        arrow: true,
        label: "Restore Last Working State",
        subLabel: "Restore Bunny's most recent healthy configuration snapshot.",
        icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("RetryIcon") }),
        disabled: !!recoveryBusy,
        onPress: () => runRecoveryAction("known-good", "restore-known-good", "Last working state restored. Reload Discord to apply it.")
      }, "recovery-known-good") : null,
      recoveryStatus.rollbackAvailable ? /* @__PURE__ */ jsx(TableRow, {
        arrow: true,
        label: "Revert Plugin Update",
        subLabel: recoveryStatus.rollbackPlugin,
        icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("RetryIcon") }),
        disabled: !!recoveryBusy,
        onPress: () => runRecoveryAction("plugin-rollback", "rollback-plugin", "Previous plugin version restored. Reload Discord to apply it.")
      }, "recovery-rollback") : null,
      null
    ] : [
      /* @__PURE__ */ jsx(TableRow, {
        label: "Loading Recovery status…",
        icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("RetryIcon") })
      }, "recovery-loading")
    ];
    return /* @__PURE__ */ jsx(import_react_native16.ScrollView, {
      style: { flex: 1 },
      contentContainerStyle: { paddingBottom: 38 },
      children: /* @__PURE__ */ jsxs(Stack, {
        style: { paddingVertical: 24, paddingHorizontal: 12 },
        spacing: 24,
        children: [
          /* @__PURE__ */ jsx(TableRowGroup, {
            title: "Recovery",
            children: statusRows
          }),
          /* @__PURE__ */ jsx(TableRowGroup, {
            title: "Backup",
            children: categoryActions.map(([key, label, description]) => /* @__PURE__ */ jsx(TableRow, {
                arrow: true,
                label,
                subLabel: description,
                icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("DownloadIcon") }),
                disabled: !!recoveryBusy,
                onPress: () => runRecoveryAction("backup-" + key, "create-backup", "Bunny backup created.", { categories: key })
              }, "backup-" + key))
          }),
          /* @__PURE__ */ jsx(TableRowGroup, {
            title: "Restore",
            children: [
              /* @__PURE__ */ jsx(TableRow, {
                arrow: true,
                label: "Restore Backup",
                subLabel: "Select and validate a Bunny backup before applying it.",
                icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("RetryIcon") }),
                disabled: !!recoveryBusy,
                onPress: selectRestoreBackup
              }, "restore-select"),
              restorePlan ? /* @__PURE__ */ jsx(TableRow, {
                label: "Validated Backup",
                subLabel: restorePlan.summary,
                icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("Check") }),
                trailing: /* @__PURE__ */ jsx(TableRow.TrailingText, { text: "Schema " + String(restorePlan.schemaVersion) })
              }, "restore-plan") : null,
              restorePlan ? /* @__PURE__ */ jsx(TableRow, {
                arrow: true,
                label: "Confirm Restore",
                subLabel: "Create a pre-restore snapshot, then apply this validated backup transactionally.",
                icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("RetryIcon") }),
                disabled: !!recoveryBusy,
                onPress: confirmRestoreBackup
              }, "restore-confirm") : null,
              restorePlan ? /* @__PURE__ */ jsx(TableRow, {
                label: "Cancel Restore",
                icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("TrashIcon") }),
                disabled: !!recoveryBusy,
                onPress: cancelRestoreBackup
              }, "restore-cancel") : null
            ]
          }),
          /* @__PURE__ */ jsx(TableRowGroup, {
            title: "Transfer",
            children: categoryActions.map(([key, label, description]) => /* @__PURE__ */ jsx(TableRow, {
                arrow: true,
                label,
                subLabel: description,
                icon: /* @__PURE__ */ jsx(TableRow.Icon, { source: findAssetId("DownloadIcon") }),
                disabled: !!recoveryBusy,
                onPress: () => runRecoveryAction("transfer-" + key, "transfer-backup", null, { categories: key })
              }, "transfer-" + key))
          })
        ]
      })
    });
  }
  function General() {
""",
                "Bunny-owned nested Recovery page");

        patched = replace(patched,
                "          /* @__PURE__ */ jsxs(TableRowGroup, {\n            title: Strings.ACTIONS,\n",
                "          /* @__PURE__ */ jsxs(TableRowGroup, {\n            title: \"Recovery\",\n",
                "Bunny General Recovery section heading");

        patched = replace(patched,
                "                  toggleSafeMode2({\n                    to,\n                    reload: false\n                  });\n                  openAlert",
                "                  toggleSafeMode2({\n                    to,\n                    reload: false\n                  });\n                  void bunnyRecoverySignal(\"safe-mode\", { enabled: to });\n                  openAlert",
                "Bunny pre-plugin Safe Mode toggle");

        patched = replace(patched,
                """
              /* @__PURE__ */ jsx(TableSwitchRow, {
                label: Strings.DEVELOPER_SETTINGS,
                icon: /* @__PURE__ */ jsx(TableRow.Icon, {
                  source: findAssetId("WrenchIcon")
                }),
                value: settings.developerSettings,
                onValueChange: (v2) => {
                  settings.developerSettings = v2;
                }
              })
""",
                """
              /* @__PURE__ */ jsx(TableRow, {
                arrow: true,
                label: "Recovery",
                subLabel: "Startup recovery, backups, restore, and transfer.",
                icon: /* @__PURE__ */ jsx(TableRow.Icon, {
                  source: findAssetId("RetryIcon")
                }),
                onPress: () => navigation2.push("BUNNY_CUSTOM_PAGE", {
                  title: "Recovery",
                  render: () => /* @__PURE__ */ jsx(BunnyRecoveryPage, {})
                })
              })
""",
                "Bunny-owned Recovery action");

        patched = replace(patched,
                """
          /* @__PURE__ */ jsx(TableRowGroup, {
            title: Strings.MISCELLANEOUS,
            children: /* @__PURE__ */ jsx(TableSwitchRow, {
              label: Strings.SETTINGS_ACTIVATE_DISCORD_EXPERIMENTS,
              subLabel: Strings.SETTINGS_ACTIVATE_DISCORD_EXPERIMENTS_DESC,
              icon: /* @__PURE__ */ jsx(TableRow.Icon, {
                source: findAssetId("WrenchIcon")
              }),
              value: settings.enableDiscordDeveloperSettings,
              onValueChange: (v2) => {
                settings.enableDiscordDeveloperSettings = v2;
              }
            })
          })
""",
                """
          /* @__PURE__ */ jsxs(TableRowGroup, {
            title: Strings.MISCELLANEOUS,
            children: [
              /* @__PURE__ */ jsx(TableSwitchRow, {
                label: Strings.DEVELOPER_SETTINGS,
                icon: /* @__PURE__ */ jsx(TableRow.Icon, {
                  source: findAssetId("WrenchIcon")
                }),
                value: settings.developerSettings,
                onValueChange: (v2) => {
                  settings.developerSettings = v2;
                }
              }),
              /* @__PURE__ */ jsx(TableSwitchRow, {
                label: Strings.SETTINGS_ACTIVATE_DISCORD_EXPERIMENTS,
                subLabel: Strings.SETTINGS_ACTIVATE_DISCORD_EXPERIMENTS_DESC,
                icon: /* @__PURE__ */ jsx(TableRow.Icon, {
                  source: findAssetId("WrenchIcon")
                }),
                value: settings.enableDiscordDeveloperSettings,
                onValueChange: (v2) => {
                  settings.enableDiscordDeveloperSettings = v2;
                }
              })
            ]
          })
""",
                "Bunny Developer Settings placement");

        patched = replace(patched,
                "              if (!settings.safeMode?.enabled) {\n                var pluginRet = yield this.evalPlugin(plugin);\n                pluginInstance[id] = pluginRet;\n                pluginRet.onLoad?.();\n              }",
                "              if (!settings.safeMode?.enabled && !globalThis.__PYON_LOADER__?.recovery?.safeMode) {\n                yield bunnyRecoverySignal(\"plugin-load-begin\", { id });\n                var pluginRet = yield this.evalPlugin(plugin);\n                pluginInstance[id] = pluginRet;\n                pluginRet.onLoad?.();\n                yield bunnyRecoverySignal(\"plugin-load-ok\", { id });\n              }",
                "Vendetta plugin Recovery attribution gate");

        patched = replace(patched,
                "            var pluginJs;\n            if (existingPlugin?.manifest.hash !== pluginManifest.hash) {",
                "            var pluginJs;\n            if (existingPlugin?.manifest.hash !== pluginManifest.hash) {\n              if (existingPlugin)\n                yield bunnyRecoverySignal(\"plugin-update-begin\", { id, kind: \"vendetta\" });",
                "Vendetta plugin update rollback boundary");

        patched = replace(patched,
                "            if (!settings.safeMode?.enabled) {\n              var _this = this;\n",
                "            if (!settings.safeMode?.enabled && !globalThis.__PYON_LOADER__?.recovery?.safeMode) {\n              var _this = this;\n",
                "Vendetta plugin Recovery startup gate");

        patched = replace(patched,
                "            yield this.fetchPlugin(id);\n            if (enabled)\n              yield this.startPlugin(id);",
                "            yield this.fetchPlugin(id);\n            yield bunnyRecoverySignal(\"plugin-change\", { id, kind: \"install\" });\n            if (enabled)\n              yield this.startPlugin(id);",
                "Vendetta plugin install change tracking");

        patched = replace(patched,
                "      assert(!pluginInstances.has(id), id, \"start an already started plugin\");\n      yield preloadStorageIfExists(`plugins/storage/${id}.json`);\n      var pluginInstance2;\n      if (isExternalPlugin(manifest)) {",
                "      assert(!pluginInstances.has(id), id, \"start an already started plugin\");\n      if (isExternalPlugin(manifest) && globalThis.__PYON_LOADER__?.recovery?.safeMode)\n        return;\n      yield preloadStorageIfExists(`plugins/storage/${id}.json`);\n      var pluginInstance2;\n      if (isExternalPlugin(manifest)) {\n        yield bunnyRecoverySignal(\"plugin-load-begin\", { id });",
                "Bunny plugin Recovery attribution gate");

        patched = replace(patched,
                "      if (fetchScript) {\n        manifest.jsPath = `plugins/scripts/${id}.js`;",
                "      if (fetchScript) {\n        yield bunnyRecoverySignal(\"plugin-update-begin\", { id, kind: \"modern\" });\n        manifest.jsPath = `plugins/scripts/${id}.js`;",
                "Bunny plugin update rollback boundary");

        patched = replace(patched,
                "      pluginSettings[id].enabled = true;\n    });\n    return _enablePlugin.apply(this, arguments);",
                "      pluginSettings[id].enabled = true;\n      yield bunnyRecoverySignal(\"plugin-change\", { id, kind: \"enable\" });\n    });\n    return _enablePlugin.apply(this, arguments);",
                "Bunny plugin enable change tracking");

        patched = replace(patched,
                "    pluginSettings[id].enabled = false;\n  }\n  function installPlugin(id, start) {",
                "    pluginSettings[id].enabled = false;\n    void bunnyRecoverySignal(\"plugin-change\", { id, kind: \"disable\" });\n  }\n  function installPlugin(id, start) {",
                "Bunny plugin disable change tracking");

        patched = replace(patched,
                "      pluginSettings[id] = {\n        enabled: true\n      };\n      if (start)\n        startPlugin(id);",
                "      pluginSettings[id] = {\n        enabled: true\n      };\n      yield bunnyRecoverySignal(\"plugin-change\", { id, kind: \"install\" });\n      if (start)\n        startPlugin(id);",
                "Bunny plugin install change tracking");

        patched = replace(patched,
                "        pluginInstance2.start?.();\n        pluginSettings[id].enabled = true;",
                "        pluginInstance2.start?.();\n        pluginSettings[id].enabled = true;\n        if (isExternalPlugin(manifest))\n          yield bunnyRecoverySignal(\"plugin-load-ok\", { id });",
                "Bunny plugin Recovery completion attribution");

        patched = replace(patched,
                "        window.bunny = lib_exports;\n        VdPluginManager.initPlugins().then((u) => unload.push(u)).catch(() => alert(\"Failed to initialize Vendetta plugins\"));\n        initPlugins();\n        updateFonts();\n        logger.log(\"Bunny is ready!\");",
                "        window.bunny = lib_exports;\n        yield bunnyRecoverySignal(\"startup-in-progress\");\n        var bunnyVendettaUnloader = yield VdPluginManager.initPlugins();\n        if (bunnyVendettaUnloader) unload.push(bunnyVendettaUnloader);\n        yield initPlugins();\n        updateFonts();\n        logger.log(\"Bunny is ready!\");\n        yield bunnyRecoverySignal(\"startup-healthy\");",
                "Bunny Recovery startup transaction");

        patched = replace(patched,
                "      _define_property(ErrorBoundary, \"getDerivedStateFromError\", (error) => ({\n        hasErr: true,\n        error\n      }));",
                "      _define_property(ErrorBoundary, \"getDerivedStateFromError\", (error) => {\n        void bunnyRecoverySignal(\"js-crash\", {\n          message: String(error?.message ?? error ?? \"Unknown render crash\").slice(0, 512),\n          stack: String(error?.stack ?? \"\").slice(0, 4096)\n        });\n        return {\n          hasErr: true,\n          error\n        };\n      });",
                "Bunny render crash tracking boundary");

        return patched;
    }

    private static String replace(String source, String anchor, String replacement, String label) throws IOException {
        return BunnyBundleStructuralMatcher.replaceExactlyOnce(source, anchor, replacement, label);
    }
}

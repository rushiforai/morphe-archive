package app.morphe.extension.discord.bunny;

import java.io.IOException;

/**
 * Integrates Bunny local-file plugins into the existing modern plugin engine.
 *
 * This patch runs after BunnyRecoveryBundlePatch so local plugins inherit
 * the same Safe Mode and Recovery lifecycle as other third-party plugins.
 *
 * Repository-backed identity remains distinct from local-file identity:
 * parentRepository continues to mean remote/repository-backed only.
 */
final class BunnyLocalPluginBundlePatch {
    private BunnyLocalPluginBundlePatch() {
    }

    static String apply(String source) throws IOException {
        String patched = source;

        /*
         * Local plugins are third-party/loadable plugins, but they are not
         * repository-backed plugins.
         *
         * Also provide deterministic startup registration from the normal
         * persisted manifest file for IDs that are actually installed.
         */
        patched = replace(
                patched,
                """
  function isPluginInstalled(id) {
    return pluginSettings[id] != null;
  }
""",
                """
  function isLocalPlugin(manifest) {
    return manifest?.__bunnyLocal === true;
  }
  function isThirdPartyPlugin(manifest) {
    return isExternalPlugin(manifest) || isLocalPlugin(manifest);
  }
  function registerInstalledLocalPlugins() {
    return _registerInstalledLocalPlugins.apply(this, arguments);
  }
  function _registerInstalledLocalPlugins() {
    _registerInstalledLocalPlugins = _async_to_generator(function* () {
      for (var id of Object.keys(pluginSettings)) {
        if (corePluginInstances.has(id))
          continue;
        var manifest = yield preloadStorageIfExists(`plugins/manifests/${id}.json`);
        if (!isLocalPlugin(manifest))
          continue;
        if (manifest.id !== id)
          continue;
        if (manifest.jsPath !== `plugins/scripts/${id}.js`)
          continue;
        registeredPlugins.set(id, manifest);
      }
    });
    return _registerInstalledLocalPlugins.apply(this, arguments);
  }
  function isPluginInstalled(id) {
    return pluginSettings[id] != null;
  }
""",
                "Bunny local plugin classification and startup registration"
        );

        /*
         * Repository refresh must never overwrite an installed local plugin.
         *
         * Check both the live registration and persisted manifest because
         * updatePlugins() performs repository refresh before initPlugins().
         */
        patched = replace(
                patched,
                """
    _updateAndWritePlugin = _async_to_generator(function* (repoUrl, id, fetchScript) {
      var manifest = yield fetchJSON(repoUrl, `builds/${id}/manifest.json`);
""",
                """
    _updateAndWritePlugin = _async_to_generator(function* (repoUrl, id, fetchScript) {
      var installedManifest = registeredPlugins.get(id);
      if (isPluginInstalled(id) && isLocalPlugin(installedManifest))
        return installedManifest;
      var storedManifest = yield preloadStorageIfExists(`plugins/manifests/${id}.json`);
      if (isPluginInstalled(id) && isLocalPlugin(storedManifest)) {
        registeredPlugins.set(id, storedManifest);
        return storedManifest;
      }
      var manifest = yield fetchJSON(repoUrl, `builds/${id}/manifest.json`);
""",
                "Bunny local plugin repository overwrite guard"
        );

        /*
         * Add a local-file install entry point beside normal installPlugin().
         *
         * The native commit boundary revalidates and atomically writes the
         * manifest/script. JavaScript then registers that committed manifest,
         * uses normal pluginSettings, and starts through startPlugin().
         */
        patched = replace(
                patched,
                """
      yield bunnyRecoverySignal("plugin-change", { id, kind: "install" });
      if (start)
        startPlugin(id);
    });
    return _installPlugin.apply(this, arguments);
  }
  function uninstallPlugin(id) {
""",
                """
      yield bunnyRecoverySignal("plugin-change", { id, kind: "install" });
      if (start)
        startPlugin(id);
    });
    return _installPlugin.apply(this, arguments);
  }
  function installLocalPlugin(id, token, start) {
    return _installLocalPlugin.apply(this, arguments);
  }
  function _installLocalPlugin() {
    _installLocalPlugin = _async_to_generator(function* (id, token, start) {
      assert(typeof id === "string" && id.length > 0, id ?? "local", "install a local plugin with an invalid ID");
      assert(typeof token === "string" && token.length > 0, id, "install a local plugin without a staged token");
      assert(!corePluginInstances.has(id), id, "install a core plugin from a local file");
      assert(!isPluginInstalled(id), id, "install an already installed plugin");
      var allowReplace = registeredPlugins.has(id);
      var raw = yield require_react_native().Linking.openURL(
        "bunny-morphe://plugin-import-commit?token=" +
          encodeURIComponent(token) +
          "&replace=" +
          (allowReplace ? "1" : "0")
      );
      var result = typeof raw === "string" ? JSON.parse(raw) : raw;
      if (!result || result.status !== "success")
        throw new Error(result?.message ?? "Failed to commit the local plugin");
      if (result.id !== id)
        throw new Error(`Local plugin identity changed during commit: expected '${id}', received '${result.id ?? "unknown"}'`);
      var manifestPath = `plugins/manifests/${id}.json`;
      var manifest = JSON.parse(yield readFile(manifestPath));
      assert(isLocalPlugin(manifest), id, "install a local plugin without Bunny's local marker");
      assert(manifest.id === id, id, "install a local plugin whose manifest ID changed");
      assert(manifest.jsPath === `plugins/scripts/${id}.js`, id, "install a local plugin with an invalid script path");
      yield updateStorage(manifestPath, manifest);

      /*
       * Bunny-owned source provenance.
       *
       * result.repository is optional project/source metadata that already
       * passed native LocalPluginPackage HTTPS validation. It is display
       * provenance only and is deliberately not promoted to an update source.
       */
      var provenancePath = "plugins/provenance.json";
      var provenance = yield preloadStorageIfExists(provenancePath) ?? {};
      provenance[id] = {
        repository: typeof result.repository === "string" && result.repository ? result.repository : null,
        installedFrom: {
          kind: "local-file"
        },
        updateSource: null
      };
      yield updateStorage(provenancePath, provenance);

      /*
       * Do not mark the plugin installed until provenance has persisted.
       * If provenance persistence fails, the committed payload remains inert.
       */
      registeredPlugins.set(id, manifest);
      pluginSettings[id] = {
        enabled: true
      };
      yield bunnyRecoverySignal("plugin-change", { id, kind: "install" });
      if (start)
        yield startPlugin(id);
      return manifest;
    });
    return _installLocalPlugin.apply(this, arguments);
  }
  function uninstallPlugin(id) {
""",
                "Bunny local plugin normal engine installer"
        );

        /*
         * Local plugins use normal uninstall behavior. Unlike a remote plugin,
         * there is no repository registration left behind, so its persisted
         * local manifest and in-memory registration are removed as well.
         */
        patched = replace(
                patched,
                """
      assert(isExternalPlugin(manifest), id, "uninstall a core plugin");
      pluginInstances.has(id) && stopPlugin(id);
      delete pluginSettings[id];
      yield purgeStorage2(`plugins/storage/${id}.json`);
      yield removeFile(`plugins/scripts/${id}.js`);
""",
                """
      assert(isThirdPartyPlugin(manifest), id, "uninstall a core plugin");
      pluginInstances.has(id) && stopPlugin(id);

      /*
       * Remove Bunny-owned provenance before destructive uninstall writes.
       * A provenance write failure therefore leaves the plugin installed
       * rather than producing an origin-less partial uninstall.
       */
      if (isLocalPlugin(manifest)) {
        var provenancePath = "plugins/provenance.json";
        var provenance = yield preloadStorageIfExists(provenancePath);

        if (
          provenance &&
          Object.prototype.hasOwnProperty.call(provenance, id)
        ) {
          delete provenance[id];
          yield updateStorage(provenancePath, provenance);
        }
      }

      delete pluginSettings[id];
      yield purgeStorage2(`plugins/storage/${id}.json`);
      yield removeFile(`plugins/scripts/${id}.js`);

      if (isLocalPlugin(manifest)) {
        yield purgeStorage2(`plugins/manifests/${id}.json`);
        registeredPlugins.delete(id);
      }
""",
                "Bunny local plugin normal uninstall lifecycle"
        );

        /*
         * Recovery's post-patch load gate currently identifies third-party
         * plugins using isExternalPlugin(). Broaden only that runtime gate;
         * isExternalPlugin itself remains repository-specific.
         */
        patched = replace(
                patched,
                """
      assert(!pluginInstances.has(id), id, "start an already started plugin");
      if (isExternalPlugin(manifest) && globalThis.__PYON_LOADER__?.recovery?.safeMode)
        return;
      yield preloadStorageIfExists(`plugins/storage/${id}.json`);
      var pluginInstance2;
      if (isExternalPlugin(manifest)) {
        yield bunnyRecoverySignal("plugin-load-begin", { id });
""",
                """
      assert(!pluginInstances.has(id), id, "start an already started plugin");
      if (isThirdPartyPlugin(manifest) && globalThis.__PYON_LOADER__?.recovery?.safeMode)
        return;
      yield preloadStorageIfExists(`plugins/storage/${id}.json`);
      var pluginInstance2;
      if (isThirdPartyPlugin(manifest)) {
        yield bunnyRecoverySignal("plugin-load-begin", { id });
""",
                "Bunny local plugin Safe Mode and load lifecycle"
        );

        patched = replace(
                patched,
                """
        if (isExternalPlugin(manifest))
          yield bunnyRecoverySignal("plugin-load-ok", { id });
""",
                """
        if (isThirdPartyPlugin(manifest))
          yield bunnyRecoverySignal("plugin-load-ok", { id });
""",
                "Bunny local plugin Recovery completion attribution"
        );

        /*
         * updatePlugins() has already completed by this point. Re-assert the
         * persisted local registration immediately before normal modern plugin
         * startup so an installed local plugin wins any same-ID repo listing.
         */
        patched = replace(
                patched,
                """
        if (bunnyVendettaUnloader) unload.push(bunnyVendettaUnloader);
        yield initPlugins();
""",
                """
        if (bunnyVendettaUnloader) unload.push(bunnyVendettaUnloader);
        yield registerInstalledLocalPlugins();
        yield initPlugins();
""",
                "Bunny local plugin startup persistence"
        );


        /*
         * Bunny plugin provenance info UI
         *
         * Provenance is persisted independently from pluginSettings. Preload
         * it during local-plugin startup so restored/imported source metadata
         * is available to the normal Bunny plugin model after every restart.
         */
        patched = replace(
                patched,
                """
    _registerInstalledLocalPlugins = _async_to_generator(function* () {
      for (var id of Object.keys(pluginSettings)) {
""",
                """
    _registerInstalledLocalPlugins = _async_to_generator(function* () {
      yield preloadStorageIfExists("plugins/provenance.json");
      for (var id of Object.keys(pluginSettings)) {
""",
                "Bunny local plugin provenance startup preload"
        );

        /*
         * Extend only the modern Bunny plugin model. Vendetta/legacy plugin
         * models remain untouched.
         *
         * parentRepository remains the authoritative acquisition/update
         * source for normal repository-backed modern plugins.
         */
        patched = replace(
                patched,
                """
  function unifyBunnyPlugin(manifest) {
    return {
      id: manifest.id,
      name: manifest.display.name,
      description: manifest.display.description,
      authors: manifest.display.authors,
      getBadges() {
""",
                """
  function isSafeBunnyRepositoryUrl(value) {
    if (typeof value !== "string" || !value)
      return false;
    try {
      var url = new URL(value);
      return url.protocol === "https:" && Boolean(url.hostname) && !url.username && !url.password;
    } catch {
      return false;
    }
  }
  function getBunnyPluginSourceInfo(manifest) {
    var provenance = getPreloadedStorage("plugins/provenance.json")?.[manifest.id];
    var local = isLocalPlugin(manifest);
    var remote = isExternalPlugin(manifest);
    var repository = local
      ? provenance?.repository ?? null
      : remote
        ? manifest.parentRepository ?? null
        : null;
    var installedFrom = local
      ? "Local file"
      : remote && typeof manifest.parentRepository === "string" && manifest.parentRepository
        ? manifest.parentRepository
        : "Unknown";
    var updateSource = local
      ? provenance?.updateSource ?? "None"
      : remote && typeof manifest.parentRepository === "string" && manifest.parentRepository
        ? manifest.parentRepository
        : "Unknown";
    return {
      repository,
      repositoryUrl: isSafeBunnyRepositoryUrl(repository) ? repository : null,
      installedFrom,
      updateSource
    };
  }
  function unifyBunnyPlugin(manifest) {
    var sourceInfo = getBunnyPluginSourceInfo(manifest);
    return {
      id: manifest.id,
      name: manifest.display.name,
      description: manifest.display.description,
      authors: manifest.display.authors,
      version: typeof manifest.version === "string" && manifest.version ? manifest.version : "Unknown",
      repository: sourceInfo.repository,
      repositoryUrl: sourceInfo.repositoryUrl,
      installedFrom: sourceInfo.installedFrom,
      updateSource: sourceInfo.updateSource,
      getBadges() {
""",
                "Bunny modern plugin provenance model"
        );

        /*
         * Replace the currently inert Copy URL button with the actual
         * Repository action. The model exposes repositoryUrl only after
         * strict HTTPS/no-credentials validation.
         */
        patched = replace(
                patched,
                """
              /* @__PURE__ */ jsx(PluginInfoIconButton, {
                label: "Copy URL",
                variant: "secondary",
                icon: findAssetId("LinkIcon"),
                onPress: () => {
                }
              })
""",
                """
              /* @__PURE__ */ jsx(PluginInfoIconButton, {
                label: "Repository",
                variant: "secondary",
                disabled: !plugin.repositoryUrl,
                icon: findAssetId("LinkIcon"),
                onPress: () => {
                  if (plugin.repositoryUrl)
                    import_react_native20.Linking.openURL(plugin.repositoryUrl);
                }
              })
""",
                "Bunny plugin repository action"
        );

        /*
         * Preserve the existing Description card and add one Bunny-native
         * details card beneath it.
         *
         * Authors are already rendered in TitleComponent; the Author row is
         * also included here so provenance/details are explicit and complete.
         */
        patched = replace(
                patched,
                """
          /* @__PURE__ */ jsxs(Card, {
            children: [
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/semibold",
                color: "text-primary",
                style: {
                  marginBottom: 4
                },
                children: "Description"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/medium",
                children: plugin.description
              })
            ]
          })
""",
                """
          /* @__PURE__ */ jsxs(Card, {
            children: [
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/semibold",
                color: "text-primary",
                style: {
                  marginBottom: 4
                },
                children: "Description"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/medium",
                children: plugin.description
              })
            ]
          }),
          /* @__PURE__ */ jsxs(Card, {
            children: [
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/semibold",
                color: "text-primary",
                children: "Author"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/medium",
                style: {
                  marginBottom: 12
                },
                children: plugin.authors?.map((author) => author.name).join(", ") || "Unknown"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/semibold",
                color: "text-primary",
                children: "Version"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/medium",
                style: {
                  marginBottom: 12
                },
                children: plugin.version ?? "Unknown"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/semibold",
                color: "text-primary",
                children: "Repository / Source"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/medium",
                style: {
                  marginBottom: 12
                },
                onPress: plugin.repositoryUrl
                  ? () => import_react_native20.Linking.openURL(plugin.repositoryUrl)
                  : void 0,
                children: plugin.repository ?? "Unknown"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/semibold",
                color: "text-primary",
                children: "Installed From"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/medium",
                style: {
                  marginBottom: 12
                },
                children: plugin.installedFrom ?? "Unknown"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/semibold",
                color: "text-primary",
                children: "Update Source"
              }),
              /* @__PURE__ */ jsx(Text, {
                variant: "text-md/medium",
                children: plugin.updateSource ?? "Unknown"
              })
            ]
          })
""",
                "Bunny plugin provenance details card"
        );

        /*
         * Bunny theme provenance details UI
         *
         * Bunny's current theme engine uses theme.id itself as the installed
         * acquisition URL and as the source passed back to fetchTheme() for
         * refetch/update. The theme manifest model does not define a separate
         * project/repository URL, so do not fabricate one.
         */
        patched = replace(
                patched,
                """
    var { authors } = theme.data;
""",
                """
    var { authors } = theme.data;
    var bunnyThemeIsCreator = String(theme.id ?? "").startsWith("bunny-custom:");
    var themeAuthorText = authors?.map((author) => author.name).join(", ") || "Unknown";
    var themeVersionText = typeof theme.data.version === "string" && theme.data.version ? theme.data.version : "Unknown";
    var themeInstalledFromText = bunnyThemeIsCreator
      ? "Theme Creator"
      : typeof theme.id === "string" && theme.id
        ? theme.id
        : "Unknown";
    var themeUpdateSourceText = bunnyThemeIsCreator
      ? "None"
      : typeof theme.id === "string" && theme.id
        ? theme.id
        : "Unknown";
    var themeRepositoryText = "Unknown";
    var bunnyThemeSafeLink = (value) => {
      if (typeof value !== "string" || !value)
        return null;
      try {
        var url = new URL(value);
        return url.protocol === "https:" && Boolean(url.hostname) && !url.username && !url.password ? value : null;
      } catch {
        return null;
      }
    };
    var bunnyThemeOpenLink = (value) => {
      var url = bunnyThemeSafeLink(value);
      if (!url)
        return;
      import_react_native24.Linking.openURL(url).catch(() => {
        showToast("Failed to open link.", findAssetId("Small"));
      });
    };
    var bunnyThemeCopyLink = (value) => {
      var url = bunnyThemeSafeLink(value);
      if (!url)
        return;
      clipboard.setString(url);
      showToast.showCopyToClipboard();
    };
    var bunnyThemeDetailLine = (label, value, url, marginBottom) => {
      var textNode = /* @__PURE__ */ jsxs(Text, {
        variant: "text-md/medium",
        style: {
          textAlign: "center"
        },
        children: [
          `${label}: `,
          /* @__PURE__ */ jsx(Text, {
            style: url ? {
              color: "#00A8FC"
            } : void 0,
            children: value
          })
        ]
      });
      var style = marginBottom ? { marginBottom } : void 0;
      return url
        ? /* @__PURE__ */ jsx(import_react_native24.Pressable, {
            style,
            onPress: () => bunnyThemeOpenLink(url),
            onLongPress: () => bunnyThemeCopyLink(url),
            children: textNode
          })
        : /* @__PURE__ */ jsx(import_react_native24.View, {
            style,
            children: textNode
          });
    };
    var themeRepositoryUrl = bunnyThemeSafeLink(themeRepositoryText);
    var themeInstalledFromUrl = bunnyThemeSafeLink(themeInstalledFromText);
    var themeUpdateSourceUrl = bunnyThemeSafeLink(themeUpdateSourceText);
    var themeDetailsContent = /* @__PURE__ */ jsxs(import_react_native24.View, {
      children: [
        bunnyThemeDetailLine("Author", themeAuthorText, null, 16),
        bunnyThemeDetailLine("Version", themeVersionText, null, 16),
        bunnyThemeDetailLine("Repository / Source", themeRepositoryText, themeRepositoryUrl, 16),
        bunnyThemeDetailLine("Installed From", themeInstalledFromText, themeInstalledFromUrl, 16),
        bunnyThemeDetailLine("Update Source", themeUpdateSourceText, themeUpdateSourceUrl, 0)
      ]
    });
""",
                "Bunny theme provenance detail values"
        );

        /*
         * Add Details to the existing ThemeCard overflow menu. This reuses
         * Bunny's existing showConfirmationAlert import and AddonCard menu
         * system; no new sheet architecture or local-theme importer is added.
         *
         * CircleInformationIcon-primary is already the verified information
         * icon used by AddonCard itself.
         */
        patched = replace(
                patched,
                """
      overflowActions: [
""",
                """
      overflowActions: [
        {
          icon: "CircleInformationIcon-primary",
          label: "Details",
          onPress: () => {
            var bunnyThemeDetailsBackSubscription;
            var bunnyThemeCleanupDetailsBack = () => {
              bunnyThemeDetailsBackSubscription?.remove();
              bunnyThemeDetailsBackSubscription = null;
            };
            showConfirmationAlert({
              title: theme.data.name,
              content: themeDetailsContent,
              confirmText: "Close",
              onConfirm: bunnyThemeCleanupDetailsBack,
              onCancel: bunnyThemeCleanupDetailsBack
            });
            bunnyThemeDetailsBackSubscription = import_react_native24.BackHandler.addEventListener(
              "hardwareBackPress",
              () => {
                bunnyThemeCleanupDetailsBack();
                Alerts2.close();
                return true;
              }
            );
          }
        },
""",
                "Bunny theme provenance details action"
        );
        return patched;
    }

    private static String replace(
            String source,
            String exemplar,
            String replacement,
            String label
    ) throws IOException {
        return BunnyBundleStructuralMatcher.replaceExactlyOnce(
                source,
                exemplar,
                replacement,
                label
        );
    }
}

package dev.brave.extension.tools;

import dev.brave.extension.core.JsInjectionHub;

public final class ForcePictureInPictureJs {
    private static volatile boolean sRegistered = false;

    private ForcePictureInPictureJs() {}

    /**
     * Registers Force Picture-in-Picture into JsInjectionHub so it runs automatically on every page
     * whenever the Force Picture-in-Picture Morphe patch is enabled.
     */
    public static void ensureRegistered() {
        if (sRegistered) return;
        synchronized (ForcePictureInPictureJs.class) {
            if (!sRegistered) {
                JsInjectionHub.registerScript(
                        "force_picture_in_picture",
                        JsInjectionHub.InjectionTiming.ON_NAVIGATION_FINISH,
                        getEnableJs()
                );
                sRegistered = true;
            }
        }
    }

    /**
     * Removes disablepictureinpicture restrictions on HTML5 <video> elements in the document,
     * open Shadow DOM roots, and any Shadow DOM roots attached after script injection (including
     * closed roots returned by wrapped attachShadow()), and overrides
     * HTMLVideoElement.prototype.disablePictureInPicture.
     *
     * Limitation: closed Shadow DOM roots created before ON_NAVIGATION_FINISH injection cannot be
     * enumerated from page context because element.shadowRoot returns null for pre-existing
     * closed roots.
     */
    public static String getEnableJs() {
        return "(() => {"
                + "  if (window._brave_force_pip_installed) return;"
                + "  window._brave_force_pip_installed = true;"
                + "  try {"
                + "    Object.defineProperty(HTMLVideoElement.prototype, 'disablePictureInPicture', {"
                + "      get: () => false,"
                + "      set: () => {},"
                + "      configurable: true"
                + "    });"
                + "  } catch (e) {}"
                + "  const observedRoots = (typeof WeakSet !== 'undefined') ? new WeakSet() : null;"
                + "  let mo = null;"
                + "  function observeRoot(root) {"
                + "    if (!root || !mo) return;"
                + "    if (observedRoots) {"
                + "      if (observedRoots.has(root)) return;"
                + "      observedRoots.add(root);"
                + "    }"
                + "    try {"
                + "      mo.observe(root, { childList: true, subtree: true, attributes: true, attributeFilter: ['disablepictureinpicture'] });"
                + "    } catch (e) {}"
                + "  }"
                + "  function unlockVideos(root) {"
                + "    if (!root || !root.querySelectorAll) return;"
                + "    if (root.nodeType === 11) observeRoot(root);"
                + "    const videos = root.querySelectorAll('video');"
                + "    for (let i = 0; i < videos.length; i++) {"
                + "      try { videos[i].removeAttribute('disablepictureinpicture'); } catch (e) {}"
                + "    }"
                + "    const all = root.querySelectorAll('*');"
                + "    for (let i = 0; i < all.length; i++) {"
                + "      if (all[i].shadowRoot) unlockVideos(all[i].shadowRoot);"
                + "    }"
                + "  }"
                + "  try {"
                + "    mo = new MutationObserver((mutations) => {"
                + "      for (const m of mutations) {"
                + "        if (m.type === 'attributes' && m.target && m.target.tagName === 'VIDEO') {"
                + "          try { m.target.removeAttribute('disablepictureinpicture'); } catch (e) {}"
                + "        } else if (m.addedNodes) {"
                + "          for (const n of m.addedNodes) {"
                + "            if (n.nodeType === 1) {"
                + "              if (n.tagName === 'VIDEO') {"
                + "                try { n.removeAttribute('disablepictureinpicture'); } catch (e) {}"
                + "              }"
                + "              if (n.shadowRoot) unlockVideos(n.shadowRoot);"
                + "              unlockVideos(n);"
                + "            }"
                + "          }"
                + "        }"
                + "      }"
                + "    });"
                + "    observeRoot(document.documentElement || document);"
                + "  } catch (e) {}"
                + "  try {"
                + "    const origAttachShadow = Element.prototype.attachShadow;"
                + "    if (origAttachShadow) {"
                + "      Element.prototype.attachShadow = function(init) {"
                + "        const sr = origAttachShadow.apply(this, arguments);"
                + "        if (sr) unlockVideos(sr);"
                + "        return sr;"
                + "      };"
                + "    }"
                + "  } catch (e) {}"
                + "  unlockVideos(document);"
                + "})();";
    }
}

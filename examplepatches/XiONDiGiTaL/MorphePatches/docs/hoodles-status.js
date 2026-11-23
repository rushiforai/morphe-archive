/* Live status for the Hoodles mirror source.
 *
 * The site is static, so whether his patches can be added is asked of GitLab when the page loads
 * instead of being written into the HTML. The file checked is the one Morphe's one-tap add link
 * resolves to: patches-bundle.json at the root of the GitLab.com metadata project. Publishing puts
 * it there last, after the bundle itself downloads from GitGud with a matching SHA-256, so that file
 * existing means the bundle behind it does too.
 *
 * GitLab's raw URLs send no CORS headers; its API does, so the same file is read through the API.
 * Three outcomes, never a guess:
 *
 *   live    the metadata resolves, so the add link works and the button is enabled
 *   pending 404, so the metadata is missing and the button stays disabled
 *   unknown network failure or an unexpected answer: the page says it could not check rather than
 *           claiming either state
 *
 * With JavaScript off the initial markup reports the published state and the button keeps its live
 * href. The script re-checks the metadata and disables the button if the file is gone.
 */
(function () {
  "use strict";

  var API =
    "https://gitlab.com/api/v4/projects/XiONDiGiTaL%2Fhoodles-morphe-patches/repository/files/" +
    "patches-bundle.json/raw?ref=main";
  var MANUAL = "https://gitgud.io/xiondigital/MorphePatches/-/raw/main/hoodles/source.json";
  var PROJECT = "https://gitlab.com/XiONDiGiTaL/hoodles-morphe-patches";
  var ADD = "https://morphe.software/add-source?gitlab=XiONDiGiTaL/hoodles-morphe-patches&name=hoodles";

  function each(selector, fn) {
    Array.prototype.forEach.call(document.querySelectorAll(selector), fn);
  }

  function setText(selector, value) {
    each(selector, function (el) {
      el.textContent = value;
    });
  }

  function render(state, data) {
    var live = state === "live";
    var version = live && data && data.version ? String(data.version) : "";

    setText(
      "[data-hoodles-chip]",
      live ? "Bundle published" : state === "pending" ? "Metadata not found" : "Bundle status unknown"
    );

    setText(
      "[data-hoodles-headline]",
      live
        ? "Status: live."
        : state === "pending"
          ? "Status: metadata not found."
          : "Status: could not check."
    );

    setText(
      "[data-hoodles-status]",
      live
        ? "The add link resolves" +
            (version ? ", v" + version : "") +
            ", so his patches can be added as their own source." +
            (data && data.sha256
              ? " SHA-256 " + data.sha256 + "."
              : " The SHA-256 is recorded in source.json.")
        : state === "pending"
          ? "The GitLab metadata returned 404, so the one-tap link cannot resolve right now."
          : "GitLab did not answer, so this is not a status: open " +
            PROJECT +
            " to see whether the metadata is there."
    );

    setText(
      "[data-hoodles-step]",
      live
        ? "Tap the button on a device with Morphe installed and confirm. Morphe keeps one bundle per source, so when both sources have patches for an app it asks which one to use."
        : state === "pending"
          ? "The metadata is missing: the button stays disabled until the file exists, and the one-tap link returns 404. Morphe keeps one bundle per source, so his collection stays its own source beside the XiØN one."
          : "Could not check: the button is left disabled rather than linking somewhere unverified. Open " +
            PROJECT +
            " to see whether the metadata is there."
    );

    setText(
      "[data-hoodles-note]",
      live
        ? "His patches are a source of their own now. The button adds them, and " +
            MANUAL +
            " works in Sources → + → Remote without the link."
        : state === "pending"
          ? "The metadata is missing, so the one-tap link cannot resolve. It is written only after the bundle is built and confirmed to download."
          : "GitLab did not answer, so this page cannot say whether his source is published; " +
            PROJECT +
            " will."
    );

    each("[data-hoodles-add]", function (el) {
      if (live) {
        el.setAttribute("href", ADD);
        el.removeAttribute("aria-disabled");
        el.classList.remove("is-disabled");
      } else {
        el.removeAttribute("href");
        el.setAttribute("aria-disabled", "true");
        el.classList.add("is-disabled");
      }
    });
  }

  if (!window.fetch) {
    render("unknown");
    return;
  }

  var controller = window.AbortController ? new AbortController() : null;
  var timer = controller
    ? setTimeout(function () {
        controller.abort();
      }, 8000)
    : null;

  fetch(API, { cache: "no-store", signal: controller ? controller.signal : undefined })
    .then(function (response) {
      if (timer) clearTimeout(timer);
      if (response.status === 200) {
        return response.json().then(
          function (data) {
            render("live", data);
          },
          function () {
            render("unknown");
          }
        );
      }
      render(response.status === 404 ? "pending" : "unknown");
    })
    .catch(function () {
      if (timer) clearTimeout(timer);
      render("unknown");
    });
})();

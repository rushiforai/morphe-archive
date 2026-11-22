/* Live status for the Hoodles mirror source.
 *
 * The site is static, so whether hoodles/source.json exists is asked of GitGud when the page loads
 * instead of being written into the HTML. Raw GitGud URLs send no CORS headers; the GitLab API does,
 * so the same file is read through the API. Three outcomes, never a guess:
 *
 *   live    the file is there and parses, so his patches can be added as a Morphe source
 *   pending 404, so CI has not published it yet
 *   unknown network failure or an unexpected answer: the page says it could not check rather than
 *           claiming either state
 *
 * With JavaScript off the initial markup shows no status claim, only how to check by hand.
 */
(function () {
  "use strict";

  var API =
    "https://gitgud.io/api/v4/projects/xiondigital%2FMorphePatches/repository/files/" +
    "hoodles%2Fsource.json/raw?ref=main";
  var SOURCE = "https://gitgud.io/xiondigital/MorphePatches/-/raw/main/hoodles/source.json";

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
    var sha = live && data && data.sha256 ? String(data.sha256) : "";

    setText(
      "[data-hoodles-chip]",
      live ? "Bundle published" : state === "pending" ? "No bundle yet" : "Bundle status unknown"
    );

    setText(
      "[data-hoodles-bundle]",
      live
        ? "Published as patches-" + (version || "1.47.0") + ".mpp"
        : state === "pending"
          ? "Not published"
          : "Not checked"
    );

    setText(
      "[data-hoodles-headline]",
      live
        ? "Status: live."
        : state === "pending"
          ? "Status: not published yet."
          : "Status: could not check."
    );

    setText(
      "[data-hoodles-status]",
      live
        ? "hoodles/source.json is published" +
            (version
              ? " — v" + version + (sha ? ", SHA-256 " + sha.slice(0, 12) + "…" : "")
              : "") +
            ", so his patches are addable as their own source."
        : state === "pending"
          ? "No hoodles/source.json exists yet, so his patches cannot be added as a source."
          : "GitGud did not answer, so this is not a status: open the source link in step 03 to see whether the file exists."
    );

    setText(
      "[data-hoodles-step]",
      live
        ? "Open Sources → + → Remote and paste the link above. Morphe keeps one bundle per source, so when both have patches for an app it asks which source to use."
        : state === "pending"
          ? "Not published yet: that link returns 404 until CI has built the bundle, so there is nothing to add today. Morphe keeps one bundle per source, so his collection stays its own source beside the XiØN one."
          : "Could not check: open the link above, and if it loads add it under Sources → + → Remote. Morphe keeps one bundle per source, so his collection stays its own source beside the XiØN one."
    );

    setText(
      "[data-hoodles-note]",
      live
        ? "His patches are a source of their own now — add " + SOURCE + " the same way."
        : state === "pending"
          ? "His patches are not a source yet: hoodles/source.json is only committed after CI has built the bundle and confirmed it downloads, so there is nothing to add until that has run."
          : "GitGud did not answer, so this page cannot say whether his source is published; the Hoodles page tries again."
    );
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

/* The release version shown in the hero and the footer.
 *
 * It used to be typed into the markup, so the page kept advertising a version the mirror had already
 * moved past. The version and its date now come from the metadata the mirror actually serves:
 * patches-bundle.json at the root of the GitGud project. That file is what Morphe reads as the patch
 * source, so the number on the page is the number a client gets.
 *
 * GitGud's raw URLs send no CORS header; its API does, so the same file is read through the API.
 *
 * Three outcomes, and the page only ever prints one of them:
 *
 *   a version   the metadata resolved and carries a version, so it is shown
 *   unverified  the fetch has not answered yet, which is also what no-JavaScript visitors see
 *   unavailable the request failed or the payload had no version; the value turns red and says so
 *
 * The markup ships "unverified" instead of a number, so nothing on the page claims a version before
 * the mirror has been asked.
 */
(function () {
  "use strict";

  var API =
    "https://gitgud.io/api/v4/projects/xiondigital%2FMorphePatches/repository/files/" +
    "patches-bundle.json/raw?ref=main";

  function each(selector, fn) {
    Array.prototype.forEach.call(document.querySelectorAll(selector), fn);
  }

  function setText(selector, value, failed) {
    each(selector, function (el) {
      el.textContent = value;
      el.classList.toggle("is-error", Boolean(failed));
      if (failed) {
        el.setAttribute("title", "Could not read patches-bundle.json from the GitGud mirror");
      } else {
        el.removeAttribute("title");
      }
    });
  }

  function fail(reason) {
    setText("[data-release-version]", "unavailable", true);
    setText("[data-release-date]", "unknown", true);
    if (window.console && window.console.error) {
      window.console.error("release metadata: " + reason + " (" + API + ")");
    }
  }

  // The newest row of the releases table, built from the same metadata. Older rows stay in the page
  // as history, and any one of them describing the live version is hidden so the table never lists
  // that version twice.
  function renderRow(data, version, date) {
    var body = document.querySelector("[data-releases-body]");
    if (!body) return;

    // Only one row may be marked current, so earlier marks are cleared before this run decides.
    Array.prototype.forEach.call(body.querySelectorAll("[data-release-row]"), function (row) {
      var stale = row.querySelector(".row-tag");
      if (!stale) return;
      var br = stale.previousElementSibling;
      if (br && br.tagName === "BR") br.remove();
      stale.remove();
    });

    // A hand-written row for the live version is kept as it is and marked current, so its Contents
    // text survives; a version with no row gets one built here instead.
    var written = null;
    Array.prototype.forEach.call(body.querySelectorAll("[data-release-row]"), function (row) {
      if (row.getAttribute("data-release-row").replace(/^v/, "") === version) written = row;
    });
    if (written) {
      var head = written.querySelector("th");
      if (head && !head.querySelector(".row-tag")) {
        var marker = document.createElement("span");
        marker.className = "row-tag";
        marker.textContent = "current";
        head.appendChild(document.createElement("br"));
        head.appendChild(marker);
      }
      return;
    }

    var row = document.createElement("tr");

    var versionCell = document.createElement("th");
    versionCell.setAttribute("scope", "row");
    var link = document.createElement("a");
    link.className = "text-link";
    link.href = "https://github.com/XiONDiGiTaL/MorphePatches/releases/tag/v" + version;
    link.textContent = "v" + version;
    var tag = document.createElement("span");
    tag.className = "row-tag";
    tag.textContent = "current";
    versionCell.appendChild(link);
    versionCell.appendChild(document.createElement("br"));
    versionCell.appendChild(tag);

    function cell(text) {
      var td = document.createElement("td");
      td.textContent = text;
      return td;
    }

    var summary = data && typeof data.summary === "string" ? data.summary.trim() : "";

    row.appendChild(versionCell);
    row.appendChild(cell(date));
    row.appendChild(cell("patches-" + version + ".mpp"));
    row.appendChild(cell(summary || "See the release notes for this version."));
    body.insertBefore(row, body.firstElementChild);
  }

  function render(data) {
    var version = data && data.version ? String(data.version).trim() : "";
    if (!version) {
      fail("patches-bundle.json has no version");
      return;
    }

    setText("[data-release-version]", "v" + version, false);

    var date = data && typeof data.created_at === "string" ? data.created_at.slice(0, 10) : "";
    var dateText = /^\d{4}-\d{2}-\d{2}$/.test(date) ? date : "unknown";
    setText("[data-release-date]", dateText, false);

    renderRow(data, version, dateText);
  }

  if (!window.fetch) {
    fail("this browser has no fetch");
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
      if (response.status !== 200) {
        fail("the metadata returned " + response.status);
        return;
      }
      return response.json().then(render, function () {
        fail("the metadata is not JSON");
      });
    })
    .catch(function (error) {
      if (timer) clearTimeout(timer);
      fail(error && error.name === "AbortError" ? "the request timed out" : "the request failed");
    });
})();

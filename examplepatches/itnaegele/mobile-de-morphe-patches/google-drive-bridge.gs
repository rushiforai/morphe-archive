/**
 * mobile.de Archiv -> Google Drive Bridge (Google Apps Script)
 *
 * Einrichtung (ca. 1 Minute):
 * 1. https://script.google.com öffnen -> "Neues Projekt"
 * 2. Diesen gesamten Code einfügen und oben SECRET auf ein eigenes Passwort ändern
 * 3. Rechts oben: "Bereitstellen" -> "Neue Bereitstellung" -> Typ: "Web-App"
 *    - Ausführen als: "Ich"
 *    - Zugriff: "Jeder" (geschützt durch dein SECRET)
 * 4. Die Web-App-URL (.../exec) und dein SECRET in der mobile.de App unter
 *    Menü -> "Archiv (Google Drive)" eintragen.
 */

var SECRET = "HIER_DEIN_GEHEIMES_PASSWORT_EINTRAGEN";
var ROOT_FOLDER_NAME = "mobile.de Archiv";

function jsonOut(obj) {
  return ContentService.createTextOutput(JSON.stringify(obj))
    .setMimeType(ContentService.MimeType.JSON);
}

function checkAuth(secret) {
  return secret && SECRET && secret === SECRET;
}

function getOrCreateFolder(parent, name) {
  var it = parent ? parent.getFoldersByName(name) : DriveApp.getFoldersByName(name);
  if (it.hasNext()) return it.next();
  return parent ? parent.createFolder(name) : DriveApp.createFolder(name);
}

function findListingFolder(root, adId) {
  var it = root.getFolders();
  var prefix = adId + " - ";
  while (it.hasNext()) {
    var f = it.next();
    var n = f.getName();
    if (n === adId || n.indexOf(prefix) === 0) {
      return f;
    }
  }
  return null;
}

function sanitizeName(str) {
  if (!str) return "";
  return String(str).replace(/[\\/:*?"<>|\r\n]+/g, " ").trim().substring(0, 60);
}

function upsertTextFile(folder, filename, content, mimeType) {
  var it = folder.getFilesByName(filename);
  if (it.hasNext()) {
    var file = it.next();
    file.setContent(content);
    return file;
  }
  return folder.createFile(filename, content, mimeType || MimeType.PLAIN_TEXT);
}

function upsertBinaryFile(folder, filename, bytes, mimeType) {
  var it = folder.getFilesByName(filename);
  if (it.hasNext()) {
    return it.next(); // Bild existiert bereits
  }
  var blob = Utilities.newBlob(bytes, mimeType || "image/jpeg", filename);
  return folder.createFile(blob);
}

function readTextFile(folder, filename) {
  var it = folder.getFilesByName(filename);
  if (!it.hasNext()) return null;
  return it.next().getBlob().getDataAsString("UTF-8");
}

function doGet(e) {
  try {
    var p = (e && e.parameter) ? e.parameter : {};
    if (!checkAuth(p.secret)) {
      return jsonOut({ ok: false, error: "unauthorized" });
    }

    var action = p.action || "ping";
    var root = getOrCreateFolder(null, ROOT_FOLDER_NAME);

    if (action === "ping") {
      return jsonOut({ ok: true, folder: root.getName(), folderId: root.getId() });
    }

    if (action === "listListings") {
      var list = [];
      var folders = root.getFolders();
      while (folders.hasNext()) {
        var f = folders.next();
        if (f.getName() === "_images") continue;
        var metaStr = readTextFile(f, "meta.json");
        if (metaStr) {
          try {
            list.push(JSON.parse(metaStr));
          } catch (err) {}
        } else {
          var adId = f.getName().split(" ")[0];
          list.push({ adId: adId, title: f.getName(), price: "", archivedAt: f.getLastUpdated().getTime() });
        }
      }
      return jsonOut({ ok: true, items: list });
    }

    if (action === "getListing") {
      var adId = p.adId;
      if (!adId) return jsonOut({ ok: false, error: "missing adId" });
      var folder = findListingFolder(root, adId);
      if (!folder) return jsonOut({ ok: true, found: false });
      return jsonOut({
        ok: true,
        found: true,
        vipJson: readTextFile(folder, "listing.json"),
        contactJson: readTextFile(folder, "contact.json"),
        metaJson: readTextFile(folder, "meta.json")
      });
    }

    if (action === "getImage") {
      var imageKey = p.imageKey;
      if (!imageKey) return jsonOut({ ok: false, error: "missing imageKey" });
      var imgName = "img_" + imageKey + ".jpg";
      var imgFolder = getOrCreateFolder(root, "_images");
      var it = imgFolder.getFilesByName(imgName);
      if (!it.hasNext()) {
        it = DriveApp.getFilesByName(imgName);
      }
      if (!it.hasNext()) return jsonOut({ ok: true, found: false });
      var bytes = it.next().getBlob().getBytes();
      return jsonOut({ ok: true, found: true, base64: Utilities.base64Encode(bytes) });
    }

    return jsonOut({ ok: false, error: "unknown action" });
  } catch (err) {
    return jsonOut({ ok: false, error: String(err) });
  }
}

function doPost(e) {
  try {
    var body = JSON.parse(e.postData.contents);
    if (!checkAuth(body.secret)) {
      return jsonOut({ ok: false, error: "unauthorized" });
    }

    var action = body.action;
    var root = getOrCreateFolder(null, ROOT_FOLDER_NAME);

    if (action === "putListing") {
      var adId = String(body.adId || "").trim();
      if (!adId) return jsonOut({ ok: false, error: "missing adId" });

      var folder = findListingFolder(root, adId);
      if (!folder) {
        var safeTitle = sanitizeName(body.title);
        var folderName = safeTitle ? (adId + " - " + safeTitle) : adId;
        folder = root.createFolder(folderName);
      }

      if (body.vipJson) {
        upsertTextFile(folder, "listing.json", body.vipJson, "application/json");
      }
      if (body.contactJson) {
        upsertTextFile(folder, "contact.json", body.contactJson, "application/json");
      }
      if (body.metaJson) {
        upsertTextFile(folder, "meta.json", body.metaJson, "application/json");
      }
      if (body.infoTxt) {
        upsertTextFile(folder, "info.txt", body.infoTxt, MimeType.PLAIN_TEXT);
      }
      return jsonOut({ ok: true, folderId: folder.getId() });
    }

    if (action === "putImage") {
      var adId = String(body.adId || "").trim();
      var imageKey = String(body.imageKey || "").trim();
      var b64 = body.base64;
      if (!imageKey || !b64) return jsonOut({ ok: false, error: "missing params" });

      var bytes = Utilities.base64Decode(b64);
      var imgName = "img_" + imageKey + ".jpg";

      // In globalem _images Ordner speichern für schnellen Lookup
      var imgRoot = getOrCreateFolder(root, "_images");
      upsertBinaryFile(imgRoot, imgName, bytes, "image/jpeg");

      // Zusätzlich im Inserats-Ordner ablegen (lesbar in Drive)
      if (adId) {
        var listingFolder = findListingFolder(root, adId);
        if (listingFolder) {
          var idxName = body.index ? ("foto_" + body.index + "_" + imageKey.substring(0, 8) + ".jpg") : imgName;
          upsertBinaryFile(listingFolder, idxName, bytes, "image/jpeg");
        }
      }
      return jsonOut({ ok: true });
    }

    return jsonOut({ ok: false, error: "unknown action" });
  } catch (err) {
    return jsonOut({ ok: false, error: String(err) });
  }
}

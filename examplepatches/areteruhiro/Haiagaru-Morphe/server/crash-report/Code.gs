const LOG_SHEET_ID = '1cYRQt3Rml1eTL7S04vVy5FpE5Yo48rl6PTohyMtVtA0';
const LOG_TAB_ID = 1279994134;

function logResponse(value) {
  return ContentService.createTextOutput(JSON.stringify(value))
      .setMimeType(ContentService.MimeType.JSON);
}

function doGet() {
  const sheet = logSheet();
  return logResponse({service: 'haiagaru-diagnostics', ready: !!sheet});
}

function doPost(event) {
  const body = event && event.postData && event.postData.contents;
  if (!body || body.length > 110000) return logResponse({ok: false});
  let item;
  try { item = JSON.parse(body); } catch (_) { return logResponse({ok: false}); }
  if (!item || !['Crash', 'ANR'].includes(item.type)
      || typeof item.id !== 'string' || !/^[a-f0-9-]{36}$/.test(item.id)
      || !Number.isSafeInteger(item.time) || item.time < 1 || item.time >= 8640000000000000
      || typeof item.report !== 'string' || item.report.length > 24000
      || !item.report.startsWith(item.type === 'ANR' ? 'Haiagaru ANR log\n' : 'Haiagaru crash log\n')) {
    return logResponse({ok: false});
  }

  const lock = LockService.getScriptLock();
  if (!lock.tryLock(5000)) return logResponse({ok: false});
  try {
    const sheet = logSheet();
    if (!sheet) return logResponse({ok: false});
    const reportColumn = logColumn(sheet, 'Haiagaru report');
    const idColumn = logColumn(sheet, 'Haiagaru report ID');
    const lastRow = sheet.getLastRow();
    if (lastRow > 2 && sheet.getRange(3, idColumn, lastRow - 2, 1)
        .createTextFinder(item.id).matchEntireCell(true).findNext()) {
      return logResponse({ok: true, id: item.id});
    }

    const lines = item.report.split('\n');
    const field = key => {
      const line = lines.find(value => value.startsWith(key + ': '));
      return line ? line.substring(key.length + 2) : '';
    };
    const time = Utilities.formatDate(new Date(item.time), 'Asia/Tokyo', 'yyyy-MM-dd HH:mm:ss.SSS');
    const error = item.type === 'ANR' ? field('Description') : (item.report.split('\n\n')[1] || '').split('\n')[0];
    const fields = [
      item.type, time, field('Package'), [field('ChMate version'), field('Haiagaru version')].filter(Boolean).join(' / '),
      field('Android'), field('Device'), field('Thread') || field('Process'), error
    ];
    const row = Array(sheet.getLastColumn()).fill('');
    fields.forEach((value, index) => row[index] = logCell(value));
    row[reportColumn - 1] = logCell(item.report);
    row[idColumn - 1] = item.id;
    sheet.getRange(Math.max(3, lastRow + 1), 1, 1, row.length).setValues([row]);
    SpreadsheetApp.flush();
    return logResponse({ok: true, id: item.id});
  } finally {
    lock.releaseLock();
  }
}

function logSheet() {
  return SpreadsheetApp.openById(LOG_SHEET_ID).getSheets().find(sheet => sheet.getSheetId() === LOG_TAB_ID);
}

function logColumn(sheet, label) {
  const last = Math.max(8, sheet.getLastColumn());
  const headers = sheet.getRange(2, 1, 1, last).getDisplayValues()[0];
  const index = headers.indexOf(label);
  if (index >= 0) return index + 1;
  if (last >= sheet.getMaxColumns()) sheet.insertColumnAfter(last);
  sheet.getRange(2, last + 1).setValue(label);
  return last + 1;
}

// Force untrusted exception text to remain plain text in the spreadsheet.
function logCell(value) {
  return /^[\s]*[=+\-@]/.test(value) ? "'" + value : value;
}

/* GAS V8 prototype. Secrets and client registrations belong in Script Properties. */
const COLUMNS = ['receivedAt', 'reporter', 'reportId', 'target', 'payload'];

function setupSharedNg() {
  const db = SpreadsheetApp.openById(props_().getProperty('SPREADSHEET_ID'));
  if (db.getSheetByName('SharedNgReports')) throw new Error('Already initialized');
  db.insertSheet('SharedNgReports').appendRow(COLUMNS);
}

function props_() { return PropertiesService.getScriptProperties(); }
function hash_(s) {
  return Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_256, s,
    Utilities.Charset.UTF_8).map(b => ('0' + ((b + 256) % 256).toString(16)).slice(-2)).join('');
}
function json_(o) {
  return ContentService.createTextOutput(JSON.stringify(o))
    .setMimeType(ContentService.MimeType.JSON);
}
function clients_() { return JSON.parse(props_().getProperty('CLIENTS_JSON') || '{}'); }
function sheet_() {
  return SpreadsheetApp.openById(props_().getProperty('SPREADSHEET_ID'))
    .getSheetByName('SharedNgReports');
}
function rows_() {
  const s = sheet_();
  return s.getLastRow() > 1 ? s.getRange(2, 1, s.getLastRow() - 1, 5).getValues() : [];
}
function require_(condition) { if (!condition) throw new Error('INVALID_REQUEST'); }
function validate_(r) {
  require_(r && typeof r === 'object');
  require_(/^[a-zA-Z0-9_-]{16,80}$/.test(r.reportId));
  require_(['5ch', 'edge', 'talk', 'external'].includes(r.service));
  require_(typeof r.site === 'string' && /^[a-z0-9.-]{1,253}$/.test(r.site));
  const match = (s, d) => s === d || s.endsWith('.' + d);
  const kind = match(r.site, '5ch.net') || match(r.site, '5ch.io') ? '5ch'
    : r.site === 'bbs.eddibb.cc' ? 'edge' : r.site === 'talk.jp' ? 'talk' : 'external';
  require_(kind === r.service);
  require_(typeof r.board === 'string' && /^[a-zA-Z0-9_/-]{1,128}$/.test(r.board));
  require_(typeof r.date === 'string' && /^\d{4}-\d{2}-\d{2}$/.test(r.date));
  const time = Date.parse(r.date + 'T00:00:00Z');
  require_(Number.isFinite(time) && new Date(time).toISOString().slice(0, 10) === r.date);
  require_(time <= Date.now() + 86400000 && time >= Date.now() - 7 * 86400000);
  require_(['id', 'wacchoi', 'prefix', 'suffix', 'trip', 'body_word'].includes(r.type));
  require_(typeof r.value === 'string' && r.value.length > 0 && r.value.length <= 256);
  require_(!/[\u0000-\u001f\u007f]/.test(r.value));
  require_(!['prefix', 'suffix'].includes(r.type) || /^[a-zA-Z0-9+/]{4}$/.test(r.value));
  require_(r.body === undefined || (typeof r.body === 'string' && r.body.length <= 4000));
  // Whitelist fields: never persist credentials or arbitrary client metadata.
  return {reportId:r.reportId, service:r.service, site:r.site, board:r.board,
    date:r.date, type:r.type, value:r.value, body:r.body || ''};
}
function target_(r) {
  return JSON.stringify([r.service, r.site, r.board, r.date, r.type, r.value]);
}
function doPost(e) {
  let lock;
  try {
    require_(e && e.postData && typeof e.postData.contents === 'string');
    const raw = e.postData.contents;
    require_(raw.length <= 65536 && Utilities.newBlob(raw).getBytes().length <= 65536);
    const q = JSON.parse(raw), clients = clients_(), client = clients[q.reporterId];
    require_(q.version === 1 && typeof q.token === 'string' && q.token.length <= 128);
    if (!client || client.disabled || hash_(q.token) !== client.tokenHash) return json_({ok:false,error:'AUTH_FAILED'});
    require_(q.action === 'report' && Array.isArray(q.reports) && q.reports.length > 0 && q.reports.length <= 20);
    const reports = q.reports.map(validate_);
    lock = LockService.getScriptLock();
    if (!lock.tryLock(5000)) return json_({ok:false,error:'BUSY'});
    const rows = rows_(), ids = new Set(), targets = new Set();
    let used = 0;
    const today = new Date().toISOString().slice(0,10);
    for (const row of rows) if (row[1] === q.reporterId) {
      ids.add(row[2]); targets.add(row[3]);
      if (String(row[0]).startsWith(today)) used++;
    }
    const ack = [], pending = [];
    for (const r of reports) {
      const key = hash_(target_(r));
      ack.push(r.reportId);
      if (ids.has(r.reportId) || targets.has(key)) continue;
      ids.add(r.reportId); targets.add(key);
      // JSON prefix prevents user input from becoming a spreadsheet formula.
      pending.push([new Date().toISOString(), q.reporterId, r.reportId, key, JSON.stringify(r)]);
    }
    if (used + pending.length > 200) return json_({ok:false,error:'DAILY_LIMIT'});
    if (pending.length) sheet_().getRange(sheet_().getLastRow()+1,1,pending.length,5).setValues(pending);
    SpreadsheetApp.flush();
    return json_({ok:true,ack:ack});
  } catch (_) { return json_({ok:false,error:'INVALID_OR_SERVER_ERROR'}); }
  finally { if (lock && lock.hasLock()) lock.releaseLock(); }
}

// Private server rules. Network slang alone intentionally has no weight.
function bonus_(body, rules) {
  const normalized = body.normalize('NFKC').toLowerCase();
  return Math.min(2, rules.reduce((sum, rule) =>
    sum + (normalized.includes(rule.term) ? rule.weight : 0), 0));
}
function aggregate_(rows, clients, rules, now) {
  const groups = new Map();
  for (const row of rows) {
    const client = clients[row[1]];
    if (!client || client.disabled || client.reviewOnly) continue;
    const r = JSON.parse(row[4]);
    const expires = Date.parse(r.date + 'T00:00:00Z') + 2 * 86400000;
    if (expires <= now) continue;
    const key = target_(r);
    if (!groups.has(key)) groups.set(key, {r:r,voters:new Set(),bonus:0,expires:expires});
    const g = groups.get(key);
    g.voters.add(row[1]); g.bonus = Math.max(g.bonus, bonus_(r.body, rules));
  }
  return Array.from(groups.values()).map(g => {
    const count = g.voters.size, score = count + g.bonus;
    // Minimum receiver strength: 1=minimal ... 5=hard.
    const minLevel = count >= 10 && score >= 12 ? 1 : count >= 5 && score >= 7 ? 2
      : count >= 3 ? 3 : count >= 2 ? 4 : 5;
    const {body, reportId, ...target} = g.r;
    return {...target,minLevel:minLevel,expiresAt:g.expires};
  }).sort((a,b) => JSON.stringify(a).localeCompare(JSON.stringify(b)));
}
function doGet(e) {
  try {
    const p = e && e.parameter || {};
    require_(['5ch','edge','talk','external'].includes(p.service));
    require_(typeof p.site === 'string' && typeof p.board === 'string');
    const rows = rows_().filter(row => {
      const r = JSON.parse(row[4]);
      return r.service === p.service && r.site === p.site && r.board === p.board;
    });
    const rules = JSON.parse(props_().getProperty('RULES_JSON') || '[]');
    const entries = aggregate_(rows, clients_(), rules, Date.now());
    const revision = hash_(JSON.stringify(entries));
    return json_(p.revision === revision ? {ok:true,unchanged:true,revision:revision}
      : {ok:true,revision:revision,replace:true,entries:entries});
  } catch (_) { return json_({ok:false,error:'INVALID_OR_SERVER_ERROR'}); }
}

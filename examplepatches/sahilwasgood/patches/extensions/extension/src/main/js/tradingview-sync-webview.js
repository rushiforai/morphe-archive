/**
 * TradingView Morphe Android Native Watchlist Backend Proxy
 * - Replaces TradingView's backend for Watchlists with our synchronized Cloudflare/local store.
 * - ZERO injected buttons or drawers — utilizes TradingView's own native frontend watchlist UI!
 * - Unlocks multi-chart layouts up to 8 panes.
 */
(function () {
  if (window.__tvBackendProxyInjected) return;
  window.__tvBackendProxyInjected = true;

  const DEFAULT_WORKER_URL = "https://tradingview-sync-worker.pubgnewstatevpn99.workers.dev";
  const STORAGE_KEY_PASSKEY = "tv_sync_passkey";
  const STORAGE_KEY_WATCHLISTS = "morphe_tv_custom_watchlists_v1";
  const STORAGE_KEY_CONFIG = "morphe_tv_sync_config_v1";
  const STORAGE_KEY_ACTIVE_ID = "morphe_tv_active_watchlist_id";

  // --- 1. Persistence & Configuration ---
  function getPasskey() {
    try {
      const p = localStorage.getItem(STORAGE_KEY_PASSKEY);
      if (p && p.trim()) return p.trim();
      const cfg = JSON.parse(localStorage.getItem(STORAGE_KEY_CONFIG) || "{}");
      if (cfg.syncToken && cfg.syncToken.trim()) return cfg.syncToken.trim();
    } catch (_) {}
    return "";
  }

  function setPasskey(val) {
    if (!val) return;
    try {
      localStorage.setItem(STORAGE_KEY_PASSKEY, val.trim());
      const cfg = JSON.parse(localStorage.getItem(STORAGE_KEY_CONFIG) || "{}");
      cfg.syncToken = val.trim();
      localStorage.setItem(STORAGE_KEY_CONFIG, JSON.stringify(cfg));
    } catch (_) {}
  }

  function loadLocalWatchlists() {
    try {
      const raw = localStorage.getItem(STORAGE_KEY_WATCHLISTS);
      if (raw) {
        const parsed = JSON.parse(raw);
        if (Array.isArray(parsed) && parsed.length > 0) return parsed;
      }
    } catch (_) {}
    return [
      {
        id: 1001,
        type: "custom",
        name: "Watchlist",
        active: true,
        color: null,
        created: Math.floor(Date.now() / 1000),
        modified: Math.floor(Date.now() / 1000),
        symbols: [
          "###Indices",
          "SP:SPX",
          "TVC:NDQ",
          "TVC:DJI",
          "CBOE:VIX",
          "###Crypto",
          "BITSTAMP:BTCUSD",
          "BINANCE:BTCUSDT",
          "BITSTAMP:ETHUSD",
          "###Tech",
          "NASDAQ:AAPL",
          "NASDAQ:TSLA",
          "NASDAQ:NVDA"
        ]
      }
    ];
  }

  function saveLocalWatchlists(list) {
    try {
      localStorage.setItem(STORAGE_KEY_WATCHLISTS, JSON.stringify(list));
    } catch (_) {}
  }

  function getActiveId() {
    try {
      return localStorage.getItem(STORAGE_KEY_ACTIVE_ID);
    } catch (_) {
      return null;
    }
  }

  function setActiveId(id) {
    try {
      localStorage.setItem(STORAGE_KEY_ACTIVE_ID, String(id));
    } catch (_) {}
  }

  let localLists = loadLocalWatchlists();
  let lastSyncTime = 0;
  let isSyncing = false;

  // Normalizes list into TradingView API format
  function formatAsTvLists() {
    const activeId = getActiveId();
    const passkey = getPasskey();

    let out = localLists.map((wl, idx) => {
      const id = wl.id ? (typeof wl.id === "string" && /^\d+$/.test(wl.id) ? parseInt(wl.id, 10) : wl.id) : (idx + 1000);
      const isActive = activeId ? String(id) === String(activeId) : idx === 0;
      const symbols = Array.isArray(wl.symbols) ? wl.symbols : (Array.isArray(wl.stocks) ? wl.stocks : []);
      return {
        id: id,
        type: "custom",
        name: wl.name || ("Watchlist " + (idx + 1)),
        active: isActive,
        color: wl.color || null,
        created: wl.created || Math.floor(Date.now() / 1000),
        modified: wl.modified || Math.floor(Date.now() / 1000),
        symbols: symbols
      };
    });

    // If passkey is not set yet, prepend a clean helper watchlist
    if (!passkey) {
      out.unshift({
        id: 999999999,
        type: "custom",
        name: "⚙️ Setup Cloud Sync Passkey",
        active: false,
        color: null,
        created: Math.floor(Date.now() / 1000),
        modified: Math.floor(Date.now() / 1000),
        symbols: ["###Tap this list to enter your desktop passkey"]
      });
    }

    return out;
  }

  // --- 2. Cloudflare Sync Engine (Bidirectional) ---
  async function syncWithCloudflare(direction = "pull") {
    const passkey = getPasskey();
    if (!passkey || isSyncing) return;
    isSyncing = true;

    try {
      if (direction === "pull") {
        const res = await fetch(`${DEFAULT_WORKER_URL}/api/sync`, {
          headers: { "x-sync-token": passkey }
        });
        if (res.ok) {
          const remote = await res.json();
          const remoteTime = Number(remote.timestamp) || 0;
          if (remote.watchlists && Array.isArray(remote.watchlists) && remote.watchlists.length > 0) {
            localLists = remote.watchlists.map((w, i) => ({
              id: w.id || (i + 1000),
              type: "custom",
              name: w.name || ("Watchlist " + (i + 1)),
              active: i === 0,
              color: w.color || null,
              created: w.created || Math.floor(Date.now() / 1000),
              modified: w.modified || Math.floor(Date.now() / 1000),
              symbols: Array.isArray(w.stocks) ? w.stocks : (Array.isArray(w.symbols) ? w.symbols : [])
            }));
            saveLocalWatchlists(localLists);
            lastSyncTime = remoteTime;
          }
        }
      } else if (direction === "push") {
        const now = Date.now();
        const payload = {
          timestamp: now,
          watchlists: localLists.map(w => ({
            id: w.id,
            name: w.name,
            stocks: w.symbols || w.stocks || [],
            stockNotes: w.stockNotes || {}
          })),
          client: "android-morphe-proxy"
        };
        await fetch(`${DEFAULT_WORKER_URL}/api/sync`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "x-sync-token": passkey
          },
          body: JSON.stringify(payload)
        });
        lastSyncTime = now;
      }
    } catch (e) {
      console.warn("[TVBackendProxy] Sync error:", e);
    } finally {
      isSyncing = false;
    }
  }

  // Pull on startup and periodically (every 60s)
  setTimeout(() => syncWithCloudflare("pull"), 1000);
  setInterval(() => syncWithCloudflare("pull"), 60000);

  // --- 3. URL Router for TradingView Symbols List API ---
  function matchSymbolsListUrl(url) {
    if (!url) return null;
    const s = String(url).split("?")[0].split("#")[0];
    if (!s.includes("/symbols_list")) return null;

    if (/\/api\/v1\/symbols_list\/(custom|all)?\/?$/i.test(s)) return { type: "LIST" };
    if (/\/api\/v1\/symbols_list\/active\/?$/i.test(s)) return { type: "ACTIVE" };
    let m = s.match(/\/api\/v1\/symbols_list\/custom\/([^\/]+)\/append\/?/i);
    if (m) return { type: "APPEND", id: m[1] };
    m = s.match(/\/api\/v1\/symbols_list\/custom\/([^\/]+)\/delete_symbols\/?/i);
    if (m) return { type: "DELETE_SYMBOLS", id: m[1] };
    m = s.match(/\/api\/v1\/symbols_list\/custom\/([^\/]+)\/rename\/?/i);
    if (m) return { type: "RENAME", id: m[1] };
    m = s.match(/\/api\/v1\/symbols_list\/custom\/([^\/]+)\/?$/i);
    if (m) return { type: "ITEM", id: m[1] };
    if (/\/api\/v1\/symbols_list/i.test(s)) return { type: "LIST" };
    return null;
  }

  // --- 4. Request Handler ---
  function handleSymbolsListRequest(method, match, body) {
    method = (method || "GET").toUpperCase();
    const lists = formatAsTvLists();

    // Trigger passkey prompt when setup list is selected
    if (match.id === "999999999" || (body && (body.id == 999999999 || String(body).includes("999999999")))) {
      setTimeout(() => {
        const currentKey = getPasskey();
        const key = prompt("Enter Cloud Sync Passkey (from Desktop Extension):", currentKey);
        if (key && key.trim()) {
          setPasskey(key.trim());
          syncWithCloudflare("pull");
        }
      }, 100);
    }

    if (match.type === "LIST") {
      if (method === "GET") {
        return { status: 200, data: lists };
      }
      if (method === "POST") {
        let parsed = {};
        try { parsed = typeof body === "string" ? JSON.parse(body) : (body || {}); } catch (_) {}
        const name = (parsed.name || "New Watchlist").trim();

        if (name.toLowerCase().startsWith("sync:")) {
          const key = name.slice(5).trim();
          if (key) {
            setPasskey(key);
            syncWithCloudflare("pull");
          }
        }

        const newId = Date.now();
        const newWl = {
          id: newId,
          type: "custom",
          name: name,
          active: true,
          color: null,
          created: Math.floor(Date.now() / 1000),
          modified: Math.floor(Date.now() / 1000),
          symbols: Array.isArray(parsed.symbols) ? parsed.symbols : []
        };
        localLists.push(newWl);
        setActiveId(newId);
        saveLocalWatchlists(localLists);
        syncWithCloudflare("push");
        return { status: 200, data: newWl };
      }
    }

    if (match.type === "ACTIVE") {
      if (method === "GET") {
        const active = lists.find(l => l.active) || lists[0];
        return { status: 200, data: active };
      }
      if (method === "POST" || method === "PUT") {
        let parsed = {};
        try { parsed = typeof body === "string" ? JSON.parse(body) : (body || {}); } catch (_) {}
        if (parsed.id) setActiveId(parsed.id);
        return { status: 200, data: { status: "ok" } };
      }
    }

    if (match.type === "ITEM") {
      const targetId = match.id;
      const target = localLists.find(l => String(l.id) === String(targetId));

      if (method === "GET") {
        if (target) return { status: 200, data: target };
        return { status: 200, data: lists[0] || {} };
      }
      if (method === "DELETE") {
        localLists = localLists.filter(l => String(l.id) !== String(targetId));
        saveLocalWatchlists(localLists);
        syncWithCloudflare("push");
        return { status: 200, data: { status: "ok" } };
      }
      if (method === "PUT" || method === "POST") {
        let parsed = {};
        try { parsed = typeof body === "string" ? JSON.parse(body) : (body || {}); } catch (_) {}
        if (target) {
          if (parsed.name) target.name = parsed.name;
          if (Array.isArray(parsed.symbols)) target.symbols = parsed.symbols;
          target.modified = Math.floor(Date.now() / 1000);
          saveLocalWatchlists(localLists);
          syncWithCloudflare("push");
          return { status: 200, data: target };
        }
      }
    }

    if (match.type === "APPEND") {
      const target = localLists.find(l => String(l.id) === String(match.id)) || localLists[0];
      let parsed = {};
      try { parsed = typeof body === "string" ? JSON.parse(body) : (body || {}); } catch (_) {}
      const toAdd = Array.isArray(parsed.symbols) ? parsed.symbols : (parsed.symbol ? [parsed.symbol] : []);
      if (target) {
        if (!target.symbols) target.symbols = [];
        toAdd.forEach(sym => {
          if (!target.symbols.includes(sym)) target.symbols.push(sym);
        });
        target.modified = Math.floor(Date.now() / 1000);
        saveLocalWatchlists(localLists);
        syncWithCloudflare("push");
        return { status: 200, data: target };
      }
    }

    if (match.type === "DELETE_SYMBOLS") {
      const target = localLists.find(l => String(l.id) === String(match.id)) || localLists[0];
      let parsed = {};
      try { parsed = typeof body === "string" ? JSON.parse(body) : (body || {}); } catch (_) {}
      const toRemove = Array.isArray(parsed.symbols) ? parsed.symbols : [];
      if (target && target.symbols) {
        target.symbols = target.symbols.filter(s => !toRemove.includes(s));
        target.modified = Math.floor(Date.now() / 1000);
        saveLocalWatchlists(localLists);
        syncWithCloudflare("push");
        return { status: 200, data: target };
      }
    }

    if (match.type === "RENAME") {
      const target = localLists.find(l => String(l.id) === String(match.id));
      let parsed = {};
      try { parsed = typeof body === "string" ? JSON.parse(body) : (body || {}); } catch (_) {}
      if (target && parsed.name) {
        target.name = parsed.name.trim();
        target.modified = Math.floor(Date.now() / 1000);
        saveLocalWatchlists(localLists);
        syncWithCloudflare("push");
        return { status: 200, data: target };
      }
    }

    return { status: 200, data: lists };
  }

  // --- 5. Intercept window.fetch ---
  const origFetch = window.fetch;
  window.fetch = async function (resource, init) {
    try {
      const url = typeof resource === "string" ? resource : (resource ? resource.url : "");
      const match = matchSymbolsListUrl(url);
      if (match) {
        const method = (init && init.method) || (typeof resource === "object" && resource.method) || "GET";
        let body = init && init.body;
        const result = handleSymbolsListRequest(method, match, body);
        return new Response(JSON.stringify(result.data), {
          status: result.status,
          headers: { "Content-Type": "application/json; charset=utf-8" }
        });
      }
    } catch (e) {
      console.warn("[TVBackendProxy] Fetch intercept error:", e);
    }
    return origFetch.apply(this, arguments);
  };

  // --- 6. Intercept window.XMLHttpRequest ---
  const origXhrOpen = XMLHttpRequest.prototype.open;
  const origXhrSend = XMLHttpRequest.prototype.send;

  XMLHttpRequest.prototype.open = function (method, url) {
    this._tvMethod = method;
    this._tvUrl = url;
    this._tvMatch = matchSymbolsListUrl(url);
    return origXhrOpen.apply(this, arguments);
  };

  XMLHttpRequest.prototype.send = function (body) {
    if (this._tvMatch) {
      const result = handleSymbolsListRequest(this._tvMethod, this._tvMatch, body);
      const jsonStr = JSON.stringify(result.data);

      Object.defineProperty(this, "status", { configurable: true, value: result.status });
      Object.defineProperty(this, "statusText", { configurable: true, value: "OK" });
      Object.defineProperty(this, "readyState", { configurable: true, value: 4 });
      Object.defineProperty(this, "responseText", { configurable: true, value: jsonStr });
      Object.defineProperty(this, "response", { configurable: true, value: jsonStr });

      setTimeout(() => {
        if (typeof this.onreadystatechange === "function") this.onreadystatechange();
        if (typeof this.onload === "function") this.onload();
        this.dispatchEvent(new Event("readystatechange"));
        this.dispatchEvent(new Event("load"));
        this.dispatchEvent(new Event("loadend"));
      }, 5);
      return;
    }
    return origXhrSend.apply(this, arguments);
  };

  // --- 7. Multi-Chart Layouts Unlock Hook ---
  (function unlockMultiChart() {
    try {
      const origParse = JSON.parse;
      JSON.parse = function () {
        const plans = origParse.apply(this, arguments);
        if (plans && plans.free && plans.free.MULTIPLE_CHARTS) {
          let maxLimit = 8;
          for (const k in plans) {
            if (plans[k] && plans[k].MULTIPLE_CHARTS && plans[k].MULTIPLE_CHARTS.limit > maxLimit) {
              maxLimit = plans[k].MULTIPLE_CHARTS.limit;
            }
          }
          for (const k in plans) {
            if (plans[k] && plans[k].MULTIPLE_CHARTS) {
              plans[k].MULTIPLE_CHARTS.limit = maxLimit;
            }
          }
        }
        return plans;
      };
    } catch (_) {}
  })();

  // --- 8. Connect with Charting Library / IWatchListApi if present ---
  function syncWithTvWidget() {
    try {
      if (window.tvWidget && typeof window.tvWidget.watchList === "function") {
        window.tvWidget.watchList().then(wlApi => {
          if (!wlApi) return;
          localLists.forEach(wl => {
            try {
              if (typeof wlApi.createList === "function") {
                wlApi.createList(wl.name, wl.symbols || [], String(wl.id));
              }
            } catch (_) {}
          });
        }).catch(() => {});
      }
    } catch (_) {}
  }
  setTimeout(syncWithTvWidget, 1500);
  setTimeout(syncWithTvWidget, 4000);
})();

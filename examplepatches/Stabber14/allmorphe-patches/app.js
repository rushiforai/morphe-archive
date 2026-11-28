const state = { bundles: [], selected: new Set(), filtered: [] };

const $ = (id) => document.getElementById(id);

async function load() {
  const res = await fetch('bundles.json');
  const data = await res.json();
  state.bundles = data.bundles || [];
  state.filtered = [...state.bundles];
  $('stats').textContent = `${state.bundles.length} bundles · ${data.totalBundles || state.bundles.length} total`;
  render();
}

function matches(b, q) {
  if (!q) return true;
  const hay = [b.name, b.author, b.repo, ...(b.targetApps || [])].join(' ').toLowerCase();
  return hay.includes(q.toLowerCase());
}

function sortFn(mode) {
  return (a, b) => {
    if (mode === 'stars') return (b.stars || 0) - (a.stars || 0);
    if (mode === 'patches') return (b.patchCount || 0) - (a.patchCount || 0);
    return (a.name || '').localeCompare(b.name || '');
  };
}

function applyFilters() {
  const q = $('search').value.trim();
  const mode = $('sort').value;
  state.filtered = state.bundles.filter(b => matches(b, q)).sort(sortFn(mode));
  render();
}

function render() {
  const list = $('list');
  list.innerHTML = '';
  $('empty').hidden = state.filtered.length !== 0;
  for (const b of state.filtered) {
    const card = document.createElement('div');
    card.className = 'card' + (state.selected.has(b.repo) ? ' sel' : '');
    const apps = (b.targetApps || []).slice(0, 6).join(', ') + ((b.targetApps || []).length > 6 ? ` +${(b.targetApps||[]).length-6}` : '');
    card.innerHTML = `
      <div class="row">
        <h3>${escape(b.name || b.repo)}</h3>
        <input type="checkbox" ${state.selected.has(b.repo) ? 'checked' : ''} data-repo="${escapeAttr(b.repo)}" />
      </div>
      <div class="meta">${escape(b.author || '')} · ${b.patchCount || 0} patches · ★ ${b.stars || 0}</div>
      <div class="apps">${escape(apps)}</div>
      <div class="row">
        <a href="${escapeAttr(b.deepLink || '#')}" target="_blank" rel="noopener">Add source</a>
        <span class="badge">${escape((b.source || 'github'))}</span>
      </div>`;
    card.querySelector('input').addEventListener('change', (e) => {
      if (e.target.checked) state.selected.add(b.repo); else state.selected.delete(b.repo);
      updateBulk();
      card.classList.toggle('sel', state.selected.has(b.repo));
    });
    list.appendChild(card);
  }
  updateBulk();
}

function updateBulk() {
  $('selCount').textContent = `${state.selected.size} selected`;
  const disabled = state.selected.size === 0;
  ['copySources','downloadSettings','openDeepLinks','copyCli'].forEach(id => { $(id).disabled = disabled; });
}

function selectedBundles() {
  const set = state.selected;
  return state.bundles.filter(b => set.has(b.repo));
}

function escape(s){ return String(s).replace(/[&<>"']/g, c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c])); }
function escapeAttr(s){ return escape(s); }

function buildSourcesText() {
  return selectedBundles().map(b => b.url || `github.com/${b.repo}`).join('\n');
}

function buildSettingsExport() {
  const now = Date.now();
  return {
    settings: {
      customBundles: selectedBundles().map((b, i) => {
        const repo = b.repo;
        const source = b.source === 'gitlab'
          ? `https://gitlab.com/${repo}/-/raw/main/patches-bundle.json`
          : `https://raw.githubusercontent.com/${repo}/main/patches-bundle.json`;
        return {
          name: b.name || repo,
          source,
          autoUpdate: true,
          enabled: true,
          sortOrder: i + 1,
          createdAt: now,
          updatedAt: now,
        };
      }),
    },
  };
}

function buildCli() {
  const flags = selectedBundles().map(b => `-p="${b.url || 'github.com/'+b.repo}"`).join(' ');
  return `morphe patch ${flags} -o="patched.apk" app.apk`;
}

$('search').addEventListener('input', applyFilters);
$('sort').addEventListener('change', applyFilters);
$('selectAll').addEventListener('click', () => {
  state.filtered.forEach(b => state.selected.add(b.repo));
  render();
});
$('clearSel').addEventListener('click', () => { state.selected.clear(); render(); });

$('copySources').addEventListener('click', async () => {
  await navigator.clipboard.writeText(buildSourcesText());
  alert('Copied ' + state.selected.size + ' source URLs.');
});
$('downloadSettings').addEventListener('click', () => {
  const blob = new Blob([JSON.stringify(buildSettingsExport(), null, 2)], { type: 'application/json' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url; a.download = 'allmorphe_settings.json';
  document.body.appendChild(a); a.click(); a.remove();
  URL.revokeObjectURL(url);
});
$('openDeepLinks').addEventListener('click', () => {
  const bundles = selectedBundles();
  if (bundles.length > 20 && !confirm(`Open ${bundles.length} deep links? Your browser may block popups.`)) return;
  bundles.forEach((b, i) => {
    setTimeout(() => { if (b.deepLink) window.open(b.deepLink, '_blank'); }, i * 300);
  });
});
$('copyCli').addEventListener('click', async () => {
  await navigator.clipboard.writeText(buildCli());
  alert('Copied CLI command.');
});

if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => navigator.serviceWorker.register('sw.js').catch(()=>{}));
}

load().catch(err => { console.error(err); $('stats').textContent = 'Failed to load bundles.json'; });

// All data fetched from repo — zero hardcoded bundle names
export const RAW = 'https://raw.githubusercontent.com/Jman-Github/ReVanced-Patch-Bundles/bundles/patch-bundles';

export let allData = [];
export let bundleNames = [];
export let bundleMeta = {}; // name -> {repo, version}

// Discover bundles from bundle-sources.json (the repo's own index)
export async function discoverBundles() {
  const r = await fetch(`${RAW}/bundle-sources.json`);
  const src = await r.json();
  const seen = new Set();
  for (const key of Object.keys(src)) {
    const name = key.replace(/-(stable|dev|latest)$/, '');
    if (!seen.has(name)) {
      seen.add(name);
      const entry = src[key];
      const repo = entry.patches.replace('https://api.github.com/repos/', '');
      bundleMeta[name] = { repo };
    }
  }
  bundleNames = [...seen].sort();
  return bundleNames;
}

// Fetch one bundle — both stable + dev channels, deduplicate patches
async function fetchBundle(name) {
  const dir = `${name}-patch-bundles`;
  const stableListUrl = `${RAW}/${dir}/${name}-stable-patches-list.json`;
  const devListUrl = `${RAW}/${dir}/${name}-dev-patches-list.json`;
  const stableBundleUrl = `${RAW}/${dir}/${name}-stable-patches-bundle.json`;
  const devBundleUrl = `${RAW}/${dir}/${name}-dev-patches-bundle.json`;
  try {
    const [slr, dlr, sbr, dbr] = await Promise.all([
      fetch(stableListUrl), fetch(devListUrl),
      fetch(stableBundleUrl), fetch(devBundleUrl)
    ]);
    const stableList = slr.ok ? await slr.json() : null;
    const devList = dlr.ok ? await dlr.json() : null;
    const stableBundle = sbr.ok ? await sbr.json() : {};
    const devBundle = dbr.ok ? await dbr.json() : {};

    // Use dev bundle for metadata if available, else stable
    const bundle = devBundle.download_url || devBundle.patches ? devBundle : stableBundle;
    const primaryList = stableList || devList;
    if (!primaryList) return [];

    if (bundleMeta[name]) {
      bundleMeta[name].stableVersion = stableList?.version || null;
      bundleMeta[name].devVersion = devList?.version || null;
      bundleMeta[name].version = stableList?.version || devList?.version;
      const dl = bundle.download_url || bundle.patches?.url || null;
      bundleMeta[name].downloadUrl = dl;
      bundleMeta[name].signatureUrl = bundle.signature_download_url || null;
      bundleMeta[name].createdAt = bundle.created_at || null;
      bundleMeta[name].changelog = bundle.description || null;
      if (dl?.endsWith('.mpp')) bundleMeta[name].type = 'Morphe';
      else if (dl?.endsWith('.rvp')) bundleMeta[name].type = 'ReVanced';
      else if (dl?.endsWith('.jar')) bundleMeta[name].type = 'Legacy';
      else bundleMeta[name].type = null;
    }

    // Merge patches from both channels, deduplicate by name+pkg
    const seen = new Set();
    const allPatches = [];
    for (const [list, channel] of [[devList, 'dev'], [stableList, 'stable']]) {
      if (!list) continue;
      for (const p of list.patches || []) {
        const pkgs = p.compatiblePackages || {};
        for (const [pkg, vers] of Object.entries(pkgs)) {
          const key = `${p.name}|${pkg}`;
          if (seen.has(key)) continue;
          seen.add(key);
          allPatches.push({
            bundle: name,
            bVer: list.version,
            channel,
            name: p.name,
            desc: p.description || '',
            use: p.use !== false,
            options: p.options || [],
            deps: (p.dependencies || []).filter(d => !['BytecodePatch','ResourcePatch'].includes(d)),
            pkg,
            vers: Array.isArray(vers) ? vers.map(String) : null,
          });
        }
      }
    }
    return allPatches;
  } catch { return []; }
}

// Load all bundles with progress + render callback per batch
export async function loadAll(onProgress, onBatch) {
  const total = bundleNames.length;
  let loaded = 0;
  const BATCH = 8;
  for (let i = 0; i < total; i += BATCH) {
    const batch = bundleNames.slice(i, i + BATCH);
    const res = await Promise.allSettled(batch.map(fetchBundle));
    for (const r of res) if (r.status === 'fulfilled') allData.push(...r.value);
    loaded = Math.min(i + BATCH, total);
    onProgress?.(loaded / total);
    onBatch?.();
  }
}

// Filter data based on search/bundle/app
export function filter(query, bundle, app, types) {
  const q = query.toLowerCase().trim();
  let f = allData;
  if (types && types.length) {
    const typeSet = new Set(types);
    f = f.filter(d => {
      const t = bundleMeta[d.bundle]?.type;
      return t ? typeSet.has(t) : typeSet.has('Legacy');
    });
  }
  if (q) f = f.filter(d =>
    d.name.toLowerCase().includes(q) ||
    d.pkg.toLowerCase().includes(q) ||
    d.desc.toLowerCase().includes(q) ||
    d.bundle.toLowerCase().includes(q) ||
    friendlyName(d.pkg).toLowerCase().includes(q)
  );
  if (bundle) f = f.filter(d => d.bundle === bundle);
  if (app) f = f.filter(d => d.pkg === app);
  return f;
}

import knownApps from './known-apps.json';

// Derive friendly name — known map first, then smart parse
export function friendlyName(pkg) {
  if (knownApps[pkg]) return knownApps[pkg];
  const parts = pkg.split('.');
  const skip = new Set(['com','org','net','android','app','apps','player','client','mobile','thirdpartyclient']);
  const meaningful = parts.filter(p => !skip.has(p) && p.length > 1);
  const name = meaningful.length ? meaningful[meaningful.length - 1] : parts[parts.length - 1];
  return name.replace(/[-_]/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
}

const fs = require('fs');
const path = require('path');

// Common Device Frame Components
function getDeviceFrame(content, options = {}) {
  const width = 452;
  const height = 932;
  const screenX = 20;
  const screenY = 20;
  const screenW = 412;
  const screenH = 892;

  return `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${width} ${height}" width="${width}" height="${height}">
  <defs>
    <clipPath id="screen-clip">
      <rect x="${screenX}" y="${screenY}" width="${screenW}" height="${screenH}" rx="36" />
    </clipPath>
    <linearGradient id="body-grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#2c2d30" />
      <stop offset="50%" stop-color="#18191b" />
      <stop offset="100%" stop-color="#0d0e10" />
    </linearGradient>
    <linearGradient id="screen-bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#121318" />
      <stop offset="50%" stop-color="#1a1c24" />
      <stop offset="100%" stop-color="#0b0c10" />
    </linearGradient>
    <filter id="phone-shadow" x="-8%" y="-8%" width="120%" height="120%">
      <feDropShadow dx="0" dy="18" stdDeviation="24" flood-color="#000000" flood-opacity="0.45" />
    </filter>
  </defs>

  <!-- Outer Phone Body -->
  <rect x="6" y="6" width="440" height="920" rx="46" fill="url(#body-grad)" stroke="#3a3d45" stroke-width="2" filter="url(#phone-shadow)" />
  <rect x="18" y="18" width="416" height="896" rx="38" fill="#000000" stroke="#25272c" stroke-width="1.5" />

  <!-- Screen Content -->
  <g clip-path="url(#screen-clip)">
    ${content}

    <!-- Status Bar (Overlay) -->
    <g id="status-bar" transform="translate(${screenX}, ${screenY})">
      <rect width="${screenW}" height="42" fill="transparent" />
      <!-- Time -->
      <text x="24" y="27" fill="#ffffff" font-family="-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, sans-serif" font-size="14" font-weight="600" letter-spacing="-0.2">09:41</text>
      <!-- Punch Hole Camera -->
      <circle cx="206" cy="20" r="7.5" fill="#050505" stroke="#1f2228" stroke-width="1.2" />
      <circle cx="204.5" cy="18.5" r="2.2" fill="#0d1b2a" opacity="0.8" />
      <!-- Icons Right -->
      <g transform="translate(340, 15)">
        <!-- 5G / Signal -->
        <rect x="0" y="8" width="2.5" height="4" rx="0.6" fill="#ffffff" />
        <rect x="4" y="6" width="2.5" height="6" rx="0.6" fill="#ffffff" />
        <rect x="8" y="3.5" width="2.5" height="8.5" rx="0.6" fill="#ffffff" />
        <rect x="12" y="0" width="2.5" height="12" rx="0.6" fill="#ffffff" />
        <!-- Battery -->
        <g transform="translate(22, 0)">
          <rect x="0" y="0.5" width="20" height="11" rx="3" fill="none" stroke="#ffffff" stroke-width="1.2" />
          <rect x="2" y="2.5" width="13" height="7" rx="1.5" fill="#22c55e" />
          <path d="M21 3.5 V8.5" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round" />
        </g>
      </g>
    </g>

    <!-- Navigation Bar Pill -->
    <rect x="${screenX + screenW / 2 - 67}" y="${screenY + screenH - 14}" width="134" height="4.5" rx="2.5" fill="#ffffff" opacity="0.6" />
  </g>
</svg>`;
}

// 1. Home Screen
function buildHomeScreen() {
  const inner = `
    <!-- Wallpaper -->
    <rect x="20" y="20" width="412" height="892" fill="url(#screen-bg)" />
    <!-- Gradient Blobs -->
    <circle cx="80" cy="180" r="140" fill="#2563eb" opacity="0.18" filter="blur(40px)" />
    <circle cx="340" cy="420" r="160" fill="#7c3aed" opacity="0.15" filter="blur(45px)" />
    <circle cx="200" cy="740" r="180" fill="#f97316" opacity="0.12" filter="blur(50px)" />

    <!-- Clock & Date Widget -->
    <g transform="translate(48, 110)">
      <text x="0" y="48" fill="#ffffff" font-family="-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif" font-size="54" font-weight="300" letter-spacing="-1">09:41</text>
      <text x="4" y="78" fill="#94a3b8" font-family="-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif" font-size="15" font-weight="500">Wednesday, Oct 24 • 21°C Sunny</text>
      <g transform="translate(4, 96)">
        <rect width="186" height="26" rx="13" fill="#ffffff" fill-opacity="0.08" stroke="#ffffff" stroke-opacity="0.12" />
        <circle cx="14" cy="13" r="4" fill="#22c55e" />
        <text x="25" y="17" fill="#e2e8f0" font-family="-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif" font-size="11" font-weight="600" letter-spacing="0.4">OPENNOVA 1.0.0 ACTIVE</text>
      </g>
    </g>

    <!-- Desktop App Grid (4 x 4) -->
    <g transform="translate(48, 280)">
      <!-- Row 1 -->
      ${renderIcon(0, 0, '#ef4444', 'Gallery', 'M4 4h16v16H4z M9 9m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0 M21 15l-5-5L5 21')}
      ${renderIcon(90, 0, '#3b82f6', 'Browser', 'M12 2a10 10 0 1 0 0 20a10 10 0 1 0 0-20 M2 12h20 M12 2a15 15 0 0 1 0 20 M12 2a15 15 0 0 0 0 20')}
      ${renderIcon(180, 0, '#10b981', 'Messages', 'M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z')}
      ${renderIcon(270, 0, '#8b5cf6', 'Camera', 'M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z M12 17a4 4 0 1 0 0-8 4 4 0 0 0 0 8z')}

      <!-- Row 2 -->
      ${renderIcon(0, 96, '#f59e0b', 'Files', 'M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z')}
      ${renderIcon(90, 96, '#06b6d4', 'Weather', 'M17.5 19H9a7 7 0 1 1 6.71-9h1.79a4.5 4.5 0 1 1 0 9Z')}
      ${renderIcon(180, 96, '#ec4899', 'Music', 'M9 18V5l12-2v13 M6 18a3 3 0 1 0 6 0a3 3 0 1 0-6 0 M18 16a3 3 0 1 0 6 0a3 3 0 1 0-6 0')}
      ${renderIcon(270, 96, '#64748b', 'Settings', 'M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1Z')}

      <!-- Row 3 -->
      ${renderIcon(0, 192, '#14b8a6', 'Terminal', 'M4 17l6-6-6-6 M12 19h8')}
      ${renderIcon(90, 192, '#a855f7', 'Notes', 'M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z M14 2v6h6 M16 13H8 M16 17H8 M10 9H8')}
      ${renderIcon(180, 192, '#f43f5e', 'Health', 'M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z')}
      ${renderIcon(270, 192, '#38bdf8', 'Maps', 'M1 6v16l7-4 8 4 7-4V2l-7 4-8-4z M8 2v16 M16 6v16')}
    </g>

    <!-- Search Bar (Nova Search Bar) -->
    <g transform="translate(44, 716)">
      <rect width="364" height="52" rx="26" fill="#1e222b" stroke="#333842" stroke-width="1.2" />
      <g transform="translate(18, 16)">
        <!-- Google 'G' / Nova Search Logo -->
        <circle cx="10" cy="10" r="10" fill="#f97316" />
        <text x="6" y="14" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="12" font-weight="900">O</text>
        <text x="32" y="15" fill="#94a3b8" font-family="-apple-system, sans-serif" font-size="14">Search apps, web...</text>
      </g>
      <!-- Mic & Lens -->
      <g transform="translate(296, 16)">
        <circle cx="12" cy="10" r="14" fill="#ffffff" fill-opacity="0.05" />
        <path d="M12 4v8 M9 8a3 3 0 0 0 6 0 M12 14v2 M9 16h6" stroke="#cbd5e1" stroke-width="1.4" fill="none" stroke-linecap="round" />
        <circle cx="44" cy="10" r="14" fill="#ffffff" fill-opacity="0.05" />
        <rect x="38" y="5" width="12" height="10" rx="2" stroke="#cbd5e1" stroke-width="1.4" fill="none" />
      </g>
    </g>

    <!-- Dock Area -->
    <g transform="translate(48, 792)">
      <rect x="-14" y="-10" width="372" height="84" rx="28" fill="#15171e" fill-opacity="0.75" stroke="#ffffff" stroke-opacity="0.08" stroke-width="1" />
      ${renderIcon(0, 0, '#22c55e', 'Phone', 'M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z')}
      ${renderIcon(90, 0, '#0284c7', 'Telegram', 'M22 2L11 13 M22 2l-7 20-4-9-9-4 20-7z')}
      ${renderIcon(180, 0, '#f97316', 'Nova', 'M12 2L2 7l10 5 10-5-10-5z M2 17l10 5 10-5 M2 12l10 5 10-5')}
      ${renderIcon(270, 0, '#e11d48', 'YouTube', 'M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z M9.75 15.02l5.75-3.27-5.75-3.27v6.54z')}
    </g>
  `;
  return getDeviceFrame(inner);
}

// 2. App Drawer Screen
function buildAppDrawerScreen() {
  const inner = `
    <!-- Background overlay blur -->
    <rect x="20" y="20" width="412" height="892" fill="#0f1115" />
    <circle cx="200" cy="180" r="180" fill="#3b82f6" opacity="0.1" filter="blur(60px)" />

    <!-- Drawer Search Bar -->
    <g transform="translate(44, 76)">
      <rect width="364" height="48" rx="24" fill="#1b1e26" stroke="#2d3340" stroke-width="1.2" />
      <g transform="translate(18, 14)">
        <circle cx="8" cy="8" r="6" stroke="#94a3b8" stroke-width="1.5" fill="none" />
        <path d="M13 13l4 4" stroke="#94a3b8" stroke-width="1.5" stroke-linecap="round" />
        <text x="28" y="14" fill="#64748b" font-family="-apple-system, sans-serif" font-size="14">Search 48 apps...</text>
      </g>
      <!-- Overflow 3-dots -->
      <g transform="translate(330, 15)">
        <circle cx="0" cy="4" r="1.8" fill="#94a3b8" />
        <circle cx="0" cy="10" r="1.8" fill="#94a3b8" />
        <circle cx="0" cy="16" r="1.8" fill="#94a3b8" />
      </g>
    </g>

    <!-- Drawer Tabs -->
    <g transform="translate(44, 140)">
      <text x="12" y="16" fill="#f97316" font-family="-apple-system, sans-serif" font-size="13" font-weight="700">APPS</text>
      <rect x="8" y="24" width="36" height="3" rx="1.5" fill="#f97316" />

      <text x="80" y="16" fill="#64748b" font-family="-apple-system, sans-serif" font-size="13" font-weight="500">WORK</text>
      <text x="156" y="16" fill="#64748b" font-family="-apple-system, sans-serif" font-size="13" font-weight="500">GAMES</text>
      <text x="238" y="16" fill="#64748b" font-family="-apple-system, sans-serif" font-size="13" font-weight="500">SYSTEM</text>
      <line x1="0" y1="26" x2="364" y2="26" stroke="#1f242e" stroke-width="1" />
    </g>

    <!-- Section A -->
    <g transform="translate(48, 192)">
      <text x="4" y="14" fill="#f97316" font-family="-apple-system, sans-serif" font-size="13" font-weight="700">A</text>
      <line x1="22" y1="10" x2="340" y2="10" stroke="#1f242e" stroke-width="1" />
      <g transform="translate(0, 26)">
        ${renderIcon(0, 0, '#ef4444', 'Alarm', 'M12 22a9 9 0 1 0 0-18a9 9 0 0 0 0 18zm0-14v5l3 3 M5 3L2 6 M19 3l3 3')}
        ${renderIcon(90, 0, '#3b82f6', 'Android Dev', 'M4 17l6-6-6-6 M12 19h8')}
        ${renderIcon(180, 0, '#10b981', 'Authenticator', 'M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z')}
        ${renderIcon(270, 0, '#8b5cf6', 'Audiobook', 'M4 19.5A2.5 2.5 0 0 1 6.5 17H20 M4 19.5A2.5 2.5 0 0 0 6.5 22H20V2H6.5A2.5 2.5 0 0 0 4 4.5z')}
      </g>
    </g>

    <!-- Section B -->
    <g transform="translate(48, 334)">
      <text x="4" y="14" fill="#f97316" font-family="-apple-system, sans-serif" font-size="13" font-weight="700">B</text>
      <line x1="22" y1="10" x2="340" y2="10" stroke="#1f242e" stroke-width="1" />
      <g transform="translate(0, 26)">
        ${renderIcon(0, 0, '#06b6d4', 'Browser', 'M12 2a10 10 0 1 0 0 20a10 10 0 1 0 0-20 M2 12h20')}
        ${renderIcon(90, 0, '#f59e0b', 'Backup', 'M19 11H5m14 0a2 2 0 0 1 2 2v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-6a2 2 0 0 1 2-2m14 0V9a2 2 0 0 0-2-2M5 11V9a2 2 0 0 1 2-2m0 0V5a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2M7 7h10')}
        ${renderIcon(180, 0, '#ec4899', 'Battery Info', 'M6 7h11a2 2 0 0 1 2 2v6a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2z M21 10v4')}
        ${renderIcon(270, 0, '#6366f1', 'Books', 'M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z')}
      </g>
    </g>

    <!-- Section C -->
    <g transform="translate(48, 476)">
      <text x="4" y="14" fill="#f97316" font-family="-apple-system, sans-serif" font-size="13" font-weight="700">C</text>
      <line x1="22" y1="10" x2="340" y2="10" stroke="#1f242e" stroke-width="1" />
      <g transform="translate(0, 26)">
        ${renderIcon(0, 0, '#14b8a6', 'Calculator', 'M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z M9 7H7 M17 7h-2 M17 11h-2 M17 15h-2 M9 15H7 M9 11H7')}
        ${renderIcon(90, 0, '#a855f7', 'Calendar', 'M19 4H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z M16 2v4 M8 2v4 M3 10h18')}
        ${renderIcon(180, 0, '#f43f5e', 'Camera', 'M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z M12 17a4 4 0 1 0 0-8 4 4 0 0 0 0 8z')}
        ${renderIcon(270, 0, '#38bdf8', 'Contacts', 'M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2 M12 11a4 4 0 1 0 0-8 4 4 0 0 0 0 8z')}
      </g>
    </g>

    <!-- Fast Scroll Index Bar Right -->
    <g transform="translate(412, 180)">
      ${['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'].map((letter, i) => {
        const isCurrent = letter === 'A';
        return `<text x="0" y="${i * 22}" fill="${isCurrent ? '#f97316' : '#475569'}" font-family="-apple-system, monospace" font-size="10" font-weight="${isCurrent ? '800' : '500'}" text-anchor="middle">${letter}</text>`;
      }).join('\n')}
    </g>
  `;
  return getDeviceFrame(inner);
}

// 3. Settings Screen (OpenNova Settings - Privacy & Unlocked Prime)
function buildSettingsScreen() {
  const inner = `
    <!-- Settings Background -->
    <rect x="20" y="20" width="412" height="892" fill="#0d0f12" />

    <!-- App Bar -->
    <g transform="translate(44, 72)">
      <path d="M19 12H5 M12 19l-7-7 7-7" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
      <text x="36" y="16" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="18" font-weight="600">OpenNova Settings</text>
      <circle cx="330" cy="11" r="14" fill="#ffffff" fill-opacity="0.06" />
      <circle cx="330" cy="11" r="5" stroke="#ffffff" stroke-width="1.5" fill="none" />
    </g>

    <!-- OpenNova v1.0.0 Banner -->
    <g transform="translate(44, 120)">
      <rect width="364" height="84" rx="16" fill="#181c24" stroke="#252b38" stroke-width="1" />
      <circle cx="44" cy="42" r="24" fill="#f97316" fill-opacity="0.15" />
      <!-- Logo icon -->
      <path d="M44 26L34 32l10 6 10-6-10-6z M34 42l10 6 10-6 M34 37l10 6 10-6" stroke="#f97316" stroke-width="1.8" fill="none" stroke-linejoin="round" />
      <text x="82" y="36" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="16" font-weight="700">OpenNovaLauncher</text>
      <text x="82" y="56" fill="#94a3b8" font-family="-apple-system, sans-serif" font-size="12">v1.0.0 • Community Edition</text>
      <rect x="264" y="30" width="76" height="24" rx="12" fill="#22c55e" fill-opacity="0.16" stroke="#22c55e" stroke-width="1" />
      <text x="302" y="46" fill="#22c55e" font-family="-apple-system, sans-serif" font-size="11" font-weight="700" text-anchor="middle">PRIME ★</text>
    </g>

    <!-- Section 1: Privacy & Telemetry Status -->
    <g transform="translate(44, 226)">
      <text x="4" y="0" fill="#f97316" font-family="-apple-system, sans-serif" font-size="12" font-weight="700" letter-spacing="0.8">PRIVACY &amp; TELEMETRY</text>
      <g transform="translate(0, 10)">
        <rect width="364" height="136" rx="16" fill="#14171e" stroke="#1f242e" stroke-width="1" />

        <!-- Row 1: Branch Metrics SDK -->
        <g transform="translate(16, 20)">
          <text x="0" y="14" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="14" font-weight="500">Branch Metrics Tracking</text>
          <text x="0" y="30" fill="#64748b" font-family="-apple-system, sans-serif" font-size="11">De-compiled and removed from binary</text>
          <rect x="278" y="4" width="56" height="22" rx="11" fill="#ef4444" fill-opacity="0.15" />
          <text x="306" y="19" fill="#ef4444" font-family="-apple-system, monospace" font-size="10" font-weight="700" text-anchor="middle">STRIPPED</text>
        </g>
        <line x1="16" y1="68" x2="348" y2="68" stroke="#1f242e" stroke-width="1" />

        <!-- Row 2: Amplitude Analytics -->
        <g transform="translate(16, 84)">
          <text x="0" y="14" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="14" font-weight="500">Amplitude Telemetry</text>
          <text x="0" y="30" fill="#64748b" font-family="-apple-system, sans-serif" font-size="11">Analytics payload routes zeroed out</text>
          <rect x="278" y="4" width="56" height="22" rx="11" fill="#ef4444" fill-opacity="0.15" />
          <text x="306" y="19" fill="#ef4444" font-family="-apple-system, monospace" font-size="10" font-weight="700" text-anchor="middle">STRIPPED</text>
        </g>
      </g>
    </g>

    <!-- Section 2: Customization & Core -->
    <g transform="translate(44, 396)">
      <text x="4" y="0" fill="#f97316" font-family="-apple-system, sans-serif" font-size="12" font-weight="700" letter-spacing="0.8">CUSTOMIZATION &amp; DESKTOP</text>
      <g transform="translate(0, 10)">
        <rect width="364" height="264" rx="16" fill="#14171e" stroke="#1f242e" stroke-width="1" />

        <!-- Desktop Grid -->
        <g transform="translate(16, 18)">
          <circle cx="16" cy="16" r="16" fill="#3b82f6" fill-opacity="0.15" />
          <rect x="9" y="9" width="14" height="14" rx="2" stroke="#3b82f6" stroke-width="1.5" fill="none" />
          <text x="44" y="15" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="14" font-weight="500">Desktop Grid</text>
          <text x="44" y="31" fill="#94a3b8" font-family="-apple-system, sans-serif" font-size="12">6 x 5 rows • Subgrid enabled</text>
        </g>
        <line x1="16" y1="64" x2="348" y2="64" stroke="#1f242e" stroke-width="1" />

        <!-- Icon Layout -->
        <g transform="translate(16, 82)">
          <circle cx="16" cy="16" r="16" fill="#10b981" fill-opacity="0.15" />
          <circle cx="16" cy="16" r="6" stroke="#10b981" stroke-width="1.5" fill="none" />
          <text x="44" y="15" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="14" font-weight="500">Icon Appearance</text>
          <text x="44" y="31" fill="#94a3b8" font-family="-apple-system, sans-serif" font-size="12">Material You adaptive • 115% size</text>
        </g>
        <line x1="16" y1="128" x2="348" y2="128" stroke="#1f242e" stroke-width="1" />

        <!-- App Drawer Style -->
        <g transform="translate(16, 146)">
          <circle cx="16" cy="16" r="16" fill="#8b5cf6" fill-opacity="0.15" />
          <path d="M10 10h12v12H10z" stroke="#8b5cf6" stroke-width="1.5" fill="none" />
          <text x="44" y="15" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="14" font-weight="500">App Drawer</text>
          <text x="44" y="31" fill="#94a3b8" font-family="-apple-system, sans-serif" font-size="12">Vertical continuous with fast-scroll</text>
        </g>
        <line x1="16" y1="192" x2="348" y2="192" stroke="#1f242e" stroke-width="1" />

        <!-- Gestures & Inputs -->
        <g transform="translate(16, 210)">
          <circle cx="16" cy="16" r="16" fill="#f59e0b" fill-opacity="0.15" />
          <path d="M12 8v8 M8 12l4-4 4 4" stroke="#f59e0b" stroke-width="1.5" fill="none" stroke-linecap="round" />
          <text x="44" y="15" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="14" font-weight="500">Gestures &amp; Inputs</text>
          <text x="44" y="31" fill="#94a3b8" font-family="-apple-system, sans-serif" font-size="12">Swipe up drawer • Double tap lock</text>
        </g>
      </g>
    </g>

    <!-- Section 3: Paywall Status -->
    <g transform="translate(44, 702)">
      <rect width="364" height="60" rx="14" fill="#14171e" stroke="#22c55e" stroke-opacity="0.4" stroke-width="1" />
      <circle cx="34" cy="30" r="12" fill="#22c55e" fill-opacity="0.2" />
      <path d="M28 30l4 4 8-8" stroke="#22c55e" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" />
      <text x="58" y="27" fill="#ffffff" font-family="-apple-system, sans-serif" font-size="13" font-weight="600">Paywall Permanently Eliminated</text>
      <text x="58" y="44" fill="#94a3b8" font-family="-apple-system, sans-serif" font-size="11">Zero subscriptions • 100% Free &amp; Open Source</text>
    </g>
  `;
  return getDeviceFrame(inner);
}

function renderIcon(x, y, color, label, iconPath) {
  return `
    <g transform="translate(${x}, ${y})">
      <rect width="56" height="56" rx="16" fill="${color}" />
      <svg x="14" y="14" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="${iconPath}" />
      </svg>
      <text x="28" y="74" fill="#e2e8f0" font-family="-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif" font-size="11" font-weight="500" text-anchor="middle">${label}</text>
    </g>
  `;
}

function main() {
  const outDir = path.resolve(__dirname);
  const homeSvg = buildHomeScreen();
  const drawerSvg = buildAppDrawerScreen();
  const settingsSvg = buildSettingsScreen();

  fs.writeFileSync(path.join(outDir, '01-home-screen.svg'), homeSvg, 'utf8');
  fs.writeFileSync(path.join(outDir, '02-app-drawer.svg'), drawerSvg, 'utf8');
  fs.writeFileSync(path.join(outDir, '03-privacy-settings.svg'), settingsSvg, 'utf8');

  console.log('Generated 3 SVG mockups in:', outDir);
}

main();

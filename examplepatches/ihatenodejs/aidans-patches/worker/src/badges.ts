import type { PatchCompatibilityStatus } from './types';

function escapeXml(unsafe: string): string {
  return unsafe
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

export function getStatusColor(status: PatchCompatibilityStatus | 'mixed'): string {
  switch (status) {
    case 'compatible':
      return '#34D399'; // green
    case 'queued':
    case 'running':
    case 'not-tested':
      return '#FBBF24'; // amber
    case 'incompatible':
    case 'error':
    default:
      return '#EF4444'; // red
  }
}

export function renderBadgeSvg(label: string, status: string, color: string): string {
  const safeLabel = escapeXml(label);
  const safeStatus = escapeXml(status);

  // Approximate character widths for Verdana 11px
  const labelWidth = Math.max(30, Math.round(safeLabel.length * 6.5 + 14));
  const statusWidth = Math.max(30, Math.round(safeStatus.length * 6.5 + 14));
  const totalWidth = labelWidth + statusWidth;

  const labelX = Math.round(labelWidth / 2);
  const statusX = Math.round(labelWidth + statusWidth / 2);

  return `<svg xmlns="http://www.w3.org/2000/svg" width="${totalWidth}" height="20" role="img" aria-label="${safeLabel}: ${safeStatus}">
  <title>${safeLabel}: ${safeStatus}</title>
  <linearGradient id="s" x2="0" y2="100%">
    <stop offset="0" stop-color="#bbb" stop-opacity=".1"/>
    <stop offset="1" stop-opacity=".1"/>
  </linearGradient>
  <clipPath id="r">
    <rect width="${totalWidth}" height="20" rx="3" fill="#fff"/>
  </clipPath>
  <g clip-path="url(#r)">
    <rect width="${labelWidth}" height="20" fill="#555"/>
    <rect x="${labelWidth}" width="${statusWidth}" height="20" fill="${color}"/>
    <rect width="${totalWidth}" height="20" fill="url(#s)"/>
  </g>
  <g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" text-rendering="geometricPrecision" font-size="110">
    <text aria-hidden="true" x="${labelX * 10}" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)">${safeLabel}</text>
    <text x="${labelX * 10}" y="140" transform="scale(.1)" fill="#fff">${safeLabel}</text>
    <text aria-hidden="true" x="${statusX * 10}" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)">${safeStatus}</text>
    <text x="${statusX * 10}" y="140" transform="scale(.1)" fill="#fff">${safeStatus}</text>
  </g>
</svg>`;
}

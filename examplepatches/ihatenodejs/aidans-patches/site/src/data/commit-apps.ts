import type { App } from './types';

export const SCOPE_TO_APP_ID: Record<string, string> = {
  // AfterShip
  aftership: 'aftership',

  // Blackjack
  blackjack: 'blackjack',
  tripledot: 'blackjack',

  // SidelineSwap
  sidelineswap: 'sidelineswap',
  sideline: 'sidelineswap',

  // Sezzle
  sezzle: 'sezzle',
  sezzlemobile: 'sezzle',

  // Fizz
  fizz: 'fizz',
  buzz: 'fizz',

  // Adobe Scan
  'adobe-scan': 'adobe-scan',
  adobescan: 'adobe-scan',
  adobe: 'adobe-scan',
  scan: 'adobe-scan',

  // Canvas Student
  canvas: 'canvas-student',
  'canvas-student': 'canvas-student',
  candroid: 'canvas-student',

  // Navigate360 Student
  navigate360: 'navigate360-student',
  'navigate360-student': 'navigate360-student',
  navigate: 'navigate360-student',
  eab: 'navigate360-student',
};

export function resolveAppForScope(
  scope: string | null,
  apps: App[]
): App | null {
  if (!scope) return null;
  const normalized = scope.toLowerCase().trim().replace(/[^\w-]/g, '');

  const matchedId = SCOPE_TO_APP_ID[normalized];
  if (matchedId) {
    const found = apps.find((a) => a.id === matchedId);
    if (found) return found;
  }

  const direct = apps.find(
    (a) => a.id === normalized || a.name.toLowerCase() === normalized
  );
  if (direct) return direct;

  return null;
}

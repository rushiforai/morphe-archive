// Local cached application icons (avoids Google rate limiting and removes external network dependency)
export const APP_ICONS: Record<string, string> = {
  'com.adobe.scan.android': '/icons/com.adobe.scan.android.png',
  'com.aftership.AfterShip': '/icons/com.aftership.AfterShip.png',
  'com.ashtoncofer.Buzz': '/icons/com.ashtoncofer.Buzz.png',
  'com.eab.se': '/icons/com.eab.se.png',
  'com.instructure.candroid': '/icons/com.instructure.candroid.png',
  'com.sezzle.sezzlemobile': '/icons/com.sezzle.sezzlemobile.png',
  'com.sidelineswap.android': '/icons/com.sidelineswap.android.png',
  'com.tripledot.blackjack': '/icons/com.tripledot.blackjack.png',
};

export function getAppIconUrl(packageName: string): string | null {
  return APP_ICONS[packageName] || null;
}

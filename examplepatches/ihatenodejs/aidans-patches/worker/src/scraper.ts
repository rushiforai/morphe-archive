export interface ScrapedAppInfo {
  playVersion: string | null;
  iconUrl: string | null;
  updatedAt: string | null;
  updatedOn: string | null;
  isNotFound: boolean;
  rawError?: string;
}

const USER_AGENT =
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36';

// Multi-tier regex patterns for Google Play web store HTML
const PRIMARY_VERSION_PATTERN =
  /\[\[\["([0-9]+\.[0-9]+(?:\.[0-9]+)*[^"]*)"\]\],\[\[\[\d+\]\],\[\[\[\d+/;

const SECONDARY_VERSION_PATTERN =
  /\[\[\["([0-9]+\.[0-9]+(?:\.[0-9]+)*[^"]*)"\]\]/;

const OG_IMAGE_PATTERN =
  /<meta\s+property="og:image"\s+content="([^"]+)"/i;

const HTML_UPDATE_DATE_PATTERN =
  /Updated on<\/div>\s*<div[^>]*>([^<]+)<\/div>/i;

const JSON_UPDATE_DATE_PATTERN =
  /\[\["([A-Za-z]{3}\s+\d{1,2},\s+\d{4})",\[(\d+),/;

export async function fetchGooglePlayApp(
  packageName: string
): Promise<ScrapedAppInfo> {
  const url = `https://play.google.com/store/apps/details?id=${encodeURIComponent(
    packageName
  )}&hl=en&gl=US`;

  try {
    const response = await fetch(url, {
      headers: {
        'User-Agent': USER_AGENT,
        Accept:
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.9',
      },
    });

    if (response.status === 404) {
      return {
        playVersion: null,
        iconUrl: null,
        updatedAt: null,
        updatedOn: null,
        isNotFound: true,
      };
    }

    if (!response.ok) {
      return {
        playVersion: null,
        iconUrl: null,
        updatedAt: null,
        updatedOn: null,
        isNotFound: false,
        rawError: `HTTP ${response.status}`,
      };
    }

    const html = await response.text();

    // 1. Extract icon
    let iconUrl: string | null = null;
    const ogMatch = html.match(OG_IMAGE_PATTERN);
    if (ogMatch && ogMatch[1]) {
      iconUrl = ogMatch[1].replace(/&amp;/g, '&');
    }

    // 2. Extract update date
    let updatedOn: string | null = null;
    let updatedAt: string | null = null;

    const jsonDateMatch = html.match(JSON_UPDATE_DATE_PATTERN);
    if (jsonDateMatch) {
      updatedOn = jsonDateMatch[1].trim();
      const tsSeconds = parseInt(jsonDateMatch[2], 10);
      if (!isNaN(tsSeconds) && tsSeconds > 0) {
        updatedAt = new Date(tsSeconds * 1000).toISOString();
      }
    }

    if (!updatedOn) {
      const htmlDateMatch = html.match(HTML_UPDATE_DATE_PATTERN);
      if (htmlDateMatch && htmlDateMatch[1]) {
        updatedOn = htmlDateMatch[1].trim();
        const parsed = Date.parse(updatedOn);
        if (!isNaN(parsed)) {
          updatedAt = new Date(parsed).toISOString();
        }
      }
    }

    // 3. Extract version using primary pattern
    const primaryMatch = html.match(PRIMARY_VERSION_PATTERN);
    if (primaryMatch && primaryMatch[1]) {
      return {
        playVersion: primaryMatch[1].trim(),
        iconUrl,
        updatedAt,
        updatedOn,
        isNotFound: false,
      };
    }

    // 4. Fallback pattern
    const secondaryMatch = html.match(SECONDARY_VERSION_PATTERN);
    if (secondaryMatch && secondaryMatch[1]) {
      return {
        playVersion: secondaryMatch[1].trim(),
        iconUrl,
        updatedAt,
        updatedOn,
        isNotFound: false,
      };
    }

    // Version might be "Varies with device" on web store
    return {
      playVersion: null,
      iconUrl,
      updatedAt,
      updatedOn,
      isNotFound: false,
    };
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : String(err);
    return {
      playVersion: null,
      iconUrl: null,
      updatedAt: null,
      updatedOn: null,
      isNotFound: false,
      rawError: message,
    };
  }
}

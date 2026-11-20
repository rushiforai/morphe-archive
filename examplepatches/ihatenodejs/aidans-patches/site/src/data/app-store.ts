import type { App } from './types';
import type {
  PlayMediaAsset,
  PlayReview,
  PublicStatusPayload,
} from './status-client';
export type StoreCategoryId =
  | 'all'
  | 'productivity'
  | 'shopping'
  | 'social'
  | 'education'
  | 'health-and-fitness'
  | 'sports'
  | 'games'
  | 'travel-and-local'
  | 'entertainment'
  | 'other';

export interface StoreCategory {
  id: StoreCategoryId;
  name: string;
  description: string;
  shortDescription: string;
  gradientPair: [string, string]; // [primary, secondary] CSS color classes or hexes
  icon: string; // Identifier for the SVG icon
}

export const STORE_CATEGORIES: Record<StoreCategoryId, StoreCategory> = {
  all: {
    id: 'all',
    name: 'All apps',
    description:
      'Browse the complete library of apps and the patches available for each one.',
    shortDescription: 'Explore every supported app and its available patches.',
    gradientPair: ['#3b82f6', '#60a5fa'], // blue / bright blue
    icon: 'grid',
  },
  productivity: {
    id: 'productivity',
    name: 'Productivity',
    description:
      'Work smarter with faster tools and cleaner everyday workflows.',
    shortDescription: 'Tools that help you get more done with less friction.',
    gradientPair: ['#06b6d4', '#8b5cf6'], // cyan / violet
    icon: 'briefcase',
  },
  shopping: {
    id: 'shopping',
    name: 'Shopping',
    description:
      'Make checkout, delivery tracking, and marketplace shopping work better.',
    shortDescription:
      'Smarter checkout, delivery tracking, and marketplace tools.',
    gradientPair: ['#d946ef', '#f59e0b'], // fuchsia / amber
    icon: 'shopping-bag',
  },
  social: {
    id: 'social',
    name: 'Social',
    description:
      'Connect with communities and keep the conversations that matter to you moving.',
    shortDescription:
      'Better ways to connect with the communities you care about.',
    gradientPair: ['#8b5cf6', '#3b82f6'], // violet / blue
    icon: 'users',
  },
  education: {
    id: 'education',
    name: 'Education',
    description:
      'Stay on top of classes, campus life, and the deadlines in between.',
    shortDescription: 'Support for classes, campus life, and busy deadlines.',
    gradientPair: ['#3b82f6', '#10b981'], // blue / emerald
    icon: 'book',
  },
  'health-and-fitness': {
    id: 'health-and-fitness',
    name: 'Health & Fitness',
    description:
      'Get more from outdoor exploration, real-world activity, and daily routines.',
    shortDescription:
      'Tools for outdoor exploration, activity, and daily routines.',
    gradientPair: ['#10b981', '#06b6d4'], // emerald / cyan
    icon: 'heart-pulse',
  },
  sports: {
    id: 'sports',
    name: 'Sports',
    description:
      'Follow live scores, real-time stats, and every game-day moment.',
    shortDescription: 'Live scores, real-time stats, and game-day updates.',
    gradientPair: ['#f97316', '#ef4444'], // orange / red
    icon: 'trophy',
  },
  games: {
    id: 'games',
    name: 'Games',
    description:
      'Enjoy classic table games, card action, and more ways to play.',
    shortDescription: 'Classic games, card action, and more ways to play.',
    gradientPair: ['#8b5cf6', '#ec4899'], // violet / pink
    icon: 'gamepad',
  },
  'travel-and-local': {
    id: 'travel-and-local',
    name: 'Travel & Local',
    description:
      'Find your way around town and discover the places worth visiting.',
    shortDescription: 'Navigate your city and discover places worth visiting.',
    gradientPair: ['#06b6d4', '#3b82f6'], // cyan / blue
    icon: 'map-pin',
  },
  entertainment: {
    id: 'entertainment',
    name: 'Entertainment',
    description:
      'Tune in to streaming, video, audio, and the media you enjoy most.',
    shortDescription: 'Streaming, video, audio, and the media you enjoy most.',
    gradientPair: ['#f43f5e', '#a855f7'], // rose / purple
    icon: 'play',
  },
  other: {
    id: 'other',
    name: 'Other',
    description:
      'Useful mobile utilities for the practical things you do every day.',
    shortDescription:
      'Useful mobile tools for the practical things you do every day.',
    gradientPair: ['#71717a', '#8b5cf6'], // zinc / violet
    icon: 'shapes',
  },
};

/**
 * Fallback category mappings for every app in our repository.
 * Guaranteed baseline even before Worker or Google Play status loads.
 */
export const APP_FALLBACK_CATEGORIES: Record<string, StoreCategoryId> = {
  'adobe-reader': 'productivity',
  'adobe-scan': 'productivity',
  aftership: 'shopping',
  '365-pay': 'shopping',
  'credit-karma': 'other',
  sezzle: 'shopping',
  sidelineswap: 'shopping',
  fizz: 'social',
  'canvas-student': 'education',
  'navigate360-student': 'education',
  'pro-metronome': 'entertainment',
  geocaching: 'health-and-fitness',
  nhl: 'sports',
  blackjack: 'games',
};

/**
 * Fallback app descriptions for rich cards before live Play metadata hydrates.
 */
export const APP_FALLBACK_SUMMARIES: Record<string, string> = {
  'adobe-reader':
    'View, annotate, and sign PDF documents with clean navigation and zero tracking or promotional upsells.',
  'adobe-scan':
    'Scan paperwork into clean PDFs, remove limits, and unlock high-speed document tools.',
  aftership:
    'Real-time package and shipment tracking across 1,000+ couriers with seamless notifications.',
  '365-pay':
    'Touchless marketplace checkout and cafeteria payment app for unattended micro-markets.',
  'credit-karma':
    'Track credit scores, monitor financial accounts, and explore loans with telemetry disabled.',
  sezzle:
    'Buy now, pay later marketplace financing split across interest-free installment schedules.',
  sidelineswap:
    'The premier peer-to-peer sports equipment marketplace for athletes to buy and sell gear.',
  fizz: 'Private campus communities for college students with verified feeds and candid conversations.',
  'canvas-student':
    'Access courses, submit assignments, collaborate, and stay on top of school deadlines.',
  'navigate360-student':
    'Connect with advisors, track degree progress, schedule appointments, and coordinate classes.',
  'pro-metronome':
    'Precision tempo and rhythm training metronome with pure offline timing and zero tracking.',
  geocaching:
    'Join the worlds largest real-world treasure hunting community with GPS coordinate logs.',
  nhl: 'Official scores, breaking hockey news, live shift tracking, Edge stats, and game highlights.',
  blackjack:
    'Timeless Las Vegas table cards with fair odds, offline play, and classic casino betting rules.',
};

export interface DiscoverySectionConfig {
  id: string;
  title: string;
  description: string;
  appIds: string[];
}

export const DISCOVERY_SECTIONS: DiscoverySectionConfig[] = [
  {
    id: 'editors-picks',
    title: "Editor's picks",
    description:
      'Hand-picked favorites delivering our most requested enhancements.',
    appIds: ['adobe-scan', 'geocaching', 'sezzle', 'fizz', 'adobe-reader'],
  },
  {
    id: 'everyday-essentials',
    title: 'Everyday essentials',
    description:
      'Daily companions built to make routines simpler, faster, and cleaner.',
    appIds: [
      'aftership',
      '365-pay',
      'canvas-student',
      'navigate360-student',
      'credit-karma',
    ],
  },
  {
    id: 'play-follow-connect',
    title: 'Play, follow & connect',
    description:
      'Stay in the loop, catch every highlight, and unwind with your favorites.',
    appIds: ['blackjack', 'nhl', 'sidelineswap', 'fizz', 'pro-metronome'],
  },
];

export interface ResolvedDiscoverySection {
  id: string;
  title: string;
  description: string;
  apps: App[];
}

/**
 * Normalizes Play Store category IDs into our curated store taxonomy.
 */
export function normalizePlayCategoryId(
  categoryId: string | null | undefined,
  fallbackId: StoreCategoryId = 'other',
): StoreCategoryId {
  if (!categoryId || typeof categoryId !== 'string') return fallbackId;
  const upper = categoryId.trim().toUpperCase();

  if (upper === 'BUSINESS' || upper === 'PRODUCTIVITY') return 'productivity';
  if (upper === 'SHOPPING' || upper === 'FINANCE') return 'shopping';
  if (upper === 'SOCIAL' || upper === 'COMMUNICATION') return 'social';
  if (upper === 'EDUCATION' || upper === 'BOOKS_AND_REFERENCE')
    return 'education';
  if (upper === 'HEALTH_AND_FITNESS') return 'health-and-fitness';
  if (upper === 'SPORTS') return 'sports';
  if (
    upper.startsWith('GAME_') ||
    upper === 'GAME' ||
    upper === 'ARCADE' ||
    upper === 'CASINO'
  ) {
    return 'games';
  }
  if (
    upper === 'MAPS_AND_NAVIGATION' ||
    upper === 'TRAVEL_AND_LOCAL' ||
    upper === 'AUTO_AND_VEHICLES'
  ) {
    return 'travel-and-local';
  }
  if (
    upper === 'ENTERTAINMENT' ||
    upper === 'MUSIC_AND_AUDIO' ||
    upper === 'VIDEO_PLAYERS' ||
    upper === 'COMICS'
  ) {
    return 'entertainment';
  }

  return fallbackId;
}

export function getFallbackCategory(appId: string): StoreCategory {
  const catId = APP_FALLBACK_CATEGORIES[appId] || 'other';
  return STORE_CATEGORIES[catId];
}

export function getFallbackSummary(appId: string): string {
  return (
    APP_FALLBACK_SUMMARIES[appId] ||
    'Curated enhancements and privacy fixes for Android.'
  );
}

export interface ResolvedStoreMetadata {
  category: StoreCategory;
  categoryLabel: string;
  summary: string;
  description: string | null;
  developer: string | null;
  releaseNotes: string | null;
  installs: string | null;
  score: number | null;
  ratingsCount: number | null;
  reviewsCount: number | null;
  contentRating: string | null;
  contentRatingIcon: PlayMediaAsset | null;
  releasedOn: string | null;
  minAndroid: string | null;
  inAppPurchases: string | null;
  permissionGroups: string[];
  screenshots: PlayMediaAsset[];
  featuredReviews: PlayReview[];
}
/**
 * Resolves Play Store metadata for an app from the public worker payload,
 * falling back safely field-by-field to static definitions.
 */
export function resolveStoreMetadata(
  payload: PublicStatusPayload | null | undefined,
  app: App,
): ResolvedStoreMetadata {
  const fallbackCat = getFallbackCategory(app.id);
  const fallbackSumm = getFallbackSummary(app.id);

  if (!payload || !payload.apps) {
    return {
      category: fallbackCat,
      categoryLabel: fallbackCat.name,
      summary: fallbackSumm,
      description: null,
      developer: null,
      releaseNotes: null,
      installs: null,
      score: null,
      ratingsCount: null,
      reviewsCount: null,
      contentRating: null,
      contentRatingIcon: null,
      releasedOn: null,
      minAndroid: null,
      inAppPurchases: null,
      permissionGroups: [],
      screenshots: [],
      featuredReviews: [],
    };
  }

  const appStatus = payload.apps[app.packageName];
  const meta = appStatus?.playMetadata;

  if (!meta) {
    return {
      category: fallbackCat,
      categoryLabel: fallbackCat.name,
      summary: fallbackSumm,
      description: null,
      developer: null,
      releaseNotes: null,
      installs: null,
      score: null,
      ratingsCount: null,
      reviewsCount: null,
      contentRating: null,
      contentRatingIcon: null,
      releasedOn: null,
      minAndroid: null,
      inAppPurchases: null,
      permissionGroups: [],
      screenshots: [],
      featuredReviews: [],
    };
  }

  // Validate bounds & trim
  const cleanSummary =
    typeof meta.summary === 'string' &&
    meta.summary.trim().length > 0 &&
    meta.summary.length <= 500
      ? meta.summary.trim()
      : fallbackSumm;

  const cleanDesc =
    typeof meta.description === 'string' &&
    meta.description.trim().length > 0 &&
    meta.description.length <= 6000
      ? meta.description.trim()
      : null;

  const cleanDev =
    typeof meta.developer === 'string' &&
    meta.developer.trim().length > 0 &&
    meta.developer.length <= 200
      ? meta.developer.trim()
      : null;

  const cleanNotes =
    typeof meta.releaseNotes === 'string' &&
    meta.releaseNotes.trim().length > 0 &&
    meta.releaseNotes.length <= 2000
      ? meta.releaseNotes.trim()
      : null;

  const normalizedCatId = normalizePlayCategoryId(
    meta.categoryId,
    fallbackCat.id,
  );
  const storeCategory = STORE_CATEGORIES[normalizedCatId];
  const categoryLabel =
    typeof meta.category === 'string' &&
    meta.category.trim().length > 0 &&
    meta.category.length <= 100
      ? meta.category.trim()
      : storeCategory.name;

  const installs =
    typeof meta.installs === 'string' && meta.installs.trim().length > 0
      ? meta.installs.trim().slice(0, 50)
      : null;

  const score =
    typeof meta.score === 'number' && meta.score >= 0 && meta.score <= 5
      ? meta.score
      : null;

  const ratingsCount =
    typeof meta.ratingsCount === 'number' && meta.ratingsCount >= 0
      ? meta.ratingsCount
      : null;

  const reviewsCount =
    typeof meta.reviewsCount === 'number' && meta.reviewsCount >= 0
      ? meta.reviewsCount
      : null;

  const contentRating =
    typeof meta.contentRating === 'string' &&
    meta.contentRating.trim().length > 0
      ? meta.contentRating.trim().slice(0, 100)
      : null;

  const contentRatingIcon =
    meta.contentRatingIcon && meta.contentRatingIcon.sourceUrl
      ? meta.contentRatingIcon
      : null;

  const releasedOn =
    typeof meta.releasedOn === 'string' && meta.releasedOn.trim().length > 0
      ? meta.releasedOn.trim().slice(0, 100)
      : null;

  const minAndroid =
    typeof meta.minAndroid === 'string' && meta.minAndroid.trim().length > 0
      ? meta.minAndroid.trim().slice(0, 100)
      : null;

  const inAppPurchases =
    typeof meta.inAppPurchases === 'string' &&
    meta.inAppPurchases.trim().length > 0
      ? meta.inAppPurchases.trim().slice(0, 100)
      : null;

  const permissionGroups = Array.isArray(meta.permissionGroups)
    ? meta.permissionGroups
        .filter(
          (p): p is string => typeof p === 'string' && p.trim().length > 0,
        )
        .slice(0, 30)
    : [];

  const screenshots = Array.isArray(meta.screenshots)
    ? meta.screenshots
        .filter((s): s is PlayMediaAsset =>
          Boolean(s && typeof s.sourceUrl === 'string'),
        )
        .slice(0, 12)
    : [];

  const featuredReviews = Array.isArray(meta.featuredReviews)
    ? meta.featuredReviews
        .filter((r): r is PlayReview =>
          Boolean(
            r &&
            typeof r.author === 'string' &&
            typeof r.text === 'string' &&
            typeof r.rating === 'number',
          ),
        )
        .slice(0, 3)
    : [];

  return {
    category: storeCategory,
    categoryLabel,
    summary: cleanSummary,
    description: cleanDesc,
    developer: cleanDev,
    releaseNotes: cleanNotes,
    installs,
    score,
    ratingsCount,
    reviewsCount,
    contentRating,
    contentRatingIcon,
    releasedOn,
    minAndroid,
    inAppPurchases,
    permissionGroups,
    screenshots,
    featuredReviews,
  };
}

/**
 * Assembles the three curated discovery sections using the current loaded apps.
 * Enforces editorial invariants (valid app IDs, non-empty apps).
 */
export function buildDiscoverySections(
  apps: App[],
): ResolvedDiscoverySection[] {
  const appsById = new Map<string, App>(apps.map((a) => [a.id, a]));

  return DISCOVERY_SECTIONS.map((section) => {
    const resolvedApps: App[] = [];
    const seenInRail = new Set<string>();

    for (const id of section.appIds) {
      if (seenInRail.has(id)) {
        throw new Error(
          `Duplicate app '${id}' in discovery section '${section.id}'`,
        );
      }
      seenInRail.add(id);

      const app = appsById.get(id);
      if (!app) {
        throw new Error(
          `App '${id}' declared in section '${section.id}' not found in apps list`,
        );
      }
      resolvedApps.push(app);
    }

    return {
      id: section.id,
      title: section.title,
      description: section.description,
      apps: resolvedApps,
    };
  });
}

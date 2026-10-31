// Adapted 2026-10-21 by BDCrusher from Better Lyrics 272d7c16c9e8 (GPL-3.0).
// Original decoding is retained; browser cache/waiter integration is supplied by this host.
import { LRCParser, lrcFixers, parseLRC, parseQRC, PlainParser, QRCParser, parseTTMLContent, TTMLParser } from '@braccato/parsers';
type LyricSourceKey = string;
type LyricSourceResult = any;
type ProviderParameters = any;
type UnisonData = any;
const HOMEPAGE_DOMAIN = 'betterlyrics.org';
const HOMEPAGE_URL = 'https://betterlyrics.org';
const logCore = (..._args: any[]) => {};
const resolveWaiter = (..._args: any[]) => {};
interface FillTtmlOptions {
  richsyncKey: LyricSourceKey;
  syncedKey: LyricSourceKey;
  source: string;
  sourceHref: string;
  cacheAllowed?: boolean;
  unisonData?: UnisonData;
}

export function fillTtml(
  responseString: string,
  providerParameters: ProviderParameters,
  options: FillTtmlOptions = {
    richsyncKey: "bLyrics-richsynced",
    syncedKey: "bLyrics-synced",
    source: HOMEPAGE_DOMAIN,
    sourceHref: HOMEPAGE_URL,
    cacheAllowed: true,
    unisonData: undefined,
  }
) {
  const { richsyncKey, syncedKey, source, sourceHref, cacheAllowed, unisonData } = options;

  const { lyrics, isWordSynced, language } = parseTTMLContent(responseString, {
    songDurationMs: providerParameters.duration * 1000,
  });

  if (lyrics.length === 0) {
    logCore(`No timed lines parsed from ${source} TTML (${responseString.length} chars)`);
    providerParameters.sourceMap[richsyncKey].lyricSourceResult = null;
    providerParameters.sourceMap[richsyncKey].filled = true;
    providerParameters.sourceMap[syncedKey].lyricSourceResult = null;
    providerParameters.sourceMap[syncedKey].filled = true;
    return;
  }

  const result: LyricSourceResult = {
    cacheAllowed: cacheAllowed ?? true,
    language,
    lyrics,
    musicVideoSynced: false,
    source,
    sourceHref,
    songwriters: TTMLParser.metadata(responseString).songwriters,
    unisonData,
  };

  if (isWordSynced) {
    providerParameters.sourceMap[richsyncKey].lyricSourceResult = result;
    providerParameters.sourceMap[syncedKey].lyricSourceResult = null;
  } else {
    providerParameters.sourceMap[richsyncKey].lyricSourceResult = null;
    providerParameters.sourceMap[syncedKey].lyricSourceResult = result;
  }

  providerParameters.sourceMap[syncedKey].filled = true;
  providerParameters.sourceMap[richsyncKey].filled = true;
}

export async function processStreamData(event: string, data: any, params: ProviderParameters) {
  const { sourceMap } = params;
  const durationMs = params.duration * 1000;

  if (event === "metadata") {
    if (data.album && !params.album) params.album = data.album;
    if (data.song && params.song !== data.song) params.song = data.song;
    if (data.artist && params.artist !== data.artist) params.artist = data.artist;
    if (data.duration && params.duration !== Number(data.duration)) params.duration = Number(data.duration);

    sourceMap["metadata"].lyricSourceResult = {
      lyrics: null,
      source: "Metadata",
      sourceHref: "",
      album: data.album,
      artist: data.artist,
      song: data.song,
      duration: Number(data.duration),
      cacheAllowed: true,
    };
    sourceMap["metadata" as LyricSourceKey].filled = true;
    resolveWaiter(params, "metadata");
    return;
  }

  if (event === "provider") {
    const provider = data.provider;
    const results = data.results;

    if (!results) return;

    // Musixmatch
    if (provider === "musixmatch") {
      if (results.wordByWord) {
        const lyrics = parseLRC(results.wordByWord, durationMs);
        lrcFixers(lyrics);
        sourceMap["musixmatch-richsync"].lyricSourceResult = {
          lyrics,
          songwriters: LRCParser.metadata(results.wordByWord).songwriters,
          source: "Musixmatch",
          sourceHref: "https://www.musixmatch.com",
          musicVideoSynced: false,
          album: params.album || "",
          artist: params.artist,
          song: params.song,
          duration: params.duration,
          cacheAllowed: true,
        };
        sourceMap["musixmatch-richsync"].filled = true;
        resolveWaiter(params, "musixmatch-richsync");
      }

      if (results.synced) {
        const lyrics = parseLRC(results.synced, durationMs);
        sourceMap["musixmatch-synced"].lyricSourceResult = {
          lyrics,
          songwriters: LRCParser.metadata(results.synced).songwriters,
          source: "Musixmatch",
          sourceHref: "https://www.musixmatch.com",
          musicVideoSynced: false,
        };
        sourceMap["musixmatch-synced"].filled = true;
        resolveWaiter(params, "musixmatch-synced");
      }
    }

    // LRCLib
    if (provider === "lrclib") {
      if (results.synced) {
        const lyrics = parseLRC(results.synced, durationMs);
        sourceMap["lrclib-synced"].lyricSourceResult = {
          lyrics,
          songwriters: LRCParser.metadata(results.synced).songwriters,
          source: "LRCLib",
          sourceHref: "https://lrclib.net",
          musicVideoSynced: false,
        };
        sourceMap["lrclib-synced"].filled = true;
        resolveWaiter(params, "lrclib-synced");
      }

      if (results.plain) {
        const lyrics = PlainParser.parse(results.plain);
        sourceMap["lrclib-plain"].lyricSourceResult = {
          lyrics,
          source: "LRCLib",
          sourceHref: "https://lrclib.net",
          musicVideoSynced: false,
          cacheAllowed: false,
        };
        sourceMap["lrclib-plain"].filled = true;
        resolveWaiter(params, "lrclib-plain");
      }
    }

    // Legato (KuGou)
    if (provider === "kugou") {
      if (results.lyrics) {
        let decodedLyrics = JSON.parse(results.lyrics);
        const lyrics = parseLRC(decodedLyrics.lyrics, durationMs);
        sourceMap["legato-synced"].lyricSourceResult = {
          lyrics,
          songwriters: LRCParser.metadata(decodedLyrics.lyrics).songwriters,
          source: "Better Lyrics Legato",
          sourceHref: HOMEPAGE_URL,
          musicVideoSynced: false,
        };
        sourceMap["legato-synced"].filled = true;
        resolveWaiter(params, "legato-synced");
      }
    }

    // Portato (QQ)
    if (provider === "qq") {
      if (results.lyrics) {
        let decodedLyrics = JSON.parse(results.lyrics);
        const lyrics = parseQRC(decodedLyrics.lyrics, durationMs, {
          title: params.song,
          artist: params.artist,
        });
        if (lyrics.length > 0) {
          sourceMap["portato-richsynced"].lyricSourceResult = {
            lyrics,
            songwriters: QRCParser.metadata(decodedLyrics.lyrics).songwriters,
            source: "Better Lyrics Portato",
            sourceHref: HOMEPAGE_URL,
            musicVideoSynced: false,
            cacheAllowed: true,
          };
        }
        sourceMap["portato-richsynced"].filled = true;
        resolveWaiter(params, "portato-richsynced");
      }
    }

    // BetterLyrics (TTML)
    if (provider === "golyrics") {
      if (results.lyrics) {
        let ttml = results.lyrics;
        try {
          // Check if it's double-encoded JSON
          const parsed = JSON.parse(ttml);
          if (parsed.ttml) ttml = parsed.ttml;
        } catch (_e) {
          // Not double-encoded, use as is
        }
        fillTtml(ttml, params);
        // fillTtml marks filled and updates sourceMap directly
        resolveWaiter(params, "bLyrics-synced");
        resolveWaiter(params, "bLyrics-richsynced");
      }
    }

    // Binimum (TTML via BiniLyrics)
    if (provider === "binimum") {
      if (results.lyrics) {
        fillTtml(results.lyrics, params, {
          richsyncKey: "binimum-richsynced",
          syncedKey: "binimum-synced",
          source: "BiniLyrics",
          sourceHref: "https://lyrics-api.binimum.org/",
        });

        const timingType: "syllable" | "line" | null = results.timingType ?? null;
        if (timingType === "syllable") {
          if (!sourceMap["binimum-richsynced"].lyricSourceResult) {
            sourceMap["binimum-richsynced"].lyricSourceResult = sourceMap["binimum-synced"].lyricSourceResult;
            sourceMap["binimum-synced"].lyricSourceResult = null;
          }
        } else if (timingType === "line") {
          if (!sourceMap["binimum-synced"].lyricSourceResult) {
            sourceMap["binimum-synced"].lyricSourceResult = sourceMap["binimum-richsynced"].lyricSourceResult;
          }
          sourceMap["binimum-richsynced"].lyricSourceResult = null;
        }

        resolveWaiter(params, "binimum-richsynced");
        resolveWaiter(params, "binimum-synced");
      }
    }
  }
}

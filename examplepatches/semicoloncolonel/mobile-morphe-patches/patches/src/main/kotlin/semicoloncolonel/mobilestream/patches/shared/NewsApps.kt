package semicoloncolonel.mobilestream.patches.shared

import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants as AbcNews
import semicoloncolonel.mobilestream.patches.aljazeera.shared.Constants as AlJazeera
import semicoloncolonel.mobilestream.patches.apnews.shared.Constants as ApNews
import semicoloncolonel.mobilestream.patches.bbcnews.shared.Constants as BbcNews
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants as CbsNews
import semicoloncolonel.mobilestream.patches.cgtn.shared.Constants as Cgtn
import semicoloncolonel.mobilestream.patches.cna.shared.Constants as Cna
import semicoloncolonel.mobilestream.patches.cnbc.shared.Constants as Cnbc
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants as Cnn
import semicoloncolonel.mobilestream.patches.cspan.shared.Constants as Cspan
import semicoloncolonel.mobilestream.patches.dailywire.shared.Constants as DailyWire
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants as FoxLocal
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants as FoxNews
import semicoloncolonel.mobilestream.patches.msnow.shared.Constants as MsNow
import semicoloncolonel.mobilestream.patches.nbcnews.shared.Constants as NbcNews
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants as NewsBreak
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants as NewsNation
import semicoloncolonel.mobilestream.patches.nhkworld.shared.Constants as NhkWorld
import semicoloncolonel.mobilestream.patches.nikkeiasia.shared.Constants as NikkeiAsia
import semicoloncolonel.mobilestream.patches.npr.shared.Constants as Npr
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants as NyTimes
import semicoloncolonel.mobilestream.patches.reuters.shared.Constants as Reuters
import semicoloncolonel.mobilestream.patches.scmp.shared.Constants as Scmp
import semicoloncolonel.mobilestream.patches.substack.shared.Constants as Substack
import semicoloncolonel.mobilestream.patches.usatoday.shared.Constants as UsaToday
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants as WashingtonPost
import semicoloncolonel.mobilestream.patches.thescore.shared.Constants as TheScore
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants as Wsj
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants as YahooFinance
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants as YahooNews
import semicoloncolonel.mobilestream.patches.yonhap.shared.Constants as Yonhap

// The news apps that every shared news patch applies to, matching the News
// category in docs/apps.md. Spread into a compatibleWith() list:
// compatibleWith(*NEWS_APPS). Add a new news app here so the shared news
// patches (currently "Route traffic through a proxy") cover it in one place.
internal val NEWS_APPS = arrayOf(
    AbcNews.COMPATIBILITY,
    AlJazeera.COMPATIBILITY,
    ApNews.COMPATIBILITY,
    BbcNews.COMPATIBILITY,
    CbsNews.COMPATIBILITY,
    Cgtn.COMPATIBILITY,
    Cna.COMPATIBILITY,
    Cnbc.COMPATIBILITY,
    Cnn.COMPATIBILITY,
    Cspan.COMPATIBILITY,
    FoxLocal.COMPATIBILITY,
    FoxNews.COMPATIBILITY,
    MsNow.COMPATIBILITY,
    NbcNews.COMPATIBILITY,
    NewsBreak.COMPATIBILITY,
    NewsNation.COMPATIBILITY,
    NhkWorld.COMPATIBILITY,
    NikkeiAsia.COMPATIBILITY,
    Npr.COMPATIBILITY,
    Reuters.COMPATIBILITY,
    Scmp.COMPATIBILITY,
    Substack.COMPATIBILITY,
    DailyWire.COMPATIBILITY,
    NyTimes.COMPATIBILITY,
    TheScore.COMPATIBILITY,
    Wsj.COMPATIBILITY,
    WashingtonPost.COMPATIBILITY,
    UsaToday.COMPATIBILITY,
    YahooFinance.COMPATIBILITY,
    YahooNews.COMPATIBILITY,
    Yonhap.COMPATIBILITY,
)

package app.template.extension.extension;

import android.webkit.WebView;

/**
 * SortByRatingsHelper — client-side "sort by number of ratings" for
 * Amazon and Flipkart search/listing pages.
 *
 * <p>Neither Amazon nor Flipkart exposes a server-side sort by ratings
 * <em>count</em> (Amazon's {@code s=review-rank} sorts by average rating,
 * Flipkart's {@code sort=popularity} is opaque). So this helper only
 * re-orders the product cards already loaded in the DOM, descending by
 * parsed ratings count. Items with no parseable count sort last, original
 * order is preserved for ties and for restore.
 *
 * <p>Limitations, by design:
 * <ul>
 *   <li>Only sorts what is loaded. Infinite scroll / pagination means you
 *       must scroll to load more first, then re-tap sort.</li>
 *   <li>Sponsored / ad cards are skipped, never re-ordered.</li>
 *   <li>Pure DOM reorder, zero network. Breaks if either site changes its
 *       markup — selectors below will need updating.</li>
 * </ul>
 */
public final class SortByRatingsHelper {

    private SortByRatingsHelper() {}

    // Mirror of the ad-card signals used by AmazonHelper so sponsored
    // cards stay where the site put them.
    private static final String[] SPONSORED_HINTS = {
        "AdHolder", "sponsored", "Sponsored", "puis-sponsored-label-text",
        "p13n-sc-sponsored-label", "dynamicSponsoredLabelClass",
        "sbv-ad-content-container",
    };

    private static final String SORT_RATINGS_JS =
        "function(cfg){"
        + "var BTN_ID='morphe-sort-ratings';"
        + "var CARD_SEL=cfg.site==='flipkart'"
        + "? 'div[data-id],div._1AtVbE,div._13oc-S,div._2kHMtA'"
        + ": '[data-component-type=\"s-search-result\"],.s-result-item[data-asin]';"
        + "function isSponsored(el){"
        + "var h=(el.className||'')+' '+(el.getAttribute('cel_widget_id')||'')+' '"
        + "+(el.getAttribute('data-cel-widget')||'')+' '+(el.getAttribute('data-component-type')||'');"
        + "for(var i=0;i<cfg.sponsored.length;i++){if(h.indexOf(cfg.sponsored[i])>=0)return true;}"
        + "if(el.querySelector('.puis-sponsored-label-text,.p13n-sc-sponsored-label,[data-ad-feedback]'))return true;"
        + "return false;}"
        + "function parseCount(text){"
        + "if(!text)return -1;"
        + "var t=text.trim();"
        + "if(!t||/out of/i.test(t))return -1;" // star value like '4.3 out of 5 stars'
        + "var hasWord=/rating|review/i.test(t);"
        + "var paren=/^\\(\\s*[\\d,.]+\\s*[kKmM]?\\s*\\+?\\s*\\)$/.test(t);"
        + "var bare=/^[\\d,.]+\\s*[kKmM]?\\s*\\+?$/.test(t);"
        + "if(!hasWord&&!paren&&!bare)return -1;"
        + "var m=t.match(/([\\d,.]+)\\s*([kKmM])?/);"
        + "if(!m)return -1;"
        + "var n=parseFloat(m[1].replace(/,/g,''));"
        + "if(isNaN(n))return -1;"
        + "var s=(m[2]||'').toLowerCase();"
        + "if(s==='k')n*=1000;else if(s==='m')n*=1000000;"
        + "return Math.floor(n);}"
        + "function amazonCount(card){"
        + "var cands=card.querySelectorAll('a[href*=\"customerReviews\"] span,"
        + "a[href*=\"#customerReviews\"],span.a-size-base.s-underline-text,"
        + "span.a-size-small span,span.a-size-base');"
        + "var star=card.querySelector('[aria-label*=\"out of\"],.a-icon-star');"
        + "var best=-1;"
        + "for(var i=0;i<cands.length;i++){"
        + "var t=cands[i].textContent||'';"
        + "if(t.length>30)continue;"
        + "var v=parseCount(t);"
        + "if(v<0)continue;"
        // Bare numbers only count when the card visibly has stars,
        // otherwise prices / discounts leak in.
        + "if(!/rating|review|\\(/.test(t)&&!star)continue;"
        + "if(v>best)best=v;}"
        + "return best;}"
        + "function flipkartCount(card){"
        + "var cands=card.querySelectorAll('span._2_R_DZ,span');"
        + "for(var i=0;i<cands.length;i++){"
        + "var t=(cands[i].textContent||'').trim();"
        + "if(t.length>16)continue;"
        + "if(!/^\\(\\s*[\\d,]+\\s*\\)$/.test(t))continue;"
        + "var v=parseCount(t);"
        + "if(v>=0)return v;}"
        // Product-page style fallback: '12,345 Ratings & 1,234 Reviews'.
        + "var txt=card.textContent||'';"
        + "var m=txt.match(/([\\d,]+)\\s*Ratings?\\s*&/i);"
        + "if(m)return parseCount(m[1]);"
        + "return -1;}"
        + "function cardCount(card){"
        + "return cfg.site==='flipkart'?flipkartCount(card):amazonCount(card);}"
        + "function collect(){"
        + "var seen=[];var seenSet=new Set();"
        + "var nodes=document.querySelectorAll(CARD_SEL);"
        + "for(var i=0;i<nodes.length;i++){"
        + "var el=nodes[i];"
        + "if(seenSet.has(el)||!el.parentNode||isSponsored(el))continue;"
        // Flipkart anchor fallback can nest; keep the outermost card.
        + "if(el.tagName==='A'&&el.querySelector('div[data-id]'))continue;"
        + "if(cardCount(el)<0&&!(el.textContent||'').match(/\\d/))continue;"
        + "seenSet.add(el);seen.push(el);}"
        + "return seen;}"
        + "function currentParent(cards){"
        + "if(!cards.length)return null;"
        + "var p=cards[0].parentNode;"
        + "for(var i=1;i<cards.length;i++){if(cards[i].parentNode!==p)return null;}"
        + "return p;}"
        + "function applySort(){"
        + "var cards=collect();"
        + "if(cards.length<2)return 0;"
        + "var parent=currentParent(cards);"
        + "if(!parent)return 0;"
        + "if(!parent.getAttribute('data-morphe-orig')){"
        + "var order=[];"
        + "for(var i=0;i<parent.children.length;i++)order.push(parent.children[i]);"
        + "parent.__morpheOrig=order.slice();"
        + "parent.setAttribute('data-morphe-orig','1');}"
        + "var mapped=cards.map(function(el,i){return{el:el,c:cardCount(el),i:i};});"
        + "mapped.sort(function(a,b){if(b.c!==a.c)return b.c-a.c;return a.i-b.i;});"
        + "mapped.forEach(function(m){parent.appendChild(m.el);});"
        + "return mapped.length;}"
        + "function restore(){"
        + "var cards=collect();"
        + "var parent=currentParent(cards);"
        + "if(parent&&parent.__morpheOrig){parent.__morpheOrig.forEach(function(el){parent.appendChild(el);});}}"
        + "function ensureBtn(){"
        + "var b=document.getElementById(BTN_ID);"
        + "if(b)return b;"
        + "b=document.createElement('button');b.id=BTN_ID;b.type='button';"
        + "b.textContent='Sort: Most rated';"
        + "b.setAttribute('data-active','0');"
        + "b.style.cssText='position:fixed;right:12px;bottom:76px;z-index:2147483647;"
        + "padding:10px 14px;border-radius:20px;border:1px solid #888;background:#232f3e;"
        + "color:#fff;font-size:13px;font-weight:bold;box-shadow:0 2px 8px rgba(0,0,0,.4);cursor:pointer';"
        + "b.onclick=function(){"
        + "var on=b.getAttribute('data-active')==='1';"
        + "if(on){b.setAttribute('data-active','0');b.textContent='Sort: Most rated';restore();}"
        + "else{var n=applySort();b.setAttribute('data-active','1');"
        + "b.textContent=n>1?'Sorted ✓ ('+n+') — tap to reset':'No ratings found';}};"
        + "document.documentElement.appendChild(b);"
        + "return b;}"
        + "if(!collect().length)return;"
        + "ensureBtn();"
        + "if(!window.__morpheSortObs){"
        + "window.__morpheSortObs=true;"
        + "var t=null;"
        + "new MutationObserver(function(){"
        + "var b=document.getElementById(BTN_ID);"
        + "if(!b||b.getAttribute('data-active')!=='1')return;"
        + "clearTimeout(t);t=setTimeout(applySort,600);"
        + "}).observe(document.body||document.documentElement,{childList:true,subtree:true});}"
        + "}";

    /**
     * Injects the sort UI on listing pages only. Safe to call on every
     * page load: non-listing pages return early.
     *
     * @param webView the page's WebView
     * @param url     current page URL, used for site + listing detection
     */
    public static void injectSortByRatings(WebView webView, String url) {
        if (webView == null || url == null) return;
        String u = url.trim().toLowerCase();
        String site = null;
        if (u.contains("amazon.")) site = "amazon";
        else if (u.contains("flipkart.com")) site = "flipkart";
        if (site == null) return;

        boolean listing;
        if ("amazon".equals(site)) {
            listing = u.contains("/s?")
                || u.contains("/s/")
                || u.contains("/search/")
                || u.contains("k=")
                || u.contains("rh=");
        } else {
            listing = u.contains("/search")
                || u.contains("q=")
                || u.contains("/category/")
                || u.contains("/browse/");
        }
        if (!listing) return;

        StringBuilder cfg = new StringBuilder("{");
        cfg.append("\"site\":").append(jsonString(site));
        cfg.append(",\"sponsored\":").append(jsonArray(SPONSORED_HINTS));
        cfg.append("}");
        webView.evaluateJavascript("(" + SORT_RATINGS_JS + ")(" + cfg + ");", null);
    }

    private static String jsonArray(String[] values) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < values.length; i++) {
            if (i > 0) sb.append(",");
            sb.append(jsonString(values[i]));
        }
        return sb.append("]").toString();
    }

    private static String jsonString(String value) {
        if (value == null) return "null";
        StringBuilder sb = new StringBuilder("\"");
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            switch (c) {
                case '"': sb.append("\\\""); break;
                case '\\': sb.append("\\\\"); break;
                case '\n': sb.append("\\n"); break;
                case '\r': sb.append("\\r"); break;
                case '\t': sb.append("\\t"); break;
                default:
                    if (c < 0x20 || c > 0x7e || c == '<' || c == '>' || c == '&'
                        || c == '\'' || c == 0x2028 || c == 0x2029) {
                        sb.append(String.format("\\u%04x", (int) c));
                    } else {
                        sb.append(c);
                    }
            }
        }
        return sb.append("\"").toString();
    }
}

package com.facebook.ads;

import android.text.TextUtils;
import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
@Deprecated
/* loaded from: classes2.dex */
public class ExtraHints {
    private static final String HINTS_JSON_KEY = "hints";
    private static final String KEYWORD_SEPARATOR = ";";
    private final String mHintsSerialized;
    private final String mMediationData;

    @Keep
    @Deprecated
    public static class Builder {
        private HashMap<HintType, String> mHints = new HashMap<>();
        private String mMediationData;

        public ExtraHints build() {
            return new ExtraHints(this.mHints, this.mMediationData);
        }

        public Builder contentUrl(String str) {
            if (str == null) {
                return this;
            }
            this.mHints.put(HintType.CONTENT_URL, str);
            return this;
        }

        public Builder extraData(String str) {
            if (str == null) {
                return this;
            }
            this.mHints.put(HintType.EXTRA_DATA, str);
            return this;
        }

        @Deprecated
        public Builder keywords(List<Keyword> list) {
            return this;
        }

        public Builder mediationData(String str) {
            if (TextUtils.isEmpty(str)) {
                return this;
            }
            this.mMediationData = str;
            return this;
        }
    }

    public enum HintType {
        KEYWORDS("keywords"),
        CONTENT_URL("content_url"),
        EXTRA_DATA("extra_data");


        /* renamed from: a, reason: collision with root package name */
        public final String f27497a;

        HintType(String str) {
            this.f27497a = str;
        }
    }

    @Keep
    @Deprecated
    public enum Keyword {
        ACCESSORIES,
        ART_HISTORY,
        AUTOMOTIVE,
        BEAUTY,
        BIOLOGY,
        BOARD_GAMES,
        BUSINESS_SOFTWARE,
        BUYING_SELLING_HOMES,
        CATS,
        CELEBRITIES,
        CLOTHING,
        COMIC_BOOKS,
        DESKTOP_VIDEO,
        DOGS,
        EDUCATION,
        EMAIL,
        ENTERTAINMENT,
        FAMILY_PARENTING,
        FASHION,
        FINE_ART,
        FOOD_DRINK,
        FRENCH_CUISINE,
        GOVERNMENT,
        HEALTH_FITNESS,
        HOBBIES,
        HOME_GARDEN,
        HUMOR,
        INTERNET_TECHNOLOGY,
        LARGE_ANIMALS,
        LAW,
        LEGAL_ISSUES,
        LITERATURE,
        MARKETING,
        MOVIES,
        MUSIC,
        NEWS,
        PERSONAL_FINANCE,
        PETS,
        PHOTOGRAPHY,
        POLITICS,
        REAL_ESTATE,
        ROLEPLAYING_GAMES,
        SCIENCE,
        SHOPPING,
        SOCIETY,
        SPORTS,
        TECHNOLOGY,
        TELEVISION,
        TRAVEL,
        VIDEO_COMPUTER_GAMES
    }

    private static String join(List<String> list) {
        StringBuilder sb2 = new StringBuilder();
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            sb2.append(it.next());
            sb2.append(KEYWORD_SEPARATOR);
        }
        return sb2.toString();
    }

    public String getHints() {
        return this.mHintsSerialized;
    }

    public String getMediationData() {
        return this.mMediationData;
    }

    private ExtraHints(HashMap<HintType, String> map, String str) throws JSONException {
        this.mMediationData = str;
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObject2 = new JSONObject();
        for (Map.Entry<HintType, String> entry : map.entrySet()) {
            try {
                jSONObject2.put(entry.getKey().f27497a, entry.getValue());
            } catch (JSONException unused) {
            }
        }
        try {
            jSONObject.put(HINTS_JSON_KEY, jSONObject2);
        } catch (JSONException unused2) {
        }
        this.mHintsSerialized = jSONObject.toString();
    }
}

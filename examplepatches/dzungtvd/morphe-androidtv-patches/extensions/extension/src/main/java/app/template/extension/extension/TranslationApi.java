package app.template.extension.extension;

import com.bytedance.retrofit2.b;
import com.bytedance.retrofit2.c.e;
import com.bytedance.retrofit2.c.g;
import com.bytedance.retrofit2.c.t;
import com.bytedance.retrofit2.c.z;

/** TikTok's multi-text translation endpoint, called through the app's signed Retrofit stack. */
@SuppressWarnings("unused")
public interface TranslationApi {

    @t(a = "/aweme/v1/contents/translation/")
    @g
    b<String> translate(
            @e(a = "trg_lang") String targetLanguage,
            @e(a = "translation_info") String translationInfo,
            @z(a = "scene") int scene);
}

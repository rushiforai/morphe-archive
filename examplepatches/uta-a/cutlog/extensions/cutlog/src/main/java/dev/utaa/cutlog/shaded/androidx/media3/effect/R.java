package dev.utaa.cutlog.shaded.androidx.media3.effect;

import android.content.Context;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;

/**
 * 付け替えた media3-effect が参照する R クラス。
 *
 * <p>extension は resource を持ち込めないため、シェーダーは resource パッチが
 * {@code res/raw/cutlog_media3_*} として setlog の APK に追加する。ここではその ID を実行時に引く。
 */
@SuppressWarnings({"unused", "DiscouragedApi"})
public final class R {
    private R() {}

    public static final class raw {
        public static int fragment_shader_alpha_scale_es2 = id("fragment_shader_alpha_scale_es2");
        public static int fragment_shader_copy_es2 = id("fragment_shader_copy_es2");
        public static int fragment_shader_hdr_to_ultra_hdr_es3 = id("fragment_shader_hdr_to_ultra_hdr_es3");
        public static int fragment_shader_hsl_es2 = id("fragment_shader_hsl_es2");
        public static int fragment_shader_lut_es2 = id("fragment_shader_lut_es2");
        public static int fragment_shader_oetf_es3 = id("fragment_shader_oetf_es3");
        public static int fragment_shader_separable_convolution_es2 = id("fragment_shader_separable_convolution_es2");
        public static int fragment_shader_transformation_es2 = id("fragment_shader_transformation_es2");
        public static int fragment_shader_transformation_external_yuv_es3 =
                id("fragment_shader_transformation_external_yuv_es3");
        public static int fragment_shader_transformation_hdr_internal_es3 =
                id("fragment_shader_transformation_hdr_internal_es3");
        public static int fragment_shader_transformation_sdr_external_es2 =
                id("fragment_shader_transformation_sdr_external_es2");
        public static int fragment_shader_transformation_sdr_internal_es2 =
                id("fragment_shader_transformation_sdr_internal_es2");
        public static int fragment_shader_transformation_sdr_oetf_es2 = id("fragment_shader_transformation_sdr_oetf_es2");
        public static int fragment_shader_transformation_ultra_hdr_es3 = id("fragment_shader_transformation_ultra_hdr_es3");
        public static int insert_overlay_fragment_shader_methods = id("insert_overlay_fragment_shader_methods");
        public static int insert_ultra_hdr = id("insert_ultra_hdr");
        public static int vertex_shader_thumbnail_strip_es2 = id("vertex_shader_thumbnail_strip_es2");
        public static int vertex_shader_transformation_es2 = id("vertex_shader_transformation_es2");
        public static int vertex_shader_transformation_es3 = id("vertex_shader_transformation_es3");

        private raw() {}

        private static int id(String name) {
            Context context = CaptureInterceptor.appContext();
            int id = context.getResources().getIdentifier("cutlog_media3_" + name, "raw", context.getPackageName());
            if (id == 0) {
                throw new IllegalStateException("Missing media3 shader resource: " + name);
            }
            return id;
        }
    }
}

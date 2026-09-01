package defpackage;

import android.graphics.Bitmap;
import android.media.Image;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.avi.AviDirectory;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import com.drew.metadata.exif.makernotes.LeicaMakernoteDirectory;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusCameraSettingsMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusFocusInfoMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusImageProcessingMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusRawInfoMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.exif.makernotes.SanyoMakernoteDirectory;
import com.drew.metadata.exif.makernotes.SonyTag9050bDirectory;
import com.drew.metadata.iptc.IptcDirectory;
import com.drew.metadata.mp4.media.Mp4SoundDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.google.android.gms.analytics.wYI.ivbZv;
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.g;
import com.google.protobuf.k;
import com.medium.android.domain.post.models.AnchorType;
import com.medium.android.domain.post.models.Markup;
import com.medium.android.domain.post.models.MarkupType;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.PostDisplay;
import com.medium.proto.model.SectionModel;
import com.medium.proto.model.SelectionPb;
import com.medium.reader.R;
import gen.model.ImageMetadata;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class pxf {
    public static final mz1 B;
    public static final rz2 E;
    public static final da4 L;
    public static final da4 M;
    public static final da4[] N;
    public static final /* synthetic */ int O = 0;
    public static final /* synthetic */ int P = 0;
    public static n0c Q;
    public static final mz1 e;
    public static final mz1 f;
    public static final mz1 n;
    public static final mz1 u;
    public static final mz1 w;
    public static final mz1 z;
    public static final float[][] a = {new float[]{0.401288f, 0.650173f, -0.051461f}, new float[]{-0.250268f, 1.204414f, 0.045854f}, new float[]{-0.002079f, 0.048952f, 0.953127f}};
    public static final float[][] b = {new float[]{1.8620678f, -1.0112547f, 0.14918678f}, new float[]{0.38752654f, 0.62144744f, -0.00897398f}, new float[]{-0.0158415f, -0.03412294f, 1.0499644f}};
    public static final float[] c = {95.047f, 100.0f, 108.883f};
    public static final float[][] d = {new float[]{0.41233894f, 0.35762063f, 0.18051042f}, new float[]{0.2126f, 0.7152f, 0.0722f}, new float[]{0.01932141f, 0.11916382f, 0.9503448f}};
    public static final mz1 g = new mz1(new yz1(21), false, -608585317);
    public static final mz1 h = new mz1(new l02(7), false, 1317666731);
    public static final mz1 i = new mz1(new l02(22), false, 1083122466);
    public static final mz1 j = new mz1(new l02(23), false, 1141104739);
    public static final mz1 k = new mz1(new l02(8), false, 2040394001);
    public static final mz1 l = new mz1(new l02(9), false, 1854689827);
    public static final mz1 m = new mz1(new l02(10), false, -1769000653);
    public static final mz1 o = new mz1(new l02(12), false, -1518899374);
    public static final mz1 p = new mz1(new l02(13), false, 717328649);
    public static final mz1 q = new mz1(new l02(14), false, -1268798095);
    public static final mz1 r = new mz1(new l02(15), false, 967429928);
    public static final mz1 s = new mz1(new l02(16), false, -1254168179);
    public static final mz1 t = new mz1(new l02(17), false, -1018696816);
    public static final mz1 v = new mz1(new l02(19), false, -1004066900);
    public static final mz1 x = new mz1(new l02(21), false, -503864342);
    public static final mz1 y = new mz1(new m02(27), false, -584727209);
    public static final mz1 A = new mz1(new u02(2), false, 193861290);
    public static final mz1 C = new mz1(new u02(4), false, -293326542);
    public static final int[] D = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 36, -1, -1, -1, 37, 38, -1, -1, -1, -1, 39, 40, -1, 41, 42, 43, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 44, -1, -1, -1, -1, -1, -1, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, -1, -1, -1, -1, -1};
    public static final int[][] F = {new int[]{27, 917}, new int[]{522, 568, 723, 809}, new int[]{237, 308, 436, 284, 646, 653, 428, 379}, new int[]{274, IptcDirectory.TAG_REFERENCE_NUMBER, 232, 755, 599, 524, LeicaMakernoteDirectory.TAG_COLOR_TEMPERATURE, NikonType2MakernoteDirectory.TAG_LENS, 295, 116, 442, 428, 295, 42, 176, 65}, new int[]{361, IptcDirectory.TAG_DIGITAL_TIME_CREATED, 922, OlympusMakernoteDirectory.TAG_ORIGINAL_MANUFACTURER_MODEL, 176, 586, OlympusMakernoteDirectory.TAG_PREVIEW_IMAGE, 321, SanyoMakernoteDirectory.TAG_FLICKER_REDUCE, 742, 677, 742, 687, 284, 193, 517, 273, 494, 263, 147, 593, LeicaMakernoteDirectory.TAG_CAMERA_TEMPERATURE, 571, AviDirectory.TAG_DATETIME_ORIGINAL, LeicaMakernoteDirectory.TAG_WB_GREEN_LEVEL, NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE, 231, 390, 685, ExifDirectoryBase.TAG_SUB_IFD_OFFSET, 63, 410}, new int[]{539, 422, 6, 93, 862, 771, 453, 106, 610, OlympusImageProcessingMakernoteDirectory.TagWbGLevel, 107, 505, 733, 877, 381, IptcDirectory.TAG_COUNTRY_OR_PRIMARY_LOCATION_CODE, 723, 476, 462, NikonType2MakernoteDirectory.TAG_IMAGE_STABILISATION, 430, 609, 858, 822, SanyoMakernoteDirectory.TAG_SCENE_SELECT, IptcDirectory.TAG_ARM_IDENTIFIER, 511, 400, 672, 762, 283, NikonType2MakernoteDirectory.TAG_FILE_INFO, 440, 35, 519, 31, 460, 594, 225, SanyoMakernoteDirectory.TAG_RECORD_SHUTTER_RELEASE, 517, 352, 605, 158, 651, Mp4VideoDirectory.TAG_VENDOR, 488, 502, 648, 733, 717, 83, 404, 97, 280, 771, 840, 629, 4, 381, 843, 623, 264, SanyoMakernoteDirectory.TAG_SCENE_SELECT}, new int[]{521, 310, 864, 547, 858, 580, 296, 379, 53, 779, 897, 444, 400, 925, 749, SonyTag9050bDirectory.TAG_SHUTTER_COUNT_3, 822, 93, 217, 208, 928, 244, 583, 620, 246, 148, 447, 631, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsEveningSunlight, 908, 490, 704, 516, 258, 457, 907, 594, 723, 674, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsEveningSunlight, 272, 96, 684, 432, 686, 606, 860, 569, 193, 219, 129, 186, 236, OlympusImageProcessingMakernoteDirectory.TagWbGLevel, 192, OlympusCameraSettingsMakernoteDirectory.TagAfFineTuneAdj, 278, NikonType2MakernoteDirectory.TAG_AF_RESPONSE, 40, 379, IptcDirectory.TAG_OBJECT_PREVIEW_FILE_FORMAT, 463, 646, OlympusFocusInfoMakernoteDirectory.TagAfPoint, 171, 491, ExifDirectoryBase.TAG_PAGE_NUMBER, 763, NikonType2MakernoteDirectory.TAG_SCENE_ASSIST, 732, 95, 270, 447, 90, 507, 48, 228, 821, OlympusFocusInfoMakernoteDirectory.TagAfInfo, 898, 784, IptcDirectory.TAG_AUDIO_SAMPLING_RATE, IptcDirectory.TAG_SOURCE, IptcDirectory.TAG_ARM_VERSION, 382, 262, 380, IptcDirectory.TAG_CITY, 754, IptcDirectory.TAG_TIME_SENT, 89, 614, 87, 432, 670, 616, 157, 374, 242, 726, 600, 269, 375, 898, 845, 454, 354, NikonType2MakernoteDirectory.TAG_ADAPTER, 814, IptcDirectory.TAG_OBJECT_CYCLE, LeicaMakernoteDirectory.TAG_WB_BLUE_LEVEL, 34, Mp4VideoDirectory.TAG_GRAPHICS_MODE, ExifDirectoryBase.TAG_SUB_IFD_OFFSET, 539, ExifDirectoryBase.TAG_PAGE_NUMBER, 827, 865, 37, 517, 834, ExifDirectoryBase.TAG_ARTIST, IptcDirectory.TAG_EXPIRATION_TIME, 86, LeicaMakernoteDirectory.TAG_COLOR_TEMPERATURE, 4, 108, 539}, new int[]{524, 894, 75, 766, 882, 857, 74, Mp4VideoDirectory.TAG_WIDTH, 82, 586, 708, 250, 905, LeicaMakernoteDirectory.TAG_MEASURED_LV, 138, 720, 858, 194, 311, 913, 275, 190, 375, 850, 438, 733, 194, 280, Mp4VideoDirectory.TAG_VENDOR, 280, 828, 757, 710, 814, 919, 89, 68, 569, 11, Mp4VideoDirectory.TAG_WIDTH, 796, 605, 540, 913, LeicaMakernoteDirectory.TAG_COLOR_TEMPERATURE, 700, 799, 137, 439, 418, IptcDirectory.TAG_BY_LINE, 668, 353, 859, 370, 694, ExifDirectoryBase.TAG_TILE_BYTE_COUNTS, 240, 216, 257, 284, 549, Mp4VideoDirectory.TAG_DEPTH, 884, ExifDirectoryBase.TAG_ARTIST, 70, 329, 793, 490, 274, 877, 162, 749, 812, 684, 461, 334, IptcDirectory.TAG_ARM_IDENTIFIER, 849, 521, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsWhiteFluorescent, 291, LeicaMakernoteDirectory.TAG_WB_GREEN_LEVEL, IptcDirectory.TAG_OBJECT_PREVIEW_FILE_FORMAT, 19, 358, 399, 908, 103, 511, 51, 8, 517, 225, 289, 470, IptcDirectory.TAG_RASTERIZED_CAPTION, 731, 66, 255, 917, 269, 463, 830, 730, 433, 848, 585, 136, IptcDirectory.TAG_CONTENT_LOCATION_CODE, 906, 90, 2, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsFineWeather, 743, 199, 655, 903, 329, 49, LeicaMakernoteDirectory.TAG_WB_RED_LEVEL, 580, 355, 588, 188, 462, 10, NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM, IptcDirectory.TAG_COPYRIGHT_NOTICE, AviDirectory.TAG_DATETIME_ORIGINAL, 479, NikonType2MakernoteDirectory.TAG_ADAPTER, 739, 71, 263, ExifDirectoryBase.TAG_WHITE_POINT, 374, 601, 192, 605, 142, 673, 687, 234, 722, 384, 177, 752, IptcDirectory.TAG_PROVINCE_OR_STATE, OlympusMakernoteDirectory.TAG_PREVIEW_IMAGE, 455, 193, 689, 707, 805, 641, 48, 60, 732, 621, 895, 544, 261, 852, 655, 309, IptcDirectory.TAG_MASTER_DOCUMENT_ID, 755, 756, 60, 231, 773, 434, 421, 726, 528, 503, 118, 49, 795, 32, 144, 500, 238, 836, 394, 280, 566, ExifDirectoryBase.TAG_PRIMARY_CHROMATICITIES, 9, IptcDirectory.TAG_LANGUAGE_IDENTIFIER, IptcDirectory.TAG_EXPIRATION_TIME, 73, 914, ExifDirectoryBase.TAG_TRANSFER_RANGE, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, 32, 681, 331, 792, 620, 60, 609, 441, 180, 791, 893, 754, 605, 383, 228, 749, 760, Mp4VideoDirectory.TAG_COLOR_TABLE, 54, ExifDirectoryBase.TAG_PAGE_NUMBER, NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM, 54, 834, 299, 922, 191, 910, 532, 609, 829, NikonType2MakernoteDirectory.TAG_PICTURE_CONTROL_2, 20, NikonType2MakernoteDirectory.TAG_EXPOSURE_SEQUENCE_NUMBER, 29, 872, 449, 83, 402, 41, 656, 505, 579, 481, NikonType2MakernoteDirectory.TAG_AF_RESPONSE, 404, 251, 688, 95, 497, 555, IptcDirectory.TAG_IMAGE_TYPE, SanyoMakernoteDirectory.TAG_SCENE_SELECT, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsWhiteFluorescent, 159, 924, 558, 648, 55, 497, 10}, new int[]{352, 77, 373, 504, 35, 599, 428, Mp4VideoDirectory.TAG_VERTICAL_RESOLUTION, 409, IptcDirectory.TAG_DIGITAL_DATE_CREATED, 118, 498, 285, 380, 350, 492, 197, 265, 920, NikonType2MakernoteDirectory.TAG_UNKNOWN_10, 914, 299, 229, IptcDirectory.TAG_IMAGE_ORIENTATION, 294, 871, 306, 88, 87, 193, 352, 781, 846, 75, 327, 520, 435, SanyoMakernoteDirectory.TAG_SCENE_SELECT, Mp4VideoDirectory.TAG_SPATIAL_QUALITY, IptcDirectory.TAG_AUDIO_OUTCUE, 249, IptcDirectory.TAG_CODED_CHARACTER_SET, 781, 621, OlympusMakernoteDirectory.TAG_PREVIEW_IMAGE, 268, 794, 534, 539, 781, 408, 390, 644, 102, 476, 499, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsFineWeather, IptcDirectory.TAG_CAPTION, 545, 37, 858, 916, IptcDirectory.TAG_SPECIAL_INSTRUCTIONS, 41, 542, 289, 122, 272, 383, LeicaMakernoteDirectory.TAG_CAMERA_TEMPERATURE, 485, 98, 752, 472, 761, 107, 784, 860, 658, 741, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsFineWeather, Mp4VideoDirectory.TAG_WIDTH, 681, 407, 855, 85, 99, 62, 482, 180, 20, ExifDirectoryBase.TAG_PAGE_NUMBER, 451, 593, 913, 142, OlympusFocusInfoMakernoteDirectory.TagAfInfo, 684, OlympusImageProcessingMakernoteDirectory.TagWbGLevel, SanyoMakernoteDirectory.TAG_FLICKER_REDUCE, 561, 76, 653, 899, 729, IptcDirectory.TAG_DATE_CREATED, 744, 390, 513, 192, 516, 258, 240, 518, 794, 395, 768, 848, 51, 610, 384, NikonType2MakernoteDirectory.TAG_FLASH_INFO, 190, 826, 328, 596, LeicaMakernoteDirectory.TAG_MEASURED_LV, Mp4SoundDirectory.TAG_AUDIO_SAMPLE_SIZE, 570, 381, SonyTag9050bDirectory.TAG_SHUTTER_COUNT_3, 641, NikonType2MakernoteDirectory.TAG_SCENE_ASSIST, 237, 151, 429, 531, Mp4VideoDirectory.TAG_VERTICAL_RESOLUTION, 676, 710, 89, NikonType2MakernoteDirectory.TAG_FLASH_INFO, 304, 402, 40, 708, IptcDirectory.TAG_DIGITAL_TIME_CREATED, 162, 864, 229, 65, 861, 841, 512, 164, 477, 221, 92, 358, 785, 288, 357, 850, 836, 827, 736, 707, 94, 8, 494, 114, 521, 2, 499, 851, SanyoMakernoteDirectory.TAG_SCENE_SELECT, 152, 729, 771, 95, 248, 361, 578, ExifDirectoryBase.TAG_TILE_LENGTH, 856, 797, 289, 51, 684, 466, 533, 820, 669, 45, 902, 452, NikonType2MakernoteDirectory.TAG_EXPOSURE_SEQUENCE_NUMBER, ExifDirectoryBase.TAG_TRANSFER_RANGE, 244, NikonType2MakernoteDirectory.TAG_AF_RESPONSE, 35, 463, 651, 51, IptcDirectory.TAG_UNIQUE_DOCUMENT_ID, 591, 452, 578, 37, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH, 298, 332, IptcDirectory.TAG_SPECIAL_INSTRUCTIONS, 43, 427, PanasonicMakernoteDirectory.TAG_BURST_SPEED, IptcDirectory.TAG_AUDIO_TYPE, 777, 475, 850, 764, 364, 578, 911, 283, 711, 472, 420, 245, 288, 594, 394, 511, 327, 589, 777, IptcDirectory.TAG_UNIQUE_DOCUMENT_ID, 688, 43, 408, 842, 383, 721, 521, 560, 644, IptcDirectory.TAG_OBJECT_PREVIEW_DATA, 559, 62, 145, 873, IptcDirectory.TAG_AUDIO_SAMPLING_RATE, IptcDirectory.TAG_OBJECT_PREVIEW_FILE_FORMAT_VERSION, 159, 672, 729, 624, 59, 193, 417, 158, Mp4VideoDirectory.TAG_DEPTH, 563, 564, 343, 693, 109, 608, 563, 365, NikonType2MakernoteDirectory.TAG_UNKNOWN_48, 772, 677, 310, 248, 353, 708, 410, 579, 870, IptcDirectory.TAG_HEADLINE, 841, IptcDirectory.TAG_CAPTION, 860, 289, SanyoMakernoteDirectory.TAG_FLICKER_REDUCE, 35, 777, 618, 586, 424, 833, 77, IptcDirectory.TAG_BY_LINE_TITLE, IptcDirectory.TAG_CODED_CHARACTER_SET, 269, 757, IptcDirectory.TAG_CAPTION, 695, 751, 331, 247, NikonType2MakernoteDirectory.TAG_FILE_INFO, 45, LeicaMakernoteDirectory.TAG_APPROXIMATE_F_NUMBER, 680, 18, 66, 407, 369, 54, 492, 228, IptcDirectory.TAG_COUNTRY_OR_PRIMARY_LOCATION_NAME, 830, 922, 437, 519, 644, 905, 789, 420, 305, 441, Mp4VideoDirectory.TAG_VERTICAL_RESOLUTION, 300, 892, 827, 141, 537, 381, IptcDirectory.TAG_AUDIO_TYPE, 513, 56, 252, 341, 242, 797, 838, 837, 720, CanonMakernoteDirectory.TAG_SENSOR_INFO_ARRAY, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsWhiteFluorescent, 631, 61, 87, 560, 310, 756, IptcDirectory.TAG_AUDIO_DURATION, 397, OlympusFocusInfoMakernoteDirectory.TagAfInfo, 851, 309, 473, 795, IptcDirectory.TAG_ARM_VERSION, 31, IptcDirectory.TAG_LANGUAGE_IDENTIFIER, 915, 459, 806, 590, 731, 425, 216, SanyoMakernoteDirectory.TAG_SEQUENCE_SHOT_INTERVAL, 249, 321, 881, IptcDirectory.TAG_UNIQUE_DOCUMENT_ID, SanyoMakernoteDirectory.TAG_RECORD_SHUTTER_RELEASE, 673, 782, Mp4VideoDirectory.TAG_COMPRESSION_TYPE, 815, 905, Mp4SoundDirectory.TAG_AUDIO_SAMPLE_SIZE, 843, 922, 281, 73, 469, 791, 660, 162, 498, 308, NikonType2MakernoteDirectory.TAG_UNKNOWN_10, 422, 907, LeicaMakernoteDirectory.TAG_CCD_BOARD_VERSION, NikonType2MakernoteDirectory.TAG_RETOUCH_INFO, 62, 16, 425, SanyoMakernoteDirectory.TAG_RECORD_SHUTTER_RELEASE, IptcDirectory.TAG_TIME_SENT, 286, 437, 375, 273, 610, 296, NikonType2MakernoteDirectory.TAG_AF_INFO_2, 923, 116, 667, 751, 353, 62, 366, 691, 379, 687, 842, 37, 357, 720, 742, ExifDirectoryBase.TAG_SUB_IFD_OFFSET, 5, 39, 923, 311, 424, 242, 749, 321, 54, 669, 316, ExifDirectoryBase.TAG_TRANSFER_RANGE, 299, 534, PanasonicMakernoteDirectory.TAG_COUNTRY, 667, 488, OlympusMakernoteDirectory.TAG_PREVIEW_IMAGE, 672, 576, 540, 316, 486, 721, 610, 46, 656, 447, 171, 616, 464, 190, 531, ExifDirectoryBase.TAG_PAGE_NUMBER, 321, 762, 752, 533, NikonType2MakernoteDirectory.TAG_UNKNOWN_30, NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM, 14, 381, 433, 717, 45, PanasonicMakernoteDirectory.TAG_LANDMARK, 20, 596, 284, 736, 138, 646, 411, 877, 669, 141, 919, 45, 780, 407, 164, 332, 899, NikonType2MakernoteDirectory.TAG_IMAGE_COUNT, 726, 600, ExifDirectoryBase.TAG_TILE_BYTE_COUNTS, 498, 655, 357, 752, 768, 223, 849, IptcDirectory.TAG_LANGUAGE_IDENTIFIER, 63, 310, 863, 251, 366, 304, 282, 738, 675, 410, 389, 244, 31, PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, Mp4SoundDirectory.TAG_AUDIO_SAMPLE_SIZE, 263}};
    public static final Object G = new Object();
    public static final Object H = new Object();
    public static final Object I = new Object();
    public static final Object J = new Object();
    public static final Object K = new Object();

    static {
        int i2 = 3;
        int i3 = 20;
        e = new mz1(new yz1(i3), false, 1439556700);
        f = new mz1(new zz1(i2), false, -585655835);
        int i4 = 11;
        n = new mz1(new l02(i4), false, 467227370);
        int i5 = 18;
        u = new mz1(new l02(i5), false, 1217531207);
        w = new mz1(new l02(i3), false, -753965621);
        z = new mz1(new zz1(i4), false, -777441745);
        B = new mz1(new u02(i2), false, -604717613);
        E = new rz2(25, new h1c(i5));
        da4 da4Var = new da4("auth_api_credentials_begin_sign_in", 9L);
        da4 da4Var2 = new da4("auth_api_credentials_sign_out", 2L);
        L = da4Var2;
        da4 da4Var3 = new da4("auth_api_credentials_authorize", 1L);
        da4 da4Var4 = new da4("auth_api_credentials_revoke_access", 1L);
        da4 da4Var5 = new da4("auth_api_credentials_save_password", 4L);
        da4 da4Var6 = new da4("auth_api_credentials_get_sign_in_intent", 6L);
        M = da4Var6;
        N = new da4[]{da4Var, da4Var2, da4Var3, da4Var4, da4Var5, da4Var6, new da4("auth_api_credentials_save_account_linking_token", 3L), new da4("auth_api_credentials_get_phone_number_hint_intent", 3L)};
    }

    public static float A(int i2) {
        float f2 = i2 / 255.0f;
        return (f2 <= 0.04045f ? f2 / 12.92f : (float) Math.pow((f2 + 0.055f) / 1.055f, 2.4000000953674316d)) * 100.0f;
    }

    public static Boolean B(Class cls) throws IllegalAccessException, InvocationTargetException {
        Method method = (Method) y().b;
        if (method == null) {
            return null;
        }
        Object objInvoke = method.invoke(cls, null);
        objInvoke.getClass();
        return (Boolean) objInvoke;
    }

    public static int C(Object obj, brb brbVar, byte[] bArr, int i2, int i3, int i4, l70 l70Var) {
        int iF = ((g) brbVar).F(obj, bArr, i2, i3, i4, l70Var);
        l70Var.a = obj;
        return iF;
    }

    public static int D(Object obj, brb brbVar, byte[] bArr, int i2, int i3, l70 l70Var) throws InvalidProtocolBufferException {
        int iT = i2 + 1;
        int i4 = bArr[i2];
        if (i4 < 0) {
            iT = t(i4, bArr, iT, l70Var);
            i4 = l70Var.b;
        }
        int i5 = iT;
        if (i4 < 0 || i4 > i3 - i5) {
            throw InvalidProtocolBufferException.g();
        }
        int i6 = i5 + i4;
        brbVar.j(obj, bArr, i5, i6, l70Var);
        l70Var.a = obj;
        return i6;
    }

    public static final mz1 E(int i2, j55 j55Var, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = new mz1(j55Var, true, i2);
            p65Var.j0(objM);
        }
        mz1 mz1Var = (mz1) objM;
        if (!g76.L(mz1Var.c, j55Var)) {
            boolean z2 = mz1Var.c == null;
            mz1Var.c = j55Var;
            if (!z2 && mz1Var.b) {
                mwa mwaVar = mz1Var.d;
                if (mwaVar != null) {
                    mwaVar.b();
                    mz1Var.d = null;
                }
                ArrayList arrayList = mz1Var.e;
                if (arrayList != null) {
                    int size = arrayList.size();
                    for (int i3 = 0; i3 < size; i3++) {
                        ((mwa) arrayList.get(i3)).b();
                    }
                    arrayList.clear();
                }
            }
        }
        return mz1Var;
    }

    public static final boolean F(mwa mwaVar, mwa mwaVar2) {
        return mwaVar == null || !mwaVar.a() || mwaVar == mwaVar2 || g76.L(mwaVar.c, mwaVar2.c);
    }

    public static final r28 G(r28 r28Var, nsb nsbVar, hw8 hw8Var, fx8 fx8Var, boolean z2, dn4 dn4Var, m68 m68Var, py8 py8Var) {
        hw8 hw8Var2 = hw8.Vertical;
        o28 o28Var = o28.b;
        return r28Var.b(hw8Var == hw8Var2 ? r40.y(o28Var, nr5.c) : r40.y(o28Var, nr5.b)).b(new zrb(py8Var, dn4Var, m68Var, hw8Var, fx8Var, nsbVar, z2, false));
    }

    public static int H(int i2, byte[] bArr, int i3, int i4, l70 l70Var) throws InvalidProtocolBufferException {
        if ((i2 >>> 3) == 0) {
            throw InvalidProtocolBufferException.a();
        }
        int i5 = i2 & 7;
        if (i5 == 0) {
            return w(bArr, i3, l70Var);
        }
        if (i5 == 1) {
            return i3 + 8;
        }
        if (i5 == 2) {
            return u(bArr, i3, l70Var) + l70Var.b;
        }
        if (i5 != 3) {
            if (i5 == 5) {
                return i3 + 4;
            }
            throw InvalidProtocolBufferException.a();
        }
        int i6 = (i2 & (-8)) | 4;
        int i7 = 0;
        while (i3 < i4) {
            i3 = u(bArr, i3, l70Var);
            i7 = l70Var.b;
            if (i7 == i6) {
                break;
            }
            i3 = H(i7, bArr, i3, i4, l70Var);
        }
        if (i3 > i4 || i7 != i6) {
            throw InvalidProtocolBufferException.f();
        }
        return i3;
    }

    public static final qn6 I(no3 no3Var, qn6 qn6Var, qn6 qn6Var2) {
        if (k40.g0(no3Var.s0(qn6Var)) != null) {
            return k40.w0(qn6Var) ? no3Var.K0(qn6Var2) : qn6Var2;
        }
        xwd xwdVar = (xwd) bu1.a1(k40.a0(qn6Var));
        if (p54.a[k40.h0(xwdVar).ordinal()] == 1) {
            no3Var.e();
            throw null;
        }
        o3e o3eVarF0 = k40.f0(no3Var, xwdVar);
        o3eVarF0.getClass();
        qn6 qn6VarI = I(no3Var, o3eVarF0, qn6Var2);
        qn6VarI.getClass();
        if (qn6VarI instanceof mn6) {
            no3Var.e();
            throw null;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(no3Var);
        sb.append(", ");
        throw new IllegalArgumentException(ka1.p(n1b.a, no3Var.getClass(), sb).toString());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0029  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object J(int r6, java.lang.Object r7, defpackage.ocb r8, defpackage.d05 r9, int r10) {
        /*
            boolean r0 = r7 instanceof android.graphics.Typeface
            if (r0 != 0) goto L5
            return r7
        L5:
            r0 = r6 & 1
            r1 = 0
            r2 = 1
            if (r0 == 0) goto L29
            d05 r0 = r8.b
            boolean r0 = defpackage.g76.L(r0, r9)
            if (r0 != 0) goto L29
            d05 r0 = defpackage.d05.d
            int r3 = r9.compareTo(r0)
            if (r3 < 0) goto L29
            d05 r3 = r8.b
            int r3 = r3.a
            int r0 = r0.a
            int r0 = defpackage.g76.Q(r3, r0)
            if (r0 >= 0) goto L29
            r0 = r2
            goto L2a
        L29:
            r0 = r1
        L2a:
            r3 = 2
            r6 = r6 & r3
            if (r6 == 0) goto L35
            int r6 = r8.c
            if (r10 != r6) goto L33
            goto L35
        L33:
            r6 = r2
            goto L36
        L35:
            r6 = r1
        L36:
            if (r6 != 0) goto L3b
            if (r0 != 0) goto L3b
            return r7
        L3b:
            int r4 = android.os.Build.VERSION.SDK_INT
            r5 = 28
            if (r4 >= r5) goto L5c
            if (r6 == 0) goto L47
            if (r10 != r2) goto L47
            r6 = r2
            goto L48
        L47:
            r6 = r1
        L48:
            if (r6 == 0) goto L4e
            if (r0 == 0) goto L4e
            r1 = 3
            goto L55
        L4e:
            if (r0 == 0) goto L52
            r1 = r2
            goto L55
        L52:
            if (r6 == 0) goto L55
            r1 = r3
        L55:
            android.graphics.Typeface r7 = (android.graphics.Typeface) r7
            android.graphics.Typeface r6 = android.graphics.Typeface.create(r7, r1)
            return r6
        L5c:
            if (r0 == 0) goto L61
            int r9 = r9.a
            goto L65
        L61:
            d05 r9 = r8.b
            int r9 = r9.a
        L65:
            if (r6 == 0) goto L6b
            if (r10 != r2) goto L70
        L69:
            r1 = r2
            goto L70
        L6b:
            int r6 = r8.c
            if (r6 != r2) goto L70
            goto L69
        L70:
            android.graphics.Typeface r7 = (android.graphics.Typeface) r7
            android.graphics.Typeface r6 = defpackage.uy.d(r7, r9, r1)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pxf.J(int, java.lang.Object, ocb, d05, int):java.lang.Object");
    }

    public static final Bitmap K(Image image) {
        Image.Plane[] planes = image.getPlanes();
        planes.getClass();
        Image.Plane plane = planes[0];
        int height = image.getHeight() * image.getWidth();
        int[] iArr = new int[height];
        plane.getBuffer().asIntBuffer().get(iArr);
        for (int i2 = 0; i2 < height; i2++) {
            int i3 = iArr[i2];
            iArr[i2] = op8.n0(op8.k(i3 & 255, (i3 >> 8) & 255, (i3 >> 16) & 255, (i3 >> 24) & 255));
        }
        return Bitmap.createBitmap(iArr, image.getWidth(), image.getHeight(), Bitmap.Config.ARGB_8888);
    }

    public static final sw5 M(ImageMetadataData imageMetadataData) {
        imageMetadataData.getClass();
        if (muc.b0(imageMetadataData.getId())) {
            return null;
        }
        String id = imageMetadataData.getId();
        Integer originalWidth = imageMetadataData.getOriginalWidth();
        Integer num = (originalWidth == null || originalWidth.intValue() <= 0) ? null : originalWidth;
        Integer originalHeight = imageMetadataData.getOriginalHeight();
        Integer num2 = (originalHeight == null || originalHeight.intValue() <= 0) ? null : originalHeight;
        Double focusPercentX = imageMetadataData.getFocusPercentX();
        if (focusPercentX == null || focusPercentX.doubleValue() < 0.0d) {
            focusPercentX = null;
        }
        Double focusPercentY = imageMetadataData.getFocusPercentY();
        Double d2 = (focusPercentY == null || focusPercentY.doubleValue() < 0.0d) ? null : focusPercentY;
        String alt = imageMetadataData.getAlt();
        return new sw5(id, num, num2, focusPercentX, d2, (alt == null || muc.b0(alt)) ? null : alt);
    }

    public static final z63 N(a73 a73Var) {
        a73Var.getClass();
        switch (c73.a[a73Var.getType().ordinal()]) {
            case 1:
                Integer numB = a73Var.getIndex();
                if (numB == null) {
                    ay0.e("index is required for INSERT_PARAGRAPH_AT");
                    return null;
                }
                int iIntValue = numB.intValue();
                ParagraphPb paragraphPbC = a73Var.getParagraphPb();
                if (paragraphPbC != null) {
                    return new g63(iIntValue, paragraphPbC, a73Var.getIsStartOfSection());
                }
                ay0.e("paragraph is required for INSERT_PARAGRAPH_AT");
                return null;
            case 2:
                Integer numB2 = a73Var.getIndex();
                if (numB2 != null) {
                    return new k63(numB2.intValue());
                }
                ay0.e("index is required for REMOVE_PARAGRAPH_AT");
                return null;
            case 3:
                Integer numB3 = a73Var.getIndex();
                if (numB3 == null) {
                    ay0.e("index is required for UPDATE_PARAGRAPH_AT");
                    return null;
                }
                int iIntValue2 = numB3.intValue();
                ParagraphPb paragraphPbC2 = a73Var.getParagraphPb();
                if (paragraphPbC2 != null) {
                    return new s63(iIntValue2, paragraphPbC2, a73Var.getVerifySameName());
                }
                ay0.e("paragraph is required for UPDATE_PARAGRAPH_AT");
                return null;
            case 4:
                String strH = a73Var.getText();
                if (strH != null) {
                    return new y63(strH);
                }
                ay0.e("text is required for UPDATE_TITLE");
                return null;
            case 5:
                String strH2 = a73Var.getText();
                if (strH2 != null) {
                    return new x63(strH2);
                }
                ay0.e("text is required for UPDATE_SUBTITLE");
                return null;
            case 6:
                String strH3 = a73Var.getText();
                if (strH3 != null) {
                    return new r63(strH3);
                }
                ay0.e("text is required for UPDATE_META_DESCRIPTION");
                return null;
            case 7:
                ImageMetadata imageMetadataA = a73Var.getImageMetadata();
                if (imageMetadataA != null) {
                    return new q63(imageMetadataA);
                }
                ay0.e("imageMetadata is required for UPDATE_IMAGE");
                return null;
            case 8:
                ImageMetadata imageMetadataA2 = a73Var.getImageMetadata();
                if (imageMetadataA2 != null) {
                    return new u63(imageMetadataA2);
                }
                ay0.e("imageMetadata is required for UPDATE_PREVIEW_IMAGE");
                return null;
            case 9:
                String strH4 = a73Var.getText();
                if (strH4 != null) {
                    return new p63(strH4);
                }
                ay0.e("text is required for UPDATE_CAPTION");
                return null;
            case 10:
                Integer numB4 = a73Var.getIndex();
                if (numB4 == null) {
                    ay0.e("index is required for INSERT_SECTION_AT");
                    return null;
                }
                int iIntValue3 = numB4.intValue();
                SectionModel sectionModelF = a73Var.getSectionModel();
                if (sectionModelF != null) {
                    return new h63(iIntValue3, sectionModelF);
                }
                ay0.e("sectionModel is required for INSERT_SECTION_AT");
                return null;
            case 11:
                Integer numB5 = a73Var.getIndex();
                if (numB5 != null) {
                    return new l63(numB5.intValue());
                }
                ay0.e("index is required for REMOVE_SECTION_AT");
                return null;
            case 12:
                Integer numB6 = a73Var.getIndex();
                if (numB6 == null) {
                    ay0.e("index is required for UPDATE_SECTION_AT");
                    return null;
                }
                int iIntValue4 = numB6.intValue();
                SectionModel sectionModelF2 = a73Var.getSectionModel();
                if (sectionModelF2 != null) {
                    return new v63(iIntValue4, sectionModelF2);
                }
                ay0.e("sectionModel is required for UPDATE_SECTION_AT");
                return null;
            case 13:
                PostDisplay postDisplayD = a73Var.getPostDisplay();
                if (postDisplayD != null) {
                    return new t63(postDisplayD);
                }
                ay0.e("postDisplay is required for UPDATE_POST_DISPLAY");
                return null;
            case 14:
                SelectionPb selectionPbG = a73Var.getSelectionPb();
                if (selectionPbG != null) {
                    return new w63(selectionPbG);
                }
                ay0.e("selectionPb is required for UPDATE_SELECTION");
                return null;
            case 15:
                String strK = a73Var.getVersionId();
                if (strK == null) {
                    ay0.e("versionId is required for REVERT");
                    return null;
                }
                String strE = a73Var.getRevision();
                if (strE != null) {
                    return new m63(strK, strE);
                }
                ay0.e("revision is required for REVERT");
                return null;
            case 16:
                return j63.a;
            case 17:
                return e63.a;
            case 18:
                return o63.a;
            case 19:
                return n63.a;
            case 20:
                return i63.a;
            case 21:
                return f63.a;
            default:
                ygf.a();
                return null;
        }
    }

    public static float P() {
        return ((float) Math.pow(0.5689655172413793d, 3.0d)) * 100.0f;
    }

    public static final void a(r28 r28Var, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-932836462);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(x45Var) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            hp7.t(p65Var, guc.A(r28Var, x45Var));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(r28Var, x45Var, i2, 3);
        }
    }

    public static final void b(final List list, final float f2, final float f3, final ArrayList arrayList, final boolean z2, final xk1 xk1Var, final long j2, final long j3, final long j4, final mkd mkdVar, final xjd xjdVar, final m73 m73Var, final x45 x45Var, final x45 x45Var2, final x45 x45Var3, x12 x12Var, final int i2, final int i3) {
        int i4;
        int i5;
        p65 p65Var;
        r28 r28Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1787529392);
        if ((i2 & 6) == 0) {
            i4 = (p65Var2.h(list) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var2.c(f2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i4 |= p65Var2.c(f3) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i4 |= p65Var2.h(arrayList) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i4 |= p65Var2.g(z2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((i2 & 196608) == 0) {
            i4 |= p65Var2.f(xk1Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((i2 & 1572864) == 0) {
            i4 |= p65Var2.e(j2) ? 1048576 : 524288;
        }
        if ((i2 & 12582912) == 0) {
            i4 |= p65Var2.e(j3) ? 8388608 : 4194304;
        }
        if ((i2 & 100663296) == 0) {
            i4 |= p65Var2.e(j4) ? 67108864 : 33554432;
        }
        if ((i2 & 805306368) == 0) {
            i4 |= p65Var2.f(mkdVar) ? 536870912 : 268435456;
        }
        if ((i3 & 6) == 0) {
            i5 = i3 | (p65Var2.f(xjdVar) ? 4 : 2);
        } else {
            i5 = i3;
        }
        if ((i3 & 48) == 0) {
            i5 |= p65Var2.f(m73Var) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i5 |= p65Var2.h(x45Var) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i5 |= p65Var2.h(x45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i3 & 24576) == 0) {
            i5 |= p65Var2.h(x45Var3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i6 = i5;
        if (p65Var2.P(i4 & 1, ((i4 & 306783379) == 306783378 && (i6 & 9363) == 9362) ? false : true)) {
            r28 r28VarE = jfc.e(jfc.d(o28.b, 1.0f), f3);
            int i7 = i6 & 7168;
            boolean z3 = ((i6 & 896) == 256) | (i7 == 2048);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                objM = new za2(x45Var, 1, x45Var2);
                p65Var2.j0(objM);
            }
            r28 r28VarA = r4d.a(r28VarE, c1e.a, (PointerInputEventHandler) objM);
            boolean zH = ((i6 & 14) == 4) | ((i4 & 896) == 256) | p65Var2.h(arrayList) | ((1879048192 & i4) == 536870912) | p65Var2.h(list) | ((i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((234881024 & i4) == 67108864) | ((i4 & 57344) == 16384) | ((458752 & i4) == 131072) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i6 & 57344) == 16384) | ((3670016 & i4) == 1048576) | ((29360128 & i4) == 8388608) | (i7 == 2048);
            Object objM2 = p65Var2.M();
            if (zH || objM2 == uobVar) {
                r28Var = r28VarA;
                x45 x45Var4 = new x45() { // from class: ez6
                    /* JADX WARN: Multi-variable type inference failed */
                    /* JADX WARN: Removed duplicated region for block: B:145:0x055d  */
                    /* JADX WARN: Removed duplicated region for block: B:153:0x05d6  */
                    /* JADX WARN: Removed duplicated region for block: B:155:0x05e0  */
                    /* JADX WARN: Removed duplicated region for block: B:156:0x05e3  */
                    /* JADX WARN: Removed duplicated region for block: B:159:0x05ed  */
                    /* JADX WARN: Removed duplicated region for block: B:160:0x05f0  */
                    /* JADX WARN: Removed duplicated region for block: B:168:0x0604  */
                    /* JADX WARN: Type inference failed for: r14v19, types: [java.lang.Integer] */
                    /* JADX WARN: Type inference failed for: r14v20 */
                    /* JADX WARN: Type inference failed for: r14v25 */
                    /* JADX WARN: Type inference failed for: r24v12 */
                    /* JADX WARN: Type inference failed for: r24v6 */
                    /* JADX WARN: Type inference failed for: r24v7, types: [java.lang.Float, java.lang.Number] */
                    /* JADX WARN: Type inference failed for: r26v15 */
                    /* JADX WARN: Type inference failed for: r26v6 */
                    /* JADX WARN: Type inference failed for: r26v7, types: [java.lang.Number] */
                    /* JADX WARN: Type inference failed for: r28v1, types: [java.lang.Number] */
                    /* JADX WARN: Type inference failed for: r28v2 */
                    /* JADX WARN: Type inference failed for: r28v4 */
                    /* JADX WARN: Type inference failed for: r28v5 */
                    /* JADX WARN: Type inference failed for: r28v6 */
                    /* JADX WARN: Type inference failed for: r28v8 */
                    /* JADX WARN: Type inference failed for: r2v56 */
                    /* JADX WARN: Type inference failed for: r2v57, types: [java.lang.Float] */
                    /* JADX WARN: Type inference failed for: r2v75 */
                    /* JADX WARN: Type inference failed for: r3v22 */
                    /* JADX WARN: Type inference failed for: r3v23, types: [java.lang.Float] */
                    /* JADX WARN: Type inference failed for: r3v33 */
                    /* JADX WARN: Type inference failed for: r5v24 */
                    /* JADX WARN: Type inference failed for: r5v25, types: [java.lang.Float] */
                    /* JADX WARN: Type inference failed for: r5v48 */
                    /* JADX WARN: Type inference failed for: r6v57 */
                    /* JADX WARN: Type inference failed for: r6v58, types: [java.lang.Float] */
                    /* JADX WARN: Type inference failed for: r6v82 */
                    @Override // defpackage.x45
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                        To view partially-correct add '--show-bad-code' argument
                    */
                    public final java.lang.Object invoke(java.lang.Object r40) throws java.lang.Throwable {
                        /*
                            Method dump skipped, instruction units count: 1738
                            To view this dump add '--comments-level debug' option
                        */
                        throw new UnsupportedOperationException("Method not decompiled: defpackage.ez6.invoke(java.lang.Object):java.lang.Object");
                    }
                };
                p65Var = p65Var2;
                p65Var.j0(x45Var4);
                objM2 = x45Var4;
            } else {
                r28Var = r28VarA;
                p65Var = p65Var2;
            }
            a(r28Var, (x45) objM2, p65Var, 0);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: fz6
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i2 | 1);
                    int iY2 = tr7.y(i3);
                    pxf.b(list, f2, f3, arrayList, z2, xk1Var, j2, j3, j4, mkdVar, xjdVar, m73Var, x45Var, x45Var2, x45Var3, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public static final void c(List list, mkd mkdVar, gr5 gr5Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        mkd mkdVar2;
        p65 p65Var;
        r28 r28Var2;
        boolean z2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1787470161);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.h(list) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            mkdVar2 = mkdVar;
            i3 |= p65Var2.f(mkdVar2) ? 32 : 16;
        } else {
            mkdVar2 = mkdVar;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(gr5Var) ? 256 : 128;
        }
        int i4 = i3 | 3072;
        int i5 = 0;
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            boolean z3 = gr5Var.c;
            final float f2 = z3 ? -15.0f : 0.0f;
            final float f3 = z3 ? -45.0f : 0.0f;
            r28 r28Var3 = o28.b;
            r28 r28VarG = w2g.G(jfc.d(r28Var3, 1.0f), 16.0f, 6.0f, 0.0f, 0.0f, 12);
            omb ombVarA = nmb.a(qb8.f, z46.m, p65Var2, 6);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            p65Var2.Y(-813522354);
            int size = list.size() - 1;
            int iIntValue = ((Number) gr5Var.b.invoke(list)).intValue();
            if (iIntValue <= 0) {
                ay0.e(ev6.w("Step must be positive, was: ", iIntValue, "."));
                return;
            }
            int iU = hk7.u(0, size, iIntValue);
            if (iU >= 0) {
                int i7 = 0;
                while (true) {
                    String str = (String) gr5Var.a.f(Long.valueOf(((kb9) list.get(i7)).b), p65Var2, Integer.valueOf(i5));
                    boolean zC = p65Var2.c(f2) | p65Var2.c(f3);
                    Object objM = p65Var2.M();
                    if (zC || objM == w12.a) {
                        objM = new x45() { // from class: gz6
                            @Override // defpackage.x45
                            public final Object invoke(Object obj) {
                                tjb tjbVar = (tjb) obj;
                                tjbVar.getClass();
                                tjbVar.t(f2);
                                tjbVar.j(f3);
                                return c1e.a;
                            }
                        };
                        p65Var2.j0(objM);
                    }
                    r28 r28VarW = xz5.W(r28Var3, (x45) objM);
                    int i8 = (i4 << 18) & 29360128;
                    int i9 = iIntValue;
                    int i10 = i7;
                    float f4 = f2;
                    int i11 = iU;
                    float f5 = f3;
                    r28Var2 = r28Var3;
                    p65 p65Var3 = p65Var2;
                    int i12 = i4;
                    z2 = i5 == true ? 1 : 0;
                    jjd.b(str, r28VarW, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar2, p65Var3, 0, i8, 131068);
                    p65Var = p65Var3;
                    if (i10 == i11) {
                        break;
                    }
                    i7 = i10 + i9;
                    iU = i11;
                    p65Var2 = p65Var;
                    f2 = f4;
                    i5 = z2 ? 1 : 0;
                    iIntValue = i9;
                    i4 = i12;
                    r28Var3 = r28Var2;
                    f3 = f5;
                    mkdVar2 = mkdVar;
                }
            } else {
                p65Var = p65Var2;
                z2 = false;
                r28Var2 = r28Var3;
            }
            p65Var.p(z2);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 26, list, mkdVar, gr5Var, r28Var2);
        }
    }

    public static final void d(final String str, final String str2, final long j2, final long j3, final long j4, final long j5, r28 r28Var, x12 x12Var, final int i2) {
        int i3;
        final r28 r28Var2;
        o28 o28Var;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-524511451);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(str) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(str2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.e(j3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.e(j4) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.e(j5) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i4 = i3 | 1572864;
        if (p65Var.P(i4 & 1, (i4 & 599187) != 599186)) {
            o28 o28Var2 = o28.b;
            r28 r28VarD = jfc.d(o28Var2, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 54);
            long j6 = p65Var.T;
            int i5 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            r28 r28VarL = jfc.l(o28Var2, 10.0f);
            amb ambVar = bmb.a;
            dy0.a(flb.a0(w2g.C(flb.a0(r28VarL, j2, ambVar), 2.0f), j3, ambVar), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var2, 8.0f));
            sn3 sn3Var = jt7.c;
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, i4 & 14, 0, 131070);
            p65Var = p65Var;
            if (str2 != null) {
                km4.F(32.0f, 1687296658, p65Var, p65Var, o28Var2);
                dy0.a(flb.a0(w2g.C(flb.a0(jfc.l(o28Var2, 10.0f), j4, ambVar), 2.0f), j5, ambVar), p65Var, 0);
                o28Var = o28Var2;
                jjd.b(str2, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) lv8.n(o28Var2, 8.0f, p65Var, sn3Var)).l, p65Var, (i4 >> 3) & 14, 0, 131070);
                p65Var = p65Var;
                z2 = false;
            } else {
                o28Var = o28Var2;
                z2 = false;
                p65Var.Y(1663755289);
            }
            p65Var.p(z2);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: dz6
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    pxf.d(str, str2, j2, j3, j4, j5, r28Var2, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:134:0x01ee  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0292  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x029a  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x029f  */
    /* JADX WARN: Removed duplicated region for block: B:178:0x02bb  */
    /* JADX WARN: Removed duplicated region for block: B:181:0x02cd  */
    /* JADX WARN: Removed duplicated region for block: B:187:0x02f6  */
    /* JADX WARN: Removed duplicated region for block: B:190:0x0339  */
    /* JADX WARN: Removed duplicated region for block: B:191:0x033d  */
    /* JADX WARN: Removed duplicated region for block: B:194:0x0367  */
    /* JADX WARN: Removed duplicated region for block: B:197:0x037a  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x03f8  */
    /* JADX WARN: Removed duplicated region for block: B:202:0x0409  */
    /* JADX WARN: Removed duplicated region for block: B:212:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x00ef  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(final java.util.List r51, final java.lang.String r52, defpackage.r28 r53, java.lang.String r54, float r55, boolean r56, defpackage.xk1 r57, final defpackage.gr5 r58, final defpackage.x45 r59, defpackage.x12 r60, final int r61, final int r62) {
        /*
            Method dump skipped, instruction units count: 1053
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pxf.e(java.util.List, java.lang.String, r28, java.lang.String, float, boolean, xk1, gr5, x45, x12, int, int):void");
    }

    public static final void f(String str, r28 r28Var, mkd mkdVar, float f2, x12 x12Var, int i2) {
        p65 p65Var;
        float f3;
        float f4;
        h49 h49Var;
        uob uobVar;
        str.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(714292559);
        int i3 = 2;
        int i4 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(r28Var) ? 32 : 16) | (p65Var2.f(mkdVar) ? 256 : 128) | 3072;
        boolean z2 = false;
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                f4 = 10.0f;
            } else {
                p65Var2.S();
                f4 = f2;
            }
            p65Var2.q();
            xjd xjdVarK = ek7.K(p65Var2);
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (objM == uobVar2) {
                objM = new h49(0);
                p65Var2.j0(objM);
            }
            h49 h49Var2 = (h49) objM;
            int i5 = i4 & 14;
            boolean zD = (i5 == 4) | ((((i4 & 896) ^ 384) > 256 && p65Var2.f(mkdVar)) || (i4 & 384) == 256) | p65Var2.d(h49Var2.g());
            Object objM2 = p65Var2.M();
            if (zD || objM2 == uobVar2) {
                if (h49Var2.g() == 0) {
                    h49Var = h49Var2;
                    uobVar = uobVar2;
                } else {
                    h49Var = h49Var2;
                    uobVar = uobVar2;
                    if (((int) (xjd.a(xjdVarK, str, mkdVar, 1, 0L, 1004).c >> 32)) > h49Var.g()) {
                        z2 = true;
                    }
                }
                objM2 = Boolean.valueOf(z2);
                p65Var2.j0(objM2);
            } else {
                h49Var = h49Var2;
                uobVar = uobVar2;
            }
            boolean zBooleanValue = ((Boolean) objM2).booleanValue();
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = new d02(h49Var, i3);
                p65Var2.j0(objM3);
            }
            r28 r28VarE = o7f.E(r28Var, (x45) objM3);
            r28 r28VarC = o28.b;
            if (zBooleanValue) {
                r28VarC = guc.C(xz5.Y(r28VarC, 0.0f, 0.0f, 0.0f, null, 458751), new fu0(i3, f4));
            }
            p65Var = p65Var2;
            jjd.b(str, bgf.N(pwd.A(r28VarE.b(r28VarC)), "marquee_text"), 0L, 0L, 0L, null, null, 0L, 0, false, 1, 0, null, mkdVar, p65Var, i5, ((i4 << 15) & 29360128) | 24576, 114684);
            f3 = f4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            f3 = f2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dj3(str, r28Var, mkdVar, f3, i2);
        }
    }

    public static final swd g(no3 no3Var, qn6 qn6Var) {
        boolean zY;
        o3e o3eVarF0;
        swd swdVarG0 = k40.g0(no3Var.s0(qn6Var));
        if (swdVarG0 != null) {
            return swdVarG0;
        }
        if (qn6Var instanceof mn6) {
            zY = vm6.y((mn6) qn6Var);
        } else {
            StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
            sb.append(qn6Var);
            sb.append(", ");
            ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
            zY = false;
        }
        if (zY && (o3eVarF0 = k40.f0(no3Var, (xwd) bu1.a1(k40.a0(qn6Var)))) != null) {
            return g(no3Var, o3eVarF0);
        }
        return null;
    }

    public static final int h(int i2, int i3) {
        return i2 << (((i3 % 10) * 3) + 1);
    }

    public static fy2 i(long j2, x12 x12Var, int i2) {
        long jM;
        if ((i2 & 1) != 0) {
            sn3 sn3Var = tv1.a;
            p65 p65Var = (p65) x12Var;
            jM = op8.M(uu1.b(0.12f, ((sv1) p65Var.j(sn3Var)).c()), ((sv1) p65Var.j(sn3Var)).e());
        } else {
            jM = j2;
        }
        sn3 sn3Var2 = tv1.a;
        long jB = uu1.b(0.87f, ((sv1) ((p65) x12Var).j(sn3Var2)).c());
        long jB2 = uu1.b(0.54f, jB);
        p65 p65Var2 = (p65) x12Var;
        long jC = ((sv1) p65Var2.j(sn3Var2)).c();
        sn3 sn3Var3 = d82.a;
        long j3 = ((uu1) p65Var2.j(sn3Var3)).a;
        if (((sv1) p65Var2.j(sn3Var2)).f()) {
            op8.f0(j3);
        } else {
            op8.f0(j3);
        }
        long jM2 = op8.M(uu1.b(0.045599997f, jC), ((sv1) p65Var2.j(sn3Var2)).e());
        p65 p65Var3 = (p65) x12Var;
        long j4 = ((uu1) p65Var3.j(sn3Var3)).a;
        if (((sv1) p65Var3.j(sn3Var2)).f()) {
            op8.f0(j4);
        } else {
            op8.f0(j4);
        }
        long jB3 = uu1.b(0.3306f, jB);
        p65 p65Var4 = (p65) x12Var;
        long j5 = ((uu1) p65Var4.j(sn3Var3)).a;
        if (((sv1) p65Var4.j(sn3Var2)).f()) {
            op8.f0(j5);
        } else {
            op8.f0(j5);
        }
        return new fy2(jM, jB, jB2, jM2, jB3, uu1.b(0.2052f, jB2));
    }

    public static final qn6 j(no3 no3Var, qn6 qn6Var, HashSet hashSet) {
        hec hecVarG;
        qn6 qn6VarL0;
        qn6 qn6VarJ;
        zvd zvdVarS0 = no3Var.s0(qn6Var);
        if (hashSet.add(zvdVarS0)) {
            swd swdVarG0 = k40.g0(zvdVarS0);
            int i2 = 1;
            int i3 = 0;
            if (swdVarG0 == null) {
                if (k40.r0(zvdVarS0)) {
                    List<swd> listE0 = k40.e0(no3Var.s0(qn6Var));
                    List listA0 = k40.a0(qn6Var);
                    ArrayList arrayList = new ArrayList(cu1.k0(listA0, 10));
                    for (Object obj : listA0) {
                        int i4 = i3 + 1;
                        if (i3 < 0) {
                            d46.i0();
                            throw null;
                        }
                        gx gxVarF0 = k40.f0(no3Var, (xwd) obj);
                        if (gxVarF0 == null) {
                            swd swdVar = (swd) listE0.get(i3);
                            swdVar.getClass();
                            gxVarF0 = ok7.C(swdVar);
                        }
                        arrayList.add(gxVarF0);
                        i3 = i4;
                    }
                    ArrayList arrayList2 = new ArrayList(cu1.k0(listE0, 10));
                    for (swd swdVar2 : listE0) {
                        swdVar2.getClass();
                        zvd zvdVarN = swdVar2.n();
                        zvdVarN.getClass();
                        arrayList2.add(zvdVarN);
                    }
                    Map mapV = ei7.V(bu1.t1(arrayList, arrayList2));
                    ArrayList arrayList3 = new ArrayList(mapV.size());
                    for (Map.Entry entry : mapV.entrySet()) {
                        awd awdVar = (awd) entry.getKey();
                        qn6 qn6Var2 = (qn6) entry.getValue();
                        awdVar.getClass();
                        qn6Var2.getClass();
                        arrayList3.add(new f09((zvd) awdVar, new onc((mn6) qn6Var2)));
                    }
                    ixd ixdVar = new ixd(new pnc(i2, ei7.V(arrayList3)));
                    qn6Var.getClass();
                    if (qn6Var instanceof mn6) {
                        hecVarG = g26.g((mn6) qn6Var);
                    } else {
                        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
                        sb.append(qn6Var);
                        sb.append(", ");
                        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
                        hecVarG = null;
                    }
                    if (hecVarG == null) {
                        qn6VarL0 = null;
                    } else {
                        swd swdVarG = g(no3Var, hecVarG);
                        qn6VarL0 = swdVarG == null ? k40.L0(ixdVar, hecVarG) : I(no3Var, hecVarG, k40.L0(ixdVar, ok7.C(swdVarG)));
                    }
                    if (qn6VarL0 != null && (qn6VarJ = j(no3Var, qn6VarL0, hashSet)) != null) {
                        if (!k40.w0(qn6Var)) {
                            return qn6VarJ;
                        }
                        if (!k40.w0(qn6VarJ) && (!(qn6VarJ instanceof jec) || !k40.x0((jec) qn6VarJ))) {
                            return no3Var.K0(qn6VarJ);
                        }
                    }
                }
                return qn6Var;
            }
            qn6 qn6VarC = ok7.C(swdVarG0);
            qn6 qn6VarJ2 = j(no3Var, qn6VarC, hashSet);
            if (qn6VarJ2 != null) {
                if (!k40.r0(no3Var.s0(qn6VarC)) && (!(qn6VarC instanceof jec) || !k40.x0((jec) qn6VarC))) {
                    i2 = 0;
                }
                return ((qn6VarJ2 instanceof jec) && k40.x0((jec) qn6VarJ2) && k40.w0(qn6Var) && i2 != 0) ? no3Var.K0(qn6VarC) : (k40.w0(qn6VarJ2) || !k40.u0(qn6Var)) ? qn6VarJ2 : no3Var.K0(qn6VarJ2);
            }
        }
        return null;
    }

    public static int k(byte[] bArr, int i2, l70 l70Var) throws InvalidProtocolBufferException {
        int iU = u(bArr, i2, l70Var);
        int i3 = l70Var.b;
        if (i3 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        if (i3 > bArr.length - iU) {
            throw InvalidProtocolBufferException.g();
        }
        if (i3 == 0) {
            l70Var.a = f21.b;
            return iU;
        }
        l70Var.a = f21.f(bArr, iU, i3);
        return iU + i3;
    }

    public static int l(int i2, byte[] bArr) {
        return ((bArr[i2 + 3] & 255) << 24) | (bArr[i2] & 255) | ((bArr[i2 + 1] & 255) << 8) | ((bArr[i2 + 2] & 255) << 16);
    }

    public static long m(int i2, byte[] bArr) {
        return ((((long) bArr[i2 + 7]) & 255) << 56) | (((long) bArr[i2]) & 255) | ((((long) bArr[i2 + 1]) & 255) << 8) | ((((long) bArr[i2 + 2]) & 255) << 16) | ((((long) bArr[i2 + 3]) & 255) << 24) | ((((long) bArr[i2 + 4]) & 255) << 32) | ((((long) bArr[i2 + 5]) & 255) << 40) | ((((long) bArr[i2 + 6]) & 255) << 48);
    }

    public static int n(brb brbVar, byte[] bArr, int i2, int i3, int i4, l70 l70Var) {
        Object objD = brbVar.d();
        int iC = C(objD, brbVar, bArr, i2, i3, i4, l70Var);
        brbVar.b(objD);
        l70Var.a = objD;
        return iC;
    }

    public static int o(brb brbVar, byte[] bArr, int i2, int i3, l70 l70Var) throws InvalidProtocolBufferException {
        Object objD = brbVar.d();
        int iD = D(objD, brbVar, bArr, i2, i3, l70Var);
        brbVar.b(objD);
        l70Var.a = objD;
        return iD;
    }

    public static int p(brb brbVar, int i2, byte[] bArr, int i3, int i4, t56 t56Var, l70 l70Var) throws InvalidProtocolBufferException {
        int iO = o(brbVar, bArr, i3, i4, l70Var);
        t56Var.add(l70Var.a);
        while (iO < i4) {
            int iU = u(bArr, iO, l70Var);
            if (i2 != l70Var.b) {
                break;
            }
            iO = o(brbVar, bArr, iU, i4, l70Var);
            t56Var.add(l70Var.a);
        }
        return iO;
    }

    public static int q(byte[] bArr, int i2, l70 l70Var) throws InvalidProtocolBufferException {
        int iU = u(bArr, i2, l70Var);
        int i3 = l70Var.b;
        if (i3 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        if (i3 == 0) {
            l70Var.a = "";
            return iU;
        }
        l70Var.a = new String(bArr, iU, i3, v56.a);
        return iU + i3;
    }

    public static int r(byte[] bArr, int i2, l70 l70Var) throws InvalidProtocolBufferException {
        int iU = u(bArr, i2, l70Var);
        int i3 = l70Var.b;
        if (i3 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        if (i3 == 0) {
            l70Var.a = "";
            return iU;
        }
        l70Var.a = toe.a.m(bArr, iU, i3);
        return iU + i3;
    }

    public static int s(int i2, byte[] bArr, int i3, int i4, k kVar, l70 l70Var) throws InvalidProtocolBufferException {
        if ((i2 >>> 3) == 0) {
            throw InvalidProtocolBufferException.a();
        }
        int i5 = i2 & 7;
        if (i5 == 0) {
            int iW = w(bArr, i3, l70Var);
            kVar.f(i2, Long.valueOf(l70Var.c));
            return iW;
        }
        if (i5 == 1) {
            kVar.f(i2, Long.valueOf(m(i3, bArr)));
            return i3 + 8;
        }
        if (i5 == 2) {
            int iU = u(bArr, i3, l70Var);
            int i6 = l70Var.b;
            if (i6 < 0) {
                throw InvalidProtocolBufferException.e();
            }
            if (i6 > bArr.length - iU) {
                throw InvalidProtocolBufferException.g();
            }
            if (i6 == 0) {
                kVar.f(i2, f21.b);
            } else {
                kVar.f(i2, f21.f(bArr, iU, i6));
            }
            return iU + i6;
        }
        if (i5 != 3) {
            if (i5 != 5) {
                throw InvalidProtocolBufferException.a();
            }
            kVar.f(i2, Integer.valueOf(l(i3, bArr)));
            return i3 + 4;
        }
        k kVar2 = new k();
        int i7 = (i2 & (-8)) | 4;
        int i8 = 0;
        while (true) {
            if (i3 >= i4) {
                break;
            }
            int iU2 = u(bArr, i3, l70Var);
            i8 = l70Var.b;
            if (i8 == i7) {
                i3 = iU2;
                break;
            }
            i3 = s(i8, bArr, iU2, i4, kVar2, l70Var);
        }
        if (i3 > i4 || i8 != i7) {
            throw InvalidProtocolBufferException.f();
        }
        kVar.f(i2, kVar2);
        return i3;
    }

    public static int t(int i2, byte[] bArr, int i3, l70 l70Var) {
        int i4 = i2 & 127;
        int i5 = i3 + 1;
        byte b2 = bArr[i3];
        if (b2 >= 0) {
            l70Var.b = i4 | (b2 << 7);
            return i5;
        }
        int i6 = i4 | ((b2 & 127) << 7);
        int i7 = i3 + 2;
        byte b3 = bArr[i5];
        if (b3 >= 0) {
            l70Var.b = i6 | (b3 << 14);
            return i7;
        }
        int i8 = i6 | ((b3 & 127) << 14);
        int i9 = i3 + 3;
        byte b4 = bArr[i7];
        if (b4 >= 0) {
            l70Var.b = i8 | (b4 << 21);
            return i9;
        }
        int i10 = i8 | ((b4 & 127) << 21);
        int i11 = i3 + 4;
        byte b5 = bArr[i9];
        if (b5 >= 0) {
            l70Var.b = i10 | (b5 << 28);
            return i11;
        }
        int i12 = i10 | ((b5 & 127) << 28);
        while (true) {
            int i13 = i11 + 1;
            if (bArr[i11] >= 0) {
                l70Var.b = i12;
                return i13;
            }
            i11 = i13;
        }
    }

    public static int u(byte[] bArr, int i2, l70 l70Var) {
        int i3 = i2 + 1;
        byte b2 = bArr[i2];
        if (b2 < 0) {
            return t(b2, bArr, i3, l70Var);
        }
        l70Var.b = b2;
        return i3;
    }

    public static int v(int i2, byte[] bArr, int i3, int i4, t56 t56Var, l70 l70Var) {
        b46 b46Var = (b46) t56Var;
        int iU = u(bArr, i3, l70Var);
        b46Var.e(l70Var.b);
        while (iU < i4) {
            int iU2 = u(bArr, iU, l70Var);
            if (i2 != l70Var.b) {
                break;
            }
            iU = u(bArr, iU2, l70Var);
            b46Var.e(l70Var.b);
        }
        return iU;
    }

    public static int w(byte[] bArr, int i2, l70 l70Var) {
        int i3 = i2 + 1;
        long j2 = bArr[i2];
        if (j2 >= 0) {
            l70Var.c = j2;
            return i3;
        }
        int i4 = i2 + 2;
        byte b2 = bArr[i3];
        long j3 = (j2 & 127) | (((long) (b2 & 127)) << 7);
        int i5 = 7;
        while (b2 < 0) {
            int i6 = i4 + 1;
            byte b3 = bArr[i4];
            i5 += 7;
            j3 |= ((long) (b3 & 127)) << i5;
            b2 = b3;
            i4 = i6;
        }
        l70Var.c = j3;
        return i4;
    }

    public static final mx x(int i2, int i3, int i4, x12 x12Var, String str, List list) {
        String str2;
        int i5 = i2;
        str.getClass();
        list.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.Y(779724892);
        int i6 = (i4 & 16) != 0 ? 100 : 0;
        String strR = vo7.R(p65Var, R.string.ellipsis);
        if (i6 <= 0) {
            strR = null;
        }
        String str3 = "";
        if (strR == null) {
            strR = "";
        }
        int length = strR.length();
        if (muc.b0(str)) {
            mx mxVar = new mx(str3);
            p65Var.p(false);
            return mxVar;
        }
        if (i5 > i3) {
            mx mxVar2 = new mx(muc.x0(i6, str).concat(strR));
            p65Var.p(false);
            return mxVar2;
        }
        if (i5 >= str.length()) {
            mx mxVar3 = new mx(muc.x0(i6, str).concat(strR));
            p65Var.p(false);
            return mxVar3;
        }
        int iMin = Math.min(i3, str.length());
        ArrayList<Markup> arrayList = new ArrayList();
        for (Object obj : list) {
            Markup markup = (Markup) obj;
            if (markup.getStart() <= markup.getEnd()) {
                arrayList.add(obj);
            }
        }
        int i7 = 1;
        if (str.length() - i3 > i6 + length) {
            String string = muc.k0(str, new n46(i3 + i6, str.length() - 1, 1)).toString();
            ArrayList<Markup> arrayList2 = new ArrayList();
            for (Object obj2 : arrayList) {
                if (((Markup) obj2).getStart() <= string.length()) {
                    arrayList2.add(obj2);
                }
            }
            arrayList = new ArrayList(cu1.k0(arrayList2, 10));
            for (Markup markupCopy$default : arrayList2) {
                if (markupCopy$default.getEnd() > string.length()) {
                    markupCopy$default = Markup.copy$default(markupCopy$default, null, 0, string.length(), null, null, null, 59, null);
                }
                arrayList.add(markupCopy$default);
            }
            str2 = ((Object) string) + strR;
        } else {
            str2 = str;
        }
        if (i5 > i6) {
            n46 n46Var = new n46(0, (i5 - i6) - 1, 1);
            int iQ0 = bu1.q0(n46Var);
            String string2 = muc.k0(str2, n46Var).toString();
            int i8 = iQ0 - length;
            ArrayList arrayList3 = new ArrayList(cu1.k0(arrayList, 10));
            for (Markup markup2 : arrayList) {
                int iMax = Math.max(0, markup2.getStart() - i8);
                arrayList3.add(Markup.copy$default(markup2, null, iMax, Math.max(iMax, markup2.getEnd() - i8), null, null, null, 57, null));
            }
            str2 = strR + ((Object) string2);
            i5 -= i8;
            iMin -= i8;
            arrayList = arrayList3;
        }
        ArrayList<Markup> arrayList4 = new ArrayList();
        for (Object obj3 : arrayList) {
            Markup markup3 = (Markup) obj3;
            if (markup3.getStart() < markup3.getEnd()) {
                arrayList4.add(obj3);
            }
        }
        kx kxVar = new kx();
        kxVar.d(str2);
        p65Var.Y(1991404551);
        for (Markup markup4 : arrayList4) {
            MarkupType type = markup4.getType();
            int i9 = vj5.b[type.ordinal()];
            if (i9 == 1) {
                p65Var.Y(-294804536);
                p65Var.p(false);
                skc skcVar = new skc(0L, 0L, d05.h, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65531);
                int start = markup4.getStart();
                if (start < 0) {
                    start = 0;
                }
                int end = markup4.getEnd();
                int length2 = str2.length();
                if (end > length2) {
                    end = length2;
                }
                kxVar.b(skcVar, start, end);
            } else if (i9 == 2) {
                p65Var.Y(-294426584);
                p65Var.p(false);
                skc skcVar2 = new skc(0L, 0L, (d05) null, new zz4(i7), (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65527);
                int start2 = markup4.getStart();
                if (start2 < 0) {
                    start2 = 0;
                }
                int end2 = markup4.getEnd();
                int length3 = str2.length();
                if (end2 > length3) {
                    end2 = length3;
                }
                kxVar.b(skcVar2, start2, end2);
            } else if (i9 != 3) {
                p65Var.Y(1930214338);
                p65Var.p(false);
                wld.a.m("Markup type not handle: " + type, new Object[0]);
            } else {
                p65Var.Y(-294004488);
                AnchorType anchorType = markup4.getAnchorType();
                int i10 = anchorType == null ? -1 : vj5.a[anchorType.ordinal()];
                if (i10 == 1) {
                    p65Var.Y(-293939109);
                    p65Var.p(false);
                    skc skcVar3 = new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439);
                    int start3 = markup4.getStart();
                    if (start3 < 0) {
                        start3 = 0;
                    }
                    int end3 = markup4.getEnd();
                    int length4 = str2.length();
                    if (end3 > length4) {
                        end3 = length4;
                    }
                    kxVar.b(skcVar3, start3, end3);
                } else if (i10 != 2) {
                    p65Var.Y(1930210511);
                    p65Var.p(false);
                    wld.a.m("Markup anchor type not handle: " + anchorType, new Object[0]);
                } else {
                    p65Var.Y(-293474543);
                    skc skcVar4 = new skc(((zo7) p65Var.j(kt7.b)).r, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534);
                    int start4 = markup4.getStart();
                    if (start4 < 0) {
                        start4 = 0;
                    }
                    int end4 = markup4.getEnd();
                    int length5 = str2.length();
                    if (end4 > length5) {
                        end4 = length5;
                    }
                    kxVar.b(skcVar4, start4, end4);
                    p65Var.p(false);
                }
                p65Var.p(false);
            }
        }
        p65Var.p(false);
        if (iMin > i5) {
            p65Var.Y(1066681208);
            kxVar.b(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, ((zo7) p65Var.j(kt7.b)).j, (ohd) null, (i3c) null, 63487), i5, iMin);
        } else {
            p65Var.Y(1060419611);
        }
        p65Var.p(false);
        mx mxVarI = kxVar.i();
        p65Var.p(false);
        return mxVarI;
    }

    public static int z(float f2) {
        if (f2 < 1.0f) {
            return -16777216;
        }
        if (f2 > 99.0f) {
            return -1;
        }
        float f3 = (f2 + 16.0f) / 116.0f;
        float f4 = f2 > 8.0f ? f3 * f3 * f3 : f2 / 903.2963f;
        float f5 = f3 * f3 * f3;
        boolean z2 = f5 > 0.008856452f;
        float f6 = z2 ? f5 : ((f3 * 116.0f) - 16.0f) / 903.2963f;
        if (!z2) {
            f5 = ((f3 * 116.0f) - 16.0f) / 903.2963f;
        }
        float[] fArr = c;
        return rv1.a(f6 * fArr[0], f4 * fArr[1], f5 * fArr[2]);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object L(defpackage.bo4 r4, java.util.ArrayList r5, defpackage.p92 r6) {
        /*
            boolean r0 = r6 instanceof defpackage.mo4
            if (r0 == 0) goto L13
            r0 = r6
            mo4 r0 = (defpackage.mo4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            mo4 r0 = new mo4
            r0.<init>(r6)
        L18:
            java.lang.Object r6 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L31
            if (r2 != r3) goto L29
            java.util.ArrayList r4 = r0.b
            defpackage.br7.v(r6)
            return r4
        L29:
            r4 = 0
            java.lang.String r4 = com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf.hWqYin
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L31:
            defpackage.br7.v(r6)
            aq r6 = new aq
            r2 = 9
            r6.<init>(r2, r5)
            r0.b = r5
            r0.d = r3
            java.lang.Object r4 = r4.b(r6, r0)
            if (r4 != r1) goto L46
            return r1
        L46:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pxf.L(bo4, java.util.ArrayList, p92):java.lang.Object");
    }

    public static String O(int i2) {
        return i2 == 0 ? "Clear" : i2 == 1 ? "Src" : i2 == 2 ? "Dst" : i2 == 3 ? "SrcOver" : i2 == 4 ? "DstOver" : i2 == 5 ? "SrcIn" : i2 == 6 ? ivbZv.MTyjczZhaiv : i2 == 7 ? "SrcOut" : i2 == 8 ? "DstOut" : i2 == 9 ? "SrcAtop" : i2 == 10 ? "DstAtop" : i2 == 11 ? "Xor" : i2 == 12 ? "Plus" : i2 == 13 ? "Modulate" : i2 == 14 ? "Screen" : i2 == 15 ? "Overlay" : i2 == 16 ? "Darken" : i2 == 17 ? "Lighten" : i2 == 18 ? "ColorDodge" : i2 == 19 ? "ColorBurn" : i2 == 20 ? "HardLight" : i2 == 21 ? "Softlight" : i2 == 22 ? "Difference" : i2 == 23 ? "Exclusion" : i2 == 24 ? "Multiply" : i2 == 25 ? "Hue" : i2 == 26 ? "Saturation" : i2 == 27 ? "Color" : i2 == 28 ? "Luminosity" : "Unknown";
    }

    public static n0c y() {
        n0c n0cVar;
        n0c n0cVar2 = Q;
        if (n0cVar2 != null) {
            return n0cVar2;
        }
        Object obj = null;
        try {
            n0cVar = new n0c(Class.class.getMethod("isSealed", null), Class.class.getMethod("getPermittedSubclasses", null), Class.class.getMethod("isRecord", null), Class.class.getMethod(dpBiLjNeNsiASg.OenDY, null), 20);
        } catch (NoSuchMethodException unused) {
            n0cVar = new n0c(obj, obj, obj, obj, 20);
        }
        Q = n0cVar;
        return n0cVar;
    }
}

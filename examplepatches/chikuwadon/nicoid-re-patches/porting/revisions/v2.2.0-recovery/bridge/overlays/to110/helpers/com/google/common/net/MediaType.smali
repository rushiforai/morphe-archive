.class public final Lcom/google/common/net/MediaType;
.super Ljava/lang/Object;
.source "MediaType.java"


# annotations
.annotation runtime Lcom/google/errorprone/annotations/Immutable;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/net/MediaType$Tokenizer;
    }
.end annotation


# static fields
.field public static final AAC_AUDIO:Lcom/google/common/net/MediaType;

.field public static final ANY_APPLICATION_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_AUDIO_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_FONT_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_IMAGE_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_TEXT_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_VIDEO_TYPE:Lcom/google/common/net/MediaType;

.field public static final APPLE_MOBILE_CONFIG:Lcom/google/common/net/MediaType;

.field public static final APPLE_PASSBOOK:Lcom/google/common/net/MediaType;

.field public static final APPLICATION_BINARY:Lcom/google/common/net/MediaType;

.field public static final APPLICATION_GZIP:Lcom/google/common/net/MediaType;

.field private static final APPLICATION_TYPE:Ljava/lang/String; = "application"

.field public static final APPLICATION_XML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final ATOM_UTF_8:Lcom/google/common/net/MediaType;

.field private static final AUDIO_TYPE:Ljava/lang/String; = "audio"

.field public static final AVIF:Lcom/google/common/net/MediaType;

.field public static final BASIC_AUDIO:Lcom/google/common/net/MediaType;

.field public static final BMP:Lcom/google/common/net/MediaType;

.field public static final BZIP2:Lcom/google/common/net/MediaType;

.field public static final CACHE_MANIFEST_UTF_8:Lcom/google/common/net/MediaType;

.field public static final CBOR:Lcom/google/common/net/MediaType;

.field private static final CHARSET_ATTRIBUTE:Ljava/lang/String; = "charset"

.field public static final CRW:Lcom/google/common/net/MediaType;

.field public static final CSS_UTF_8:Lcom/google/common/net/MediaType;

.field public static final CSV_UTF_8:Lcom/google/common/net/MediaType;

.field public static final DART_UTF_8:Lcom/google/common/net/MediaType;

.field public static final EOT:Lcom/google/common/net/MediaType;

.field public static final EPUB:Lcom/google/common/net/MediaType;

.field public static final FLV_VIDEO:Lcom/google/common/net/MediaType;

.field public static final FONT_COLLECTION:Lcom/google/common/net/MediaType;

.field public static final FONT_OTF:Lcom/google/common/net/MediaType;

.field public static final FONT_SFNT:Lcom/google/common/net/MediaType;

.field public static final FONT_TTF:Lcom/google/common/net/MediaType;

.field private static final FONT_TYPE:Ljava/lang/String; = "font"

.field public static final FONT_WOFF:Lcom/google/common/net/MediaType;

.field public static final FONT_WOFF2:Lcom/google/common/net/MediaType;

.field public static final FORM_DATA:Lcom/google/common/net/MediaType;

.field public static final GEO_JSON:Lcom/google/common/net/MediaType;

.field public static final GIF:Lcom/google/common/net/MediaType;

.field public static final GZIP:Lcom/google/common/net/MediaType;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final HAL_JSON:Lcom/google/common/net/MediaType;

.field public static final HEIF:Lcom/google/common/net/MediaType;

.field public static final HTML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final ICO:Lcom/google/common/net/MediaType;

.field private static final IMAGE_TYPE:Ljava/lang/String; = "image"

.field public static final I_CALENDAR_UTF_8:Lcom/google/common/net/MediaType;

.field public static final JAVASCRIPT_UTF_8:Lcom/google/common/net/MediaType;

.field public static final JOSE:Lcom/google/common/net/MediaType;

.field public static final JOSE_JSON:Lcom/google/common/net/MediaType;

.field public static final JP2K:Lcom/google/common/net/MediaType;

.field public static final JPEG:Lcom/google/common/net/MediaType;

.field public static final JSON_UTF_8:Lcom/google/common/net/MediaType;

.field public static final JWT:Lcom/google/common/net/MediaType;

.field public static final KEY_ARCHIVE:Lcom/google/common/net/MediaType;

.field public static final KML:Lcom/google/common/net/MediaType;

.field public static final KMZ:Lcom/google/common/net/MediaType;

.field public static final L16_AUDIO:Lcom/google/common/net/MediaType;

.field public static final L24_AUDIO:Lcom/google/common/net/MediaType;

.field private static final LINEAR_WHITE_SPACE:Lcom/google/common/base/CharMatcher;

.field public static final MANIFEST_JSON_UTF_8:Lcom/google/common/net/MediaType;

.field public static final MBOX:Lcom/google/common/net/MediaType;

.field public static final MD_UTF_8:Lcom/google/common/net/MediaType;

.field public static final MEDIA_PRESENTATION_DESCRIPTION:Lcom/google/common/net/MediaType;

.field public static final MICROSOFT_EXCEL:Lcom/google/common/net/MediaType;

.field public static final MICROSOFT_OUTLOOK:Lcom/google/common/net/MediaType;

.field public static final MICROSOFT_POWERPOINT:Lcom/google/common/net/MediaType;

.field public static final MICROSOFT_WORD:Lcom/google/common/net/MediaType;

.field public static final MP4_AUDIO:Lcom/google/common/net/MediaType;

.field public static final MP4_VIDEO:Lcom/google/common/net/MediaType;

.field public static final MPEG_AUDIO:Lcom/google/common/net/MediaType;

.field public static final MPEG_VIDEO:Lcom/google/common/net/MediaType;

.field public static final NACL_APPLICATION:Lcom/google/common/net/MediaType;

.field public static final NACL_PORTABLE_APPLICATION:Lcom/google/common/net/MediaType;

.field public static final OCTET_STREAM:Lcom/google/common/net/MediaType;

.field public static final OGG_AUDIO:Lcom/google/common/net/MediaType;

.field public static final OGG_CONTAINER:Lcom/google/common/net/MediaType;

.field public static final OGG_VIDEO:Lcom/google/common/net/MediaType;

.field public static final OOXML_DOCUMENT:Lcom/google/common/net/MediaType;

.field public static final OOXML_PRESENTATION:Lcom/google/common/net/MediaType;

.field public static final OOXML_SHEET:Lcom/google/common/net/MediaType;

.field public static final OPENDOCUMENT_GRAPHICS:Lcom/google/common/net/MediaType;

.field public static final OPENDOCUMENT_PRESENTATION:Lcom/google/common/net/MediaType;

.field public static final OPENDOCUMENT_SPREADSHEET:Lcom/google/common/net/MediaType;

.field public static final OPENDOCUMENT_TEXT:Lcom/google/common/net/MediaType;

.field public static final OPENSEARCH_DESCRIPTION_UTF_8:Lcom/google/common/net/MediaType;

.field private static final PARAMETER_JOINER:Lcom/google/common/base/Joiner$MapJoiner;

.field private static final PARAMETER_VALUE_MATCHER:Lcom/google/common/base/CharMatcher;

.field public static final PDF:Lcom/google/common/net/MediaType;

.field public static final PEM:Lcom/google/common/net/MediaType;

.field public static final PLAIN_TEXT_UTF_8:Lcom/google/common/net/MediaType;

.field public static final PNG:Lcom/google/common/net/MediaType;

.field public static final POSTSCRIPT:Lcom/google/common/net/MediaType;

.field public static final PROTOBUF:Lcom/google/common/net/MediaType;

.field public static final PSD:Lcom/google/common/net/MediaType;

.field public static final QUICKTIME:Lcom/google/common/net/MediaType;

.field private static final QUOTED_TEXT_MATCHER:Lcom/google/common/base/CharMatcher;

.field public static final RDF_XML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final RTF_UTF_8:Lcom/google/common/net/MediaType;

.field public static final SFNT:Lcom/google/common/net/MediaType;

.field public static final SHOCKWAVE_FLASH:Lcom/google/common/net/MediaType;

.field public static final SKETCHUP:Lcom/google/common/net/MediaType;

.field public static final SOAP_XML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final SVG_UTF_8:Lcom/google/common/net/MediaType;

.field public static final TAR:Lcom/google/common/net/MediaType;

.field public static final TEXT_JAVASCRIPT_UTF_8:Lcom/google/common/net/MediaType;

.field private static final TEXT_TYPE:Ljava/lang/String; = "text"

.field public static final THREE_GPP2_VIDEO:Lcom/google/common/net/MediaType;

.field public static final THREE_GPP_VIDEO:Lcom/google/common/net/MediaType;

.field public static final TIFF:Lcom/google/common/net/MediaType;

.field private static final TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

.field public static final TSV_UTF_8:Lcom/google/common/net/MediaType;

.field private static final UTF_8_CONSTANT_PARAMETERS:Lcom/google/common/collect/ImmutableListMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableListMultimap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final VCARD_UTF_8:Lcom/google/common/net/MediaType;

.field private static final VIDEO_TYPE:Ljava/lang/String; = "video"

.field public static final VND_REAL_AUDIO:Lcom/google/common/net/MediaType;

.field public static final VND_WAVE_AUDIO:Lcom/google/common/net/MediaType;

.field public static final VORBIS_AUDIO:Lcom/google/common/net/MediaType;

.field public static final VTT_UTF_8:Lcom/google/common/net/MediaType;

.field public static final WASM_APPLICATION:Lcom/google/common/net/MediaType;

.field public static final WAX_AUDIO:Lcom/google/common/net/MediaType;

.field public static final WEBM_AUDIO:Lcom/google/common/net/MediaType;

.field public static final WEBM_VIDEO:Lcom/google/common/net/MediaType;

.field public static final WEBP:Lcom/google/common/net/MediaType;

.field private static final WILDCARD:Ljava/lang/String; = "*"

.field public static final WMA_AUDIO:Lcom/google/common/net/MediaType;

.field public static final WML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final WMV:Lcom/google/common/net/MediaType;

.field public static final WOFF:Lcom/google/common/net/MediaType;

.field public static final WOFF2:Lcom/google/common/net/MediaType;

.field public static final XHTML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final XML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final XRD_UTF_8:Lcom/google/common/net/MediaType;

.field public static final YAML:Lcom/google/common/net/MediaType;

.field public static final ZIP:Lcom/google/common/net/MediaType;

.field private static final knownTypes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/common/net/MediaType;",
            "Lcom/google/common/net/MediaType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private hashCode:I
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation
.end field

.field private final parameters:Lcom/google/common/collect/ImmutableListMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableListMultimap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private parsedCharset:Lcom/google/common/base/Optional;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional<",
            "Ljava/nio/charset/Charset;",
            ">;"
        }
    .end annotation
.end field

.field private final subtype:Ljava/lang/String;

.field private toString:Ljava/lang/String;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation
.end field

.field private final type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .line 80
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 81
    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "charset"

    invoke-static {v1, v0}, Lcom/google/common/collect/ImmutableListMultimap;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->UTF_8_CONSTANT_PARAMETERS:Lcom/google/common/collect/ImmutableListMultimap;

    .line 85
    invoke-static {}, Lcom/google/common/base/CharMatcher;->ascii()Lcom/google/common/base/CharMatcher;

    move-result-object v0

    .line 86
    invoke-static {}, Lcom/google/common/base/CharMatcher;->javaIsoControl()Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/base/CharMatcher;->negate()Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    const/16 v1, 0x20

    .line 87
    invoke-static {v1}, Lcom/google/common/base/CharMatcher;->isNot(C)Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    const-string v1, "()<>@,;:\\\"/[]?="

    .line 88
    invoke-static {v1}, Lcom/google/common/base/CharMatcher;->noneOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    .line 91
    invoke-static {}, Lcom/google/common/base/CharMatcher;->ascii()Lcom/google/common/base/CharMatcher;

    move-result-object v0

    invoke-static {}, Lcom/google/common/base/CharMatcher;->javaIsoControl()Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/base/CharMatcher;->negate()Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    const/16 v1, 0x9

    invoke-static {v1}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PARAMETER_VALUE_MATCHER:Lcom/google/common/base/CharMatcher;

    .line 93
    const-string v1, "\"\\"

    .line 94
    invoke-static {v1}, Lcom/google/common/base/CharMatcher;->noneOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->QUOTED_TEXT_MATCHER:Lcom/google/common/base/CharMatcher;

    .line 100
    const-string v0, " \t\r\n"

    invoke-static {v0}, Lcom/google/common/base/CharMatcher;->anyOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->LINEAR_WHITE_SPACE:Lcom/google/common/base/CharMatcher;

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/common/net/MediaType;->knownTypes:Ljava/util/Map;

    .line 143
    const-string v0, "*"

    invoke-static {v0, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->ANY_TYPE:Lcom/google/common/net/MediaType;

    .line 146
    const-string v1, "text"

    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v2

    sput-object v2, Lcom/google/common/net/MediaType;->ANY_TEXT_TYPE:Lcom/google/common/net/MediaType;

    .line 149
    const-string v2, "image"

    invoke-static {v2, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v3

    sput-object v3, Lcom/google/common/net/MediaType;->ANY_IMAGE_TYPE:Lcom/google/common/net/MediaType;

    .line 152
    const-string v3, "audio"

    invoke-static {v3, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v4

    sput-object v4, Lcom/google/common/net/MediaType;->ANY_AUDIO_TYPE:Lcom/google/common/net/MediaType;

    .line 155
    const-string v4, "video"

    invoke-static {v4, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v5

    sput-object v5, Lcom/google/common/net/MediaType;->ANY_VIDEO_TYPE:Lcom/google/common/net/MediaType;

    .line 158
    const-string v5, "application"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v6

    sput-object v6, Lcom/google/common/net/MediaType;->ANY_APPLICATION_TYPE:Lcom/google/common/net/MediaType;

    .line 165
    const-string v6, "font"

    invoke-static {v6, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ANY_FONT_TYPE:Lcom/google/common/net/MediaType;

    .line 173
    const-string v0, "cache-manifest"

    .line 174
    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->CACHE_MANIFEST_UTF_8:Lcom/google/common/net/MediaType;

    .line 177
    const-string v0, "css"

    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->CSS_UTF_8:Lcom/google/common/net/MediaType;

    .line 180
    const-string v0, "csv"

    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->CSV_UTF_8:Lcom/google/common/net/MediaType;

    .line 183
    const-string v0, "html"

    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->HTML_UTF_8:Lcom/google/common/net/MediaType;

    .line 186
    const-string v0, "calendar"

    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->I_CALENDAR_UTF_8:Lcom/google/common/net/MediaType;

    .line 194
    const-string v0, "markdown"

    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MD_UTF_8:Lcom/google/common/net/MediaType;

    .line 197
    const-string v0, "plain"

    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PLAIN_TEXT_UTF_8:Lcom/google/common/net/MediaType;

    .line 204
    const-string v0, "javascript"

    invoke-static {v1, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v7

    sput-object v7, Lcom/google/common/net/MediaType;->TEXT_JAVASCRIPT_UTF_8:Lcom/google/common/net/MediaType;

    .line 212
    const-string v7, "tab-separated-values"

    invoke-static {v1, v7}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v7

    sput-object v7, Lcom/google/common/net/MediaType;->TSV_UTF_8:Lcom/google/common/net/MediaType;

    .line 215
    const-string v7, "vcard"

    invoke-static {v1, v7}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v7

    sput-object v7, Lcom/google/common/net/MediaType;->VCARD_UTF_8:Lcom/google/common/net/MediaType;

    .line 223
    const-string v7, "vnd.wap.wml"

    invoke-static {v1, v7}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v7

    sput-object v7, Lcom/google/common/net/MediaType;->WML_UTF_8:Lcom/google/common/net/MediaType;

    .line 230
    const-string v7, "xml"

    invoke-static {v1, v7}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v8

    sput-object v8, Lcom/google/common/net/MediaType;->XML_UTF_8:Lcom/google/common/net/MediaType;

    .line 238
    const-string v8, "vtt"

    invoke-static {v1, v8}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->VTT_UTF_8:Lcom/google/common/net/MediaType;

    .line 247
    const-string v1, "bmp"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->BMP:Lcom/google/common/net/MediaType;

    .line 258
    const-string v1, "x-canon-crw"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->CRW:Lcom/google/common/net/MediaType;

    .line 264
    const-string v1, "gif"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->GIF:Lcom/google/common/net/MediaType;

    .line 267
    const-string v1, "vnd.microsoft.icon"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->ICO:Lcom/google/common/net/MediaType;

    .line 270
    const-string v1, "jpeg"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->JPEG:Lcom/google/common/net/MediaType;

    .line 273
    const-string v1, "png"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->PNG:Lcom/google/common/net/MediaType;

    .line 292
    const-string v1, "vnd.adobe.photoshop"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->PSD:Lcom/google/common/net/MediaType;

    .line 295
    const-string v1, "svg+xml"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->SVG_UTF_8:Lcom/google/common/net/MediaType;

    .line 298
    const-string v1, "tiff"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->TIFF:Lcom/google/common/net/MediaType;

    .line 305
    const-string v1, "avif"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->AVIF:Lcom/google/common/net/MediaType;

    .line 312
    const-string v1, "webp"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->WEBP:Lcom/google/common/net/MediaType;

    .line 319
    const-string v1, "heif"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->HEIF:Lcom/google/common/net/MediaType;

    .line 326
    const-string v1, "jp2"

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->JP2K:Lcom/google/common/net/MediaType;

    .line 330
    const-string v1, "mp4"

    invoke-static {v3, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v2

    sput-object v2, Lcom/google/common/net/MediaType;->MP4_AUDIO:Lcom/google/common/net/MediaType;

    .line 333
    const-string v2, "mpeg"

    invoke-static {v3, v2}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v8

    sput-object v8, Lcom/google/common/net/MediaType;->MPEG_AUDIO:Lcom/google/common/net/MediaType;

    .line 336
    const-string v8, "ogg"

    invoke-static {v3, v8}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v9

    sput-object v9, Lcom/google/common/net/MediaType;->OGG_AUDIO:Lcom/google/common/net/MediaType;

    .line 339
    const-string v9, "webm"

    invoke-static {v3, v9}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->WEBM_AUDIO:Lcom/google/common/net/MediaType;

    .line 346
    const-string v10, "l16"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->L16_AUDIO:Lcom/google/common/net/MediaType;

    .line 353
    const-string v10, "l24"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->L24_AUDIO:Lcom/google/common/net/MediaType;

    .line 361
    const-string v10, "basic"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->BASIC_AUDIO:Lcom/google/common/net/MediaType;

    .line 369
    const-string v10, "aac"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->AAC_AUDIO:Lcom/google/common/net/MediaType;

    .line 376
    const-string v10, "vorbis"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->VORBIS_AUDIO:Lcom/google/common/net/MediaType;

    .line 385
    const-string v10, "x-ms-wma"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->WMA_AUDIO:Lcom/google/common/net/MediaType;

    .line 394
    const-string v10, "x-ms-wax"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->WAX_AUDIO:Lcom/google/common/net/MediaType;

    .line 402
    const-string v10, "vnd.rn-realaudio"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v10

    sput-object v10, Lcom/google/common/net/MediaType;->VND_REAL_AUDIO:Lcom/google/common/net/MediaType;

    .line 409
    const-string v10, "vnd.wave"

    invoke-static {v3, v10}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v3

    sput-object v3, Lcom/google/common/net/MediaType;->VND_WAVE_AUDIO:Lcom/google/common/net/MediaType;

    .line 413
    invoke-static {v4, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->MP4_VIDEO:Lcom/google/common/net/MediaType;

    .line 416
    invoke-static {v4, v2}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->MPEG_VIDEO:Lcom/google/common/net/MediaType;

    .line 419
    invoke-static {v4, v8}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->OGG_VIDEO:Lcom/google/common/net/MediaType;

    .line 422
    const-string v1, "quicktime"

    invoke-static {v4, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->QUICKTIME:Lcom/google/common/net/MediaType;

    .line 425
    invoke-static {v4, v9}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->WEBM_VIDEO:Lcom/google/common/net/MediaType;

    .line 432
    const-string v1, "x-ms-wmv"

    invoke-static {v4, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->WMV:Lcom/google/common/net/MediaType;

    .line 441
    const-string v1, "x-flv"

    invoke-static {v4, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->FLV_VIDEO:Lcom/google/common/net/MediaType;

    .line 450
    const-string v1, "3gpp"

    invoke-static {v4, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->THREE_GPP_VIDEO:Lcom/google/common/net/MediaType;

    .line 459
    const-string v1, "3gpp2"

    invoke-static {v4, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->THREE_GPP2_VIDEO:Lcom/google/common/net/MediaType;

    .line 469
    invoke-static {v5, v7}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->APPLICATION_XML_UTF_8:Lcom/google/common/net/MediaType;

    .line 472
    const-string v1, "atom+xml"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->ATOM_UTF_8:Lcom/google/common/net/MediaType;

    .line 475
    const-string v1, "x-bzip2"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->BZIP2:Lcom/google/common/net/MediaType;

    .line 483
    const-string v1, "dart"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->DART_UTF_8:Lcom/google/common/net/MediaType;

    .line 492
    const-string v1, "vnd.apple.pkpass"

    .line 493
    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->APPLE_PASSBOOK:Lcom/google/common/net/MediaType;

    .line 502
    const-string v1, "vnd.ms-fontobject"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->EOT:Lcom/google/common/net/MediaType;

    .line 513
    const-string v1, "epub+zip"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->EPUB:Lcom/google/common/net/MediaType;

    .line 516
    const-string v1, "x-www-form-urlencoded"

    .line 517
    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->FORM_DATA:Lcom/google/common/net/MediaType;

    .line 526
    const-string v1, "pkcs12"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->KEY_ARCHIVE:Lcom/google/common/net/MediaType;

    .line 538
    const-string v1, "binary"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->APPLICATION_BINARY:Lcom/google/common/net/MediaType;

    .line 547
    const-string v1, "cbor"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->CBOR:Lcom/google/common/net/MediaType;

    .line 555
    const-string v1, "geo+json"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->GEO_JSON:Lcom/google/common/net/MediaType;

    .line 566
    const-string v1, "gzip"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->APPLICATION_GZIP:Lcom/google/common/net/MediaType;

    .line 575
    const-string v1, "x-gzip"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->GZIP:Lcom/google/common/net/MediaType;

    .line 583
    const-string v1, "hal+json"

    invoke-static {v5, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v1

    sput-object v1, Lcom/google/common/net/MediaType;->HAL_JSON:Lcom/google/common/net/MediaType;

    .line 591
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->JAVASCRIPT_UTF_8:Lcom/google/common/net/MediaType;

    .line 599
    const-string v0, "jose"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->JOSE:Lcom/google/common/net/MediaType;

    .line 607
    const-string v0, "jose+json"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->JOSE_JSON:Lcom/google/common/net/MediaType;

    .line 610
    const-string v0, "json"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->JSON_UTF_8:Lcom/google/common/net/MediaType;

    .line 617
    const-string v0, "jwt"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->JWT:Lcom/google/common/net/MediaType;

    .line 624
    const-string v0, "manifest+json"

    .line 625
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MANIFEST_JSON_UTF_8:Lcom/google/common/net/MediaType;

    .line 630
    const-string v0, "vnd.google-earth.kml+xml"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->KML:Lcom/google/common/net/MediaType;

    .line 636
    const-string v0, "vnd.google-earth.kmz"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->KMZ:Lcom/google/common/net/MediaType;

    .line 643
    const-string v0, "mbox"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MBOX:Lcom/google/common/net/MediaType;

    .line 652
    const-string v0, "x-apple-aspen-config"

    .line 653
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->APPLE_MOBILE_CONFIG:Lcom/google/common/net/MediaType;

    .line 660
    const-string v0, "vnd.ms-excel"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MICROSOFT_EXCEL:Lcom/google/common/net/MediaType;

    .line 668
    const-string v0, "vnd.ms-outlook"

    .line 669
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MICROSOFT_OUTLOOK:Lcom/google/common/net/MediaType;

    .line 676
    const-string v0, "vnd.ms-powerpoint"

    .line 677
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MICROSOFT_POWERPOINT:Lcom/google/common/net/MediaType;

    .line 684
    const-string v0, "msword"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MICROSOFT_WORD:Lcom/google/common/net/MediaType;

    .line 695
    const-string v0, "dash+xml"

    .line 696
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MEDIA_PRESENTATION_DESCRIPTION:Lcom/google/common/net/MediaType;

    .line 704
    const-string v0, "wasm"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->WASM_APPLICATION:Lcom/google/common/net/MediaType;

    .line 713
    const-string v0, "x-nacl"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->NACL_APPLICATION:Lcom/google/common/net/MediaType;

    .line 721
    const-string v0, "x-pem-file"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PEM:Lcom/google/common/net/MediaType;

    .line 730
    const-string v0, "x-pnacl"

    .line 731
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->NACL_PORTABLE_APPLICATION:Lcom/google/common/net/MediaType;

    .line 734
    const-string v0, "octet-stream"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OCTET_STREAM:Lcom/google/common/net/MediaType;

    .line 737
    invoke-static {v5, v8}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OGG_CONTAINER:Lcom/google/common/net/MediaType;

    .line 744
    const-string v0, "vnd.openxmlformats-officedocument.wordprocessingml.document"

    .line 745
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OOXML_DOCUMENT:Lcom/google/common/net/MediaType;

    .line 753
    const-string v0, "vnd.openxmlformats-officedocument.presentationml.presentation"

    .line 754
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OOXML_PRESENTATION:Lcom/google/common/net/MediaType;

    .line 762
    const-string v0, "vnd.openxmlformats-officedocument.spreadsheetml.sheet"

    .line 763
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OOXML_SHEET:Lcom/google/common/net/MediaType;

    .line 770
    const-string v0, "vnd.oasis.opendocument.graphics"

    .line 771
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENDOCUMENT_GRAPHICS:Lcom/google/common/net/MediaType;

    .line 778
    const-string v0, "vnd.oasis.opendocument.presentation"

    .line 779
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENDOCUMENT_PRESENTATION:Lcom/google/common/net/MediaType;

    .line 786
    const-string v0, "vnd.oasis.opendocument.spreadsheet"

    .line 787
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENDOCUMENT_SPREADSHEET:Lcom/google/common/net/MediaType;

    .line 794
    const-string v0, "vnd.oasis.opendocument.text"

    .line 795
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENDOCUMENT_TEXT:Lcom/google/common/net/MediaType;

    .line 804
    const-string v0, "opensearchdescription+xml"

    .line 805
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENSEARCH_DESCRIPTION_UTF_8:Lcom/google/common/net/MediaType;

    .line 808
    const-string v0, "pdf"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PDF:Lcom/google/common/net/MediaType;

    .line 811
    const-string v0, "postscript"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->POSTSCRIPT:Lcom/google/common/net/MediaType;

    .line 818
    const-string v0, "protobuf"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PROTOBUF:Lcom/google/common/net/MediaType;

    .line 828
    const-string v0, "rdf+xml"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->RDF_XML_UTF_8:Lcom/google/common/net/MediaType;

    .line 831
    const-string v0, "rtf"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->RTF_UTF_8:Lcom/google/common/net/MediaType;

    .line 840
    const-string v0, "font-sfnt"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->SFNT:Lcom/google/common/net/MediaType;

    .line 843
    const-string v0, "x-shockwave-flash"

    .line 844
    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->SHOCKWAVE_FLASH:Lcom/google/common/net/MediaType;

    .line 852
    const-string v0, "vnd.sketchup.skp"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->SKETCHUP:Lcom/google/common/net/MediaType;

    .line 865
    const-string v0, "soap+xml"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->SOAP_XML_UTF_8:Lcom/google/common/net/MediaType;

    .line 868
    const-string v0, "x-tar"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->TAR:Lcom/google/common/net/MediaType;

    .line 877
    const-string v0, "font-woff"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->WOFF:Lcom/google/common/net/MediaType;

    .line 886
    const-string v0, "font-woff2"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->WOFF2:Lcom/google/common/net/MediaType;

    .line 889
    const-string v0, "xhtml+xml"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->XHTML_UTF_8:Lcom/google/common/net/MediaType;

    .line 899
    const-string v0, "xrd+xml"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->XRD_UTF_8:Lcom/google/common/net/MediaType;

    .line 902
    const-string v0, "zip"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ZIP:Lcom/google/common/net/MediaType;

    .line 912
    const-string v0, "collection"

    invoke-static {v6, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->FONT_COLLECTION:Lcom/google/common/net/MediaType;

    .line 920
    const-string v0, "otf"

    invoke-static {v6, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->FONT_OTF:Lcom/google/common/net/MediaType;

    .line 930
    const-string v0, "sfnt"

    invoke-static {v6, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->FONT_SFNT:Lcom/google/common/net/MediaType;

    .line 938
    const-string v0, "ttf"

    invoke-static {v6, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->FONT_TTF:Lcom/google/common/net/MediaType;

    .line 948
    const-string v0, "woff"

    invoke-static {v6, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->FONT_WOFF:Lcom/google/common/net/MediaType;

    .line 958
    const-string v0, "woff2"

    invoke-static {v6, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->FONT_WOFF2:Lcom/google/common/net/MediaType;

    .line 966
    const-string v0, "yaml"

    invoke-static {v5, v0}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->YAML:Lcom/google/common/net/MediaType;

    .line 1381
    const-string v0, "; "

    invoke-static {v0}, Lcom/google/common/base/Joiner;->on(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Lcom/google/common/base/Joiner;->withKeyValueSeparator(Ljava/lang/String;)Lcom/google/common/base/Joiner$MapJoiner;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PARAMETER_JOINER:Lcom/google/common/base/Joiner$MapJoiner;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "type",
            "subtype",
            "parameters"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/common/collect/ImmutableListMultimap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 981
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 982
    iput-object p1, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    .line 983
    iput-object p2, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    .line 984
    iput-object p3, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    return-void
.end method

.method private static addKnownType(Lcom/google/common/net/MediaType;)Lcom/google/common/net/MediaType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mediaType"
        }
    .end annotation

    .line 128
    sget-object v0, Lcom/google/common/net/MediaType;->knownTypes:Ljava/util/Map;

    invoke-interface {v0, p0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method private computeToString()Ljava/lang/String;
    .registers 3

    .line 1399
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1400
    iget-object v1, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableListMultimap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1401
    const-string v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1402
    iget-object p0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    new-instance v1, Lcom/google/common/net/MediaType$0;

    invoke-direct {v1}, Lcom/google/common/net/MediaType$0;-><init>()V

    .line 1403
    invoke-static {p0, v1}, Lcom/google/common/collect/Multimaps;->transformValues(Lcom/google/common/collect/ListMultimap;Lcom/google/common/base/Function;)Lcom/google/common/collect/ListMultimap;

    move-result-object p0

    .line 1409
    sget-object v1, Lcom/google/common/net/MediaType;->PARAMETER_JOINER:Lcom/google/common/base/Joiner$MapJoiner;

    invoke-interface {p0}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object p0

    invoke-virtual {v1, v0, p0}, Lcom/google/common/base/Joiner$MapJoiner;->appendTo(Ljava/lang/StringBuilder;Ljava/lang/Iterable;)Ljava/lang/StringBuilder;

    .line 1411
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static consumeSeparator(Lcom/google/common/net/MediaType$Tokenizer;C)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "tokenizer",
            "c"
        }
    .end annotation

    .line 1301
    sget-object v0, Lcom/google/common/net/MediaType;->LINEAR_WHITE_SPACE:Lcom/google/common/base/CharMatcher;

    invoke-virtual {p0, v0}, Lcom/google/common/net/MediaType$Tokenizer;->consumeTokenIfPresent(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    .line 1302
    invoke-virtual {p0, p1}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 1303
    invoke-virtual {p0, v0}, Lcom/google/common/net/MediaType$Tokenizer;->consumeTokenIfPresent(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "type",
            "subtype"
        }
    .end annotation

    .line 1161
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->of()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;

    move-result-object p0

    .line 1162
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/net/MediaType;->parsedCharset:Lcom/google/common/base/Optional;

    return-object p0
.end method

.method private static create(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "type",
            "subtype",
            "parameters"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/common/collect/Multimap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/common/net/MediaType;"
        }
    .end annotation

    .line 1168
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1169
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1170
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1171
    invoke-static {p0}, Lcom/google/common/net/MediaType;->normalizeToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1172
    invoke-static {p1}, Lcom/google/common/net/MediaType;->normalizeToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1174
    const-string v0, "*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v1, "A wildcard type cannot be used with a non-wildcard subtype"

    .line 1173
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 1176
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->builder()Lcom/google/common/collect/ImmutableListMultimap$Builder;

    move-result-object v0

    .line 1177
    invoke-interface {p2}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1178
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/google/common/net/MediaType;->normalizeToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1179
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/google/common/net/MediaType;->normalizeParameterValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    goto :goto_1

    .line 1181
    :cond_1
    new-instance p2, Lcom/google/common/net/MediaType;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->build()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    invoke-direct {p2, p0, p1, v0}, Lcom/google/common/net/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V

    .line 1184
    sget-object p0, Lcom/google/common/net/MediaType;->knownTypes:Ljava/util/Map;

    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/net/MediaType;

    invoke-static {p0, p2}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/net/MediaType;

    return-object p0
.end method

.method static createApplicationType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "subtype"
        }
    .end annotation

    .line 1194
    const-string v0, "application"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

.method static createAudioType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "subtype"
        }
    .end annotation

    .line 1203
    const-string v0, "audio"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

.method private static createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "type",
            "subtype"
        }
    .end annotation

    .line 115
    new-instance v0, Lcom/google/common/net/MediaType;

    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->of()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/net/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V

    invoke-static {v0}, Lcom/google/common/net/MediaType;->addKnownType(Lcom/google/common/net/MediaType;)Lcom/google/common/net/MediaType;

    move-result-object p0

    .line 116
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/net/MediaType;->parsedCharset:Lcom/google/common/base/Optional;

    return-object p0
.end method

.method private static createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "type",
            "subtype"
        }
    .end annotation

    .line 121
    new-instance v0, Lcom/google/common/net/MediaType;

    sget-object v1, Lcom/google/common/net/MediaType;->UTF_8_CONSTANT_PARAMETERS:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/net/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V

    invoke-static {v0}, Lcom/google/common/net/MediaType;->addKnownType(Lcom/google/common/net/MediaType;)Lcom/google/common/net/MediaType;

    move-result-object p0

    .line 122
    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/net/MediaType;->parsedCharset:Lcom/google/common/base/Optional;

    return-object p0
.end method

.method static createFontType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "subtype"
        }
    .end annotation

    .line 1212
    const-string v0, "font"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

.method static createImageType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "subtype"
        }
    .end annotation

    .line 1221
    const-string v0, "image"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

.method static createTextType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "subtype"
        }
    .end annotation

    .line 1230
    const-string v0, "text"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

.method static createVideoType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "subtype"
        }
    .end annotation

    .line 1239
    const-string v0, "video"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

.method private static escapeAndQuote(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 1415
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x10

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    .line 1416
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 1417
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5c

    if-eq v3, v4, :cond_0

    if-ne v3, v1, :cond_1

    .line 1419
    :cond_0
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1421
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1423
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$computeToString$0(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 1406
    sget-object v0, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, p0}, Lcom/google/common/base/CharMatcher;->matchesAllOf(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    .line 1408
    :cond_0
    invoke-static {p0}, Lcom/google/common/net/MediaType;->escapeAndQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static normalizeParameterValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "attribute",
            "value"
        }
    .end annotation

    .line 1249
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1250
    sget-object v0, Lcom/google/common/net/MediaType;->PARAMETER_VALUE_MATCHER:Lcom/google/common/base/CharMatcher;

    .line 1251
    invoke-virtual {v0, p1}, Lcom/google/common/base/CharMatcher;->matchesAllOf(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "parameter values must contain only ASCII and no control characters: %s"

    .line 1250
    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 1254
    const-string v0, "charset"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p1
.end method

.method private static normalizeToken(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "token"
        }
    .end annotation

    .line 1243
    sget-object v0, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, p0}, Lcom/google/common/base/CharMatcher;->matchesAllOf(Ljava/lang/CharSequence;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1244
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1245
    invoke-static {p0}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private parametersAsMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/common/collect/ImmutableMultiset<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1003
    iget-object p0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableListMultimap;->asMap()Lcom/google/common/collect/ImmutableMap;

    move-result-object p0

    new-instance v0, Lcom/google/common/net/MediaType$1;

    invoke-direct {v0}, Lcom/google/common/net/MediaType$1;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/collect/Maps;->transformValues(Ljava/util/Map;Lcom/google/common/base/Function;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static parse(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 1264
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1265
    new-instance v0, Lcom/google/common/net/MediaType$Tokenizer;

    invoke-direct {v0, p0}, Lcom/google/common/net/MediaType$Tokenizer;-><init>(Ljava/lang/String;)V

    .line 1267
    :try_start_0
    sget-object v1, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, v1}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2f

    .line 1268
    invoke-static {v0, v3}, Lcom/google/common/net/MediaType;->consumeSeparator(Lcom/google/common/net/MediaType$Tokenizer;C)V

    .line 1269
    invoke-virtual {v0, v1}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v1

    .line 1270
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->builder()Lcom/google/common/collect/ImmutableListMultimap$Builder;

    move-result-object v3

    .line 1271
    :goto_0
    invoke-virtual {v0}, Lcom/google/common/net/MediaType$Tokenizer;->hasMore()Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 v4, 0x3b

    .line 1272
    invoke-static {v0, v4}, Lcom/google/common/net/MediaType;->consumeSeparator(Lcom/google/common/net/MediaType$Tokenizer;C)V

    .line 1273
    sget-object v4, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, v4}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x3d

    .line 1274
    invoke-static {v0, v6}, Lcom/google/common/net/MediaType;->consumeSeparator(Lcom/google/common/net/MediaType$Tokenizer;C)V

    .line 1276
    invoke-virtual {v0}, Lcom/google/common/net/MediaType$Tokenizer;->previewChar()C

    move-result v6

    const/16 v7, 0x22

    if-ne v6, v7, :cond_2

    .line 1277
    invoke-virtual {v0, v7}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 1278
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1279
    :goto_1
    invoke-virtual {v0}, Lcom/google/common/net/MediaType$Tokenizer;->previewChar()C

    move-result v6

    if-eq v6, v7, :cond_1

    .line 1280
    invoke-virtual {v0}, Lcom/google/common/net/MediaType$Tokenizer;->previewChar()C

    move-result v6

    const/16 v8, 0x5c

    if-ne v6, v8, :cond_0

    .line 1281
    invoke-virtual {v0, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 1282
    sget-object v6, Lcom/google/common/net/MediaType;->PARAMETER_VALUE_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, v6}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(Lcom/google/common/base/CharMatcher;)C

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1284
    :cond_0
    sget-object v6, Lcom/google/common/net/MediaType;->QUOTED_TEXT_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, v6}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1287
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1288
    invoke-virtual {v0, v7}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    goto :goto_2

    .line 1290
    :cond_2
    invoke-virtual {v0, v4}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v4

    .line 1292
    :goto_2
    invoke-virtual {v3, v5, v4}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    goto :goto_0

    .line 1294
    :cond_3
    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->build()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    invoke-static {v2, v1, v0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    .line 1296
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Could not parse \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\'"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public charset()Lcom/google/common/base/Optional;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional<",
            "Ljava/nio/charset/Charset;",
            ">;"
        }
    .end annotation

    .line 1016
    iget-object v0, p0, Lcom/google/common/net/MediaType;->parsedCharset:Lcom/google/common/base/Optional;

    if-nez v0, :cond_3

    .line 1019
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v0

    .line 1020
    iget-object v1, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    const-string v2, "charset"

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableListMultimap;->get(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v1

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v2, :cond_1

    .line 1023
    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v0

    move-object v2, v3

    goto :goto_0

    .line 1024
    :cond_1
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1025
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Multiple charset values defined: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1029
    :cond_2
    iput-object v0, p0, Lcom/google/common/net/MediaType;->parsedCharset:Lcom/google/common/base/Optional;

    :cond_3
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1359
    :cond_0
    instance-of v1, p1, Lcom/google/common/net/MediaType;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 1360
    check-cast p1, Lcom/google/common/net/MediaType;

    .line 1361
    iget-object v1, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    .line 1362
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1364
    invoke-direct {p0}, Lcom/google/common/net/MediaType;->parametersAsMap()Ljava/util/Map;

    move-result-object p0

    invoke-direct {p1}, Lcom/google/common/net/MediaType;->parametersAsMap()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public hasWildcard()Z
    .registers 3

    .line 1116
    iget-object v0, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public hashCode()I
    .registers 4

    .line 1373
    iget v0, p0, Lcom/google/common/net/MediaType;->hashCode:I

    if-nez v0, :cond_0

    .line 1375
    iget-object v0, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/common/net/MediaType;->parametersAsMap()Ljava/util/Map;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    .line 1376
    iput v0, p0, Lcom/google/common/net/MediaType;->hashCode:I

    :cond_0
    return v0
.end method

.method public is(Lcom/google/common/net/MediaType;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mediaTypeRange"
        }
    .end annotation

    .line 1149
    iget-object v0, p1, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p1, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    .line 1150
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    iget-object p0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    .line 1151
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableListMultimap;->entries()Lcom/google/common/collect/ImmutableCollection;

    move-result-object p0

    iget-object p1, p1, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableListMultimap;->entries()Lcom/google/common/collect/ImmutableCollection;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableCollection;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public parameters()Lcom/google/common/collect/ImmutableListMultimap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableListMultimap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 999
    iget-object p0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    return-object p0
.end method

.method public subtype()Ljava/lang/String;
    .registers 1

    .line 994
    iget-object p0, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 1390
    iget-object v0, p0, Lcom/google/common/net/MediaType;->toString:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1392
    invoke-direct {p0}, Lcom/google/common/net/MediaType;->computeToString()Ljava/lang/String;

    move-result-object v0

    .line 1393
    iput-object v0, p0, Lcom/google/common/net/MediaType;->toString:Ljava/lang/String;

    :cond_0
    return-object v0
.end method

.method public type()Ljava/lang/String;
    .registers 1

    .line 989
    iget-object p0, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    return-object p0
.end method

.method public withCharset(Ljava/nio/charset/Charset;)Lcom/google/common/net/MediaType;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "charset"
        }
    .end annotation

    .line 1107
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1108
    const-string v0, "charset"

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/common/net/MediaType;->withParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    .line 1110
    invoke-static {p1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/net/MediaType;->parsedCharset:Lcom/google/common/base/Optional;

    return-object p0
.end method

.method public withParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "attribute",
            "value"
        }
    .end annotation

    .line 1094
    invoke-static {p2}, Lcom/google/common/collect/ImmutableSet;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/common/net/MediaType;->withParameters(Ljava/lang/String;Ljava/lang/Iterable;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

.method public withParameters(Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parameters"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/common/net/MediaType;"
        }
    .end annotation

    .line 1048
    iget-object v0, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

.method public withParameters(Ljava/lang/String;Ljava/lang/Iterable;)Lcom/google/common/net/MediaType;
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "attribute",
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/common/net/MediaType;"
        }
    .end annotation

    .line 1059
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1060
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1061
    invoke-static {p1}, Lcom/google/common/net/MediaType;->normalizeToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1063
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->builder()Lcom/google/common/collect/ImmutableListMultimap$Builder;

    move-result-object v0

    .line 1064
    iget-object v1, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableListMultimap;->entries()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableCollection;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 1065
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1066
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1067
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    goto :goto_0

    .line 1070
    :cond_1
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1072
    invoke-static {p1, v1}, Lcom/google/common/net/MediaType;->normalizeParameterValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1071
    invoke-virtual {v0, p1, v1}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    goto :goto_1

    .line 1074
    :cond_2
    new-instance p2, Lcom/google/common/net/MediaType;

    iget-object v1, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->build()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    invoke-direct {p2, v1, v2, v0}, Lcom/google/common/net/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V

    .line 1076
    const-string v0, "charset"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 1077
    iget-object p0, p0, Lcom/google/common/net/MediaType;->parsedCharset:Lcom/google/common/base/Optional;

    iput-object p0, p2, Lcom/google/common/net/MediaType;->parsedCharset:Lcom/google/common/base/Optional;

    .line 1081
    :cond_3
    sget-object p0, Lcom/google/common/net/MediaType;->knownTypes:Ljava/util/Map;

    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/net/MediaType;

    invoke-static {p0, p2}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/net/MediaType;

    return-object p0
.end method

.method public withoutParameters()Lcom/google/common/net/MediaType;
    .registers 2

    .line 1039
    iget-object v0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableListMultimap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    return-object p0
.end method

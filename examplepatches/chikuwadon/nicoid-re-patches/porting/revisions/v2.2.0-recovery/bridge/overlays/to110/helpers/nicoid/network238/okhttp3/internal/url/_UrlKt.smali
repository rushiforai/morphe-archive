.class public final Lnicoid/network238/okhttp3/internal/url/_UrlKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0000\n\u0002\u0010\u0019\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u000b\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u001aV\u0010\u0010\u001a\u00020\u0011*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00052\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00020\u00052\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001b\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u00192\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0000\u001a\\\u0010\u001f\u001a\u00020\u0005*\u00020\u00052\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u00152\u0008\u0008\u0002\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u00192\n\u0008\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0000\u001a,\u0010 \u001a\u00020\u0011*\u00020\u00122\u0006\u0010!\u001a\u00020\u00052\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u001b\u001a\u00020\u0019H\u0000\u001aP\u0010\"\u001a\u00020\u0005*\u00020\u00052\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u00152\u0008\u0008\u0002\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0019H\u0000\u001a*\u0010#\u001a\u00020\u0005*\u00020\u00052\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u00152\u0008\u0008\u0002\u0010\u0016\u001a\u00020\u00152\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u0019H\u0000\u001a\u001c\u0010$\u001a\u00020\u0019*\u00020\u00052\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0015H\u0000\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0003\"\u000e\u0010\u0004\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0007\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0008\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\t\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\n\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000b\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000c\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\r\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000e\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000f\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\u00a8\u0006%"
    }
    d2 = {
        "HEX_DIGITS",
        "",
        "getHEX_DIGITS",
        "()[C",
        "USERNAME_ENCODE_SET",
        "",
        "PASSWORD_ENCODE_SET",
        "PATH_SEGMENT_ENCODE_SET",
        "PATH_SEGMENT_ENCODE_SET_URI",
        "QUERY_ENCODE_SET",
        "QUERY_COMPONENT_REENCODE_SET",
        "QUERY_COMPONENT_ENCODE_SET",
        "QUERY_COMPONENT_ENCODE_SET_URI",
        "FORM_ENCODE_SET",
        "FRAGMENT_ENCODE_SET",
        "FRAGMENT_ENCODE_SET_URI",
        "writeCanonicalized",
        "",
        "Lnicoid/network238/okio/Buffer;",
        "input",
        "pos",
        "",
        "limit",
        "encodeSet",
        "alreadyEncoded",
        "",
        "strict",
        "plusIsSpace",
        "unicodeAllowed",
        "charset",
        "Ljava/nio/charset/Charset;",
        "canonicalizeWithCharset",
        "writePercentDecoded",
        "encoded",
        "canonicalize",
        "percentDecode",
        "isPercentEncoded",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final FORM_ENCODE_SET:Ljava/lang/String; = " !\"#$&\'()+,/:;<=>?@[\\]^`{|}~"

.field public static final FRAGMENT_ENCODE_SET:Ljava/lang/String; = ""

.field public static final FRAGMENT_ENCODE_SET_URI:Ljava/lang/String; = " \"#<>\\^`{|}"

.field private static final HEX_DIGITS:[C

.field public static final PASSWORD_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#"

.field public static final PATH_SEGMENT_ENCODE_SET:Ljava/lang/String; = " \"<>^`{}|/\\?#"

.field public static final PATH_SEGMENT_ENCODE_SET_URI:Ljava/lang/String; = "[]"

.field public static final QUERY_COMPONENT_ENCODE_SET:Ljava/lang/String; = " !\"#$&\'(),/:;<=>?@[]\\^`{|}~"

.field public static final QUERY_COMPONENT_ENCODE_SET_URI:Ljava/lang/String; = "\\^`{|}"

.field public static final QUERY_COMPONENT_REENCODE_SET:Ljava/lang/String; = " \"\'<>#&="

.field public static final QUERY_ENCODE_SET:Ljava/lang/String; = " \"\'<>#"

.field public static final USERNAME_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 25
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->HEX_DIGITS:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public static final canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;
    .registers 19

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 207
    const/4 v8, 0x0

    const/16 v9, 0x80

    const/4 v10, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-static/range {v0 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalizeWithCharset$default(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;
    .registers 11

    and-int/lit8 p9, p8, 0x1

    const/4 v0, 0x0

    if-eqz p9, :cond_0

    move p1, v0

    :cond_0
    and-int/lit8 p9, p8, 0x2

    if-eqz p9, :cond_1

    .line 200
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    :cond_1
    and-int/lit8 p9, p8, 0x8

    if-eqz p9, :cond_2

    move p4, v0

    :cond_2
    and-int/lit8 p9, p8, 0x10

    if-eqz p9, :cond_3

    move p5, v0

    :cond_3
    and-int/lit8 p9, p8, 0x20

    if-eqz p9, :cond_4

    move p6, v0

    :cond_4
    and-int/lit8 p8, p8, 0x40

    if-eqz p8, :cond_5

    move p7, v0

    .line 198
    :cond_5
    invoke-static/range {p0 .. p7}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final canonicalizeWithCharset(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 19

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move v2, p1

    :goto_0
    if-ge v2, p2, :cond_5

    .line 135
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    const/16 v1, 0x20

    if-lt v0, v1, :cond_4

    const/16 v1, 0x7f

    if-eq v0, v1, :cond_4

    const/16 v1, 0x80

    if-lt v0, v1, :cond_0

    if-eqz p7, :cond_4

    :cond_0
    int-to-char v1, v0

    .line 140
    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static {p3, v1, v3, v4, v5}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const/16 v1, 0x25

    if-ne v0, v1, :cond_1

    if-eqz p4, :cond_4

    if-eqz p5, :cond_1

    .line 142
    invoke-static {p0, v2, p2}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->isPercentEncoded(Ljava/lang/String;II)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    const/16 v1, 0x2b

    if-ne v0, v1, :cond_3

    if-eqz p6, :cond_3

    :cond_2
    goto :goto_1

    .line 162
    :cond_3
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    add-int/2addr v2, v0

    goto :goto_0

    .line 147
    :cond_4
    :goto_1
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 148
    invoke-virtual {v0, p0, p1, v2}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;

    .line 149
    move-object v1, p0

    move v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->writeCanonicalized(Lnicoid/network238/okio/Buffer;Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)V

    .line 160
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 166
    :cond_5
    invoke-virtual/range {p0 .. p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic canonicalizeWithCharset$default(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;ILjava/lang/Object;)Ljava/lang/String;
    .registers 12

    and-int/lit8 p10, p9, 0x1

    const/4 v0, 0x0

    if-eqz p10, :cond_0

    move p1, v0

    :cond_0
    and-int/lit8 p10, p9, 0x2

    if-eqz p10, :cond_1

    .line 124
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    :cond_1
    and-int/lit8 p10, p9, 0x8

    if-eqz p10, :cond_2

    move p4, v0

    :cond_2
    and-int/lit8 p10, p9, 0x10

    if-eqz p10, :cond_3

    move p5, v0

    :cond_3
    and-int/lit8 p10, p9, 0x20

    if-eqz p10, :cond_4

    move p6, v0

    :cond_4
    and-int/lit8 p10, p9, 0x40

    if-eqz p10, :cond_5

    move p7, v0

    :cond_5
    and-int/lit16 p9, p9, 0x80

    if-eqz p9, :cond_6

    const/4 p8, 0x0

    .line 122
    :cond_6
    invoke-static/range {p0 .. p8}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalizeWithCharset(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final getHEX_DIGITS()[C
    .registers 1

    .line 24
    sget-object v0, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->HEX_DIGITS:[C

    return-object v0
.end method

.method public static final isPercentEncoded(Ljava/lang/String;II)Z
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    add-int/lit8 v0, p1, 0x2

    if-ge v0, p2, :cond_0

    .line 242
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 v1, 0x25

    if-ne p2, v1, :cond_0

    const/4 p2, 0x1

    add-int/2addr p1, p2

    .line 243
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    .line 244
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result p0

    if-eq p0, v1, :cond_0

    return p2

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;
    .registers 7

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move v0, p1

    :goto_0
    if-ge v0, p2, :cond_2

    .line 223
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x25

    if-eq v1, v2, :cond_1

    const/16 v2, 0x2b

    if-ne v1, v2, :cond_0

    if-nez p3, :cond_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 226
    :cond_1
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 227
    invoke-virtual {v1, p0, p1, v0}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;

    .line 228
    invoke-static {v1, p0, v0, p2, p3}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->writePercentDecoded(Lnicoid/network238/okio/Buffer;Ljava/lang/String;IIZ)V

    .line 229
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 234
    :cond_2
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;
    .registers 7

    and-int/lit8 p5, p4, 0x1

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move p1, v0

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    .line 219
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    move p3, v0

    .line 217
    :cond_2
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final writeCanonicalized(Lnicoid/network238/okio/Buffer;Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)V
    .registers 18

    move-object/from16 v0, p9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x0

    move-object v2, v1

    :goto_0
    if-ge p2, p3, :cond_c

    .line 53
    invoke-virtual {p1, p2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    if-eqz p5, :cond_1

    const/16 v4, 0x9

    if-eq v3, v4, :cond_0

    const/16 v4, 0xa

    if-eq v3, v4, :cond_0

    const/16 v4, 0xc

    if-eq v3, v4, :cond_0

    const/16 v4, 0xd

    if-ne v3, v4, :cond_1

    .line 59
    :cond_0
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    goto/16 :goto_5

    :cond_1
    const-string v4, "+"

    const/16 v5, 0x20

    if-ne v3, v5, :cond_2

    .line 63
    const-string v6, " !\"#$&\'()+,/:;<=>?@[\\]^`{|}~"

    if-ne p4, v6, :cond_2

    .line 65
    invoke-virtual {p0, v4}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    goto/16 :goto_5

    :cond_2
    const/16 v6, 0x2b

    if-ne v3, v6, :cond_4

    if-eqz p7, :cond_4

    if-eqz p5, :cond_3

    .line 68
    goto :goto_1

    :cond_3
    const-string v4, "%2B"

    :goto_1
    invoke-virtual {p0, v4}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    goto/16 :goto_5

    :cond_4
    const/16 v4, 0x25

    if-lt v3, v5, :cond_7

    const/16 v5, 0x7f

    if-eq v3, v5, :cond_7

    const/16 v5, 0x80

    if-lt v3, v5, :cond_5

    if-eqz p8, :cond_7

    :cond_5
    int-to-char v5, v3

    .line 73
    const/4 v6, 0x0

    const/4 v7, 0x2

    invoke-static {p4, v5, v6, v7, v1}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7

    if-ne v3, v4, :cond_6

    if-eqz p5, :cond_7

    if-eqz p6, :cond_6

    .line 75
    invoke-static {p1, p2, p3}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->isPercentEncoded(Ljava/lang/String;II)Z

    move-result v5

    if-nez v5, :cond_6

    goto :goto_2

    .line 96
    :cond_6
    invoke-virtual {p0, v3}, Lnicoid/network238/okio/Buffer;->writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;

    goto :goto_5

    :cond_7
    :goto_2
    if-nez v2, :cond_8

    .line 79
    new-instance v2, Lnicoid/network238/okio/Buffer;

    invoke-direct {v2}, Lnicoid/network238/okio/Buffer;-><init>()V

    :cond_8
    if-eqz v0, :cond_a

    .line 82
    sget-object v5, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {v0, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    goto :goto_3

    .line 85
    :cond_9
    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v5, p2

    invoke-virtual {v2, p1, p2, v5, v0}, Lnicoid/network238/okio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;

    goto :goto_4

    .line 83
    :cond_a
    :goto_3
    invoke-virtual {v2, v3}, Lnicoid/network238/okio/Buffer;->writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;

    .line 88
    :goto_4
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v5

    if-nez v5, :cond_b

    .line 89
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v5

    and-int/lit16 v6, v5, 0xff

    .line 90
    invoke-virtual {p0, v4}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 91
    sget-object v7, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->HEX_DIGITS:[C

    shr-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0xf

    aget-char v6, v7, v6

    invoke-virtual {p0, v6}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    and-int/lit8 v5, v5, 0xf

    .line 92
    aget-char v5, v7, v5

    invoke-virtual {p0, v5}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    goto :goto_4

    :cond_b
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    .line 98
    :goto_5
    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v3

    add-int/2addr p2, v3

    goto/16 :goto_0

    :cond_c
    return-void
.end method

.method public static final writePercentDecoded(Lnicoid/network238/okio/Buffer;Ljava/lang/String;IIZ)V
    .registers 10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    if-ge p2, p3, :cond_2

    .line 178
    invoke-virtual {p1, p2}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    const/16 v1, 0x25

    if-ne v0, v1, :cond_0

    add-int/lit8 v1, p2, 0x2

    if-ge v1, p3, :cond_0

    add-int/lit8 v2, p2, 0x1

    .line 180
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result v2

    .line 181
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result v3

    const/4 v4, -0x1

    if-eq v2, v4, :cond_1

    if-eq v3, v4, :cond_1

    shl-int/lit8 v2, v2, 0x4

    add-int/2addr v2, v3

    .line 183
    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 185
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result p2

    add-int/2addr p2, v1

    goto :goto_0

    :cond_0
    const/16 v1, 0x2b

    if-ne v0, v1, :cond_1

    if-eqz p4, :cond_1

    .line 189
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 193
    :cond_1
    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;

    .line 194
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    add-int/2addr p2, v0

    goto :goto_0

    :cond_2
    return-void
.end method

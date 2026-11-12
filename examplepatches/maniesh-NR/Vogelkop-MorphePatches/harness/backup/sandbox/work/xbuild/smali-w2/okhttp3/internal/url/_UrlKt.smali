.class public final Lokhttp3/internal/url/_UrlKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\r\n\u0002\u0010\u0019\n\u0002\u0008\u0011\u001a]\u0010\u000f\u001a\u00020\u000e*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u00072\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0000\u00a2\u0006\u0004\u0008\u000f\u0010\u0010\u001ac\u0010\u0011\u001a\u00020\u0001*\u00020\u00012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00072\u0008\u0008\u0002\u0010\t\u001a\u00020\u00072\u0008\u0008\u0002\u0010\n\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u00072\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0000\u00a2\u0006\u0004\u0008\u0011\u0010\u0012\u001a3\u0010\u0014\u001a\u00020\u000e*\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u0007H\u0000\u00a2\u0006\u0004\u0008\u0014\u0010\u0015\u001aW\u0010\u0016\u001a\u00020\u0001*\u00020\u00012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00072\u0008\u0008\u0002\u0010\t\u001a\u00020\u00072\u0008\u0008\u0002\u0010\n\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u0007H\u0000\u00a2\u0006\u0004\u0008\u0016\u0010\u0017\u001a1\u0010\u0018\u001a\u00020\u0001*\u00020\u00012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00032\u0008\u0008\u0002\u0010\n\u001a\u00020\u0007H\u0000\u00a2\u0006\u0004\u0008\u0018\u0010\u0019\u001a#\u0010\u001a\u001a\u00020\u0007*\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u0003H\u0000\u00a2\u0006\u0004\u0008\u001a\u0010\u001b\"\u001a\u0010\u001d\u001a\u00020\u001c8\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008\u001d\u0010\u001e\u001a\u0004\u0008\u001f\u0010 \"\u0014\u0010!\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"\"\u0014\u0010#\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008#\u0010\"\"\u0014\u0010$\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008$\u0010\"\"\u0014\u0010%\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008%\u0010\"\"\u0014\u0010&\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008&\u0010\"\"\u0014\u0010\'\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008\'\u0010\"\"\u0014\u0010(\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008(\u0010\"\"\u0014\u0010)\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008)\u0010\"\"\u0014\u0010*\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008*\u0010\"\"\u0014\u0010+\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008+\u0010\"\"\u0014\u0010,\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008,\u0010\"\u00a8\u0006-"
    }
    d2 = {
        "Ld04;",
        "",
        "input",
        "",
        "pos",
        "limit",
        "encodeSet",
        "",
        "alreadyEncoded",
        "strict",
        "plusIsSpace",
        "unicodeAllowed",
        "Ljava/nio/charset/Charset;",
        "charset",
        "",
        "writeCanonicalized",
        "(Ld04;Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)V",
        "canonicalizeWithCharset",
        "(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;",
        "encoded",
        "writePercentDecoded",
        "(Ld04;Ljava/lang/String;IIZ)V",
        "canonicalize",
        "(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;",
        "percentDecode",
        "(Ljava/lang/String;IIZ)Ljava/lang/String;",
        "isPercentEncoded",
        "(Ljava/lang/String;II)Z",
        "",
        "HEX_DIGITS",
        "[C",
        "getHEX_DIGITS",
        "()[C",
        "USERNAME_ENCODE_SET",
        "Ljava/lang/String;",
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
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final FRAGMENT_ENCODE_SET:Ljava/lang/String; = ""
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final FRAGMENT_ENCODE_SET_URI:Ljava/lang/String; = " \"#<>\\^`{|}"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final HEX_DIGITS:[C
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final PASSWORD_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final PATH_SEGMENT_ENCODE_SET:Ljava/lang/String; = " \"<>^`{}|/\\?#"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final PATH_SEGMENT_ENCODE_SET_URI:Ljava/lang/String; = "[]"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final QUERY_COMPONENT_ENCODE_SET:Ljava/lang/String; = " !\"#$&\'(),/:;<=>?@[]\\^`{|}~"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final QUERY_COMPONENT_ENCODE_SET_URI:Ljava/lang/String; = "\\^`{|}"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final QUERY_COMPONENT_REENCODE_SET:Ljava/lang/String; = " \"\'<>#&="
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final QUERY_ENCODE_SET:Ljava/lang/String; = " \"\'<>#"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final USERNAME_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lokhttp3/internal/url/_UrlKt;->HEX_DIGITS:[C

    return-void

    :array_a
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
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const/16 v9, 0x80

    const/4 v10, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-static/range {v0 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalizeWithCharset$default(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;
    .registers 11

    and-int/lit8 p9, p8, 0x1

    const/4 v0, 0x0

    if-eqz p9, :cond_6

    move p1, v0

    :cond_6
    and-int/lit8 p9, p8, 0x2

    if-eqz p9, :cond_e

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    :cond_e
    and-int/lit8 p9, p8, 0x8

    if-eqz p9, :cond_13

    move p4, v0

    :cond_13
    and-int/lit8 p9, p8, 0x10

    if-eqz p9, :cond_18

    move p5, v0

    :cond_18
    and-int/lit8 p9, p8, 0x20

    if-eqz p9, :cond_1d

    move p6, v0

    :cond_1d
    and-int/lit8 p8, p8, 0x40

    if-eqz p8, :cond_22

    move p7, v0

    :cond_22
    invoke-static/range {p0 .. p7}, Lokhttp3/internal/url/_UrlKt;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final canonicalizeWithCharset(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 19
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    move v2, p1

    :goto_1
    if-ge v2, p2, :cond_51

    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    const/16 v1, 0x20

    if-lt v0, v1, :cond_36

    const/16 v1, 0x7f

    if-eq v0, v1, :cond_36

    const/16 v1, 0x80

    if-lt v0, v1, :cond_15

    if-eqz p7, :cond_36

    :cond_15
    int-to-char v1, v0

    invoke-static {p3, v1}, Lkotlin/text/StringsKt;->F(Ljava/lang/CharSequence;C)Z

    move-result v1

    if-nez v1, :cond_36

    const/16 v1, 0x25

    if-ne v0, v1, :cond_2a

    if-eqz p4, :cond_36

    if-eqz p5, :cond_2a

    invoke-static {p0, v2, p2}, Lokhttp3/internal/url/_UrlKt;->isPercentEncoded(Ljava/lang/String;II)Z

    move-result v1

    if-eqz v1, :cond_36

    :cond_2a
    const/16 v1, 0x2b

    if-ne v0, v1, :cond_30

    if-nez p6, :cond_36

    :cond_30
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    add-int/2addr v2, v0

    goto :goto_1

    :cond_36
    new-instance v0, Ld04;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, p1, v2, p0}, Ld04;->b0(IILjava/lang/String;)V

    move-object v1, p0

    move v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-static/range {v0 .. v9}, Lokhttp3/internal/url/_UrlKt;->writeCanonicalized(Ld04;Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)V

    invoke-virtual {v0}, Ld04;->D()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_51
    invoke-virtual/range {p0 .. p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic canonicalizeWithCharset$default(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;ILjava/lang/Object;)Ljava/lang/String;
    .registers 12

    and-int/lit8 p10, p9, 0x1

    const/4 v0, 0x0

    if-eqz p10, :cond_6

    move p1, v0

    :cond_6
    and-int/lit8 p10, p9, 0x2

    if-eqz p10, :cond_e

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    :cond_e
    and-int/lit8 p10, p9, 0x8

    if-eqz p10, :cond_13

    move p4, v0

    :cond_13
    and-int/lit8 p10, p9, 0x10

    if-eqz p10, :cond_18

    move p5, v0

    :cond_18
    and-int/lit8 p10, p9, 0x20

    if-eqz p10, :cond_1d

    move p6, v0

    :cond_1d
    and-int/lit8 p10, p9, 0x40

    if-eqz p10, :cond_22

    move p7, v0

    :cond_22
    and-int/lit16 p9, p9, 0x80

    if-eqz p9, :cond_27

    const/4 p8, 0x0

    :cond_27
    invoke-static/range {p0 .. p8}, Lokhttp3/internal/url/_UrlKt;->canonicalizeWithCharset(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final getHEX_DIGITS()[C
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lokhttp3/internal/url/_UrlKt;->HEX_DIGITS:[C

    return-object v0
.end method

.method public static final isPercentEncoded(Ljava/lang/String;II)Z
    .registers 5
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    add-int/lit8 v0, p1, 0x2

    if-ge v0, p2, :cond_24

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 v1, 0x25

    if-ne p2, v1, :cond_24

    const/4 p2, 0x1

    add-int/2addr p1, p2

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Lokhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_24

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Lokhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result p0

    if-eq p0, v1, :cond_24

    return p2

    :cond_24
    const/4 p0, 0x0

    return p0
.end method

.method public static final percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;
    .registers 7
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    move v0, p1

    :goto_1
    if-ge v0, p2, :cond_24

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x25

    if-eq v1, v2, :cond_14

    const/16 v2, 0x2b

    if-ne v1, v2, :cond_11

    if-nez p3, :cond_14

    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_14
    new-instance v1, Ld04;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v1, p1, v0, p0}, Ld04;->b0(IILjava/lang/String;)V

    invoke-static {v1, p0, v0, p2, p3}, Lokhttp3/internal/url/_UrlKt;->writePercentDecoded(Ld04;Ljava/lang/String;IIZ)V

    invoke-virtual {v1}, Ld04;->D()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_24
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;
    .registers 7

    and-int/lit8 p5, p4, 0x1

    const/4 v0, 0x0

    if-eqz p5, :cond_6

    move p1, v0

    :cond_6
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_e

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    :cond_e
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_13

    move p3, v0

    :cond_13
    invoke-static {p0, p1, p2, p3}, Lokhttp3/internal/url/_UrlKt;->percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final writeCanonicalized(Ld04;Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)V
    .registers 16
    .param p0    # Ld04;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    :goto_1
    if-ge p2, p3, :cond_ad

    invoke-virtual {p1, p2}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    if-eqz p5, :cond_19

    const/16 v2, 0x9

    if-eq v1, v2, :cond_a6

    const/16 v2, 0xa

    if-eq v1, v2, :cond_a6

    const/16 v2, 0xc

    if-eq v1, v2, :cond_a6

    const/16 v2, 0xd

    if-eq v1, v2, :cond_a6

    :cond_19
    const-string v2, "+"

    const/16 v3, 0x20

    const/4 v4, 0x0

    if-ne v1, v3, :cond_2d

    const-string v5, " !\"#$&\'()+,/:;<=>?@[\\]^`{|}~"

    if-ne p4, v5, :cond_2d

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x1

    invoke-virtual {p0, v4, v3, v2}, Ld04;->b0(IILjava/lang/String;)V

    goto/16 :goto_a6

    :cond_2d
    const/16 v5, 0x2b

    if-ne v1, v5, :cond_42

    if-eqz p7, :cond_42

    if-nez p5, :cond_37

    const-string v2, "%2B"

    :cond_37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v4, v3, v2}, Ld04;->b0(IILjava/lang/String;)V

    goto :goto_a6

    :cond_42
    const/16 v2, 0x25

    if-lt v1, v3, :cond_67

    const/16 v3, 0x7f

    if-eq v1, v3, :cond_67

    const/16 v3, 0x80

    if-lt v1, v3, :cond_50

    if-eqz p8, :cond_67

    :cond_50
    int-to-char v3, v1

    invoke-static {p4, v3}, Lkotlin/text/StringsKt;->F(Ljava/lang/CharSequence;C)Z

    move-result v3

    if-nez v3, :cond_67

    if-ne v1, v2, :cond_63

    if-eqz p5, :cond_67

    if-eqz p6, :cond_63

    invoke-static {p1, p2, p3}, Lokhttp3/internal/url/_UrlKt;->isPercentEncoded(Ljava/lang/String;II)Z

    move-result v3

    if-eqz v3, :cond_67

    :cond_63
    invoke-virtual {p0, v1}, Ld04;->e0(I)V

    goto :goto_a6

    :cond_67
    if-nez v0, :cond_6e

    new-instance v0, Ld04;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    :cond_6e
    if-eqz p9, :cond_81

    sget-object v3, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p9, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_81

    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v3

    add-int/2addr v3, p2

    invoke-virtual {v0, p1, p2, v3, p9}, Ld04;->Z(Ljava/lang/String;IILjava/nio/charset/Charset;)V

    goto :goto_84

    :cond_81
    invoke-virtual {v0, v1}, Ld04;->e0(I)V

    :goto_84
    invoke-virtual {v0}, Ld04;->x()Z

    move-result v3

    if-nez v3, :cond_a6

    invoke-virtual {v0}, Ld04;->readByte()B

    move-result v3

    and-int/lit16 v4, v3, 0xff

    invoke-virtual {p0, v2}, Ld04;->P(I)V

    sget-object v5, Lokhttp3/internal/url/_UrlKt;->HEX_DIGITS:[C

    shr-int/lit8 v4, v4, 0x4

    and-int/lit8 v4, v4, 0xf

    aget-char v4, v5, v4

    invoke-virtual {p0, v4}, Ld04;->P(I)V

    and-int/lit8 v3, v3, 0xf

    aget-char v3, v5, v3

    invoke-virtual {p0, v3}, Ld04;->P(I)V

    goto :goto_84

    :cond_a6
    :goto_a6
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v1

    add-int/2addr p2, v1

    goto/16 :goto_1

    :cond_ad
    return-void
.end method

.method public static final writePercentDecoded(Ld04;Ljava/lang/String;IIZ)V
    .registers 10
    .param p0    # Ld04;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    :goto_0
    if-ge p2, p3, :cond_48

    invoke-virtual {p1, p2}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    const/16 v1, 0x25

    if-ne v0, v1, :cond_31

    add-int/lit8 v1, p2, 0x2

    if-ge v1, p3, :cond_31

    add-int/lit8 v2, p2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lokhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result v2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lokhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result v3

    const/4 v4, -0x1

    if-eq v2, v4, :cond_3f

    if-eq v3, v4, :cond_3f

    shl-int/lit8 v2, v2, 0x4

    add-int/2addr v2, v3

    invoke-virtual {p0, v2}, Ld04;->P(I)V

    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result p2

    add-int/2addr p2, v1

    goto :goto_0

    :cond_31
    const/16 v1, 0x2b

    if-ne v0, v1, :cond_3f

    if-eqz p4, :cond_3f

    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Ld04;->P(I)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3f
    invoke-virtual {p0, v0}, Ld04;->e0(I)V

    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    add-int/2addr p2, v0

    goto :goto_0

    :cond_48
    return-void
.end method

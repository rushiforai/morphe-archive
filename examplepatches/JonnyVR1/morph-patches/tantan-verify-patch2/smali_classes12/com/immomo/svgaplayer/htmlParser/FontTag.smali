.class public final Lcom/immomo/svgaplayer/htmlParser/FontTag;
.super Lcom/immomo/svgaplayer/htmlParser/HtmlTag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/htmlParser/FontTag$FontFace;,
        Lcom/immomo/svgaplayer/htmlParser/FontTag$FontColor;,
        Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001:\u0003\u000c\r\u000eB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0010\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0016J\u001a\u0010\t\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0016\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/htmlParser/FontTag;",
        "Lcom/immomo/svgaplayer/htmlParser/HtmlTag;",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "endHandleTag",
        "",
        "text",
        "Landroid/text/Editable;",
        "startHandleTag",
        "attributes",
        "Lorg/xml/sax/Attributes;",
        "FontColor",
        "FontFace",
        "FontSize",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;-><init>(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public endHandleTag(Landroid/text/Editable;)V
    .locals 3
    .param p1    # Landroid/text/Editable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-class v0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontFace;

    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontFace;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontFace;->getFace()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    new-instance v2, Landroid/text/style/TypefaceSpan;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontFace;->getFace()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v2, v1}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1, v0, v2}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->end(Landroid/text/Editable;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const-class v0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontColor;

    .line 37
    .line 38
    invoke-virtual {p0, p1, v0}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontColor;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontColor;->getColor()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_1

    .line 55
    .line 56
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontColor;->getColor()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-direct {v2, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1, v0, v2}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->end(Landroid/text/Editable;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    const-class v0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;

    .line 73
    .line 74
    invoke-virtual {p0, p1, v0}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->getLast(Landroid/text/Spanned;Ljava/lang/Class;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;

    .line 79
    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->getSize()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-lez v2, :cond_2

    .line 87
    .line 88
    new-instance v2, Landroid/text/style/AbsoluteSizeSpan;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->getSize()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-direct {v2, v1}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1, v0, v2}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->end(Landroid/text/Editable;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    return-void
.end method

.method public startHandleTag(Landroid/text/Editable;Lorg/xml/sax/Attributes;)V
    .locals 4
    .param p1    # Landroid/text/Editable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lorg/xml/sax/Attributes;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string v2, "face"

    .line 10
    .line 11
    invoke-interface {p2, v1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object v2, v0

    .line 17
    :goto_0
    if-eqz p2, :cond_1

    .line 18
    .line 19
    const-string v3, "color"

    .line 20
    .line 21
    invoke-interface {p2, v1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move-object v3, v0

    .line 27
    :goto_1
    if-eqz p2, :cond_2

    .line 28
    .line 29
    const-string v0, "size"

    .line 30
    .line 31
    invoke-interface {p2, v1, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :cond_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_3

    .line 40
    .line 41
    new-instance p2, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontFace;

    .line 42
    .line 43
    invoke-direct {p2, v2}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontFace;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->start(Landroid/text/Editable;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-nez p2, :cond_4

    .line 54
    .line 55
    new-instance p2, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontColor;

    .line 56
    .line 57
    invoke-direct {p2, v3}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontColor;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1, p2}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->start(Landroid/text/Editable;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_6

    .line 68
    .line 69
    new-instance p2, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;

    .line 70
    .line 71
    if-nez v0, :cond_5

    .line 72
    .line 73
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 74
    .line 75
    .line 76
    :cond_5
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-direct {p2, v0}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;-><init>(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1, p2}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->start(Landroid/text/Editable;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_6
    return-void
.end method

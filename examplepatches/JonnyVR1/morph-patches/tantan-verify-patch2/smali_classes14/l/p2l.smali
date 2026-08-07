.class public Ll/p2l;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/q2l;)Landroid/text/SpannableString;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatMatches"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/q2l;->g()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bpj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/q2l;->e()Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->switchCount:I

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 20
    .line 21
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->P:I

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v1, v2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 37
    .line 38
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->Q:I

    .line 39
    .line 40
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :goto_0
    new-instance v1, Landroid/text/SpannableString;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 54
    .line 55
    const-string v3, "#d74d37"

    .line 56
    .line 57
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    sub-int v0, p0, v0

    .line 73
    .line 74
    const/16 v3, 0x21

    .line 75
    .line 76
    invoke-virtual {v1, v2, v0, p0, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 77
    .line 78
    .line 79
    return-object v1
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;",
            ")",
            "Ljava/util/List<",
            "Ll/q2l;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->multiple:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    if-ge v2, v1, :cond_1

    .line 17
    .line 18
    new-instance v3, Ll/q2l;

    .line 19
    .line 20
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->multiple:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 27
    .line 28
    invoke-direct {v3, v4, p1, v2}, Ll/q2l;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;I)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    :goto_1
    return-object v0
.end method

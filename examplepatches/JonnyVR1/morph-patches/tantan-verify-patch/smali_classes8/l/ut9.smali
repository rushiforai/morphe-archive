.class public Ll/ut9;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/wt9;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/Media;

.field public b:Lcom/p1/mobile/putong/core/data/Sticker;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/ut9;->a:Lcom/p1/mobile/putong/data/Media;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/ut9;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ut9;->n0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/ut9;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ut9;->q0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ljava/util/List;)Lcom/p1/mobile/putong/data/Picture;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic h0(Ljava/util/List;)Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic i0(Ll/ut9;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ut9;->p0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ll/ut9;Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ut9;->o0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Ll/ut9;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ut9;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic m0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic n0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "selectedImages"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/util/ArrayList;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/wt9;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/wt9;->d(Ljava/util/ArrayList;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic r0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 13
    .line 14
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 15
    .line 16
    const p1, 0x9d87

    .line 17
    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->g6:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 33
    .line 34
    new-instance p1, Ll/rt9;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/rt9;-><init>()V

    .line 37
    .line 38
    .line 39
    const-wide/16 v0, 0x32

    .line 40
    .line 41
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/lt9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lt9;-><init>(Ll/ut9;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ut9;->a:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ut9;->a:Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 17
    .line 18
    const-string v0, "preprocessed"

    .line 19
    .line 20
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/Media;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "custom_sticker"

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/yb5;->I(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Ll/st9;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/st9;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public final synthetic p0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 4

    .line 1
    iput-object p2, p0, Ll/ut9;->a:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Sticker;->new_()Lcom/p1/mobile/putong/core/data/Sticker;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 8
    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 23
    .line 24
    move-object v1, p2

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 28
    .line 29
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 30
    .line 31
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 34
    .line 35
    new-instance v2, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v3, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 51
    .line 52
    iput-object v1, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 53
    .line 54
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 55
    .line 56
    iput-object p2, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 57
    .line 58
    iget-object p2, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 59
    .line 60
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 71
    .line 72
    const-string v0, "selfCollect"

    .line 73
    .line 74
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/StickerSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 79
    .line 80
    :try_start_0
    iget-object p2, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 81
    .line 82
    new-instance v0, Ljava/io/File;

    .line 83
    .line 84
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0}, Ll/niw;->d(Ljava/io/File;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iput-object p1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :catch_0
    move-exception p1

    .line 99
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 105
    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 107
    .line 108
    iget-object p0, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 109
    .line 110
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/z$c;->O(Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0
.end method

.method public final synthetic q0(Ll/uxj0;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 13
    .line 14
    iget-object v1, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 48
    .line 49
    iget-object v1, p0, Ll/ut9;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v1, "selectedImages"

    .line 88
    .line 89
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Ljava/util/ArrayList;

    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-lez v2, :cond_1

    .line 100
    .line 101
    new-instance v0, Landroid/content/Intent;

    .line 102
    .line 103
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    const/4 v1, -0x1

    .line 114
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setResult(I)V

    .line 123
    .line 124
    .line 125
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 130
    .line 131
    .line 132
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->h6:I

    .line 133
    .line 134
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 135
    .line 136
    .line 137
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 138
    .line 139
    new-instance p1, Ll/tt9;

    .line 140
    .line 141
    invoke-direct {p1}, Ll/tt9;-><init>()V

    .line 142
    .line 143
    .line 144
    const-wide/16 v0, 0x32

    .line 145
    .line 146
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public s0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ll/i1y;

    .line 8
    .line 9
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 18
    .line 19
    const/4 v6, 0x1

    .line 20
    const/16 v3, 0x2d0

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    invoke-direct/range {v1 .. v6}, Ll/i1y;-><init>(Ljava/util/List;IILandroid/graphics/Bitmap$CompressFormat;Z)V

    .line 24
    .line 25
    .line 26
    new-instance p1, Ll/mt9;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/mt9;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p1, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v1, Ll/nt9;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/nt9;-><init>(Ll/ut9;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Lrx/c;->last()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance v1, Ll/ot9;

    .line 65
    .line 66
    invoke-direct {v1, p0, v0}, Ll/ot9;-><init>(Ll/ut9;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance v0, Ll/pt9;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/pt9;-><init>(Ll/ut9;)V

    .line 84
    .line 85
    .line 86
    new-instance v1, Ll/qt9;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/qt9;-><init>(Ll/ut9;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    return-void
.end method

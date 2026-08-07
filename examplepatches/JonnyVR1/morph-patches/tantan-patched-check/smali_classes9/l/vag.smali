.class public Ll/vag;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/vx3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vx3<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable$ConstantState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vx3;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vx3;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vag;->a:Ll/vx3;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/oag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic b(Ll/fbg;Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;->name:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fbg;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Ll/fbg;Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->name:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fbg;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic d(Ll/oag;)Ll/ruf0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Ll/oag;
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p3, p2, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance p3, Ll/oag;

    .line 32
    .line 33
    invoke-direct {p3, v0, p2}, Ll/oag;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3, p0}, Ll/oag;->d(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Ll/vag;->a:Ll/vx3;

    .line 40
    .line 41
    invoke-virtual {p3}, Ll/oag;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p0, p1, p2}, Ll/vx3;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-object p3

    .line 49
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public static f(Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;Ll/fbg;)Ljava/lang/String;
    .locals 9

    .line 1
    iget-object p1, p1, Ll/fbg;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    array-length v0, p1

    .line 8
    const/4 v1, 0x0

    .line 9
    move v2, v1

    .line 10
    move v3, v2

    .line 11
    move v4, v3

    .line 12
    :goto_0
    if-ge v2, v0, :cond_3

    .line 13
    .line 14
    aget-char v5, p1, v2

    .line 15
    .line 16
    invoke-static {v5}, Ll/a9g0;->h(C)Z

    .line 17
    .line 18
    .line 19
    move-result v6

    .line 20
    if-eqz v6, :cond_0

    .line 21
    .line 22
    add-int/lit8 v3, v3, 0x1

    .line 23
    .line 24
    :cond_0
    invoke-static {v5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    invoke-static {v6}, Ll/a9g0;->j(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    if-nez v6, :cond_1

    .line 33
    .line 34
    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    if-eqz v5, :cond_2

    .line 39
    .line 40
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 41
    .line 42
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    array-length v0, p1

    .line 46
    const/4 v2, 0x1

    .line 47
    if-ne v3, v0, :cond_4

    .line 48
    .line 49
    array-length v0, p1

    .line 50
    if-gt v0, v2, :cond_4

    .line 51
    .line 52
    move v0, v2

    .line 53
    goto :goto_1

    .line 54
    :cond_4
    move v0, v1

    .line 55
    :goto_1
    array-length v5, p1

    .line 56
    const/4 v6, 0x2

    .line 57
    if-ne v4, v5, :cond_5

    .line 58
    .line 59
    array-length v5, p1

    .line 60
    if-gt v5, v6, :cond_5

    .line 61
    .line 62
    move v5, v2

    .line 63
    goto :goto_2

    .line 64
    :cond_5
    move v5, v1

    .line 65
    :goto_2
    array-length v7, p1

    .line 66
    if-ne v3, v7, :cond_6

    .line 67
    .line 68
    array-length v7, p1

    .line 69
    if-gt v7, v6, :cond_6

    .line 70
    .line 71
    move v7, v2

    .line 72
    goto :goto_3

    .line 73
    :cond_6
    move v7, v1

    .line 74
    :goto_3
    array-length v8, p1

    .line 75
    if-ne v4, v8, :cond_7

    .line 76
    .line 77
    array-length p1, p1

    .line 78
    const/4 v8, 0x3

    .line 79
    if-gt p1, v8, :cond_7

    .line 80
    .line 81
    move p1, v2

    .line 82
    goto :goto_4

    .line 83
    :cond_7
    move p1, v1

    .line 84
    :goto_4
    if-ne v3, v2, :cond_8

    .line 85
    .line 86
    if-ne v4, v2, :cond_8

    .line 87
    .line 88
    move v8, v2

    .line 89
    goto :goto_5

    .line 90
    :cond_8
    move v8, v1

    .line 91
    :goto_5
    if-ne v3, v2, :cond_9

    .line 92
    .line 93
    if-ne v4, v6, :cond_9

    .line 94
    .line 95
    move v1, v2

    .line 96
    :cond_9
    invoke-static {v6}, Ll/wft;->b(I)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-nez v2, :cond_a

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->backgroundUrl:Ljava/lang/String;

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_a
    if-nez v0, :cond_e

    .line 106
    .line 107
    if-eqz v5, :cond_b

    .line 108
    .line 109
    goto :goto_7

    .line 110
    :cond_b
    if-nez v7, :cond_d

    .line 111
    .line 112
    if-nez p1, :cond_d

    .line 113
    .line 114
    if-nez v8, :cond_d

    .line 115
    .line 116
    if-eqz v1, :cond_c

    .line 117
    .line 118
    goto :goto_6

    .line 119
    :cond_c
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->backgroundLargeUrl:Ljava/lang/String;

    .line 120
    .line 121
    return-object p0

    .line 122
    :cond_d
    :goto_6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->backgroundMiddleUrl:Ljava/lang/String;

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_e
    :goto_7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->backgroundSmallUrl:Ljava/lang/String;

    .line 126
    .line 127
    return-object p0
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static h(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Lrx/c;
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ")",
            "Lrx/c<",
            "Ll/ruf0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/vag;->i(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/lang/String;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static i(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/lang/String;)Lrx/c;
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/ruf0;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    const-string p1, "cannot find anchor\'s fanbase Medal!"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-static {}, Ll/fbg;->a()Ll/fbg$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/fbg$a;->e(Ljava/lang/String;)Ll/fbg$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/fbg$a;->d(Ljava/lang/String;)Ll/fbg$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->color:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/fbg$a;->b(Ljava/lang/String;)Ll/fbg$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, p2}, Ll/fbg$a;->f(Ljava/lang/String;)Ll/fbg$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1, p0}, Ll/fbg$a;->c(I)Ll/fbg$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/fbg$a;->a()Ll/fbg;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/vag;->k(Ll/fbg;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public static j(ILl/cm0;)Lrx/c;
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/cm0;",
            ")",
            "Lrx/c<",
            "Ll/ruf0;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    const-string p1, "cannot find anchor\'s fanbase Medal!"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object v0, p1, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 16
    .line 17
    iget-object p1, p1, Ll/cm0;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0, v0, p1}, Ll/vag;->i(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static k(Ll/fbg;)Lrx/c;
    .locals 4
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fbg;",
            ")",
            "Lrx/c<",
            "Ll/ruf0;",
            ">;"
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/fbg;->c:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/fbg;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/aiv;->z0(ILjava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    new-instance v1, Ll/qag;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/qag;-><init>(Ll/fbg;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/vag;->f(Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;Ll/fbg;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->icons:Ljava/util/List;

    .line 34
    .line 35
    new-instance v3, Ll/rag;

    .line 36
    .line 37
    invoke-direct {v3, p0}, Ll/rag;-><init>(Ll/fbg;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;->url:Ljava/lang/String;

    .line 49
    .line 50
    :cond_0
    move-object v0, v2

    .line 51
    move-object v2, v1

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    move-object v0, v2

    .line 54
    :goto_0
    if-eqz v2, :cond_2

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object p0, p0, Ll/fbg;->e:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v2, v0, p0}, Ll/vag;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    .line 66
    .line 67
    const-string v0, "cannot find background or icon for fanbase Medals!"

    .line 68
    .line 69
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public static l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/ruf0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p0, p1}, Ll/vag;->g(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/vag;->a:Ll/vx3;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/vx3;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/graphics/drawable/Drawable$ConstantState;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ll/oag;

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ll/oag;->d(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    const-string v1, "context_livingAct"

    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p1}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v1, Ll/sag;

    .line 57
    .line 58
    invoke-direct {v1, p2, v0}, Ll/sag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p0, p1, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Ll/tag;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/tag;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/4 p1, 0x1

    .line 75
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    new-instance p1, Ll/uag;

    .line 80
    .line 81
    invoke-direct {p1}, Ll/uag;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_2
    :goto_0
    new-instance p0, Ll/ek20;

    .line 98
    .line 99
    invoke-direct {p0}, Ll/ek20;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    return-object p0
.end method

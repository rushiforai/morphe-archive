.class public Ll/gv40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cv40<",
        "Ll/dw40;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

.field public b:Ll/cv40;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cv40<",
            "Ll/dw40;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/gv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gv40;->f(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;)V

    return-void
.end method

.method public static synthetic b(Ll/gv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gv40;->e(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;)V

    return-void
.end method

.method public static synthetic c(Ll/gv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gv40;->i(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gv40;->b:Ll/cv40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ll/cv40;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cv40<",
            "Ll/dw40;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/gv40;->b:Ll/cv40;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gv40;->b:Ll/cv40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cv40;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gv40;->b:Ll/cv40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cv40;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/yec0;->W:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;

    .line 19
    .line 20
    iget-object v1, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/gv40;->b:Ll/cv40;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/cv40;->j4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 v1, 0x0

    .line 42
    :goto_0
    new-instance v2, Ll/fv40;

    .line 43
    .line 44
    invoke-direct {v2, p0, p1}, Ll/fv40;-><init>(Ll/gv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;->c(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;ZLl/y20;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cv40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gv40;->d(Ll/cv40;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    move v1, v0

    .line 11
    :goto_0
    iget-object v2, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v1, v2, :cond_4

    .line 18
    .line 19
    iget-object v2, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    instance-of v3, v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;

    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;

    .line 31
    .line 32
    iget-object v3, v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;->d:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 33
    .line 34
    if-ne v3, p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;->d(Z)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    iget-boolean v3, v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;->c:Z

    .line 41
    .line 42
    if-eqz v3, :cond_3

    .line 43
    .line 44
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;->d(Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    instance-of v3, v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;

    .line 49
    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;

    .line 53
    .line 54
    iget-object v3, v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;->c:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 55
    .line 56
    if-ne v3, p1, :cond_2

    .line 57
    .line 58
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;->d(Z)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    iget-boolean v3, v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;->d:Z

    .line 63
    .line 64
    if-eqz v3, :cond_3

    .line 65
    .line 66
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListItem;->d(Z)V

    .line 67
    .line 68
    .line 69
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->fixedTypes:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p2}, Ll/gv40;->l(Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->floatTypes:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/gv40;->m(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final l(Ljava/util/List;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget-object v0, p0, Ll/gv40;->b:Ll/cv40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/cv40;->j4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    move-object v0, p2

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 25
    .line 26
    :cond_1
    iget-object p2, p0, Ll/gv40;->b:Ll/cv40;

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Ll/cv40;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 29
    .line 30
    .line 31
    move p2, v1

    .line 32
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-ge p2, v2, :cond_3

    .line 37
    .line 38
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 43
    .line 44
    iget-object v3, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 45
    .line 46
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    sget v4, Ll/yec0;->V:I

    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;

    .line 58
    .line 59
    iget-object v4, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 60
    .line 61
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_2

    .line 71
    .line 72
    const/4 v4, 0x1

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    move v4, v1

    .line 75
    :goto_1
    new-instance v5, Ll/ev40;

    .line 76
    .line 77
    invoke-direct {v5, p0, v2}, Ll/ev40;-><init>(Ll/gv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3, v2, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;->c(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;ZLl/y20;)V

    .line 81
    .line 82
    .line 83
    add-int/lit8 p2, p2, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    :goto_2
    return-void
.end method

.method public final m(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Ll/yec0;->U:I

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListDivideItem;

    .line 25
    .line 26
    iget-object v1, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/dv40;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/dv40;-><init>(Ll/gv40;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget v0, Ll/yec0;->T:I

    .line 50
    .line 51
    invoke-virtual {p1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListShadowItem;

    .line 56
    .line 57
    iget-object p0, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

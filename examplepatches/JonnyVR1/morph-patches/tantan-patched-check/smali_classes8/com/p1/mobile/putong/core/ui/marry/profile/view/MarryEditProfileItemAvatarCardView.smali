.class public Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/oyl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

.field public b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(I)Ll/xk1;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zk1;->e(I)Ll/xk1$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xk1$a;->u()Ll/xk1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private r()V
    .locals 2

    .line 1
    sget v0, Ll/gdc0;->I:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 10
    .line 11
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->X5()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const/16 v1, 0x9

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v1, 0x6

    .line 29
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 33
    .line 34
    new-instance v1, Ll/t0x;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/t0x;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setConfig(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards$b;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 43
    .line 44
    new-instance v1, Ll/u0x;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/u0x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setOnMediaChanged(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->v()V

    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setMedia(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public getAllMedia()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
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
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 8
    .line 9
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 10
    .line 11
    if-ge v1, v3, :cond_1

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object v0
.end method

.method public getClickView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getItemType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/sec0;->I:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    const/4 v3, -0x2

    .line 23
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->r()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public bridge synthetic setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/oyl;->setContent(Ljava/lang/String;)V

    return-void
.end method

.method public setMediaChangeCallback(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->c:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final v()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 8
    .line 9
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 10
    .line 11
    if-ge v1, v3, :cond_1

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->c:Ll/y20;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;->c:Ll/y20;

    .line 44
    .line 45
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

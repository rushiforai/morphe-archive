.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VDraweeView;

.field public k:Lv/VDraweeView;

.field public l:Lv/VDraweeView;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

.field public o:Landroid/widget/AdapterViewFlipper;

.field public p:Ll/edh;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->k(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->k(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->k(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 v0, p0, 0x1

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method


# virtual methods
.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gdh;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    new-instance p0, Ll/fdh;

    .line 20
    .line 21
    invoke-direct {p0, v0, p2}, Ll/fdh;-><init>(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, p0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x3

    .line 14
    if-le p0, v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->m:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/16 p1, 0x8

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final f(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/OnVoiceCall;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
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
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;->user:Lcom/p1/mobile/putong/feed/data/Reference;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Reference;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-object v0
.end method

.method public final g(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
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
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->c(Ljava/util/List;Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public final h(Lcom/p1/mobile/putong/data/VoiceRoomInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->topics:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->topics:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;->name:Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    const-string p0, ""

    .line 22
    .line 23
    return-object p0
.end method

.method public final i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final j(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    const-string p0, ""

    .line 33
    .line 34
    return-object p0
.end method

.method public final k(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    sget-object p1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 15
    .line 16
    const-string v0, "#c175ff"

    .line 17
    .line 18
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const-string v2, "#00000000"

    .line 23
    .line 24
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    filled-new-array {v1, v3}, [I

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {p0, p1, v1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 40
    .line 41
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    filled-new-array {v0, v2}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-direct {p0, v1, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final l(Landroid/content/Context;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->m:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/widget/AdapterViewFlipper;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v0, p1, v1, v2}, Landroid/widget/AdapterViewFlipper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 14
    .line 15
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    const/4 v2, -0x2

    .line 19
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    const/16 v1, 0x10

    .line 23
    .line 24
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->r(Landroid/widget/AdapterViewFlipper;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 37
    .line 38
    sget v1, Ll/e8c0;->a:I

    .line 39
    .line 40
    invoke-virtual {v0, p1, v1}, Landroid/widget/AdapterViewAnimator;->setInAnimation(Landroid/content/Context;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 44
    .line 45
    sget v1, Ll/e8c0;->b:I

    .line 46
    .line 47
    invoke-virtual {v0, p1, v1}, Landroid/widget/AdapterViewAnimator;->setOutAnimation(Landroid/content/Context;I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-virtual {p1, v0}, Landroid/widget/AdapterViewAnimator;->setAnimateFirstView(Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 57
    .line 58
    const/16 v0, 0x708

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/widget/AdapterViewFlipper;->setFlipInterval(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->w()V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->m:Landroid/widget/FrameLayout;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final m(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/OnVoiceCall;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/OnVoiceCall;",
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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;->user:Lcom/p1/mobile/putong/feed/data/Reference;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Reference;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;->user:Lcom/p1/mobile/putong/feed/data/Reference;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Reference;->id:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_0

    .line 59
    .line 60
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    return-object v0
.end method

.method public n(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->u()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->l(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 16
    .line 17
    sget v0, Ll/lbc0;->z1:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->e(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->q(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->p(Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->s(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final o()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->onVoiceCalls:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->m(Ljava/util/List;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->f(Ljava/util/List;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g(Ljava/util/List;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v1, v2, :cond_3

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    if-eq v1, v3, :cond_1

    .line 36
    .line 37
    const/4 v3, 0x2

    .line 38
    if-eq v1, v3, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->l:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->v(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->k:Lv/VDraweeView;

    .line 48
    .line 49
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->v(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->j:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->v(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;)V

    .line 56
    .line 57
    .line 58
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->w()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->x()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->w()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->x()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final p(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->i:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "#bfffffff"

    .line 6
    .line 7
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->h:Lv/VText;

    .line 15
    .line 16
    const/4 p1, -0x1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p1, "#bfbfbf"

    .line 22
    .line 23
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->h:Lv/VText;

    .line 31
    .line 32
    const/high16 p1, -0x1000000

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final q(Z)V
    .locals 1

    .line 1
    const/high16 v0, 0x41080000    # 8.5f

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 6
    .line 7
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    int-to-float v0, v0

    .line 15
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 16
    .line 17
    .line 18
    const-string v0, "#33ffffff"

    .line 19
    .line 20
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g:Lv/VText;

    .line 33
    .line 34
    const/4 p1, -0x1

    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 40
    .line 41
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    int-to-float v0, v0

    .line 49
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 50
    .line 51
    .line 52
    const-string v0, "#0b000000"

    .line 53
    .line 54
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g:Lv/VText;

    .line 67
    .line 68
    const/high16 p1, -0x1000000

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final r(Landroid/widget/AdapterViewFlipper;)V
    .locals 3

    .line 1
    new-instance v0, Ll/edh;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x3

    .line 8
    invoke-direct {v0, v1, v2}, Ll/edh;-><init>(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->p:Ll/edh;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/edh;->e(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->p:Ll/edh;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/widget/AdapterViewFlipper;->setAdapter(Landroid/widget/Adapter;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/16 p0, 0x8

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final s(Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_6

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->j(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->i:Lv/VText;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->m1:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 46
    .line 47
    iget-wide v3, v1, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->memberCount:D

    .line 48
    .line 49
    double-to-int v1, v3

    .line 50
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->j(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->m1:I

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 81
    .line 82
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 83
    .line 84
    iget-wide v3, v3, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->memberCount:D

    .line 85
    .line 86
    double-to-int v3, v3

    .line 87
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v1, "%s \u2022 %s"

    .line 104
    .line 105
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g:Lv/VText;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 115
    .line 116
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 117
    .line 118
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->h(Lcom/p1/mobile/putong/data/VoiceRoomInfo;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v2, "%s"

    .line 127
    .line 128
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->h:Lv/VText;

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 140
    .line 141
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->title:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 147
    .line 148
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 149
    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->specialShowName:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    const/4 v1, 0x1

    .line 157
    const/4 v2, 0x0

    .line 158
    if-nez v0, :cond_1

    .line 159
    .line 160
    if-eqz p1, :cond_1

    .line 161
    .line 162
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->d:Landroid/widget/ImageView;

    .line 163
    .line 164
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->f:Landroid/widget/TextView;

    .line 168
    .line 169
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->b:Lv/VDraweeView;

    .line 173
    .line 174
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->e:Landroid/widget/TextView;

    .line 178
    .line 179
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g:Lv/VText;

    .line 183
    .line 184
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->e:Landroid/widget/TextView;

    .line 188
    .line 189
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 190
    .line 191
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 192
    .line 193
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->specialShowName:Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 199
    .line 200
    const/4 v0, 0x0

    .line 201
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 202
    .line 203
    .line 204
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 205
    .line 206
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->b:Lv/VDraweeView;

    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 211
    .line 212
    iget-object v3, p0, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->specialShowBackgroundUrl:Ljava/lang/String;

    .line 213
    .line 214
    const/4 v6, 0x0

    .line 215
    const/4 v7, 0x0

    .line 216
    const/4 v4, 0x0

    .line 217
    const/4 v5, 0x1

    .line 218
    invoke-virtual/range {v1 .. v7}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g:Lv/VText;

    .line 223
    .line 224
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->e:Landroid/widget/TextView;

    .line 228
    .line 229
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 230
    .line 231
    .line 232
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->b:Lv/VDraweeView;

    .line 233
    .line 234
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 238
    .line 239
    if-eqz p1, :cond_2

    .line 240
    .line 241
    sget p1, Ll/lbc0;->z1:I

    .line 242
    .line 243
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 244
    .line 245
    .line 246
    goto :goto_1

    .line 247
    :cond_2
    sget p1, Ll/lbc0;->L5:I

    .line 248
    .line 249
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 250
    .line 251
    .line 252
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 253
    .line 254
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceLiveGame:Lcom/p1/mobile/putong/data/VoiceLiveGame;

    .line 255
    .line 256
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    if-eqz p1, :cond_3

    .line 261
    .line 262
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 263
    .line 264
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceLiveGame:Lcom/p1/mobile/putong/data/VoiceLiveGame;

    .line 265
    .line 266
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 267
    .line 268
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    if-nez p1, :cond_3

    .line 273
    .line 274
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->f:Landroid/widget/TextView;

    .line 275
    .line 276
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 277
    .line 278
    .line 279
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->d:Landroid/widget/ImageView;

    .line 280
    .line 281
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 282
    .line 283
    .line 284
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->f:Landroid/widget/TextView;

    .line 285
    .line 286
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 287
    .line 288
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceLiveGame:Lcom/p1/mobile/putong/data/VoiceLiveGame;

    .line 289
    .line 290
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 293
    .line 294
    .line 295
    goto :goto_2

    .line 296
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->f:Landroid/widget/TextView;

    .line 297
    .line 298
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->d:Landroid/widget/ImageView;

    .line 302
    .line 303
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 304
    .line 305
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 306
    .line 307
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->maskMode:Z

    .line 308
    .line 309
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 310
    .line 311
    .line 312
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->g:Lv/VText;

    .line 313
    .line 314
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->d:Landroid/widget/ImageView;

    .line 315
    .line 316
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    if-nez v0, :cond_5

    .line 321
    .line 322
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->e:Landroid/widget/TextView;

    .line 323
    .line 324
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    if-nez v0, :cond_5

    .line 329
    .line 330
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->f:Landroid/widget/TextView;

    .line 331
    .line 332
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 333
    .line 334
    .line 335
    move-result p0

    .line 336
    if-eqz p0, :cond_4

    .line 337
    .line 338
    goto :goto_3

    .line 339
    :cond_4
    const/high16 p0, 0x41200000    # 10.0f

    .line 340
    .line 341
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 342
    .line 343
    .line 344
    move-result p0

    .line 345
    goto :goto_4

    .line 346
    :cond_5
    :goto_3
    const/high16 p0, 0x40800000    # 4.0f

    .line 347
    .line 348
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 349
    .line 350
    .line 351
    move-result p0

    .line 352
    :goto_4
    invoke-static {p1, p0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 353
    .line 354
    .line 355
    :cond_6
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->u()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->m:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    sget v0, Ll/lbc0;->L5:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->e(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->q(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->p(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->s(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->l:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->k:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->j:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->masksMap:Ljava/util/Map;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/data/LiveUserMask;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 34
    .line 35
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->maskMode:Z

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    const/4 p1, 0x0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-static {p2, v0, p1}, Ll/j6x;->a(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/LiveUserMask;Z)V

    .line 47
    .line 48
    .line 49
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    iget-object v3, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatar:Ljava/lang/String;

    .line 52
    .line 53
    const/4 v6, 0x0

    .line 54
    const/4 v7, 0x0

    .line 55
    const/4 v4, 0x1

    .line 56
    const/4 v5, 0x0

    .line 57
    move-object v2, p2

    .line 58
    invoke-virtual/range {v1 .. v7}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    move-object v2, p2

    .line 63
    invoke-static {v2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    move-object v2, p2

    .line 68
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, v2, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void
.end method

.method public final w()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/AdapterViewFlipper;->startFlipping()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final x()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->o:Landroid/widget/AdapterViewFlipper;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/AdapterViewFlipper;->stopFlipping()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->p:Ll/edh;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->p:Ll/edh;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/edh;->g()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Lv/VText;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/FrameLayout;

.field public final e:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/data/DbLinks;

.field public g:Ll/kcg0;

.field public h:Ll/kcg0;

.field public i:Ll/w76;

.field public j:Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/Runnable;

.field public m:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

.field public final n:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->f:Lcom/p1/mobile/putong/data/DbLinks;

    .line 13
    .line 14
    const-string p1, ""

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->k:Ljava/lang/String;

    .line 17
    .line 18
    new-instance p1, Ll/i76;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Ll/i76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->n:Ll/y20;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->f:Lcom/p1/mobile/putong/data/DbLinks;

    .line 29
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->k:Ljava/lang/String;

    .line 30
    new-instance p1, Ll/i76;

    invoke-direct {p1, p0}, Ll/i76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->n:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    const/4 p1, 0x0

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->f:Lcom/p1/mobile/putong/data/DbLinks;

    .line 34
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->k:Ljava/lang/String;

    .line 35
    new-instance p1, Ll/i76;

    invoke-direct {p1, p0}, Ll/i76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->n:Ll/y20;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->I(Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->H(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;ZLl/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->L(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;ZLl/vg60;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->M(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->G(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/LabelParams;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LabelParams;->key:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "closefriend"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private getOnlineAllView()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->i:Ll/w76;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->i:Ll/w76;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w76;->G()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/x66;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/x66;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-le v1, v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->N()V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->setProgress(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->P(Ll/vg60;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/data/LabelParams;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LabelParams;->key:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "online"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic l(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object p0, p0, Ll/dkb;->l1:Ll/byd0;

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic m(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-string v0, "-11000"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "-"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic q(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->J(Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->K(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->O(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ge p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/data/LabelParams;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LabelParams;->key:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "onlineAll"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static bridge synthetic w(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)Lcom/p1/mobile/putong/core/data/MessageFilterConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->j:Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    if-eqz p2, :cond_4

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_4

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 13
    .line 14
    const-string v2, "default"

    .line 15
    .line 16
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 23
    .line 24
    const-string v2, "blocked"

    .line 25
    .line 26
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_3

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-virtual {p0, v2, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->B(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_1

    .line 63
    .line 64
    return v0

    .line 65
    :cond_3
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :cond_4
    :goto_1
    return v0
.end method

.method public B(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x5

    .line 9
    const/4 v2, 0x3

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x1

    .line 12
    const/4 v5, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :sswitch_0
    const-string v0, "superLikeMe"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    const/16 v5, 0x8

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :sswitch_1
    const-string v0, "newMatch"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v5, 0x7

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string v0, "closefriend"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v5, 0x6

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string v0, "onlineAll"

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    move v5, v1

    .line 64
    goto :goto_0

    .line 65
    :sswitch_4
    const-string v0, "picture"

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v5, 0x4

    .line 75
    goto :goto_0

    .line 76
    :sswitch_5
    const-string v0, "unread"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    move v5, v2

    .line 86
    goto :goto_0

    .line 87
    :sswitch_6
    const-string v0, "online"

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_6

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    const/4 v5, 0x2

    .line 97
    goto :goto_0

    .line 98
    :sswitch_7
    const-string v0, "nearby"

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_7

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    move v5, v4

    .line 108
    goto :goto_0

    .line 109
    :sswitch_8
    const-string v0, "sentMessage"

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-nez p1, :cond_8

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_8
    move v5, v3

    .line 119
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :pswitch_0
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->R(Lcom/p1/mobile/putong/data/User;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    return p0

    .line 128
    :pswitch_1
    iget-boolean p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 129
    .line 130
    if-eqz p0, :cond_9

    .line 131
    .line 132
    iget-boolean p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 133
    .line 134
    if-nez p0, :cond_9

    .line 135
    .line 136
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-eqz p0, :cond_9

    .line 143
    .line 144
    return v4

    .line 145
    :cond_9
    return v3

    .line 146
    :pswitch_2
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 147
    .line 148
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-eqz p0, :cond_a

    .line 153
    .line 154
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 157
    .line 158
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_a

    .line 163
    .line 164
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 167
    .line 168
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 169
    .line 170
    if-eqz p1, :cond_a

    .line 171
    .line 172
    iget p0, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 173
    .line 174
    if-lt p0, v2, :cond_a

    .line 175
    .line 176
    return v4

    .line 177
    :cond_a
    :goto_1
    return v3

    .line 178
    :pswitch_3
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 179
    .line 180
    .line 181
    move-result p0

    .line 182
    return p0

    .line 183
    :pswitch_4
    iget p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 184
    .line 185
    if-gtz p0, :cond_b

    .line 186
    .line 187
    return v3

    .line 188
    :cond_b
    invoke-static {}, Ll/gra;->S2()Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    if-eqz p0, :cond_d

    .line 193
    .line 194
    iget-object p0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 195
    .line 196
    const-string p1, "-"

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    if-eqz p0, :cond_d

    .line 203
    .line 204
    const-string p0, "-11000"

    .line 205
    .line 206
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 207
    .line 208
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    if-eqz p0, :cond_c

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_c
    return v3

    .line 216
    :cond_d
    :goto_2
    return v4

    .line 217
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 218
    .line 219
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 220
    .line 221
    invoke-virtual {p0, p3, v1}, Lcom/p1/mobile/putong/core/api/f;->k3(Lcom/p1/mobile/putong/data/User;I)Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    return p0

    .line 226
    :pswitch_6
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    if-nez p0, :cond_e

    .line 231
    .line 232
    iget-object p0, p3, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 233
    .line 234
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 235
    .line 236
    const/16 p1, 0x4e20

    .line 237
    .line 238
    if-gt p0, p1, :cond_e

    .line 239
    .line 240
    return v4

    .line 241
    :cond_e
    return v3

    .line 242
    :pswitch_7
    iget p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 243
    .line 244
    if-lez p0, :cond_f

    .line 245
    .line 246
    return v4

    .line 247
    :cond_f
    return v3

    .line 248
    nop

    .line 249
    :sswitch_data_0
    .sparse-switch
        -0x58b672b1 -> :sswitch_8
        -0x3e8dd581 -> :sswitch_7
        -0x3c5549ad -> :sswitch_6
        -0x32158c51 -> :sswitch_5
        -0x226fa302 -> :sswitch_4
        -0x907b9b2 -> :sswitch_3
        0x2a9b8e96 -> :sswitch_2
        0x51124405 -> :sswitch_1
        0x7844c2ea -> :sswitch_0
    .end sparse-switch

    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final C()V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->getOnlineAllView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget v1, Ll/adc0;->G:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    sget v1, Ll/adc0;->z6:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    move-object v4, v1

    .line 21
    check-cast v4, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;

    .line 22
    .line 23
    sget v1, Ll/adc0;->jc:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    new-instance v2, Ll/e76;

    .line 36
    .line 37
    move-object v6, v4

    .line 38
    move v7, v5

    .line 39
    move-object v4, v1

    .line 40
    move-object v5, v3

    .line 41
    move-object v3, p0

    .line 42
    invoke-direct/range {v2 .. v7}, Ll/e76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V

    .line 43
    .line 44
    .line 45
    move v4, v7

    .line 46
    move-object v7, v2

    .line 47
    move-object v2, v3

    .line 48
    move-object v3, v5

    .line 49
    move v5, v4

    .line 50
    move-object v4, v6

    .line 51
    const/4 v6, 0x1

    .line 52
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->T(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;IZLjava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public D(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 4
    .line 5
    new-instance p1, Ll/w76;

    .line 6
    .line 7
    new-instance p2, Ll/n76;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/n76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 13
    .line 14
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/o76;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/o76;-><init>(Ljava/util/Set;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p1, p2, v1}, Ll/w76;-><init>(Ll/y20;Ll/qcj;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->i:Ll/w76;

    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 28
    .line 29
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->j:Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 38
    .line 39
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_0

    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->j:Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 48
    .line 49
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-nez p2, :cond_0

    .line 54
    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->j:Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 56
    .line 57
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    const/4 v0, 0x0

    .line 67
    if-nez p2, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->S()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_1

    .line 78
    .line 79
    new-instance p1, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 82
    .line 83
    .line 84
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 87
    .line 88
    iget-object p2, p2, Ll/dkb;->z6:Ll/jxd0;

    .line 89
    .line 90
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    check-cast p2, Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-nez p2, :cond_1

    .line 101
    .line 102
    new-instance p2, Ll/p76;

    .line 103
    .line 104
    invoke-direct {p2}, Ll/p76;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-static {p1, p2}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 108
    .line 109
    .line 110
    :cond_1
    invoke-static {}, Ll/gra;->s3()Lcom/p1/mobile/putong/core/data/LabelParams;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_2

    .line 119
    .line 120
    new-instance v1, Ll/q76;

    .line 121
    .line 122
    invoke-direct {v1}, Ll/q76;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {p1, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 126
    .line 127
    .line 128
    invoke-interface {p1, v0, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->i:Ll/w76;

    .line 132
    .line 133
    invoke-virtual {p2, p1}, Ll/w76;->J(Ljava/util/List;)V

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 138
    .line 139
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    :goto_0
    invoke-static {}, Ll/gra;->d3()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-eqz p1, :cond_4

    .line 147
    .line 148
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_4

    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->c:Landroid/widget/FrameLayout;

    .line 155
    .line 156
    const/4 p2, 0x1

    .line 157
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->d:Landroid/widget/FrameLayout;

    .line 161
    .line 162
    new-instance p2, Ll/r76;

    .line 163
    .line 164
    invoke-direct {p2, p3}, Ll/r76;-><init>(Ljava/lang/Runnable;)V

    .line 165
    .line 166
    .line 167
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 168
    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 171
    .line 172
    sget p1, Ll/qa00;->y:I

    .line 173
    .line 174
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->c:Landroid/widget/FrameLayout;

    .line 179
    .line 180
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 184
    .line 185
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public final E()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->y0()Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->j:Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->b:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 33
    .line 34
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$a;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Ljava/util/List;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v1, 0x14

    .line 15
    .line 16
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    new-instance v1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const/4 v3, 0x0

    .line 30
    move v4, v3

    .line 31
    :goto_0
    if-ge v4, v0, :cond_3

    .line 32
    .line 33
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 38
    .line 39
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    iget-object v7, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v6, v7}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-virtual {p0, v5, v6}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->A(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    if-eqz v6, :cond_2

    .line 54
    .line 55
    new-instance v6, Ll/k76;

    .line 56
    .line 57
    invoke-direct {v6, v5}, Ll/k76;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v2, v6}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-ltz v6, :cond_1

    .line 65
    .line 66
    invoke-interface {v2, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-eqz p2, :cond_4

    .line 80
    .line 81
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-nez p2, :cond_4

    .line 86
    .line 87
    invoke-interface {v2, v3, v1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 88
    .line 89
    .line 90
    :cond_4
    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->z(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final synthetic H(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;)V
    .locals 2

    .line 1
    filled-new-array {p1}, [Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->setProgress(F)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->i:Ll/w76;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic I(Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    new-instance v6, Ll/l76;

    .line 6
    .line 7
    invoke-direct {v6, p0, p2, p3}, Ll/l76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;)V

    .line 8
    .line 9
    .line 10
    const/4 v5, 0x0

    .line 11
    move-object v1, p0

    .line 12
    move-object v2, p2

    .line 13
    move-object v3, p3

    .line 14
    move v4, p4

    .line 15
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->T(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;IZLjava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic J(Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V
    .locals 6

    .line 1
    new-instance v0, Ll/g76;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/g76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    invoke-static {v2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$c;

    .line 24
    .line 25
    invoke-direct {p2, v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$c;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string p2, "https://auto.tancdn.com/v1/raw/6298bf34-85f1-47a4-83ad-43dd96fcb6e114.svga"

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$b;

    .line 43
    .line 44
    invoke-direct {p2, v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic K(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "filtrate_tag"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 8
    .line 9
    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "tag_state"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_fast_filtrate"

    .line 30
    .line 31
    const-string v2, "p_messages_view"

    .line 32
    .line 33
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->n:Ll/y20;

    .line 37
    .line 38
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic L(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;ZLl/vg60;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->getTabFilter()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/gra;->S2()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p4, Ll/vg60;->a:Ljava/util/List;

    .line 19
    .line 20
    new-instance v0, Ll/z66;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/z66;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p1, p4, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->f:Lcom/p1/mobile/putong/data/DbLinks;

    .line 31
    .line 32
    iget-object p1, p4, Ll/vg60;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->M(Ljava/util/List;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->z(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic M(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->l:Ljava/lang/Runnable;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->l:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic O(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :goto_0
    const-string v0, "onlineAll"

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    iget-object p1, p1, Ll/dkb;->l1:Ll/byd0;

    .line 31
    .line 32
    const-wide/16 v0, -0x1

    .line 33
    .line 34
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_1
    const-string p1, "filtrate_tag"

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->getTabFilter()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    filled-new-array {p1}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string v0, "e_fast_filtrate"

    .line 56
    .line 57
    const-string v1, "p_messages_view"

    .line 58
    .line 59
    invoke-static {v0, v1, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->i:Ll/w76;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 68
    .line 69
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->p2:Lrx/subjects/a;

    .line 80
    .line 81
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->h:Ll/kcg0;

    .line 87
    .line 88
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->getConversationsAdapter()Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const/4 v0, 0x0

    .line 99
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Z)V

    .line 100
    .line 101
    .line 102
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    new-instance v0, Ll/s76;

    .line 107
    .line 108
    invoke-direct {v0, p0}, Ll/s76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic P(Ll/vg60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/f76;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/f76;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    iget-object p1, p1, Ll/dkb;->l1:Ll/byd0;

    .line 31
    .line 32
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->n:Ll/y20;

    .line 44
    .line 45
    const-string p1, "onlineAll"

    .line 46
    .line 47
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->C()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Z)V
    .locals 4

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->f:Lcom/p1/mobile/putong/data/DbLinks;

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->f:Lcom/p1/mobile/putong/data/DbLinks;

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->getTabFilter()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/a;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v3, "&"

    .line 42
    .line 43
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->f:Lcom/p1/mobile/putong/data/DbLinks;

    .line 47
    .line 48
    iget-object v3, v3, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const-string v2, ""

    .line 61
    .line 62
    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->k:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_4

    .line 76
    .line 77
    :cond_3
    :goto_1
    return-void

    .line 78
    :cond_4
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->k:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->g:Ll/kcg0;

    .line 81
    .line 82
    invoke-static {v2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 94
    .line 95
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/api/g;->mg(Ljava/lang/String;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    new-instance v2, Ll/t76;

    .line 104
    .line 105
    invoke-direct {v2, p0, v0, p1, p2}, Ll/t76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Z)V

    .line 106
    .line 107
    .line 108
    new-instance p1, Ll/y66;

    .line 109
    .line 110
    invoke-direct {p1, p0}, Ll/y66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {v1, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->g:Ll/kcg0;

    .line 122
    .line 123
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 8
    .line 9
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherRelationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 49
    .line 50
    const-string p1, "SUPERLIKED"

    .line 51
    .line 52
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    :cond_2
    :goto_0
    return p0
.end method

.method public final S()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelParams;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gra;->P()Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;->enabled:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;->filterTabList:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;->filterTabList:Ljava/util/List;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public final T(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;IZLjava/lang/Runnable;)V
    .locals 4
    .param p5    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    const v0, 0x800003

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const v0, 0x800005

    .line 14
    .line 15
    .line 16
    :goto_0
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "#33000000"

    .line 22
    .line 23
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 v0, -0x1

    .line 28
    if-eqz p4, :cond_1

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->t(II)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-virtual {p2, v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->t(II)V

    .line 35
    .line 36
    .line 37
    :goto_1
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 38
    .line 39
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x2

    .line 43
    new-array v1, v0, [F

    .line 44
    .line 45
    fill-array-data v1, :array_0

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    new-instance v2, Ll/h76;

    .line 53
    .line 54
    invoke-direct {v2, p2}, Ll/h76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 61
    .line 62
    .line 63
    sget-object p2, Ll/ht0;->n:Landroid/util/Property;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    if-eqz p4, :cond_2

    .line 67
    .line 68
    move v3, v2

    .line 69
    goto :goto_2

    .line 70
    :cond_2
    move v3, p3

    .line 71
    :goto_2
    if-eqz p4, :cond_3

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_3
    move p3, v2

    .line 75
    :goto_3
    filled-new-array {v3, p3}, [I

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-static {p1, p2, p3}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    new-array p3, v0, [Landroid/animation/Animator;

    .line 84
    .line 85
    aput-object p2, p3, v2

    .line 86
    .line 87
    const/4 p2, 0x1

    .line 88
    aput-object v1, p3, p2

    .line 89
    .line 90
    invoke-virtual {p0, p3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 91
    .line 92
    .line 93
    const-wide/16 p2, 0x190

    .line 94
    .line 95
    invoke-virtual {p0, p2, p3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 96
    .line 97
    .line 98
    new-instance p2, Ll/j76;

    .line 99
    .line 100
    invoke-direct {p2, p1}, Ll/j76;-><init>(Landroid/view/View;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p0, p2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    invoke-static {p0, p5, p5}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public U()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    const-string v2, "onlineAll"

    .line 32
    .line 33
    invoke-static {v2}, Lcom/p1/mobile/putong/core/api/a;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->mg(Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/a76;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/a76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ll/b76;

    .line 51
    .line 52
    invoke-direct {p0}, Ll/b76;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    invoke-static {}, Ll/gra;->v3()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->C()V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public getTabFilter()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_0

    .line 29
    .line 30
    const-string v2, ","

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->x(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->E()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/m76;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/m76;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u76;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y(ILjava/lang/String;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->h:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->k:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez p1, :cond_2

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->j:Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->j:Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    move p1, v1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move p1, v2

    .line 35
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 36
    .line 37
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->b:Lv/VText;

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->b:Lv/VText;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->b:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    sget v0, Lcom/p1/mobile/putong/core/R$string;->d2:I

    .line 63
    .line 64
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 73
    .line 74
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->b:Lv/VText;

    .line 78
    .line 79
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->b:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 88
    .line 89
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_3

    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->a:Lv/VRecyclerView;

    .line 96
    .line 97
    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e:Ljava/util/Set;

    .line 101
    .line 102
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 103
    .line 104
    .line 105
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->p2:Lrx/subjects/a;

    .line 110
    .line 111
    sget-object p2, Ll/uxj0;->a:Ll/uxj0;

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->l:Ljava/lang/Runnable;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_4

    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->l:Ljava/lang/Runnable;

    .line 125
    .line 126
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_3
    move v1, v2

    .line 131
    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->i:Ll/w76;

    .line 132
    .line 133
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_5

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->i:Ll/w76;

    .line 140
    .line 141
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 142
    .line 143
    .line 144
    :cond_5
    return v1
.end method

.method public final z(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->h:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->Te()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/c76;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/c76;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/d76;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/d76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->h:Ll/kcg0;

    .line 51
    .line 52
    return-void
.end method

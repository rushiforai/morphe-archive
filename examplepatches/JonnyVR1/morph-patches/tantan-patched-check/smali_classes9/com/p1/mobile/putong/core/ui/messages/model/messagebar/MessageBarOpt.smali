.class public Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;
.super Lcom/p1/mobile/putong/core/ui/messages/MessageBar;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;
    }
.end annotation


# static fields
.field public static final G0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final H0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final I0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final J0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:Lv/VText;

.field public B:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

.field public C:Landroid/widget/TextView;

.field public D:Lv/VText;

.field public E:Landroid/widget/FrameLayout;

.field public E0:Landroid/widget/LinearLayout;

.field public F:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

.field public F0:Z

.field public G:Landroid/widget/TextView;

.field public H:Landroid/widget/TextView;

.field public I:Lv/VText;

.field public J:Landroid/widget/ImageView;

.field public K:Lv/VButton;

.field public L:Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

.field public M:Landroid/view/ViewStub;

.field public N:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;

.field public O:Ljava/lang/String;

.field public P:Ljava/lang/String;

.field public Q:Ll/y20;

.field public R:Z

.field public S:Z

.field public T:Z

.field public U:Landroid/view/animation/AccelerateInterpolator;

.field public V:Z

.field public W:Ll/dyy;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/RelativeLayout;

.field public h:Landroid/widget/TextView;

.field public i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/view/View;

.field public k0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/rxy;",
            ">;"
        }
    .end annotation
.end field

.field public l:Landroid/widget/ImageView;

.field public m:Landroid/widget/ImageView;

.field public n:Lcom/p1/mobile/putong/core/ui/messages/view/MessageBarRootLayout;

.field public o:Landroid/widget/LinearLayout;

.field public p:Landroid/widget/LinearLayout;

.field public p0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;",
            ">;"
        }
    .end annotation
.end field

.field public q:Landroid/widget/FrameLayout;

.field public r:Landroid/widget/FrameLayout;

.field public s:Lv/VText;

.field public t:Landroid/view/View;

.field public u:Landroid/widget/LinearLayout;

.field public v:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

.field public w:Lv/VLinear;

.field public x:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

.field public y:Lcom/tantan/library/svga/SVGAnimationView;

.field public z:Lv/VImage;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$m;

    .line 2
    .line 3
    const-string v1, "marginLeft"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$m;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->G0:Landroid/util/Property;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$a;

    .line 13
    .line 14
    const-string v1, "marginTop"

    .line 15
    .line 16
    invoke-direct {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->H0:Landroid/util/Property;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$b;

    .line 22
    .line 23
    const-string v1, "marginBottom"

    .line 24
    .line 25
    invoke-direct {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->I0:Landroid/util/Property;

    .line 29
    .line 30
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$c;

    .line 31
    .line 32
    const-string v1, "backgroundColor"

    .line 33
    .line 34
    invoke-direct {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$c;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->J0:Landroid/util/Property;

    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->O:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->R:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S:Z

    .line 14
    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T:Z

    .line 16
    .line 17
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->U:Landroid/view/animation/AccelerateInterpolator;

    .line 23
    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->V:Z

    .line 25
    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->F0:Z

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->O:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P:Ljava/lang/String;

    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->R:Z

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S:Z

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T:Z

    .line 35
    new-instance p2, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->U:Landroid/view/animation/AccelerateInterpolator;

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->V:Z

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->F0:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->O:Ljava/lang/String;

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P:Ljava/lang/String;

    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->R:Z

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S:Z

    .line 43
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T:Z

    .line 44
    new-instance p2, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->U:Landroid/view/animation/AccelerateInterpolator;

    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->V:Z

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->F0:Z

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->i0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->g0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->c0(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->o0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->q0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->m0()V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->D0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method private getSafeSourceFrom()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const-string p0, "love_signal"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeQuickChatConv()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    const-string p0, "quickchat"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    const-string p0, ""

    .line 46
    .line 47
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->j0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->e0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->C0()V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->n0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->l0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->d0()V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Ll/dyy;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rxy;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-interface {p0, v0, p1, v1}, Ll/dyy;->b(Ll/rxy;Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f0()V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0()V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->h0()V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r0()V

    return-void
.end method


# virtual methods
.method public A0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->EMOJI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->B0(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->EMOJI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->B0(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public B0(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Ll/rxy;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/rxy;->d()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    if-ne v3, p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2, p2}, Ll/rxy;->j(Z)Ll/rxy;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, p2}, Ll/rxy;->k(Z)Ll/rxy;

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final C0()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->g1:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v0, v0, Ll/dkb;->s2:Ll/jxd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ll/clz;->t7()Ll/qzz;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ll/qzz;->V1()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x0

    .line 64
    new-array v1, v1, [Ll/sfj0$a;

    .line 65
    .line 66
    const-string v2, "e_heat_entrance_bubble"

    .line 67
    .line 68
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->g1:Ll/jxd0;

    .line 76
    .line 77
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    new-instance v0, Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 89
    .line 90
    .line 91
    const-string v1, "\u7528\u6e29\u5ea6\u8bb0\u5f55\u4f60\u4eec\u7684\u804a\u5929\u65f6\u5149\u3002\u968f\u7740\u6e29\n\u5ea6\u7684\u5347\u9ad8\uff0c\u53ef\u89e3\u9501\u66f4\u591a\u4eb2\u5bc6\u529f\u80fd"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    const/high16 v1, 0x41800000    # 16.0f

    .line 97
    .line 98
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    const/high16 v3, 0x41200000    # 10.0f

    .line 103
    .line 104
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 117
    .line 118
    .line 119
    const/high16 v1, 0x41500000    # 13.0f

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    const/4 v2, 0x1

    .line 129
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 130
    .line 131
    .line 132
    const/4 v1, -0x1

    .line 133
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 134
    .line 135
    .line 136
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 139
    .line 140
    .line 141
    new-instance v1, Ll/rzy;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Ll/rzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 147
    .line 148
    .line 149
    new-instance v1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-direct {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const/16 v3, 0x4b

    .line 163
    .line 164
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    sget v2, Ll/qa00;->i:I

    .line 177
    .line 178
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->z(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    const-wide/16 v3, 0xbb8

    .line 183
    .line 184
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    neg-int v2, v2

    .line 189
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 194
    .line 195
    sget v3, Ll/qa00;->g:I

    .line 196
    .line 197
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 202
    .line 203
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 204
    .line 205
    or-int/2addr v2, v3

    .line 206
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-eqz v2, :cond_2

    .line 226
    .line 227
    sget v2, Ll/g9c0;->j:I

    .line 228
    .line 229
    goto :goto_0

    .line 230
    :cond_2
    sget v2, Ll/b9c0;->h:I

    .line 231
    .line 232
    :goto_0
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    filled-new-array {v0}, [I

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 241
    .line 242
    .line 243
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 248
    .line 249
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->O:Ljava/lang/String;

    .line 254
    .line 255
    return-void
.end method

.method public final D0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

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
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    move-object v1, v0

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ll/qzz;->V1()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "heat_function_name"

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->key:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    filled-new-array {v2}, [Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "e_heat_increase_remind"

    .line 54
    .line 55
    invoke-static {v3, v1, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    sget v2, Ll/qec0;->I2:I

    .line 67
    .line 68
    const/4 v3, 0x0

    .line 69
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    sget v2, Ll/edc0;->k1:I

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Landroid/widget/ImageView;

    .line 80
    .line 81
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->t(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 86
    .line 87
    .line 88
    sget v2, Ll/edc0;->Q4:I

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Landroid/widget/TextView;

    .line 95
    .line 96
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    const/4 v4, 0x1

    .line 101
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 102
    .line 103
    .line 104
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->u(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    sget v2, Ll/edc0;->Z:I

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Landroid/widget/TextView;

    .line 118
    .line 119
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->s(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    sget v2, Ll/edc0;->B:I

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    check-cast v2, Landroid/widget/TextView;

    .line 133
    .line 134
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 139
    .line 140
    .line 141
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->l(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    new-instance v3, Ll/xzy;

    .line 149
    .line 150
    invoke-direct {v3, p0, v0, p1}, Ll/xzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 157
    .line 158
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-direct {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    const/16 v2, 0x4b

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    const-wide/16 v2, 0x1388

    .line 184
    .line 185
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    sget v2, Ll/qa00;->i:I

    .line 190
    .line 191
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->z(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 196
    .line 197
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 198
    .line 199
    or-int/2addr v3, v4

    .line 200
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    neg-int v3, v2

    .line 205
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 210
    .line 211
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    sget v2, Ll/qa00;->m:I

    .line 216
    .line 217
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->j(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    filled-new-array {p1}, [I

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 230
    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 237
    .line 238
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P:Ljava/lang/String;

    .line 243
    .line 244
    return-void
.end method

.method public final E0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->R:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->R:Z

    .line 8
    .line 9
    const-string v0, "source_from"

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSafeSourceFrom()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "e_im_fake_to_good"

    .line 24
    .line 25
    const-string v1, "p_chat_view"

    .line 26
    .line 27
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final F0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->Q:Ll/y20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->Q:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zzy;->a(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E0:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public N()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rxy;

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {v0, v1}, Ll/rxy;->a(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public O()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Ll/rxy;

    .line 18
    .line 19
    instance-of v4, v3, Ll/xxy;

    .line 20
    .line 21
    if-eqz v4, :cond_0

    .line 22
    .line 23
    invoke-virtual {v3, v1}, Ll/rxy;->j(Z)Ll/rxy;

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const/4 v4, 0x1

    .line 28
    invoke-virtual {v3, v4}, Ll/rxy;->j(Z)Ll/rxy;

    .line 29
    .line 30
    .line 31
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->L(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S:Z

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->q:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget p1, Ll/qa00;->i:I

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public R()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S(Ljava/util/List;Ll/dyy;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/rxy;",
            ">;",
            "Ll/dyy;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->W:Ll/dyy;

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 11
    .line 12
    new-instance v0, Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E0:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 26
    .line 27
    .line 28
    const-wide/16 v1, 0x96

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E0:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    const/4 v1, -0x1

    .line 41
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E0:Landroid/widget/LinearLayout;

    .line 47
    .line 48
    invoke-virtual {v2, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v2, 0x0

    .line 62
    :goto_0
    if-ge v2, v0, :cond_1

    .line 63
    .line 64
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Ll/rxy;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-static {v3, v4, v2, v0}, Ll/uxy;->c(Ll/rxy;Landroid/content/Context;II)Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 79
    .line 80
    invoke-direct {v5, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 81
    .line 82
    .line 83
    const/high16 v6, 0x3f800000    # 1.0f

    .line 84
    .line 85
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 86
    .line 87
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E0:Landroid/widget/LinearLayout;

    .line 88
    .line 89
    invoke-virtual {v6, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    .line 91
    .line 92
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    new-instance v5, Ll/yzy;

    .line 101
    .line 102
    invoke-direct {v5, p2}, Ll/yzy;-><init>(Ll/dyy;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v4, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v3}, Ll/rxy;->f()Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-eqz v3, :cond_0

    .line 113
    .line 114
    new-instance v3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$d;

    .line 115
    .line 116
    invoke-direct {v3, p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$d;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Ll/dyy;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v4, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 120
    .line 121
    .line 122
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A0()V

    .line 126
    .line 127
    .line 128
    :cond_2
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->y0()V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T:Z

    .line 16
    .line 17
    const-string p0, "chat_emoji_entrance"

    .line 18
    .line 19
    const-string v0, "emoji"

    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "e_chat_emoji_entrance"

    .line 30
    .line 31
    const-string v1, "p_chat_view"

    .line 32
    .line 33
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->z0()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final U()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->D:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/mzy;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->x:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$e;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$e;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->K:Lv/VButton;

    .line 49
    .line 50
    sget v0, Ll/ibc0;->g:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 2
    .line 3
    const/high16 v1, 0x41700000    # 15.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 14
    .line 15
    const/high16 v1, 0x41f00000    # 30.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    const/high16 v1, 0x41cc0000    # 25.5f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    int-to-float v1, v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    const/high16 v1, 0x41a80000    # 21.0f

    .line 40
    .line 41
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    int-to-float v1, v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    new-instance v2, Ll/czy;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/czy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    if-ne p1, v0, :cond_0

    .line 70
    .line 71
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    const/4 v0, 0x1

    .line 76
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 80
    .line 81
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-array v2, v1, [Ll/sfj0$a;

    .line 95
    .line 96
    const-string v3, "e_heat_entrance"

    .line 97
    .line 98
    invoke-static {v3, v0, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->v:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 113
    .line 114
    const/high16 v1, 0x426c0000    # 59.0f

    .line 115
    .line 116
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->v:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 123
    .line 124
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 128
    .line 129
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->j(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    sget v4, Ll/qa00;->i:I

    .line 134
    .line 135
    const/4 v7, 0x0

    .line 136
    const/4 v8, 0x0

    .line 137
    const/4 v5, -0x1

    .line 138
    const/4 v6, 0x0

    .line 139
    invoke-static/range {v2 .. v8}, Ll/zfm;->b(Landroid/view/View;IIIIII)V

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 143
    .line 144
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->k(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public W()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->W:Ll/dyy;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->W:Ll/dyy;

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->BLOCK:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/dyy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    new-array v0, v0, [Ll/sfj0$a;

    .line 13
    .line 14
    const-string v1, "e_heat_entrance"

    .line 15
    .line 16
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->O:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->O:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    const-string p1, "keyboard_left"

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->F0(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "source_from"

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSafeSourceFrom()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "e_im_fake_to_good"

    .line 16
    .line 17
    const-string v1, "p_chat_view"

    .line 18
    .line 19
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    invoke-interface {p1, p0}, Ll/r97;->D1(Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public a()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rxy;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Ll/rxy;->i(Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic a0(Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->W:Ll/dyy;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    move-object v0, p1

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d0()Ll/vez;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/n2;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->V:Z

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/dzy;

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ll/dzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 51
    .line 52
    .line 53
    const-wide/16 v1, 0x12c

    .line 54
    .line 55
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 60
    .line 61
    invoke-virtual {v1, p1}, Landroid/view/View;->setAlpha(F)V

    .line 62
    .line 63
    .line 64
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->U:Landroid/view/animation/AccelerateInterpolator;

    .line 65
    .line 66
    const/high16 p1, 0x43480000    # 200.0f

    .line 67
    .line 68
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    int-to-float p1, p1

    .line 73
    const/4 v0, 0x2

    .line 74
    new-array v8, v0, [F

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    aput p1, v8, v0

    .line 78
    .line 79
    const/4 p1, 0x1

    .line 80
    aput v2, v8, p1

    .line 81
    .line 82
    const-string v2, "translationY"

    .line 83
    .line 84
    const-wide/16 v3, 0x0

    .line 85
    .line 86
    const-wide/16 v5, 0xc8

    .line 87
    .line 88
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    filled-new-array {p1}, [Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 101
    .line 102
    .line 103
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->W:Ll/dyy;

    .line 104
    .line 105
    invoke-interface {p0}, Ll/dyy;->a()V

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ge v0, v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/rxy;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/rxy;->d()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-ne v1, p1, :cond_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v0, -0x1

    .line 37
    :goto_1
    if-ltz v0, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-ge v0, p1, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Landroid/view/View;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_2
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method public final synthetic b0(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "keyboard_top"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->F0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/rxy;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/rxy;->d()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-ne v0, p1, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public final synthetic c0(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string p3, "heat_function_name"

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->key:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p3, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string p3, "e_heat_increase_remind"

    .line 20
    .line 21
    invoke-static {p3, p1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p1, "keyboard_top"

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->F0(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/rxy;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/rxy;->d()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-ne v1, p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/rxy;->g()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public final synthetic d0()V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 12
    .line 13
    const/4 v3, 0x3

    .line 14
    new-array v4, v3, [F

    .line 15
    .line 16
    fill-array-data v4, :array_0

    .line 17
    .line 18
    .line 19
    const-string v5, "scaleX"

    .line 20
    .line 21
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 29
    .line 30
    new-array v2, v3, [F

    .line 31
    .line 32
    fill-array-data v2, :array_1

    .line 33
    .line 34
    .line 35
    const-string v3, "scaleY"

    .line 36
    .line 37
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    new-instance p0, Landroid/view/animation/DecelerateInterpolator;

    .line 45
    .line 46
    invoke-direct {p0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 53
    .line 54
    .line 55
    const-wide/16 v1, 0x180

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f91eb85    # 1.14f
        0x0
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f91eb85    # 1.14f
        0x0
    .end array-data
.end method

.method public final synthetic e0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->J0:Landroid/util/Property;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->j(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->l(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    filled-new-array {v4, p1}, [I

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {v2, v3, p1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v2, Landroid/animation/ArgbEvaluator;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 43
    .line 44
    const/4 v2, 0x2

    .line 45
    new-array v2, v2, [F

    .line 46
    .line 47
    fill-array-data v2, :array_0

    .line 48
    .line 49
    .line 50
    const-string v3, "alpha"

    .line 51
    .line 52
    invoke-static {p1, v3, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 60
    .line 61
    .line 62
    const-wide/16 v1, 0x85

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->H0:Landroid/util/Property;

    .line 73
    .line 74
    const/16 v1, 0xe

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    filled-new-array {v1, v2}, [I

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {p1, v0, v1}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-wide/16 v0, 0xe9

    .line 86
    .line 87
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$l;

    .line 92
    .line 93
    invoke-direct {v0, p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$l;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;D)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Ll/rxy;

    .line 23
    .line 24
    invoke-virtual {v3, v2, v1, v0}, Ll/rxy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic f0()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->H0:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/16 v2, 0xe

    .line 7
    .line 8
    filled-new-array {v1, v2}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {p0, v0, v1}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-wide/16 v0, 0xe9

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;->DEFAULT:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMessageBarRoot()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;->FAKE_LOCK:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;

    .line 31
    .line 32
    if-ne p1, v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMessageBarRoot()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    sget v0, Ll/ibc0;->g:I

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    sget v0, Ll/ibc0;->e:I

    .line 70
    .line 71
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Ll/g9c0;->a0:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const-string v0, "\u4e0a\u4f20\u5934\u50cf\u540e\u5f00\u542f\u804a\u5929"

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance v0, Ll/ezy;

    .line 105
    .line 106
    invoke-direct {v0, p0}, Ll/ezy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E0()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;->AVATAR_AUDIT:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;

    .line 117
    .line 118
    if-ne p1, v0, :cond_3

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMessageBarRoot()Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    sget v0, Ll/ibc0;->K1:I

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    sget v1, Ll/g9c0;->a0:I

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRecoverMatchView()Lv/VButton;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    const-string p1, "\u5ba1\u6838\u901a\u8fc7\u540e\u5373\u53ef\u5f00\u542f\u804a\u5929"

    .line 165
    .line 166
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    :cond_3
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->J0:Landroid/util/Property;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->l(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->j(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    filled-new-array {v4, p1}, [I

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {v2, v3, p1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v2, Landroid/animation/ArgbEvaluator;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 43
    .line 44
    const/4 p1, 0x2

    .line 45
    new-array p1, p1, [F

    .line 46
    .line 47
    fill-array-data p1, :array_0

    .line 48
    .line 49
    .line 50
    const-string v2, "alpha"

    .line 51
    .line 52
    invoke-static {p0, v2, p1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 60
    .line 61
    .line 62
    const-wide/16 p0, 0x85

    .line 63
    .line 64
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public getActionLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAiChatview()Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->N:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBarMaskLayer()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBarWrapper()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->q:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->x:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBar_center_text_layout()Lv/VLinear;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->w:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getBar_send()Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_send()Lv/VText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getBar_send()Lv/VText;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    return-object p0
.end method

.method public getBlockText()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->D:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCameraFunction()Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->B:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getChangeSizeView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCloseView()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->J:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCountDownTimer()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEditRootView()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->v:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExpandView()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->m:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFilterNameView()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFilterView()Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftView()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ge v0, v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/rxy;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/rxy;->d()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->GIFT:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 31
    .line 32
    if-ne v1, v2, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 v0, -0x1

    .line 39
    :goto_1
    if-ltz v0, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-ge v0, v1, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Landroid/view/View;

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_2
    const/4 p0, 0x0

    .line 59
    return-object p0
.end method

.method public getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->L:Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInputAiView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->y:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInputContent()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->o:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInputRoot()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->u:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskLayer()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMessageBarRoot()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->n:Lcom/p1/mobile/putong/core/ui/messages/view/MessageBarRootLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNoticeBubble()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->G:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNoticeVideo()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->H:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRealShotSend()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->C:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->F:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecoverMatchView()Lv/VButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->K:Lv/VButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReferenceView()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSingleText()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->I:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceContainer()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->d:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceViewRooter()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSwitchCameraView()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->l:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTempInputLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Ll/rxy;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/rxy;->d()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    if-ne v3, p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2, p2}, Ll/rxy;->i(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic h0()V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 12
    .line 13
    const/4 v3, 0x4

    .line 14
    new-array v4, v3, [F

    .line 15
    .line 16
    fill-array-data v4, :array_0

    .line 17
    .line 18
    .line 19
    const-string v5, "scaleX"

    .line 20
    .line 21
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 29
    .line 30
    new-array v2, v3, [F

    .line 31
    .line 32
    fill-array-data v2, :array_1

    .line 33
    .line 34
    .line 35
    const-string v3, "scaleY"

    .line 36
    .line 37
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 45
    .line 46
    .line 47
    const-wide/16 v1, 0x15e

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x3f88f5c3    # 1.07f
        0x3f7ae148    # 0.98f
        0x3f800000    # 1.0f
    .end array-data

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    :array_1
    .array-data 4
        0x0
        0x3f88f5c3    # 1.07f
        0x3f7ae148    # 0.98f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public i(ZZ)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/h39;->S()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v1, "switchPicBubbleKey"

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->N:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;

    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->N:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;

    .line 42
    .line 43
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S:Z

    .line 49
    .line 50
    xor-int/2addr p0, v0

    .line 51
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->J0:Landroid/util/Property;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->l(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->j(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    filled-new-array {v4, p1}, [I

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {v2, v3, p1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v2, Landroid/animation/ArgbEvaluator;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 43
    .line 44
    const/4 p1, 0x2

    .line 45
    new-array p1, p1, [F

    .line 46
    .line 47
    fill-array-data p1, :array_0

    .line 48
    .line 49
    .line 50
    const-string v2, "alpha"

    .line 51
    .line 52
    invoke-static {p0, v2, p1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 60
    .line 61
    .line 62
    const-wide/16 p0, 0x85

    .line 63
    .line 64
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public j(ZZ)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->V:Z

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->z:Lv/VImage;

    .line 11
    .line 12
    if-eqz p1, :cond_3

    .line 13
    .line 14
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    sget p1, Ll/ibc0;->D:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    sget p1, Ll/ibc0;->C:I

    .line 32
    .line 33
    :goto_0
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    if-nez p2, :cond_2

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->q:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    const/high16 p2, 0x40e00000    # 7.0f

    .line 41
    .line 42
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-static {p1, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_1
    return-void

    .line 56
    :cond_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    sget p1, Ll/ibc0;->B:I

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    sget p1, Ll/ibc0;->A:I

    .line 74
    .line 75
    :goto_2
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->q:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S:Z

    .line 81
    .line 82
    if-eqz p2, :cond_5

    .line 83
    .line 84
    sget p2, Ll/qa00;->i:I

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_5
    const/4 p2, 0x0

    .line 88
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    :goto_3
    invoke-static {p1, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->E:Landroid/widget/FrameLayout;

    .line 96
    .line 97
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S:Z

    .line 98
    .line 99
    xor-int/lit8 p0, p0, 0x1

    .line 100
    .line 101
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 12
    .line 13
    const/4 v3, 0x4

    .line 14
    new-array v4, v3, [F

    .line 15
    .line 16
    fill-array-data v4, :array_0

    .line 17
    .line 18
    .line 19
    const-string v5, "scaleX"

    .line 20
    .line 21
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 29
    .line 30
    new-array v3, v3, [F

    .line 31
    .line 32
    fill-array-data v3, :array_1

    .line 33
    .line 34
    .line 35
    const-string v4, "scaleY"

    .line 36
    .line 37
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$k;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$k;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    const-wide/16 p0, 0x16f

    .line 56
    .line 57
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f88f5c3    # 1.07f
        0x3f7ae148    # 0.98f
        0x3f800000    # 1.0f
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :array_1
    .array-data 4
        0x0
        0x3f88f5c3    # 1.07f
        0x3f7ae148    # 0.98f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public k(ILcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 1

    .line 1
    const/16 v0, 0x77c

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance p2, Ll/szy;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/szy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/16 v0, 0x8b9

    .line 19
    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/tzy;

    .line 27
    .line 28
    invoke-direct {v0, p0, p2, p3, p4}, Ll/tzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const/16 p3, 0x1482

    .line 36
    .line 37
    if-ne p1, p3, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance p2, Ll/uzy;

    .line 44
    .line 45
    invoke-direct {p2, p0}, Ll/uzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    const/16 p3, 0x14d5

    .line 53
    .line 54
    if-ne p1, p3, :cond_3

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance p3, Ll/vzy;

    .line 61
    .line 62
    invoke-direct {p3, p0, p2}, Ll/vzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1, p3}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    const/16 p2, 0x1539

    .line 70
    .line 71
    if-ne p1, p2, :cond_4

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance p2, Ll/wzy;

    .line 78
    .line 79
    invoke-direct {p2, p0}, Ll/wzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 83
    .line 84
    .line 85
    :cond_4
    return-void
.end method

.method public final synthetic k0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->v:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 8
    .line 9
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->G0:Landroid/util/Property;

    .line 10
    .line 11
    const/high16 v3, 0x42740000    # 61.0f

    .line 12
    .line 13
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/high16 v4, 0x426c0000    # 59.0f

    .line 18
    .line 19
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    filled-new-array {v1, v3, v4}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v2, v1}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-wide/16 v1, 0x14e

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$f;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$f;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public l(ILcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 2
    .line 3
    if-ne p2, v0, :cond_4

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance p2, Ll/fzy;

    .line 12
    .line 13
    invoke-direct {p2, p0}, Ll/fzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/16 p2, 0x32

    .line 21
    .line 22
    if-ne p1, p2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance p2, Ll/hzy;

    .line 29
    .line 30
    invoke-direct {p2, p0, p3, p4, p5}, Ll/hzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    const/16 p2, 0xc4e

    .line 38
    .line 39
    if-ne p1, p2, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance p2, Ll/izy;

    .line 46
    .line 47
    invoke-direct {p2, p0}, Ll/izy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    const/16 p2, 0xcb2

    .line 55
    .line 56
    if-ne p1, p2, :cond_3

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance p2, Ll/jzy;

    .line 63
    .line 64
    invoke-direct {p2, p0, p3}, Ll/jzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    const/16 p2, 0xd05

    .line 72
    .line 73
    if-ne p1, p2, :cond_9

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance p2, Ll/kzy;

    .line 80
    .line 81
    invoke-direct {p2, p0, p3}, Ll/kzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 82
    .line 83
    .line 84
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance p2, Ll/lzy;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Ll/lzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 94
    .line 95
    .line 96
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    const/16 v0, 0x77c

    .line 101
    .line 102
    if-ne p1, v0, :cond_5

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    new-instance p3, Ll/nzy;

    .line 109
    .line 110
    invoke-direct {p3, p0, p2}, Ll/nzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p1, p3}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_5
    const/16 v0, 0x8b9

    .line 118
    .line 119
    if-ne p1, v0, :cond_6

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    new-instance v0, Ll/ozy;

    .line 126
    .line 127
    move-object v1, p0

    .line 128
    move-object v2, p2

    .line 129
    move-object v3, p3

    .line 130
    move-wide v4, p4

    .line 131
    invoke-direct/range {v0 .. v5}, Ll/ozy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    .line 132
    .line 133
    .line 134
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_6
    move-object v1, p0

    .line 139
    move-object v3, p3

    .line 140
    const/16 p0, 0x1482

    .line 141
    .line 142
    if-ne p1, p0, :cond_7

    .line 143
    .line 144
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    new-instance p1, Ll/pzy;

    .line 149
    .line 150
    invoke-direct {p1, v1}, Ll/pzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 151
    .line 152
    .line 153
    invoke-static {p0, p1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_7
    const/16 p0, 0x14e6

    .line 158
    .line 159
    if-ne p1, p0, :cond_8

    .line 160
    .line 161
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    new-instance p1, Ll/qzy;

    .line 166
    .line 167
    invoke-direct {p1, v1, v3}, Ll/qzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 168
    .line 169
    .line 170
    invoke-static {p0, p1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_8
    const/16 p0, 0x1539

    .line 175
    .line 176
    if-ne p1, p0, :cond_9

    .line 177
    .line 178
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    new-instance p1, Ll/gzy;

    .line 183
    .line 184
    invoke-direct {p1, v1, v3}, Ll/gzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 185
    .line 186
    .line 187
    invoke-static {p0, p1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 188
    .line 189
    .line 190
    :cond_9
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 v3, 0x3

    .line 14
    new-array v4, v3, [F

    .line 15
    .line 16
    fill-array-data v4, :array_0

    .line 17
    .line 18
    .line 19
    const-string v5, "scaleX"

    .line 20
    .line 21
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    new-array v3, v3, [F

    .line 31
    .line 32
    fill-array-data v3, :array_1

    .line 33
    .line 34
    .line 35
    const-string v4, "scaleY"

    .line 36
    .line 37
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 45
    .line 46
    .line 47
    const-wide/16 v1, 0x1d2

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 50
    .line 51
    .line 52
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    .line 53
    .line 54
    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$g;

    .line 61
    .line 62
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$g;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    nop

    .line 73
    :array_0
    .array-data 4
        0x0
        0x3f851eb8    # 1.04f
        0x3f800000    # 1.0f
    .end array-data

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_1
    .array-data 4
        0x0
        0x3f851eb8    # 1.04f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic m0()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->H0:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/high16 v2, 0x41600000    # 14.0f

    .line 11
    .line 12
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x0

    .line 17
    filled-new-array {v3, v1, v2}, [I

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {p0, v0, v1}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-wide/16 v0, 0xe9

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    fill-array-data v3, :array_0

    .line 12
    .line 13
    .line 14
    const-string v4, "alpha"

    .line 15
    .line 16
    invoke-static {v1, v4, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->J0:Landroid/util/Property;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->l(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->j(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    filled-new-array {v4, p1}, [I

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p0, v3, p1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Landroid/animation/ArgbEvaluator;

    .line 41
    .line 42
    invoke-direct {p1}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 46
    .line 47
    .line 48
    new-array p1, v2, [Landroid/animation/Animator;

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    aput-object v1, p1, v2

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    aput-object p0, p1, v1

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 57
    .line 58
    .line 59
    const-wide/16 p0, 0x85

    .line 60
    .line 61
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    nop

    .line 69
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 12
    .line 13
    const/4 v3, 0x4

    .line 14
    new-array v4, v3, [F

    .line 15
    .line 16
    fill-array-data v4, :array_0

    .line 17
    .line 18
    .line 19
    const-string v5, "scaleX"

    .line 20
    .line 21
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 29
    .line 30
    new-array v3, v3, [F

    .line 31
    .line 32
    fill-array-data v3, :array_1

    .line 33
    .line 34
    .line 35
    const-string v4, "scaleY"

    .line 36
    .line 37
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$h;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$h;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    const-wide/16 p0, 0x15e

    .line 56
    .line 57
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f88f5c3    # 1.07f
        0x3f7ae148    # 0.98f
        0x3f800000    # 1.0f
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :array_1
    .array-data 4
        0x0
        0x3f88f5c3    # 1.07f
        0x3f7ae148    # 0.98f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->P()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->U()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->x:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget v2, Ll/g9c0;->g:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->x:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget v2, Ll/g9c0;->i:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->x:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 55
    .line 56
    invoke-static {v0}, Ll/wpe;->a(Lv/VEditText;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->l:Landroid/widget/ImageView;

    .line 60
    .line 61
    sget v1, Ll/ibc0;->w3:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->m:Landroid/widget/ImageView;

    .line 67
    .line 68
    sget v1, Ll/ibc0;->t3:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->B:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 74
    .line 75
    sget v1, Ll/ibc0;->y3:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->J:Landroid/widget/ImageView;

    .line 81
    .line 82
    sget v1, Ll/ibc0;->s3:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->z:Lv/VImage;

    .line 88
    .line 89
    sget v1, Ll/ibc0;->B:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->G:Landroid/widget/TextView;

    .line 95
    .line 96
    sget v0, Ll/ibc0;->H1:I

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 99
    .line 100
    .line 101
    :cond_0
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 12
    .line 13
    const/4 v3, 0x3

    .line 14
    new-array v4, v3, [F

    .line 15
    .line 16
    fill-array-data v4, :array_0

    .line 17
    .line 18
    .line 19
    const-string v5, "scaleX"

    .line 20
    .line 21
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 29
    .line 30
    new-array v3, v3, [F

    .line 31
    .line 32
    fill-array-data v3, :array_1

    .line 33
    .line 34
    .line 35
    const-string v4, "scaleY"

    .line 36
    .line 37
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 45
    .line 46
    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$i;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$i;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 61
    .line 62
    .line 63
    const-wide/16 p0, 0x16f

    .line 64
    .line 65
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    nop

    .line 73
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f91eb85    # 1.14f
        0x0
    .end array-data

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f91eb85    # 1.14f
        0x0
    .end array-data
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 4

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->r:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->J0:Landroid/util/Property;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->j(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->l(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    filled-new-array {p1, p2}, [I

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {v2, v3, p1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p2, Landroid/animation/ArgbEvaluator;

    .line 32
    .line 33
    invoke-direct {p2}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 43
    .line 44
    const/4 p2, 0x2

    .line 45
    new-array p2, p2, [F

    .line 46
    .line 47
    fill-array-data p2, :array_0

    .line 48
    .line 49
    .line 50
    const-string v2, "alpha"

    .line 51
    .line 52
    invoke-static {p1, v2, p2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 60
    .line 61
    .line 62
    const-wide/16 p1, 0x85

    .line 63
    .line 64
    invoke-virtual {v0, p1, p2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 71
    .line 72
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->H0:Landroid/util/Property;

    .line 73
    .line 74
    const/16 v0, 0xe

    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    filled-new-array {v0, v1}, [I

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {p1, p2, v0}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-wide/16 v0, 0xe9

    .line 86
    .line 87
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$j;

    .line 92
    .line 93
    invoke-direct {p2, p0, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$j;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;D)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic r0()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->H0:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/16 v2, 0xe

    .line 7
    .line 8
    filled-new-array {v1, v2}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {p0, v0, v1}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-wide/16 v0, 0xe9

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public s0(Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    move v4, v1

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, v0, :cond_2

    .line 12
    .line 13
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    check-cast v5, Ll/rxy;

    .line 20
    .line 21
    instance-of v6, v5, Ll/xxy;

    .line 22
    .line 23
    if-eqz v6, :cond_0

    .line 24
    .line 25
    invoke-virtual {v5, v1}, Ll/rxy;->j(Z)Ll/rxy;

    .line 26
    .line 27
    .line 28
    instance-of v6, v5, Ll/xxy;

    .line 29
    .line 30
    if-eqz v6, :cond_1

    .line 31
    .line 32
    check-cast v5, Ll/xxy;

    .line 33
    .line 34
    invoke-virtual {v5}, Ll/xxy;->l()Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual {p0, v5, v4, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->x0(Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    add-int/lit8 v4, v4, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    invoke-virtual {v5, v2}, Ll/rxy;->j(Z)Ll/rxy;

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public setEditTextAndEnsureFocus(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusable(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusableInTouchMode(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setGroupStyle(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->F0:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public t0(Ll/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->Q:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public u0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->N:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->N:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;->e()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->p0:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 17
    .line 18
    if-ne v2, p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ll/rxy;

    .line 25
    .line 26
    invoke-virtual {v3, v2, v1, v0}, Ll/rxy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V

    .line 27
    .line 28
    .line 29
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-void
.end method

.method public w0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->k0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rxy;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/rxy;->b()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final x0(Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;ILjava/lang/String;)V
    .locals 2

    .line 1
    const-string p0, "bottom_menu_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "official_account_id"

    .line 10
    .line 11
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    const-string v0, "bottom_menu_x_axis"

    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "bottom_menu_y_axis"

    .line 31
    .line 32
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "bottom_menu_name"

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->text:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    filled-new-array {p0, p3, p2, v0, p1}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "e_official_account_bottom_menu"

    .line 49
    .line 50
    const-string p2, "p_chat_view"

    .line 51
    .line 52
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public y0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->z:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->v:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->w:Lv/VLinear;

    .line 18
    .line 19
    sget v2, Ll/ibc0;->J1:I

    .line 20
    .line 21
    invoke-static {v0, v1, v2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->x:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 49
    .line 50
    sget v2, Ll/ibc0;->J1:I

    .line 51
    .line 52
    invoke-static {v0, v1, v2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 61
    .line 62
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    sget v2, Ll/ibc0;->M1:I

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    sget v2, Ll/ibc0;->L1:I

    .line 80
    .line 81
    :goto_0
    invoke-static {v0, v1, v2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 85
    .line 86
    const/high16 v1, 0x41600000    # 14.0f

    .line 87
    .line 88
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    invoke-static {v0, v2}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 96
    .line 97
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 105
    .line 106
    const/high16 v1, 0x41000000    # 8.0f

    .line 107
    .line 108
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->z:Lv/VImage;

    .line 116
    .line 117
    new-instance v1, Ll/bzy;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/bzy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public z0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->z:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->v:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 12
    .line 13
    sget v2, Ll/ibc0;->J1:I

    .line 14
    .line 15
    invoke-static {v0, v1, v2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->w:Lv/VLinear;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->B0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->B0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 30
    .line 31
    const/high16 v1, 0x40800000    # 4.0f

    .line 32
    .line 33
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 41
    .line 42
    const/high16 v1, 0x41800000    # 16.0f

    .line 43
    .line 44
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A:Lv/VText;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

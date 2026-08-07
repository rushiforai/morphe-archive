.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;,
        Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;,
        Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;
    }
.end annotation


# static fields
.field public static x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

.field public b:Lv/VLinear;

.field public c:Lv/VFrame;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/view/ViewStub;

.field public i:Lv/VRecyclerView;

.field public j:Lcom/tantan/library/svga/SVGAnimationView;

.field public k:Landroid/view/View;

.field public l:Ll/kcg0;

.field public m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

.field public final n:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
            ">;>;"
        }
    .end annotation
.end field

.field public o:J

.field public p:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

.field public q:Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;

.field public r:D

.field public s:Z

.field public t:Z

.field public u:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
            ">;"
        }
    .end annotation
.end field

.field public w:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->n:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->o:J

    .line 20
    .line 21
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->r:D

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->s:Z

    .line 27
    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->t:Z

    .line 29
    .line 30
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->u:Lrx/subjects/a;

    .line 37
    .line 38
    new-instance p1, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->v:Ljava/util/List;

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->w:Z

    .line 47
    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 51
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->n:Lrx/subjects/a;

    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->o:J

    const-wide/high16 p1, -0x4010000000000000L    # -1.0

    .line 53
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->r:D

    const/4 p1, 0x0

    .line 54
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->s:Z

    .line 55
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->t:Z

    .line 56
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->u:Lrx/subjects/a;

    .line 57
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->v:Ljava/util/List;

    const/4 p1, 0x1

    .line 58
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->w:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 59
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 61
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->n:Lrx/subjects/a;

    .line 62
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->o:J

    const-wide/high16 p1, -0x4010000000000000L    # -1.0

    .line 63
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->r:D

    const/4 p1, 0x0

    .line 64
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->s:Z

    .line 65
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->t:Z

    .line 66
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->u:Lrx/subjects/a;

    .line 67
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->v:Ljava/util/List;

    const/4 p1, 0x1

    .line 68
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->w:Z

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/app/Activity;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic C(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j0(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->c0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->p:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    return-object p0
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->n:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->p:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->Z()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->a0(I)Z

    move-result p0

    return p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f0(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->e0(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->b0()V

    return-void
.end method


# virtual methods
.method public final O(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f96;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final Q()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/t86;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/t86;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/u86;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/u86;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/v86;

    .line 29
    .line 30
    invoke-direct {v2}, Ll/v86;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->l:Ll/kcg0;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/w86;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/w86;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v2, Ll/x86;

    .line 53
    .line 54
    invoke-direct {v2, p0}, Ll/x86;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->wn()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/q86;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/q86;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->t:Z

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->Q()V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->S()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public S()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->Z:Lrx/subjects/a;

    .line 10
    .line 11
    new-instance v2, Ll/y86;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/y86;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/z86;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/z86;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->n:Lrx/subjects/a;

    .line 34
    .line 35
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/a96;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/a96;-><init>(Lrx/subjects/a;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/b96;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/b96;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->n:Lrx/subjects/a;

    .line 8
    .line 9
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->n:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public V()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->Y0()Lcom/p1/mobile/putong/core/data/RealtimeRefreshNewMatch;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/RealtimeRefreshNewMatch;->function_switch:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->t:Z

    .line 8
    .line 9
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->canScrollVertically()Z

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 35
    .line 36
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;

    .line 37
    .line 38
    const/high16 v3, 0x40f00000    # 7.5f

    .line 39
    .line 40
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-direct {v1, p0, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/view/View;->setOverScrollMode(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 63
    .line 64
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$a;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f:Lv/VText;

    .line 73
    .line 74
    const/4 v1, 0x2

    .line 75
    const/high16 v3, 0x41700000    # 15.0f

    .line 76
    .line 77
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f:Lv/VText;

    .line 81
    .line 82
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->R()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->h0()V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f:Lv/VText;

    .line 94
    .line 95
    const/high16 v1, 0x40a00000    # 5.0f

    .line 96
    .line 97
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->k:Landroid/view/View;

    .line 105
    .line 106
    const/16 v1, 0x8

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f:Lv/VText;

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    sget v3, Lcom/p1/mobile/putong/core/R$string;->C9:I

    .line 118
    .line 119
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->g:Landroid/widget/TextView;

    .line 127
    .line 128
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->Z()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_0

    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f:Lv/VText;

    .line 138
    .line 139
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->getHeadRecommendListHeight()I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 147
    .line 148
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 152
    .line 153
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 157
    .line 158
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ll/gra;->d3()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-eqz v0, :cond_0

    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->k:Landroid/view/View;

    .line 168
    .line 169
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    :cond_0
    return-void
.end method

.method public final W(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FriendInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
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
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_1

    .line 19
    .line 20
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/core/data/FriendInfo;

    .line 25
    .line 26
    new-instance v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 27
    .line 28
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 29
    .line 30
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 31
    .line 32
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->X(Lcom/p1/mobile/putong/core/data/FriendSuggestReason;)I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/FriendInfo;->userId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {v3, v4, v5}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;-><init>(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 42
    .line 43
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->forceText:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v4, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->text:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v4, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->c:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->interactionType:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 52
    .line 53
    iput-object v4, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->q:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 54
    .line 55
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->relation:Lcom/p1/mobile/putong/core/data/Relation;

    .line 56
    .line 57
    iput-object v4, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->r:Lcom/p1/mobile/putong/core/data/Relation;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->roomId:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v2, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->s:Ljava/lang/String;

    .line 62
    .line 63
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    :goto_1
    return-object v0
.end method

.method public final X(Lcom/p1/mobile/putong/core/data/FriendSuggestReason;)I
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v1, 0x7

    .line 22
    const/4 v2, 0x6

    .line 23
    const/4 v3, 0x5

    .line 24
    const/4 v4, 0x4

    .line 25
    const/4 v5, 0x3

    .line 26
    const/4 v6, -0x1

    .line 27
    sparse-switch p1, :sswitch_data_0

    .line 28
    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :sswitch_0
    const-string p1, "interaction_voice"

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :cond_1
    move v6, v0

    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :sswitch_1
    const-string p1, "interaction_live"

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move v6, v1

    .line 55
    goto :goto_0

    .line 56
    :sswitch_2
    const-string p1, "default"

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    move v6, v2

    .line 66
    goto :goto_0

    .line 67
    :sswitch_3
    const-string p1, "newMatch"

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    move v6, v3

    .line 77
    goto :goto_0

    .line 78
    :sswitch_4
    const-string p1, "distance"

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_5

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    move v6, v4

    .line 88
    goto :goto_0

    .line 89
    :sswitch_5
    const-string p1, "oof"

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_6

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    move v6, v5

    .line 99
    goto :goto_0

    .line 100
    :sswitch_6
    const-string p1, "interaction_moment"

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_7

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    const/4 v6, 0x2

    .line 110
    goto :goto_0

    .line 111
    :sswitch_7
    const-string p1, "activity"

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-nez p0, :cond_8

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_8
    const/4 v6, 0x1

    .line 121
    goto :goto_0

    .line 122
    :sswitch_8
    const-string p1, "recentMessage"

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_9

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    const/4 v6, 0x0

    .line 132
    :goto_0
    packed-switch v6, :pswitch_data_0

    .line 133
    .line 134
    .line 135
    return v0

    .line 136
    :pswitch_0
    const/16 p0, 0x11

    .line 137
    .line 138
    return p0

    .line 139
    :pswitch_1
    const/16 p0, 0x10

    .line 140
    .line 141
    return p0

    .line 142
    :pswitch_2
    return v1

    .line 143
    :pswitch_3
    return v2

    .line 144
    :pswitch_4
    return v3

    .line 145
    :pswitch_5
    const/16 p0, 0x15

    .line 146
    .line 147
    return p0

    .line 148
    :pswitch_6
    const/16 p0, 0x12

    .line 149
    .line 150
    return p0

    .line 151
    :pswitch_7
    return v5

    .line 152
    :pswitch_8
    return v4

    .line 153
    :sswitch_data_0
    .sparse-switch
        -0x67927ad4 -> :sswitch_8
        -0x62b40cf1 -> :sswitch_7
        -0x2779e733 -> :sswitch_6
        0x1ae86 -> :sswitch_5
        0x11318bf5 -> :sswitch_4
        0x51124405 -> :sswitch_3
        0x5c13d641 -> :sswitch_2
        0x5eca96f9 -> :sswitch_1
        0x7b17bcc5 -> :sswitch_0
    .end sparse-switch

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final Y(Ljava/util/List;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xb

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-le v0, v2, :cond_2

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_2

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 25
    .line 26
    iget v4, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 27
    .line 28
    if-ne v4, v1, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->n:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/ListIterator;->remove()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->u:Lrx/subjects/a;

    .line 44
    .line 45
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 51
    .line 52
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_3

    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 63
    .line 64
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    const-wide/16 v4, 0x0

    .line 69
    .line 70
    invoke-virtual {v3, v4, v5}, Landroidx/recyclerview/widget/RecyclerView$l;->setChangeDuration(J)V

    .line 71
    .line 72
    .line 73
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    const/16 v4, 0x8

    .line 78
    .line 79
    if-ne v3, v2, :cond_5

    .line 80
    .line 81
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 86
    .line 87
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 88
    .line 89
    if-ne v3, v1, :cond_5

    .line 90
    .line 91
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 96
    .line 97
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->m:I

    .line 98
    .line 99
    if-nez v1, :cond_5

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 102
    .line 103
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->q:Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;

    .line 107
    .line 108
    if-nez v1, :cond_4

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->h:Landroid/view/ViewStub;

    .line 111
    .line 112
    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;

    .line 117
    .line 118
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->q:Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;

    .line 119
    .line 120
    invoke-static {}, Ll/zsb;->f()Ll/zsb;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1, v2}, Ll/zsb;->n(Z)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->q:Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;

    .line 128
    .line 129
    new-instance v2, Ll/r86;

    .line 130
    .line 131
    invoke-direct {v2, p0}, Ll/r86;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_4
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 139
    .line 140
    .line 141
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->q:Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;

    .line 142
    .line 143
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;->i0()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    const/high16 v2, 0x43070000    # 135.0f

    .line 151
    .line 152
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 157
    .line 158
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    const/high16 v2, 0x43150000    # 149.0f

    .line 167
    .line 168
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 173
    .line 174
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 178
    .line 179
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 180
    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->q:Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;

    .line 183
    .line 184
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_6

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->q:Lcom/p1/mobile/putong/core/newui/messages/IntlConversationOnlyBoostView;

    .line 191
    .line 192
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 193
    .line 194
    .line 195
    :cond_6
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 196
    .line 197
    if-eqz p2, :cond_7

    .line 198
    .line 199
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->H(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;)Ljava/util/List;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 208
    .line 209
    invoke-interface {p2, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 213
    .line 214
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_7
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->U(Ljava/util/List;)V

    .line 219
    .line 220
    .line 221
    return-void
.end method

.method public final Z()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->q2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->d3()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public final a0(I)Z
    .locals 0

    .line 1
    const/16 p0, 0xb

    if-eq p1, p0, :cond_1

    const/16 p0, 0xc

    if-eq p1, p0, :cond_1

    const/16 p0, 0xd

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final synthetic b0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c0(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->o:J

    .line 12
    .line 13
    sub-long/2addr v0, v2

    .line 14
    const-wide/32 v2, 0x927c0

    .line 15
    .line 16
    .line 17
    cmp-long p1, v0, v2

    .line 18
    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->o:J

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->Z:Lrx/subjects/a;

    .line 32
    .line 33
    const-string p1, ""

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->o:J

    .line 44
    .line 45
    return-void
.end method

.method public final synthetic e0(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->W(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic f0(Ljava/lang/String;)Lrx/c;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "message_tab_hide_to_show_refresh"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->J()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    long-to-double v2, v2

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    iget-wide v4, v0, Lcom/p1/mobile/putong/core/api/g;->a0:D

    .line 32
    .line 33
    sub-double/2addr v2, v4

    .line 34
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    div-double/2addr v2, v4

    .line 40
    invoke-static {}, Ll/gra;->Y0()Lcom/p1/mobile/putong/core/data/RealtimeRefreshNewMatch;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-nez v4, :cond_3

    .line 49
    .line 50
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->s:Z

    .line 51
    .line 52
    if-nez v4, :cond_3

    .line 53
    .line 54
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    iget v1, v0, Lcom/p1/mobile/putong/core/data/RealtimeRefreshNewMatch;->message_tab_hide_to_show_refresh_interval:I

    .line 61
    .line 62
    int-to-double v4, v1

    .line 63
    cmpl-double v1, v2, v4

    .line 64
    .line 65
    if-gtz v1, :cond_3

    .line 66
    .line 67
    :cond_1
    const-string v1, "message_tab_generate_new_match_refresh"

    .line 68
    .line 69
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    iget p1, v0, Lcom/p1/mobile/putong/core/data/RealtimeRefreshNewMatch;->message_tab_generate_new_match_refresh_interval:I

    .line 76
    .line 77
    int-to-double v0, p1

    .line 78
    cmpl-double p1, v2, v0

    .line 79
    .line 80
    if-lez p1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    const/4 p0, 0x0

    .line 84
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_3
    :goto_0
    const/4 p1, 0x0

    .line 90
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->s:Z

    .line 91
    .line 92
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->ug()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    new-instance v0, Ll/s86;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/s86;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0
.end method

.method public final synthetic g0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/zsb;->f()Ll/zsb;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ll/zsb;->d(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public getHeadRecommendListHeight()I
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->d3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x42e60000    # 115.0f

    .line 8
    .line 9
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {}, Ll/gra;->q2()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/high16 p0, 0x42e00000    # 112.0f

    .line 21
    .line 22
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public getRecommendListObs()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->n:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVisibleObs()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->u:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x43150000    # 149.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->O(Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public k0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
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
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x8

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->u:Lrx/subjects/a;

    .line 13
    .line 14
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->Y(Ljava/util/List;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->O(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->e:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->c:Lv/VFrame;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->e:Lv/VText;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f:Lv/VText;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/gra;->e3()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 41
    .line 42
    const/high16 v3, 0x40e00000    # 7.0f

    .line 43
    .line 44
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    neg-int v3, v3

    .line 49
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/gra;->z()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    const/high16 v0, 0x42ac0000    # 86.0f

    .line 59
    .line 60
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 65
    .line 66
    new-array v2, v2, [Landroid/view/View;

    .line 67
    .line 68
    aput-object v3, v2, v1

    .line 69
    .line 70
    invoke-static {v0, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 74
    .line 75
    invoke-static {p0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    const/high16 v0, 0x428c0000    # 70.0f

    .line 80
    .line 81
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 86
    .line 87
    new-array v2, v2, [Landroid/view/View;

    .line 88
    .line 89
    aput-object v3, v2, v1

    .line 90
    .line 91
    invoke-static {v0, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 95
    .line 96
    const/high16 v0, 0x40c00000    # 6.0f

    .line 97
    .line 98
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 103
    .line 104
    .line 105
    :cond_1
    return-void
.end method

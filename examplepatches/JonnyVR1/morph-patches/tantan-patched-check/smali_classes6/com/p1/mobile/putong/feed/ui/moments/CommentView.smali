.class public Lcom/p1/mobile/putong/feed/ui/moments/CommentView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VFrame_Anim;

.field public f:Lv/VProgressBar;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/view/View;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VText;

.field public k:Landroid/widget/LinearLayout;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public o:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->n:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->o:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->n:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->o:Lcom/p1/mobile/putong/data/User;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->n:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->o:Lcom/p1/mobile/putong/data/User;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->q(Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;->d:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->o(Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->r(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->t(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->s(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->p(Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->n(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->v(Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->u(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qi5;->a(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final m(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->n:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->n:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->y(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x4

    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-static {p0, p1, v2, v0, v1}, Ll/orb0;->d(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/w1e;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/orb0;->u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic t(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-nez p6, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    sget p5, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 14
    .line 15
    const/4 p6, 0x1

    .line 16
    invoke-virtual {p4, p5, p6}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 17
    .line 18
    .line 19
    sget-object p4, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 20
    .line 21
    invoke-virtual {p4, p2, p3, p1}, Lcom/p1/mobile/putong/feed/api/b;->X2(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance p2, Ll/oi5;

    .line 26
    .line 27
    invoke-direct {p2, p0}, Ll/oi5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;)V

    .line 28
    .line 29
    .line 30
    new-instance p3, Ll/pi5;

    .line 31
    .line 32
    invoke-direct {p3, p0}, Ll/pi5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->e:I

    .line 6
    .line 7
    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->O3:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {p4, v0}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    invoke-static {p4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "normal"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v1, 0x1

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, p4}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    new-instance v0, Ll/ni5;

    .line 58
    .line 59
    invoke-direct {v0, p0, p1, p2, p3}, Ll/ni5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 67
    .line 68
    .line 69
    return v1
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "from_MomentsFeedAct"

    .line 12
    .line 13
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 p1, 0x16

    .line 18
    .line 19
    invoke-virtual {p2, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public w(Ll/pol;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 9

    .line 1
    const/4 v7, 0x0

    .line 2
    const/4 v8, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    move v5, p5

    .line 9
    move v6, p6

    .line 10
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->x(Ll/pol;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/feed/ui/moments/CommentView$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public x(Ll/pol;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/feed/ui/moments/CommentView$a;)V
    .locals 4
    .param p8    # Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-boolean p5, p8, Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;->a:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->a:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    if-eqz p5, :cond_0

    .line 15
    .line 16
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->h:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {p5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->k:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-static {p5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->h:Landroid/view/View;

    .line 34
    .line 35
    iget-boolean v0, p8, Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;->b:Z

    .line 36
    .line 37
    xor-int/2addr v0, v2

    .line 38
    invoke-static {p5, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->k:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    if-eqz p7, :cond_1

    .line 44
    .line 45
    iget-boolean p7, p8, Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;->b:Z

    .line 46
    .line 47
    if-eqz p7, :cond_1

    .line 48
    .line 49
    move p7, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move p7, v3

    .line 52
    :goto_0
    invoke-static {p5, p7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :goto_1
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->i:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    iget-boolean p7, p8, Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;->b:Z

    .line 58
    .line 59
    invoke-static {p5, p7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->j:Lv/VText;

    .line 63
    .line 64
    iget-boolean p7, p8, Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;->c:Z

    .line 65
    .line 66
    if-eqz p7, :cond_2

    .line 67
    .line 68
    const-string p7, "\u6536\u8d77\u7cbe\u9009\u8bc4\u8bba"

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_2
    const-string p7, "\u67e5\u770b\u66f4\u591a\u7cbe\u9009\u8bc4\u8bba"

    .line 72
    .line 73
    :goto_2
    invoke-virtual {p5, p7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->i:Landroid/widget/FrameLayout;

    .line 77
    .line 78
    new-instance p7, Ll/gi5;

    .line 79
    .line 80
    invoke-direct {p7, p8}, Ll/gi5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView$a;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p5, p7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_3
    iget-object p8, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->a:Landroid/widget/FrameLayout;

    .line 88
    .line 89
    invoke-static {p8, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p8, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->h:Landroid/view/View;

    .line 93
    .line 94
    xor-int/lit8 v0, p5, 0x1

    .line 95
    .line 96
    invoke-static {p8, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object p8, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->k:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    if-eqz p7, :cond_4

    .line 102
    .line 103
    if-eqz p5, :cond_4

    .line 104
    .line 105
    move p5, v2

    .line 106
    goto :goto_3

    .line 107
    :cond_4
    move p5, v3

    .line 108
    :goto_3
    invoke-static {p8, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->i:Landroid/widget/FrameLayout;

    .line 112
    .line 113
    invoke-static {p5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->i:Landroid/widget/FrameLayout;

    .line 117
    .line 118
    invoke-virtual {p5, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 119
    .line 120
    .line 121
    :goto_4
    invoke-virtual {p0, v1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->y(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 125
    .line 126
    .line 127
    move-result-object p5

    .line 128
    iget-object p7, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {p7}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object p7

    .line 134
    invoke-interface {p1, p5, p7}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    new-instance p5, Ll/hi5;

    .line 139
    .line 140
    invoke-direct {p5, p0, p2}, Ll/hi5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p5}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 144
    .line 145
    .line 146
    move-result-object p5

    .line 147
    invoke-virtual {p1, p5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->m(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_5

    .line 155
    .line 156
    return-void

    .line 157
    :cond_5
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->n:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 158
    .line 159
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 171
    .line 172
    .line 173
    move-result p5

    .line 174
    const-string p7, "failed"

    .line 175
    .line 176
    const/4 p8, -0x1

    .line 177
    sparse-switch p5, :sswitch_data_0

    .line 178
    .line 179
    .line 180
    :goto_5
    move v2, p8

    .line 181
    goto :goto_6

    .line 182
    :sswitch_0
    const-string p5, "sending"

    .line 183
    .line 184
    invoke-virtual {p1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-nez p1, :cond_6

    .line 189
    .line 190
    goto :goto_5

    .line 191
    :cond_6
    const/4 v2, 0x2

    .line 192
    goto :goto_6

    .line 193
    :sswitch_1
    const-string p5, "normal"

    .line 194
    .line 195
    invoke-virtual {p1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    if-nez p1, :cond_8

    .line 200
    .line 201
    goto :goto_5

    .line 202
    :sswitch_2
    invoke-virtual {p1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    if-nez p1, :cond_7

    .line 207
    .line 208
    goto :goto_5

    .line 209
    :cond_7
    move v2, v3

    .line 210
    :cond_8
    :goto_6
    packed-switch v2, :pswitch_data_0

    .line 211
    .line 212
    .line 213
    goto :goto_7

    .line 214
    :pswitch_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->e:Lv/VFrame_Anim;

    .line 215
    .line 216
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->e:Lv/VFrame_Anim;

    .line 220
    .line 221
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->f:Lv/VProgressBar;

    .line 222
    .line 223
    invoke-virtual {p1, p5}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 224
    .line 225
    .line 226
    goto :goto_7

    .line 227
    :pswitch_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->e:Lv/VFrame_Anim;

    .line 228
    .line 229
    const/16 p5, 0x8

    .line 230
    .line 231
    invoke-virtual {p1, p5}, Landroid/view/View;->setVisibility(I)V

    .line 232
    .line 233
    .line 234
    goto :goto_7

    .line 235
    :pswitch_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->e:Lv/VFrame_Anim;

    .line 236
    .line 237
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 238
    .line 239
    .line 240
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->e:Lv/VFrame_Anim;

    .line 241
    .line 242
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->g:Landroid/widget/ImageView;

    .line 243
    .line 244
    invoke-virtual {p1, p5}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 245
    .line 246
    .line 247
    :goto_7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isOtherUser()Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    if-eqz p1, :cond_a

    .line 252
    .line 253
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->a:Landroid/widget/FrameLayout;

    .line 254
    .line 255
    if-eqz p6, :cond_9

    .line 256
    .line 257
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 258
    .line 259
    .line 260
    goto :goto_8

    .line 261
    :cond_9
    new-instance p3, Ll/ii5;

    .line 262
    .line 263
    invoke-direct {p3, p0, p2}, Ll/ii5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 267
    .line 268
    .line 269
    :goto_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->a:Landroid/widget/FrameLayout;

    .line 270
    .line 271
    new-instance p3, Ll/ji5;

    .line 272
    .line 273
    invoke-direct {p3, p0, p2}, Ll/ji5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 277
    .line 278
    .line 279
    goto :goto_a

    .line 280
    :cond_a
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-static {p1, p7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->a:Landroid/widget/FrameLayout;

    .line 289
    .line 290
    if-eqz p1, :cond_b

    .line 291
    .line 292
    new-instance p1, Ll/ki5;

    .line 293
    .line 294
    invoke-direct {p1, p0, p2}, Ll/ki5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p5, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    .line 299
    .line 300
    goto :goto_9

    .line 301
    :cond_b
    invoke-virtual {p5, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 302
    .line 303
    .line 304
    :goto_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->a:Landroid/widget/FrameLayout;

    .line 305
    .line 306
    new-instance p5, Ll/li5;

    .line 307
    .line 308
    invoke-direct {p5, p0, p2, p3, p4}, Ll/li5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    invoke-virtual {p1, p5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 312
    .line 313
    .line 314
    :goto_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->b:Lv/VDraweeView;

    .line 315
    .line 316
    if-eqz p6, :cond_c

    .line 317
    .line 318
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :cond_c
    new-instance p3, Ll/mi5;

    .line 323
    .line 324
    invoke-direct {p3, p0, p2}, Ll/mi5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 328
    .line 329
    .line 330
    return-void

    .line 331
    :sswitch_data_0
    .sparse-switch
        -0x4c696bc3 -> :sswitch_2
        -0x3df94319 -> :sswitch_1
        0x76033b5a -> :sswitch_0
    .end sparse-switch

    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final y(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->o:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->b:Lv/VDraweeView;

    .line 10
    .line 11
    sget v2, Ll/lbc0;->i1:I

    .line 12
    .line 13
    invoke-virtual {p1, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->d:Lv/VText;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->c:Lv/VImage;

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->o:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/User;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->m(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->o:Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->getGPMemo(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_2

    .line 63
    .line 64
    move-object v1, v2

    .line 65
    :cond_2
    new-instance v2, Landroid/text/SpannableString;

    .line 66
    .line 67
    new-instance v3, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v4, "  "

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-direct {v2, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    new-instance p2, Landroid/text/style/ForegroundColorSpan;

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-interface {v3}, Ll/tq8;->d()Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-eqz v3, :cond_3

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-eqz v3, :cond_3

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-nez v3, :cond_3

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    sget v4, Ll/k9c0;->k0:I

    .line 125
    .line 126
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    goto :goto_0

    .line 131
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    sget v4, Ll/k9c0;->l0:I

    .line 136
    .line 137
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    :goto_0
    invoke-direct {p2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    const/16 v3, 0x21

    .line 149
    .line 150
    invoke-interface {v2, p2, v0, v1, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->d:Lv/VText;

    .line 154
    .line 155
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    .line 157
    .line 158
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->b:Lv/VDraweeView;

    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 171
    .line 172
    .line 173
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 174
    .line 175
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 176
    .line 177
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->l()Lcom/p1/mobile/android/app/Act;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->c:Lv/VImage;

    .line 182
    .line 183
    invoke-interface {p2, v0, p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

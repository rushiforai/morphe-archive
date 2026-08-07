.class public Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VEditText;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Z

.field public f:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->e:Z

    .line 6
    .line 7
    new-instance p1, Ll/mh5;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/mh5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->f:Ll/z20;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->e:Z

    .line 20
    new-instance p1, Ll/mh5;

    invoke-direct {p1, p0}, Ll/mh5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->f:Ll/z20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->e:Z

    .line 17
    new-instance p1, Ll/mh5;

    invoke-direct {p1, p0}, Ll/mh5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->f:Ll/z20;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->q(Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->k()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->n(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->o(Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->l(Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->I3:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->m(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sh5;->a(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j()Lcom/p1/mobile/android/app/Act;
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

.method public final synthetic k()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic l(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->e:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->t()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->j()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance p2, Ll/nh5;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/nh5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V

    .line 21
    .line 22
    .line 23
    const-wide/16 v0, 0xf0

    .line 24
    .line 25
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->a:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic m(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->c:Lv/VText;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic n(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p2, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->e:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->j()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return p2
.end method

.method public final synthetic o(Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->j()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->J3:I

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->j()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget v0, Ll/lbc0;->Z1:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p2, p0}, Ll/o1j0;->q(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-interface {p1}, Ll/x20;->call()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lv/VEditText;->i(Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/kh5;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/kh5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/lh5;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/lh5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q(Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    if-nez p4, :cond_1

    .line 20
    .line 21
    sget-object p4, Ll/uqb0;->Z:Ll/a4j;

    .line 22
    .line 23
    invoke-virtual {p4, v4}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    if-eqz p4, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    check-cast p4, Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    new-instance v0, Ll/ph5;

    .line 36
    .line 37
    move-object v1, p0

    .line 38
    move-object v2, p1

    .line 39
    move-object v3, p2

    .line 40
    move-object v5, p3

    .line 41
    invoke-direct/range {v0 .. v5}, Ll/ph5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p4, v0}, Ll/k3h;->z0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    move-object v1, p0

    .line 49
    move-object v2, p1

    .line 50
    move-object v3, p2

    .line 51
    move-object v5, p3

    .line 52
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/mrb0;->X(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 12
    .line 13
    const-string p2, ""

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->j()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->e:Z

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->j()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 47
    .line 48
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p3, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 52
    .line 53
    iput-object p2, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 54
    .line 55
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 56
    .line 57
    invoke-virtual {p2, p1, v0}, Lcom/p1/mobile/putong/feed/api/b;->b3(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance p2, Ll/qh5;

    .line 62
    .line 63
    invoke-direct {p2, p0, p4}, Ll/qh5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ll/x20;)V

    .line 64
    .line 65
    .line 66
    new-instance p0, Ll/rh5;

    .line 67
    .line 68
    invoke-direct {p0}, Ll/rh5;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method

.method public s(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->c:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/oh5;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2, p3}, Ll/oh5;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->j()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->b:Lv/VEditText;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->e:Z

    .line 18
    .line 19
    return-void
.end method

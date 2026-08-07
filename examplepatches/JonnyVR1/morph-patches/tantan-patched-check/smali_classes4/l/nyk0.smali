.class public Ll/nyk0;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/ImageView;

.field public k:Landroid/widget/TextView;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Landroid/widget/PopupWindow;

.field public n:Lcom/p1/mobile/putong/newui/main/base/TabName;

.field public o:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 5
    .line 6
    iput-object v0, p0, Ll/nyk0;->n:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 7
    .line 8
    iput-object p1, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic B(Ll/nyk0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nyk0;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/nyk0;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nyk0;->K(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method


# virtual methods
.method public A()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/nyk0;->J()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    return v1

    .line 36
    :cond_2
    iget-object v0, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-virtual {p0, v0, v2}, Ll/nyk0;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v2, Landroid/widget/PopupWindow;

    .line 48
    .line 49
    const/4 v3, -0x1

    .line 50
    const/4 v4, -0x2

    .line 51
    invoke-direct {v2, v0, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 52
    .line 53
    .line 54
    iput-object v2, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 60
    .line 61
    sget v1, Ll/agc0;->D:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/nyk0;->j:Landroid/widget/ImageView;

    .line 67
    .line 68
    new-instance v1, Ll/lyk0;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/lyk0;-><init>(Ll/nyk0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    new-instance v1, Ll/myk0;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/myk0;-><init>(Ll/nyk0;)V

    .line 81
    .line 82
    .line 83
    const-wide/16 v2, 0xbb8

    .line 84
    .line 85
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/nyk0;->M()V

    .line 89
    .line 90
    .line 91
    const p0, 0x7fffffff

    .line 92
    .line 93
    .line 94
    return p0

    .line 95
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 96
    .line 97
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_4

    .line 102
    .line 103
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 104
    .line 105
    invoke-interface {p0}, Ll/x20;->call()V

    .line 106
    .line 107
    .line 108
    :cond_4
    return v1
.end method

.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oyk0;->b(Ll/nyk0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nyk0;->o:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 21
    .line 22
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 31
    .line 32
    invoke-interface {p0}, Ll/x20;->call()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public I(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/kyk0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/kyk0;-><init>(Ll/nyk0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/nyk0;->o:Ll/kcg0;

    .line 32
    .line 33
    return-void
.end method

.method public J()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

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
    iget-object p0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/nyk0;->n:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    invoke-virtual {p0, p1}, Ll/nyk0;->N(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nyk0;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final M()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const v1, 0x1020002

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 45
    .line 46
    sget v1, Ll/qa00;->q:I

    .line 47
    .line 48
    neg-int v1, v1

    .line 49
    const/16 v2, 0x31

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-virtual {p0, v0, v2, v3, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public N(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/nyk0;->M()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/high16 p1, 0x3f800000    # 1.0f

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/high16 v0, -0x3a860000    # -4000.0f

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public isValid()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nyk0;->n:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nyk0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

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
    iget-object p1, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/nyk0;->m:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->QUICK_CHAT_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getGroup()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->QUICK_CHAT_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.class public Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;
.super Ll/fqe0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;,
        Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;,
        Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;
    }
.end annotation


# static fields
.field public static final k:I

.field public static final l:I


# instance fields
.field public final i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

.field public j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42b80000    # 92.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->k:I

    .line 8
    .line 9
    const/high16 v0, 0x42980000    # 76.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->l:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->l(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/c3m;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/fqe0;->g:Ll/c3m;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;Ll/tpf0;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;-><init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->K(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->J()V

    return-void
.end method

.method public static bridge synthetic F()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->l:I

    return v0
.end method

.method public static bridge synthetic H()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->k:I

    return v0
.end method


# virtual methods
.method public A()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

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
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 22
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 23
    .line 24
    invoke-static {v2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/app/Activity;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;-><init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 45
    .line 46
    new-instance v0, Ll/mpf0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/mpf0;-><init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 52
    .line 53
    new-instance v2, Ll/npf0;

    .line 54
    .line 55
    invoke-direct {v2, p0, v0}, Ll/npf0;-><init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->g()V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/jlb0;->a:Ll/x20;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    iget-object v1, p0, Ll/jlb0;->a:Ll/x20;

    .line 75
    .line 76
    invoke-interface {v1}, Ll/x20;->call()V

    .line 77
    .line 78
    .line 79
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 80
    .line 81
    invoke-static {v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/app/Activity;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object v2, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 86
    .line 87
    invoke-static {v2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->i(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    int-to-long v2, v2

    .line 92
    invoke-static {v1, v0, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 96
    .line 97
    invoke-static {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->i(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0

    .line 102
    :cond_4
    :goto_2
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_5

    .line 109
    .line 110
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 111
    .line 112
    invoke-interface {p0}, Ll/x20;->call()V

    .line 113
    .line 114
    .line 115
    :cond_5
    return v1
.end method

.method public I()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->dismiss()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic J()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->t()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/android/ui/poplevel/PopAction;->AUTO_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->dismiss()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic K(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/jlb0;->b:Ll/x20;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/high16 v0, -0x3a860000    # -4000.0f

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public g(Ll/al80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getPriority()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->m(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->j:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->f(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->g(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u()I
    .locals 1

    .line 1
    invoke-super {p0}, Ll/fqe0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Ll/fqe0;->u()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->i:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->m(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Lcom/p1/mobile/android/ui/poplevel/a;->F(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

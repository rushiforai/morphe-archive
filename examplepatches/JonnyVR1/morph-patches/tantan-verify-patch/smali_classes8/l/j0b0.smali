.class public Ll/j0b0;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public i:Landroid/app/Activity;

.field public j:Ljava/lang/String;

.field public k:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;ILcom/p1/mobile/putong/data/Picture$ImageUri;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j0b0;->i:Landroid/app/Activity;

    .line 5
    .line 6
    iput-object p2, p0, Ll/j0b0;->j:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Ll/j0b0;->k:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 9
    .line 10
    iput-boolean p5, p0, Ll/j0b0;->l:Z

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Ll/jlb0;->r(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic B(Ll/j0b0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j0b0;->C()V

    return-void
.end method

.method private synthetic C()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

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
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public A()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/j0b0;->i:Landroid/app/Activity;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 34
    .line 35
    invoke-interface {p0}, Ll/x20;->call()V

    .line 36
    .line 37
    .line 38
    :cond_2
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_3
    iget-object v0, p0, Ll/j0b0;->i:Landroid/app/Activity;

    .line 41
    .line 42
    iget-object v1, p0, Ll/j0b0;->j:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v2, Ll/i0b0;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/i0b0;-><init>(Ll/j0b0;)V

    .line 47
    .line 48
    .line 49
    iget-object v3, p0, Ll/j0b0;->k:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 50
    .line 51
    iget-boolean p0, p0, Ll/j0b0;->l:Z

    .line 52
    .line 53
    invoke-static {v0, v1, v2, v3, p0}, Ll/o0b0;->j(Landroid/app/Activity;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 54
    .line 55
    .line 56
    const/16 p0, 0xbb8

    .line 57
    .line 58
    return p0
.end method

.method public f(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/o0b0;->f()Landroid/widget/PopupWindow;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/high16 p1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/high16 v1, -0x3a860000    # -4000.0f

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j0b0;->i:Landroid/app/Activity;

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
    iget-object p0, p0, Ll/j0b0;->i:Landroid/app/Activity;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/o0b0;->f()Landroid/widget/PopupWindow;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->PROFILE_MOMENT_SEND_MESSAGE_FLOAT:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

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
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->PROFILE_MOMENT_SEND_MESSAGE_FLOAT:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

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

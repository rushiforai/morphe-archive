.class public Ll/xex;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public i:Landroid/app/Activity;

.field public j:Ljava/lang/String;

.field public k:Lcom/p1/mobile/putong/data/Picture$ImageUri;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;ILcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xex;->i:Landroid/app/Activity;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xex;->j:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Ll/xex;->k:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 9
    .line 10
    invoke-virtual {p0, p3}, Ll/jlb0;->r(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic B(Ll/xex;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xex;->C()V

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
    .locals 3

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
    if-eqz v0, :cond_2

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/xex;->i:Landroid/app/Activity;

    .line 18
    .line 19
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v0, p0, Ll/xex;->i:Landroid/app/Activity;

    .line 31
    .line 32
    iget-object v1, p0, Ll/xex;->j:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v2, Ll/wex;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/wex;-><init>(Ll/xex;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/xex;->k:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 40
    .line 41
    invoke-static {v0, v1, v2, p0}, Ll/bfx;->g(Landroid/app/Activity;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 42
    .line 43
    .line 44
    const/16 p0, 0xbb8

    .line 45
    .line 46
    return p0

    .line 47
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 56
    .line 57
    invoke-interface {p0}, Ll/x20;->call()V

    .line 58
    .line 59
    .line 60
    :cond_3
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method public f(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bfx;->e()Landroid/widget/PopupWindow;

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
    iget-object p0, p0, Ll/xex;->i:Landroid/app/Activity;

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
    iget-object p0, p0, Ll/xex;->i:Landroid/app/Activity;

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
    invoke-static {}, Ll/bfx;->e()Landroid/widget/PopupWindow;

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
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->MATCH_SEND_MESSAGE_FLOAT:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

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
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->MATCH_SEND_MESSAGE_FLOAT:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

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

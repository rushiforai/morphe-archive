.class public Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VFrame;

.field public d:Lv/VDraweeView;

.field public e:Lv/VFrame;

.field public f:Lv/VDraweeView;

.field public g:Lv/VFrame;

.field public h:Lv/VDraweeView;

.field public i:Lv/VFrame;

.field public j:Lv/VDraweeView;

.field public k:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "\ud83d\udc4b"

    .line 5
    .line 6
    const-string v0, "\ud83d\ude09"

    .line 7
    .line 8
    const-string v1, "\u2764\ufe0f"

    .line 9
    .line 10
    const-string v2, "\u263a\ufe0f"

    .line 11
    .line 12
    filled-new-array {v1, v2, p1, v0}, [Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 19
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const-string p1, "\ud83d\udc4b"

    const-string p2, "\ud83d\ude09"

    const-string v0, "\u2764\ufe0f"

    const-string v1, "\u263a\ufe0f"

    filled-new-array {v0, v1, p1, p2}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    const-string p1, "\ud83d\udc4b"

    const-string p2, "\ud83d\ude09"

    const-string p3, "\u2764\ufe0f"

    const-string v0, "\u263a\ufe0f"

    filled-new-array {p3, v0, p1, p2}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->Y(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->a0(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Ll/clz;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->H4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "chat_page_enter_text"

    .line 28
    .line 29
    invoke-interface {p1, p0, v0}, Ll/r97;->showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0, p1}, Ll/clz;->S6(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->X(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->b0(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->Z(Ll/y20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u500;->a(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    aget-object p0, p0, p2

    .line 5
    .line 6
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Y(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    aget-object p0, p0, p2

    .line 5
    .line 6
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Z(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    aget-object p0, p0, p2

    .line 5
    .line 6
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic a0(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 p2, 0x2

    .line 4
    aget-object p0, p0, p2

    .line 5
    .line 6
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic b0(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 p2, 0x3

    .line 4
    aget-object p0, p0, p2

    .line 5
    .line 6
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c0(Ll/clz;)V
    .locals 2

    .line 1
    new-instance v0, Ll/o500;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/o500;-><init>(Ll/clz;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->c:Lv/VFrame;

    .line 7
    .line 8
    new-instance v1, Ll/p500;

    .line 9
    .line 10
    invoke-direct {v1, p0, v0}, Ll/p500;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->c:Lv/VFrame;

    .line 17
    .line 18
    new-instance v1, Ll/q500;

    .line 19
    .line 20
    invoke-direct {v1, p0, v0}, Ll/q500;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->e:Lv/VFrame;

    .line 27
    .line 28
    new-instance v1, Ll/r500;

    .line 29
    .line 30
    invoke-direct {v1, p0, v0}, Ll/r500;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->g:Lv/VFrame;

    .line 37
    .line 38
    new-instance v1, Ll/s500;

    .line 39
    .line 40
    invoke-direct {v1, p0, v0}, Ll/s500;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->i:Lv/VFrame;

    .line 47
    .line 48
    new-instance v1, Ll/t500;

    .line 49
    .line 50
    invoke-direct {v1, p0, v0}, Ll/t500;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->W(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->d:Lv/VDraweeView;

    .line 8
    .line 9
    new-instance v1, Ll/jye;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    aget-object v3, v3, v4

    .line 19
    .line 20
    const/high16 v4, 0x41c00000    # 24.0f

    .line 21
    .line 22
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const/high16 v6, 0x41800000    # 16.0f

    .line 27
    .line 28
    invoke-direct {v1, v2, v3, v6, v5}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->f:Lv/VDraweeView;

    .line 35
    .line 36
    new-instance v1, Ll/jye;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 43
    .line 44
    const/4 v5, 0x1

    .line 45
    aget-object v3, v3, v5

    .line 46
    .line 47
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    invoke-direct {v1, v2, v3, v6, v5}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->h:Lv/VDraweeView;

    .line 58
    .line 59
    new-instance v1, Ll/jye;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 66
    .line 67
    const/4 v5, 0x2

    .line 68
    aget-object v3, v3, v5

    .line 69
    .line 70
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    invoke-direct {v1, v2, v3, v6, v5}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->j:Lv/VDraweeView;

    .line 81
    .line 82
    new-instance v1, Ll/jye;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;->k:[Ljava/lang/String;

    .line 89
    .line 90
    const/4 v3, 0x3

    .line 91
    aget-object p0, p0, v3

    .line 92
    .line 93
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-direct {v1, v2, p0, v6, v3}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

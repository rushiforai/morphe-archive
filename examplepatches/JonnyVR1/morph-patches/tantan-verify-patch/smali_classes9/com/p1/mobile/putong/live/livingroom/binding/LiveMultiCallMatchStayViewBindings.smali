.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/k3m;",
        ">",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public d:Ll/k3m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveMultiCallMatchStayView;

.field public f:Lv/VText;

.field public g:Lv/VRadioButton;

.field public h:Landroid/view/View;

.field public i:Lv/VText;

.field public j:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveMultiCallMatchStayView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveMultiCallMatchStayView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->e:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveMultiCallMatchStayView;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveMultiCallMatchStayView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->e:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveMultiCallMatchStayView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lv/VText;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->f:Lv/VText;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "_content"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lv/VRadioButton;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->g:Lv/VRadioButton;

    .line 29
    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    const-string v0, "_checked"

    .line 33
    .line 34
    :cond_1
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->h:Landroid/view/View;

    .line 40
    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    const-string v0, "_divider"

    .line 44
    .line 45
    :cond_2
    const/4 v1, 0x3

    .line 46
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lv/VText;

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->i:Lv/VText;

    .line 53
    .line 54
    if-nez v1, :cond_3

    .line 55
    .line 56
    const-string v0, "_negative"

    .line 57
    .line 58
    :cond_3
    const/4 v1, 0x4

    .line 59
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lv/VText;

    .line 64
    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->j:Lv/VText;

    .line 66
    .line 67
    if-nez p1, :cond_4

    .line 68
    .line 69
    const-string v0, "_positive"

    .line 70
    .line 71
    :cond_4
    if-nez v0, :cond_5

    .line 72
    .line 73
    return-void

    .line 74
    :cond_5
    const-string p0, "Missing required view with ID:"

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public i1(Ll/k3m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->d:Ll/k3m;

    .line 2
    .line 3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->q4:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    move-object p2, p1

    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->h0(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallMatchStayViewBindings;->h0(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

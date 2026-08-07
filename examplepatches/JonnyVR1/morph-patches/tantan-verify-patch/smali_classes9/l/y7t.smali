.class public Ll/y7t;
.super Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/hj2;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder<",
        "TP;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Landroid/widget/LinearLayout;

.field public f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

.field public i:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->u4:I

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
    invoke-virtual {p0, p2}, Ll/y7t;->u(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public u(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/LinearLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/y7t;->e:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Landroid/view/ViewGroup;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 19
    .line 20
    iput-object v1, p0, Ll/y7t;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    const-string v1, "_crv_time"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Landroid/view/ViewGroup;

    .line 33
    .line 34
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 39
    .line 40
    iput-object v2, p0, Ll/y7t;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 41
    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    const-string v1, "_crv_heart"

    .line 45
    .line 46
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/view/ViewGroup;

    .line 51
    .line 52
    const/4 v2, 0x2

    .line 53
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 58
    .line 59
    iput-object v0, p0, Ll/y7t;->h:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 60
    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    const-string v1, "_crv_add_fans"

    .line 64
    .line 65
    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Landroid/widget/TextView;

    .line 70
    .line 71
    iput-object p1, p0, Ll/y7t;->i:Landroid/widget/TextView;

    .line 72
    .line 73
    if-nez p1, :cond_3

    .line 74
    .line 75
    const-string v1, "_tv_confirm"

    .line 76
    .line 77
    :cond_3
    if-nez v1, :cond_4

    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    const-string p0, "Missing required view with ID:"

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;)V
    .locals 0

    .line 1
    return-void
.end method

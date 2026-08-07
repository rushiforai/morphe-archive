.class public Ll/k6v;
.super Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder<",
        "Ll/i1l;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Lv/VRecyclerView;

.field public i:Lv/VLinear;

.field public j:Lv/VImage;

.field public k:Lv/VText;


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
    sget v0, Ll/yec0;->a9:I

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
    invoke-virtual {p0, p2}, Ll/k6v;->u(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public u(Landroid/view/ViewGroup;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/k6v;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lv/VText;

    .line 12
    .line 13
    iput-object v1, p0, Ll/k6v;->f:Lv/VText;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_title"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    const/4 v2, 0x1

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lv/VImage;

    .line 27
    .line 28
    iput-object v3, p0, Ll/k6v;->g:Lv/VImage;

    .line 29
    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    const-string v1, "_back"

    .line 33
    .line 34
    :cond_1
    const/4 v3, 0x3

    .line 35
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lv/VRecyclerView;

    .line 40
    .line 41
    iput-object v3, p0, Ll/k6v;->h:Lv/VRecyclerView;

    .line 42
    .line 43
    if-nez v3, :cond_2

    .line 44
    .line 45
    const-string v1, "_recyclerView"

    .line 46
    .line 47
    :cond_2
    const/4 v3, 0x4

    .line 48
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    check-cast v4, Lv/VLinear;

    .line 53
    .line 54
    iput-object v4, p0, Ll/k6v;->i:Lv/VLinear;

    .line 55
    .line 56
    if-nez v4, :cond_3

    .line 57
    .line 58
    const-string v1, "_empty"

    .line 59
    .line 60
    :cond_3
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Landroid/view/ViewGroup;

    .line 65
    .line 66
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lv/VImage;

    .line 71
    .line 72
    iput-object v0, p0, Ll/k6v;->j:Lv/VImage;

    .line 73
    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    const-string v1, "_empty_icon"

    .line 77
    .line 78
    :cond_4
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Landroid/view/ViewGroup;

    .line 83
    .line 84
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Lv/VText;

    .line 89
    .line 90
    iput-object p1, p0, Ll/k6v;->k:Lv/VText;

    .line 91
    .line 92
    if-nez p1, :cond_5

    .line 93
    .line 94
    const-string v1, "_empty_text"

    .line 95
    .line 96
    :cond_5
    if-nez v1, :cond_6

    .line 97
    .line 98
    return-void

    .line 99
    :cond_6
    const-string p0, "Missing required view with ID:"

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# instance fields
.field public c:Landroid/view/ViewStub;

.field public d:Lv/VFrame;

.field public e:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public f:Lv/VIcon;

.field public g:Lv/VFrame;

.field public h:Lv/VIcon;

.field public i:Lv/VFrame;

.field public j:Lv/VImage;

.field public k:Lv/VOnlineIndicator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bgl;->a(Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public i1(Ll/k3m;)V
    .locals 0

    .line 1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->h:Lv/VIcon;

    .line 14
    .line 15
    sget v1, Ll/dbc0;->Ht:I

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->j:Lv/VImage;

    .line 21
    .line 22
    sget v1, Ll/dbc0;->Gt:I

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->f:Lv/VIcon;

    .line 28
    .line 29
    sget v1, Ll/dbc0;->I7:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 32
    .line 33
    .line 34
    const/high16 v0, 0x42000000    # 32.0f

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->d:Lv/VFrame;

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    new-array v4, v3, [Landroid/view/View;

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    aput-object v2, v4, v5

    .line 47
    .line 48
    invoke-static {v1, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->d:Lv/VFrame;

    .line 52
    .line 53
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->h:Lv/VIcon;

    .line 65
    .line 66
    new-array v4, v3, [Landroid/view/View;

    .line 67
    .line 68
    aput-object v2, v4, v5

    .line 69
    .line 70
    invoke-static {v1, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->h:Lv/VIcon;

    .line 74
    .line 75
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->j:Lv/VImage;

    .line 87
    .line 88
    new-array v4, v3, [Landroid/view/View;

    .line 89
    .line 90
    aput-object v2, v4, v5

    .line 91
    .line 92
    invoke-static {v1, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->j:Lv/VImage;

    .line 96
    .line 97
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->f:Lv/VIcon;

    .line 109
    .line 110
    new-array v3, v3, [Landroid/view/View;

    .line 111
    .line 112
    aput-object v2, v3, v5

    .line 113
    .line 114
    invoke-static {v1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeTitleMenuLayout;->f:Lv/VIcon;

    .line 118
    .line 119
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 124
    .line 125
    .line 126
    :cond_0
    return-void
.end method

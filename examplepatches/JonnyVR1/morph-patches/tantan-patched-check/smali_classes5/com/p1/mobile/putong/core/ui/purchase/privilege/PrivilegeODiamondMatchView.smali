.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/le90;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->b:Lv/AutoVDraweeView;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->zj(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView$a;->a:[I

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    aget p1, v0, p1

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    if-eq p1, v0, :cond_5

    .line 36
    .line 37
    const/4 v0, 0x2

    .line 38
    if-eq p1, v0, :cond_5

    .line 39
    .line 40
    const/4 v0, 0x3

    .line 41
    if-eq p1, v0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x4

    .line 44
    if-eq p1, v0, :cond_0

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->a:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-static {}, Ll/c17;->u0()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    sget v1, Ll/jbc0;->G4:I

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    sget v1, Ll/jbc0;->F4:I

    .line 61
    .line 62
    :goto_0
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->c:Lv/VImage;

    .line 66
    .line 67
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_2

    .line 78
    .line 79
    sget p1, Ll/jbc0;->C4:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    sget p1, Ll/jbc0;->B4:I

    .line 83
    .line 84
    :goto_1
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->a:Lv/VDraweeView;

    .line 91
    .line 92
    invoke-static {}, Ll/c17;->u0()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    sget v1, Ll/jbc0;->I4:I

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    sget v1, Ll/jbc0;->H4:I

    .line 102
    .line 103
    :goto_2
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->c:Lv/VImage;

    .line 107
    .line 108
    sget p1, Ll/jbc0;->D4:I

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_5
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->a:Lv/VDraweeView;

    .line 117
    .line 118
    invoke-static {}, Ll/c17;->u0()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_6

    .line 123
    .line 124
    sget v1, Ll/jbc0;->K4:I

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_6
    sget v1, Ll/jbc0;->J4:I

    .line 128
    .line 129
    :goto_3
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->c:Lv/VImage;

    .line 133
    .line 134
    sget p1, Ll/jbc0;->E4:I

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

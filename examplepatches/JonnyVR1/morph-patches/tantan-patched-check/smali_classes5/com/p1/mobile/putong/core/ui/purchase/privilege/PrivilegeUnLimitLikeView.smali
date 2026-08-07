.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VImage;


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
    invoke-static {p0, p1}, Ll/zj90;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->d:Lv/VImage;

    .line 2
    .line 3
    sget v1, Ll/jbc0;->Fc:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/rbb0;->n()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->a:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->e:Lv/VImage;

    .line 26
    .line 27
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->b:Lv/AutoVDraweeView;

    .line 33
    .line 34
    invoke-static {}, Ll/c17;->u0()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    sget v2, Ll/jbc0;->zc:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    sget v2, Ll/jbc0;->yc:I

    .line 44
    .line 45
    :goto_0
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->c:Lv/AutoVDraweeView;

    .line 49
    .line 50
    invoke-static {}, Ll/rbb0;->n()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->e:Lv/VImage;

    .line 68
    .line 69
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->e:Lv/VImage;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 79
    .line 80
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 81
    .line 82
    const/high16 v2, 0x43000000    # 128.0f

    .line 83
    .line 84
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eq v1, v4, :cond_2

    .line 89
    .line 90
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 95
    .line 96
    const/16 v1, 0x11

    .line 97
    .line 98
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 99
    .line 100
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 101
    .line 102
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->e:Lv/VImage;

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->e:Lv/VImage;

    .line 110
    .line 111
    invoke-static {}, Ll/c17;->u0()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_3

    .line 116
    .line 117
    sget v0, Ll/jbc0;->Gc:I

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    sget v0, Ll/jbc0;->Dc:I

    .line 121
    .line 122
    :goto_1
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

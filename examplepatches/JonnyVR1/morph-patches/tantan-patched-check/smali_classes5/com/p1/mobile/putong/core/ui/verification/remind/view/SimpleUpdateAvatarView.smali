.class public Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public b:Lv/VProgressBar;

.field public c:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;Lcom/p1/mobile/putong/data/Media;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->u(Lcom/p1/mobile/putong/data/Media;[I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->s(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->c:Lv/VText;

    .line 14
    .line 15
    sget v1, Ll/dbc0;->z0:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->c:Lv/VText;

    .line 21
    .line 22
    sget v0, Ll/dbc0;->B0:I

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p0, v0, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dqf0;->a(Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/data/Media;[I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p2, p0, p1, v0}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public v(Ll/p0k0$b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->b:Lv/VProgressBar;

    .line 2
    .line 3
    iget-object v1, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isLoading()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->c:Lv/VText;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x1

    .line 28
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->c:Lv/VText;

    .line 32
    .line 33
    iget-object v1, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p1, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 69
    .line 70
    new-instance v1, Ll/cqf0;

    .line 71
    .line 72
    invoke-direct {v1, p0, p1}, Ll/cqf0;-><init>(Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;Lcom/p1/mobile/putong/data/Media;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 80
    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

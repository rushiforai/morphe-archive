.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public d:Lv/VLinear;

.field public e:Lv/VLinear;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VImage;

.field public h:Lv/AutoVDraweeView;

.field public i:Lv/VText_NoTopPadding;

.field public j:Lv/VText_NoTopPadding;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "swipe"

    .line 2
    .line 3
    invoke-static {p1}, Ll/gp5;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ei4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;Ll/t7m;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->media:Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-static {p2}, Ll/xr5;->a(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p2, 0x0

    .line 20
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    const/4 v0, 0x1

    .line 25
    if-nez p3, :cond_2

    .line 26
    .line 27
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 28
    .line 29
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->h:Lv/AutoVDraweeView;

    .line 30
    .line 31
    const/high16 v1, 0x41d00000    # 26.0f

    .line 32
    .line 33
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {p1, p3, p2, v2, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->h:Lv/AutoVDraweeView;

    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 51
    .line 52
    if-eqz p2, :cond_3

    .line 53
    .line 54
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-nez p2, :cond_3

    .line 59
    .line 60
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 61
    .line 62
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->h:Lv/AutoVDraweeView;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const/16 v1, 0x18

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p2, p3, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->h:Lv/AutoVDraweeView;

    .line 78
    .line 79
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->h:Lv/AutoVDraweeView;

    .line 84
    .line 85
    const/4 p2, 0x0

    .line 86
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->i:Lv/VText_NoTopPadding;

    .line 90
    .line 91
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 92
    .line 93
    sget p3, Lcom/p1/mobile/putong/core/R$string;->V9:I

    .line 94
    .line 95
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->e:Lv/VLinear;

    .line 103
    .line 104
    new-instance p1, Ll/di4;

    .line 105
    .line 106
    invoke-direct {p1, p4}, Ll/di4;-><init>(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

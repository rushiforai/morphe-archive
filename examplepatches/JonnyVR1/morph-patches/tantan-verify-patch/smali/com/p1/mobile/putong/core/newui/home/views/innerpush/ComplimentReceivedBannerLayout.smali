.class public Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/sum;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;


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
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/Frag;)V
    .locals 3

    .line 1
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p3, 0x1

    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->a:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-boolean p1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->e:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->a:Lv/VDraweeView;

    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    const/16 v2, 0xa

    .line 27
    .line 28
    invoke-virtual {p1, p4, v0, v1, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->a:Lv/VDraweeView;

    .line 35
    .line 36
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, p4, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget p1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 43
    .line 44
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->a:Lv/VDraweeView;

    .line 45
    .line 46
    if-lez p1, :cond_2

    .line 47
    .line 48
    invoke-static {p4, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->a:Lv/VDraweeView;

    .line 52
    .line 53
    iget p4, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 54
    .line 55
    invoke-virtual {p1, p4}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    const/4 p1, 0x0

    .line 60
    invoke-static {p4, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 64
    .line 65
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->c:Lv/VText;

    .line 72
    .line 73
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->c:Lv/VText;

    .line 77
    .line 78
    iget-object p4, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 79
    .line 80
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->c:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 90
    .line 91
    .line 92
    :cond_3
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->b:Ljava/lang/CharSequence;

    .line 93
    .line 94
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_4

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->d:Lv/VText;

    .line 101
    .line 102
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->d:Lv/VText;

    .line 106
    .line 107
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->b:Ljava/lang/CharSequence;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :cond_4
    return-void
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bs5;->a(Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

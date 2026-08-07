.class public Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jph;->a(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/ji80;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;->d:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Ll/ji80;->c:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Ll/ji80;->c:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;->e:Lv/VText;

    .line 21
    .line 22
    iget-object v1, p1, Ll/ji80;->c:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p1, Ll/ji80;->d:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p1, Ll/ji80;->d:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p1, Ll/ji80;->d:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;->c:Lv/VDraweeView;

    .line 64
    .line 65
    iget-object p1, p1, Ll/ji80;->d:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 70
    .line 71
    sget v1, Ll/qa00;->v:I

    .line 72
    .line 73
    invoke-virtual {v0, p0, p1, v1, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v0, "res://"

    .line 80
    .line 81
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v0, "/"

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    sget v0, Ll/dbc0;->gk:I

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;->c:Lv/VDraweeView;

    .line 112
    .line 113
    sget v1, Ll/qa00;->v:I

    .line 114
    .line 115
    invoke-virtual {v0, p0, p1, v1, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

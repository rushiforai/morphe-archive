.class public Ll/qh40;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lv/VDraweeView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;->f:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/TextView;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;->g:Landroid/widget/TextView;

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lv/VImage;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;->h:Lv/VImage;

    .line 29
    .line 30
    const/4 v0, 0x3

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lv/VDraweeView;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;->i:Lv/VDraweeView;

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lv/VText;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;->j:Lv/VText;

    .line 47
    .line 48
    const/4 v0, 0x6

    .line 49
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/widget/ImageView;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;->k:Landroid/widget/ImageView;

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Landroid/widget/TextView;

    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;->l:Landroid/widget/TextView;

    .line 65
    .line 66
    const/16 v0, 0x8

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/widget/TextView;

    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;->m:Landroid/widget/TextView;

    .line 75
    .line 76
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->Eb:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/qh40;->a(Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioReformBubbleView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

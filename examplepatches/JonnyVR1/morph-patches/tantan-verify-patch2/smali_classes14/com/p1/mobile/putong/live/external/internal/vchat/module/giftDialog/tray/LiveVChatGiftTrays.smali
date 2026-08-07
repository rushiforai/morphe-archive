.class public Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/nns;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

.field public b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

.field public c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

.field public d:Ll/nns;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->k(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method

.method private m(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->d:Ll/nns;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/nns;->B3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jnu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->getPlayingComboId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->y0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 27
    .line 28
    .line 29
    return v2

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->getPlayingComboId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->y0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 47
    .line 48
    .line 49
    return v2

    .line 50
    :cond_2
    return v1
.end method

.method public d(Ll/nns;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->d:Ll/nns;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->G0(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->Q0()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;)Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;->top:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 9
    .line 10
    return-object p0
.end method

.method public getAnimation()Landroid/view/animation/Animation;
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->ownLuxury:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->getPlayingGiftPriority()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_4

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->H0()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_4

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->otherLuxury:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 27
    .line 28
    if-eq p1, v0, :cond_0

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->otherNormal:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 31
    .line 32
    if-eq p1, v0, :cond_0

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->owmNormal:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 35
    .line 36
    if-ne p1, v0, :cond_4

    .line 37
    .line 38
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->E0()V

    .line 41
    .line 42
    .line 43
    return v1

    .line 44
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->owmNormal:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 45
    .line 46
    if-ne p1, v0, :cond_3

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->getPlayingGiftPriority()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->H0()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->otherNormal:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 65
    .line 66
    if-ne p1, v0, :cond_2

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->E0()V

    .line 71
    .line 72
    .line 73
    return v1

    .line 74
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->getPlayingGiftPriority()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    if-eqz p1, :cond_4

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->H0()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->otherNormal:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 91
    .line 92
    if-ne p1, v0, :cond_4

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->E0()V

    .line 97
    .line 98
    .line 99
    return v1

    .line 100
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->otherLuxury:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 101
    .line 102
    if-ne p1, v0, :cond_4

    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->getPlayingGiftPriority()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    if-eqz p1, :cond_4

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->H0()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_4

    .line 119
    .line 120
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->otherNormal:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 121
    .line 122
    if-ne p1, v0, :cond_4

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->E0()V

    .line 127
    .line 128
    .line 129
    :cond_4
    const/4 p0, 0x0

    .line 130
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/nns;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->d(Ll/nns;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;->top:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->H0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;->bottom:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;

    .line 13
    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->H0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->d:Ll/nns;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nns;->y3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->S0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;)Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/inu;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/inu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->U0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;)Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->n(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;)V

    .line 18
    .line 19
    .line 20
    if-eqz p3, :cond_0

    .line 21
    .line 22
    sget-object p3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;->top:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;

    .line 23
    .line 24
    if-ne p1, p3, :cond_0

    .line 25
    .line 26
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->m(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->X0()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->X0()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatTrayBackground;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatTrayBackground;

    .line 22
    .line 23
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

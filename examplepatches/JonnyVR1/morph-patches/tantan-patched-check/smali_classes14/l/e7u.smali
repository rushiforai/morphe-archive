.class public Ll/e7u;
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

.method public static a(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareVoiceCompanionDialogView;Landroid/view/View;)V
    .locals 3

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
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareVoiceCompanionDialogView;->a:Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lv/VText;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareVoiceCompanionDialogView;->b:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/view/ViewGroup;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VText;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareVoiceCompanionDialogView;->c:Lv/VText;

    .line 40
    .line 41
    const/4 v0, 0x2

    .line 42
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lv/VText;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareVoiceCompanionDialogView;->d:Lv/VText;

    .line 49
    .line 50
    const/4 v0, 0x3

    .line 51
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/VButton;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareVoiceCompanionDialogView;->e:Lv/VButton;

    .line 58
    .line 59
    const/4 v0, 0x4

    .line 60
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lv/VText;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareVoiceCompanionDialogView;->f:Lv/VText;

    .line 67
    .line 68
    return-void
.end method

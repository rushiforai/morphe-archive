.class public Ll/t100;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->d:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lv/VText;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->e:Lv/VText;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lv/VSwitchButton;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lv/VLinear;

    .line 32
    .line 33
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->g:Lv/VLinear;

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VText;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->h:Lv/VText;

    .line 48
    .line 49
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Landroid/view/ViewGroup;

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Landroid/widget/ImageView;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->i:Landroid/widget/ImageView;

    .line 62
    .line 63
    return-void
.end method

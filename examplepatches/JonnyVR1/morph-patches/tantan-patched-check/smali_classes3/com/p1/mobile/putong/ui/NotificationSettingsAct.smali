.class public Lcom/p1/mobile/putong/ui/NotificationSettingsAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/ui/NotificationSettingsAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/NotificationSettingsAct;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const-string p1, "\u5f00\u542f\u901a\u77e5\u8bbe\u7f6e"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final Y1(Landroid/widget/LinearLayout;Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/jec0;->B:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget v0, Ll/ycc0;->r0:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    sget p2, Ll/ycc0;->G:I

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Landroid/widget/ImageView;

    .line 30
    .line 31
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance p1, Landroid/widget/ScrollView;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Landroid/widget/LinearLayout;

    .line 7
    .line 8
    invoke-direct {p2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "oppo"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const-string v0, "\u7b2c\u4e00\u6b65\uff1a\u5f00\u542f\u6d88\u606f\u901a\u77e5"

    .line 30
    .line 31
    sget v1, Ll/cbc0;->r0:I

    .line 32
    .line 33
    invoke-virtual {p0, p2, v0, v1}, Lcom/p1/mobile/putong/ui/NotificationSettingsAct;->Y1(Landroid/widget/LinearLayout;Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    const-string v0, "\u7b2c\u4e8c\u6b65\uff1a\u5173\u95ed\u540e\u53f0\u51bb\u7ed3\uff0c\u5426\u5219\u9501\u5c4f\u4e0b\u65e0\u6cd5\u53ca\u65f6\u6536\u5230\u6d88\u606f"

    .line 37
    .line 38
    sget v1, Ll/cbc0;->s0:I

    .line 39
    .line 40
    invoke-virtual {p0, p2, v0, v1}, Lcom/p1/mobile/putong/ui/NotificationSettingsAct;->Y1(Landroid/widget/LinearLayout;Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const-string v0, "\u7b2c\u4e09\u6b65\uff1a\u5f00\u542f\u540e\u53f0\u5e38\u9a7b\uff0c\u907f\u514d\u88ab\u7cfb\u7edf\u81ea\u52a8\u5220\u9664\u8fdb\u7a0b"

    .line 44
    .line 45
    sget v1, Ll/cbc0;->t0:I

    .line 46
    .line 47
    invoke-virtual {p0, p2, v0, v1}, Lcom/p1/mobile/putong/ui/NotificationSettingsAct;->Y1(Landroid/widget/LinearLayout;Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "vivo"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    const-string v0, "\u7b2c\u4e00\u6b65\uff1a\u5f00\u542f\u81ea\u542f\u52a8\uff0c\u5426\u5219\u65e0\u6cd5\u53ca\u65f6\u6536\u5230\u6d88\u606f"

    .line 64
    .line 65
    sget v1, Ll/cbc0;->y0:I

    .line 66
    .line 67
    invoke-virtual {p0, p2, v0, v1}, Lcom/p1/mobile/putong/ui/NotificationSettingsAct;->Y1(Landroid/widget/LinearLayout;Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    const-string v0, "\u7b2c\u4e8c\u6b65\uff1a\u5f00\u542f\u540e\u53f0\u5e38\u9a7b\uff0c\u5426\u514d\u88ab\u7cfb\u7edf\u81ea\u52a8\u5220\u9664\u8fdb\u7a0b"

    .line 71
    .line 72
    sget v1, Ll/cbc0;->z0:I

    .line 73
    .line 74
    invoke-virtual {p0, p2, v0, v1}, Lcom/p1/mobile/putong/ui/NotificationSettingsAct;->Y1(Landroid/widget/LinearLayout;Ljava/lang/String;I)V

    .line 75
    .line 76
    .line 77
    :cond_1
    :goto_0
    invoke-virtual {p1, p2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/d250;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/d250;-><init>(Lcom/p1/mobile/putong/ui/NotificationSettingsAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

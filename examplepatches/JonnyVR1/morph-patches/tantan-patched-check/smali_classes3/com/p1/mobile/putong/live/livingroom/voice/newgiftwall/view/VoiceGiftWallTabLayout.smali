.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallTabLayout;
.super Lcom/google/android/material/tabs/TabLayout;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/tabs/TabLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/tabs/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/tabs/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;Ll/y20;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftTab;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftTab;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->clearOnTabSelectedListeners()V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    move v1, v0

    .line 16
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge v1, v2, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    new-instance v3, Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-direct {v3, v4}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftTab;

    .line 40
    .line 41
    const/high16 v5, 0x41500000    # 13.0f

    .line 42
    .line 43
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    const/high16 v7, 0x40c00000    # 6.0f

    .line 48
    .line 49
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    invoke-virtual {v3, v6, v8, v5, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 62
    .line 63
    .line 64
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftTab;->name:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    sget v4, Ll/obc0;->X6:I

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 72
    .line 73
    .line 74
    const/high16 v4, 0x41600000    # 14.0f

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 77
    .line 78
    .line 79
    const/4 v4, 0x1

    .line 80
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 81
    .line 82
    .line 83
    const-string v4, "#66ffffff"

    .line 84
    .line 85
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    .line 93
    .line 94
    sget v5, Ll/bnl0;->f:I

    .line 95
    .line 96
    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2, v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 106
    .line 107
    .line 108
    add-int/lit8 v1, v1, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallTabLayout$a;

    .line 112
    .line 113
    invoke-direct {v1, p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallTabLayout$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallTabLayout;Ll/y20;Ljava/util/List;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-interface {v1, p0}, Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;->onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

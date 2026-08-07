.class public Ll/tqq;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;)Ll/crq;
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "checkBox"

    .line 6
    .line 7
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v3, -0x1

    .line 12
    const/4 v4, -0x2

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move v1, v4

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v3

    .line 18
    :goto_0
    invoke-direct {v0, v1, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    const/high16 v1, 0x41c00000    # 24.0f

    .line 22
    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->topMargin:I

    .line 28
    .line 29
    int-to-float v4, v4

    .line 30
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 35
    .line 36
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 37
    .line 38
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    sparse-switch v4, :sswitch_data_0

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :sswitch_0
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    const/4 v3, 0x3

    .line 61
    goto :goto_1

    .line 62
    :sswitch_1
    const-string v2, "input"

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    const/4 v3, 0x2

    .line 72
    goto :goto_1

    .line 73
    :sswitch_2
    const-string v2, "text"

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-nez v1, :cond_3

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    const/4 v3, 0x1

    .line 83
    goto :goto_1

    .line 84
    :sswitch_3
    const-string v2, "button"

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_4

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    const/4 v3, 0x0

    .line 94
    :goto_1
    const/4 v1, 0x0

    .line 95
    packed-switch v3, :pswitch_data_0

    .line 96
    .line 97
    .line 98
    move-object v2, v1

    .line 99
    goto :goto_2

    .line 100
    :pswitch_0
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;

    .line 101
    .line 102
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;-><init>(Landroid/content/Context;)V

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :pswitch_1
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;

    .line 107
    .line 108
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;-><init>(Landroid/content/Context;)V

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :pswitch_2
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogText;

    .line 113
    .line 114
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogText;-><init>(Landroid/content/Context;)V

    .line 115
    .line 116
    .line 117
    goto :goto_2

    .line 118
    :pswitch_3
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;

    .line 119
    .line 120
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {v2, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    :goto_2
    if-eqz v2, :cond_5

    .line 132
    .line 133
    move-object p0, v2

    .line 134
    check-cast p0, Ll/sqq;

    .line 135
    .line 136
    invoke-interface {p0, p1, p2, v0}, Ll/sqq;->g(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;)V

    .line 137
    .line 138
    .line 139
    new-instance p0, Ll/crq;

    .line 140
    .line 141
    invoke-direct {p0, v2, v0}, Ll/crq;-><init>(Landroid/view/View;Landroid/widget/LinearLayout$LayoutParams;)V

    .line 142
    .line 143
    .line 144
    return-object p0

    .line 145
    :cond_5
    return-object v1

    .line 146
    nop

    .line 147
    :sswitch_data_0
    .sparse-switch
        -0x521dd8ce -> :sswitch_3
        0x36452d -> :sswitch_2
        0x5fb57ca -> :sswitch_1
        0x5b9aa3a3 -> :sswitch_0
    .end sparse-switch

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

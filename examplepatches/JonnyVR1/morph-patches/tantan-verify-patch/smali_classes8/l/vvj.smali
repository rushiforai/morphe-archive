.class public Ll/vvj;
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

.method public static synthetic a(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, ","

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, ",click"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/CoreGiftPanelName;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/x20;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getShowingDialog()Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v0, v0, Ll/pz20;

    .line 12
    .line 13
    if-nez v0, :cond_7

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getShowingDialog()Landroid/app/Dialog;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v0, v0, Ll/qvj;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_5

    .line 24
    .line 25
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    const-string v0, "note"

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    const-string v0, "greet"

    .line 52
    .line 53
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    move-object v3, p0

    .line 65
    move-object v4, p1

    .line 66
    move-object v5, p2

    .line 67
    move-object v6, p4

    .line 68
    move-object v7, p5

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    :goto_0
    new-instance v1, Ll/qvj;

    .line 71
    .line 72
    move-object v2, p0

    .line 73
    move-object v3, p1

    .line 74
    move-object v4, p2

    .line 75
    move-object v5, p4

    .line 76
    move-object v6, p5

    .line 77
    invoke-direct/range {v1 .. v6}, Ll/qvj;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    move-object v3, v2

    .line 81
    goto :goto_3

    .line 82
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_3

    .line 91
    .line 92
    new-instance v2, Ll/qvj;

    .line 93
    .line 94
    invoke-direct/range {v2 .. v7}, Ll/qvj;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :goto_2
    move-object v1, v2

    .line 98
    goto :goto_3

    .line 99
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-interface {p0}, Ll/r97;->b5()Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_4

    .line 112
    .line 113
    new-instance v2, Ll/pz20;

    .line 114
    .line 115
    invoke-direct/range {v2 .. v7}, Ll/pz20;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_4
    const/4 v1, 0x0

    .line 120
    :goto_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-eqz p0, :cond_7

    .line 125
    .line 126
    instance-of p0, v3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 127
    .line 128
    if-eqz p0, :cond_5

    .line 129
    .line 130
    move-object p0, v3

    .line 131
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    iget-object p0, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    invoke-interface {v1, p0}, Ll/rul;->k(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_4

    .line 151
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-interface {p0, v3}, Ll/r97;->t4(Lcom/p1/mobile/android/app/Act;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-eqz p0, :cond_6

    .line 164
    .line 165
    iget p0, v3, Lcom/p1/mobile/android/app/Act;->screenHeight:I

    .line 166
    .line 167
    invoke-interface {v1, p0}, Ll/rul;->k(I)V

    .line 168
    .line 169
    .line 170
    invoke-interface {v1, p7}, Ll/rul;->d(I)V

    .line 171
    .line 172
    .line 173
    new-instance p0, Ll/uvj;

    .line 174
    .line 175
    invoke-direct {p0, p6}, Ll/uvj;-><init>(Ll/x20;)V

    .line 176
    .line 177
    .line 178
    invoke-interface {v1, p0}, Ll/rul;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 179
    .line 180
    .line 181
    :cond_6
    :goto_4
    invoke-interface {v1, p3}, Ll/rul;->b(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-interface {v1}, Ll/rul;->j()V

    .line 185
    .line 186
    .line 187
    :cond_7
    :goto_5
    return-void
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/CoreGiftPanelName;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v5, ""

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move-object v6, p5

    .line 10
    invoke-static/range {v0 .. v7}, Ll/vvj;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 21

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 9
    .line 10
    invoke-virtual {v2}, Ll/lu8;->N3()Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/lu8;->N3()Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->giftInfo()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v4, "giftId"

    .line 36
    .line 37
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->giftInfo()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 46
    .line 47
    const-string v4, "gift_type"

    .line 48
    .line 49
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->giftInfo()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 58
    .line 59
    const-string v4, "giftName"

    .line 60
    .line 61
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    const-string v3, "module"

    .line 66
    .line 67
    const-string v4, "e_gift_bar"

    .line 68
    .line 69
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v8

    .line 73
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->getIndexOnPage()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    add-int/2addr v3, v0

    .line 78
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    const-string v4, "index"

    .line 83
    .line 84
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v9

    .line 88
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->getPageIndex()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    add-int/2addr v3, v0

    .line 93
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v3, "giftBarPageId"

    .line 98
    .line 99
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v10

    .line 103
    const-string v0, "enoughCoin"

    .line 104
    .line 105
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v11

    .line 113
    const-string v0, "gift_num"

    .line 114
    .line 115
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->giftInfo()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 124
    .line 125
    const-wide/high16 v13, 0x4024000000000000L    # 10.0

    .line 126
    .line 127
    div-double/2addr v2, v13

    .line 128
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const-string v2, "giftUnitPrice"

    .line 133
    .line 134
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v13

    .line 138
    const-string v0, "gift_bar_tab"

    .line 139
    .line 140
    const-string v2, "classic"

    .line 141
    .line 142
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 143
    .line 144
    .line 145
    move-result-object v14

    .line 146
    const-string v0, "gift_receiver_id"

    .line 147
    .line 148
    move-object/from16 v2, p1

    .line 149
    .line 150
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 151
    .line 152
    .line 153
    move-result-object v15

    .line 154
    const-string v0, "orderId"

    .line 155
    .line 156
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 157
    .line 158
    .line 159
    move-result-object v16

    .line 160
    const-string v0, "giftCombos"

    .line 161
    .line 162
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object v17

    .line 166
    const-string v0, "combo_id"

    .line 167
    .line 168
    const-string v1, ""

    .line 169
    .line 170
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 171
    .line 172
    .line 173
    move-result-object v18

    .line 174
    const-string v0, "gift_send_type"

    .line 175
    .line 176
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 177
    .line 178
    .line 179
    move-result-object v19

    .line 180
    const-string v0, "gift_scenario"

    .line 181
    .line 182
    const-string v1, "vas"

    .line 183
    .line 184
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object v20

    .line 188
    filled-new-array/range {v5 .. v20}, [Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    const-string v1, "e_gift"

    .line 193
    .line 194
    move-object/from16 v2, p0

    .line 195
    .line 196
    invoke-static {v1, v2, v0}, Ll/i4g0;->q(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 197
    .line 198
    .line 199
    return-void
.end method

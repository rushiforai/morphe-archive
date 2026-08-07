.class public Ll/qzj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qzj$a;
    }
.end annotation


# static fields
.field public static final a:Ll/qzj$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qzj$a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/qzj$a;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/qzj$a;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/qzj;->a:Ll/qzj$a;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 17

    .line 1
    const-string v0, "index"

    .line 2
    .line 3
    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v0, "module"

    .line 12
    .line 13
    move-object/from16 v1, p2

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v0, "giftId"

    .line 20
    .line 21
    move-object/from16 v1, p3

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    const-string v0, "giftName"

    .line 28
    .line 29
    move-object/from16 v1, p4

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    const-string v0, "giftUnitPrice"

    .line 36
    .line 37
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string v0, "enoughCoin"

    .line 46
    .line 47
    const-string v1, "NA"

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-string v0, "giftCombos"

    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    const-string v0, "gift_type"

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    const-string v0, "combo_id"

    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v10

    .line 71
    const/4 v0, 0x1

    .line 72
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v11, "gift_num"

    .line 77
    .line 78
    invoke-static {v11, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    const-string v0, "gift_receiver_id"

    .line 83
    .line 84
    move-object/from16 v12, p6

    .line 85
    .line 86
    invoke-static {v0, v12}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v12

    .line 90
    const-string v0, "activity_name"

    .line 91
    .line 92
    move-object/from16 v13, p7

    .line 93
    .line 94
    invoke-static {v0, v13}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v13

    .line 98
    const-string v0, "giftBarPageId"

    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object v14

    .line 104
    const-string v0, "gift_bar_tab"

    .line 105
    .line 106
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v15

    .line 110
    const-string v0, "gift_press_type"

    .line 111
    .line 112
    const-string v1, "click"

    .line 113
    .line 114
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v16

    .line 118
    filled-new-array/range {v2 .. v16}, [Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v1, "e_gift"

    .line 123
    .line 124
    move-object/from16 v2, p1

    .line 125
    .line 126
    invoke-static {v1, v2, v0}, Ll/i4g0;->q(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public static b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 16

    .line 1
    const-string v0, "index"

    .line 2
    .line 3
    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v0, "module"

    .line 12
    .line 13
    move-object/from16 v1, p2

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v0, "giftId"

    .line 20
    .line 21
    move-object/from16 v1, p3

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    const-string v0, "giftName"

    .line 28
    .line 29
    move-object/from16 v1, p4

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    const-string v0, "giftUnitPrice"

    .line 36
    .line 37
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string v0, "enoughCoin"

    .line 46
    .line 47
    const-string v1, "NA"

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-string v0, "gift_type"

    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    const-string v0, "combo_id"

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    const/4 v0, 0x1

    .line 66
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v10, "gift_num"

    .line 71
    .line 72
    invoke-static {v10, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v10

    .line 76
    const-string v0, "gift_receiver_id"

    .line 77
    .line 78
    move-object/from16 v11, p6

    .line 79
    .line 80
    invoke-static {v0, v11}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    const-string v0, "activity_name"

    .line 85
    .line 86
    move-object/from16 v12, p7

    .line 87
    .line 88
    invoke-static {v0, v12}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v12

    .line 92
    const-string v0, "giftBarPageId"

    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v13

    .line 98
    const-string v0, "gift_bar_tab"

    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object v14

    .line 104
    const-string v0, "gift_press_type"

    .line 105
    .line 106
    const-string v1, "click"

    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v15

    .line 112
    filled-new-array/range {v2 .. v15}, [Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const-string v1, "e_gift"

    .line 117
    .line 118
    move-object/from16 v2, p1

    .line 119
    .line 120
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/util/List;Z)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, ""

    .line 8
    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/coj;

    .line 20
    .line 21
    new-instance p2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p1, Ll/coj;->e:Ll/h64;

    .line 27
    .line 28
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p1, ","

    .line 34
    .line 35
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    add-int/lit8 p0, p0, -0x1

    .line 48
    .line 49
    const/4 p2, 0x0

    .line 50
    invoke-virtual {p1, p2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :cond_1
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "giftId"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "giftUnitPrice"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const-string v0, "gift_receiver_id"

    .line 26
    .line 27
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const-string p2, "gift_type"

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    const-string p0, "module"

    .line 40
    .line 41
    const-string p2, "ktv_panel"

    .line 42
    .line 43
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    const-string p0, "giftCombos"

    .line 48
    .line 49
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    filled-new-array/range {v2 .. v7}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p2, "e_gift"

    .line 62
    .line 63
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p2, "giftId"

    .line 8
    .line 9
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p2, "module"

    .line 14
    .line 15
    const-string p3, "ktv_panel"

    .line 16
    .line 17
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    filled-new-array {p0, p2}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p2, "e_gift"

    .line 26
    .line 27
    invoke-static {p2, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;ZLjava/lang/String;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 7

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string p2, "p_anchor_live_room"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p2, "p_user_live_room"

    .line 7
    .line 8
    :goto_0
    const-string v0, "anchorId"

    .line 9
    .line 10
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string p3, "liveId"

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string p0, "roomId"

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget p0, p4, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 31
    .line 32
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "giftId"

    .line 37
    .line 38
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    const-string p0, "combo_id"

    .line 43
    .line 44
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    iget p0, p4, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 51
    .line 52
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string p1, "combo_num"

    .line 57
    .line 58
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "e_live_send_gift_tray"

    .line 67
    .line 68
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 7
    .line 8
    sget-object p1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_SLIDER:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    iput-object p1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 11
    .line 12
    const-string p1, "e_gift_bar"

    .line 13
    .line 14
    iput-object p1, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const-string v1, "gift_bar_tab"

    .line 21
    .line 22
    const-string v2, "giftBarPageId"

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    add-int/lit8 p2, p2, 0x1

    .line 27
    .line 28
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p2, "live_new_type"

    .line 41
    .line 42
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    filled-new-array {p1, p0, p2}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {v0, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 55
    .line 56
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {v0, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "index"

    .line 4
    .line 5
    const-string v2, "NA"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v1, "module"

    .line 12
    .line 13
    move-object/from16 v4, p1

    .line 14
    .line 15
    invoke-static {v1, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 20
    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v5, "giftId"

    .line 26
    .line 27
    invoke-static {v5, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    const-string v1, "giftName"

    .line 32
    .line 33
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    iget-wide v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 40
    .line 41
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v7, "giftUnitPrice"

    .line 46
    .line 47
    invoke-static {v7, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    const-string v1, "giftBarPageId"

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    const-string v1, "enoughCoin"

    .line 58
    .line 59
    invoke-static/range {p3 .. p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    invoke-static {v1, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v9

    .line 67
    const-string v1, "gift_type"

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    const-string v0, "combo_id"

    .line 76
    .line 77
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v11

    .line 81
    const-string v0, "gift_num"

    .line 82
    .line 83
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v12

    .line 91
    const-string v0, "gift_bar_tab"

    .line 92
    .line 93
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v13

    .line 97
    const-string v0, "activity_name"

    .line 98
    .line 99
    move-object/from16 v1, p2

    .line 100
    .line 101
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v14

    .line 105
    const-string v0, "gift_receiver_id"

    .line 106
    .line 107
    move-object/from16 v1, p6

    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v15

    .line 113
    const-string v0, "gift_press_type"

    .line 114
    .line 115
    const-string v1, "click"

    .line 116
    .line 117
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v16

    .line 121
    filled-new-array/range {v3 .. v16}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v1, "e_gift"

    .line 126
    .line 127
    move-object/from16 v2, p4

    .line 128
    .line 129
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "index"

    .line 4
    .line 5
    const-string v2, "NA"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v1, "module"

    .line 12
    .line 13
    const-string v4, "quickgift"

    .line 14
    .line 15
    invoke-static {v1, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 20
    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v5, "giftId"

    .line 26
    .line 27
    invoke-static {v5, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    const-string v1, "giftName"

    .line 32
    .line 33
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    iget-wide v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 40
    .line 41
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v7, "giftUnitPrice"

    .line 46
    .line 47
    invoke-static {v7, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    const-string v1, "giftBarPageId"

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    const-string v1, "enoughCoin"

    .line 58
    .line 59
    move-object/from16 v9, p1

    .line 60
    .line 61
    invoke-static {v1, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    const-string v1, "gift_type"

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v10

    .line 73
    const-string v0, "combo_id"

    .line 74
    .line 75
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v11

    .line 79
    const-string v0, "gift_num"

    .line 80
    .line 81
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v12

    .line 89
    const-string v0, "gift_bar_tab"

    .line 90
    .line 91
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object v13

    .line 95
    const-string v0, "gift_receiver_id"

    .line 96
    .line 97
    move-object/from16 v1, p4

    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v14

    .line 103
    const-string v0, "gift_press_type"

    .line 104
    .line 105
    const-string v1, "click"

    .line 106
    .line 107
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object v15

    .line 111
    filled-new-array/range {v3 .. v15}, [Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v1, "e_gift"

    .line 116
    .line 117
    move-object/from16 v2, p2

    .line 118
    .line 119
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static j(Ll/bjs;Ll/jjs;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;",
            "Ll/jjs;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/vme0;

    .line 6
    .line 7
    const/16 v2, 0x2bc

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ll/vme0;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v3, 0x2

    .line 30
    if-lt v1, v3, :cond_0

    .line 31
    .line 32
    move v1, v2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v1, 0x0

    .line 35
    :goto_0
    new-instance v3, Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 38
    .line 39
    .line 40
    add-int/2addr p2, v2

    .line 41
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const-string v4, "index"

    .line 46
    .line 47
    invoke-interface {v3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    const-string p2, "module"

    .line 51
    .line 52
    const-string v4, "e_gift_bar"

    .line 53
    .line 54
    invoke-interface {v3, p2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    iget p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 58
    .line 59
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    const-string v4, "giftId"

    .line 64
    .line 65
    invoke-interface {v3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    const-string p2, "giftName"

    .line 69
    .line 70
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {v3, p2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    iget-wide v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 76
    .line 77
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    const-string v4, "giftUnitPrice"

    .line 82
    .line 83
    invoke-interface {v3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ll/jjs;->k()I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    add-int/2addr p2, v2

    .line 91
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    const-string v2, "giftBarPageId"

    .line 96
    .line 97
    invoke-interface {v3, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    const-string p2, "enoughCoin"

    .line 101
    .line 102
    invoke-interface {v3, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    const-string p2, "gift_type"

    .line 106
    .line 107
    iget-object p3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 108
    .line 109
    invoke-interface {v3, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    const-string p2, "combo_id"

    .line 113
    .line 114
    const-string p3, "NA"

    .line 115
    .line 116
    invoke-interface {v3, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    const-string p2, "gift_num"

    .line 120
    .line 121
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    invoke-interface {v3, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    const-string p2, "gift_bar_tab"

    .line 129
    .line 130
    invoke-virtual {p1}, Ll/jjs;->i()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-interface {v3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    const-string p1, "gift_send_type"

    .line 138
    .line 139
    invoke-interface {v3, p1, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    const-string p1, "gift_receiver_id"

    .line 143
    .line 144
    invoke-static {p7, p0, v1}, Ll/qzj;->c(Ljava/lang/String;Ljava/util/List;Z)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    if-eqz p8, :cond_1

    .line 152
    .line 153
    const-string p1, "long_press"

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_1
    const-string p1, "click"

    .line 157
    .line 158
    :goto_1
    const-string p2, "gift_press_type"

    .line 159
    .line 160
    invoke-interface {v3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    if-eqz v1, :cond_2

    .line 164
    .line 165
    const-string p1, "1"

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_2
    const-string p1, "0"

    .line 169
    .line 170
    :goto_2
    const-string p2, "is_send_all"

    .line 171
    .line 172
    invoke-interface {v3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    const-string p1, "receive_user_num"

    .line 184
    .line 185
    invoke-interface {v3, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    const-string p0, "e_gift"

    .line 189
    .line 190
    invoke-static {p0, p4, v3}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public static k(Ll/jjs;ILjava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jjs;->k()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    mul-int/lit8 v1, v1, 0x8

    .line 12
    .line 13
    add-int/2addr p1, v1

    .line 14
    const-string v1, "index"

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string p1, "module"

    .line 25
    .line 26
    const-string v1, "e_gift_bar"

    .line 27
    .line 28
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    iget p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 33
    .line 34
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v1, "giftId"

    .line 39
    .line 40
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    const-string p1, "giftName"

    .line 45
    .line 46
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    iget-wide v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 53
    .line 54
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string v1, "giftUnitPrice"

    .line 59
    .line 60
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-virtual {p0}, Ll/jjs;->k()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    add-int/lit8 p1, p1, 0x1

    .line 69
    .line 70
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string v1, "giftBarPageId"

    .line 75
    .line 76
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    const-string p1, "gift_type"

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    const-string p1, "gift_bar_tab"

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/jjs;->i()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v9

    .line 98
    filled-new-array/range {v2 .. v9}, [Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p1, "e_gift"

    .line 103
    .line 104
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public static l(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "e_live_gift_skin"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static m(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "e_live_gift_skin"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static n(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "module"

    .line 2
    .line 3
    const-string v1, "e_gift_bar"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_recharge"

    .line 14
    .line 15
    invoke-static {v1, p0, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static o(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "live_new_type"

    .line 6
    .line 7
    const-string v2, "gift_bar_tab"

    .line 8
    .line 9
    const-string v3, "giftBarPageId"

    .line 10
    .line 11
    const-string v4, "e_gift_bar"

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    add-int/lit8 p2, p2, 0x1

    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {v3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    filled-new-array {p2, p0, p3}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {v4, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 42
    .line 43
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {v3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    const-string p3, ""

    .line 52
    .line 53
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p2, p3, p0}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {v4, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static p(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "module"

    .line 2
    .line 3
    const-string v1, "e_gift_bar"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_recharge"

    .line 14
    .line 15
    invoke-static {v1, p0, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static q(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;ILjava/lang/String;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Ll/q4f;

    .line 6
    .line 7
    invoke-direct {v2}, Ll/q4f;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v3, "e_gift"

    .line 11
    .line 12
    iput-object v3, v2, Ll/q4f;->s:Ljava/lang/String;

    .line 13
    .line 14
    move-object/from16 v3, p2

    .line 15
    .line 16
    iput-object v3, v2, Ll/q4f;->n:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v3, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    iput-object v3, v2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 21
    .line 22
    const-string v3, "index"

    .line 23
    .line 24
    const-string v4, "NA"

    .line 25
    .line 26
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    const-string v3, "module"

    .line 31
    .line 32
    const-string v6, "quickgift"

    .line 33
    .line 34
    invoke-static {v3, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    iget v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 39
    .line 40
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v7, "giftId"

    .line 45
    .line 46
    invoke-static {v7, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    const-string v3, "giftName"

    .line 51
    .line 52
    iget-object v8, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v3, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    iget-wide v9, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 59
    .line 60
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const-string v9, "giftUnitPrice"

    .line 65
    .line 66
    invoke-static {v9, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    const-string v3, "giftBarPageId"

    .line 71
    .line 72
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v10

    .line 76
    const-string v3, "enoughCoin"

    .line 77
    .line 78
    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-static {v3, v11}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 85
    .line 86
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    const-string v12, "giftCombos"

    .line 91
    .line 92
    invoke-static {v12, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v12

    .line 96
    const-string v3, "gift_type"

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object v13

    .line 104
    const-string v0, "combo_id"

    .line 105
    .line 106
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v14

    .line 112
    const-string v0, "gift_num"

    .line 113
    .line 114
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object v15

    .line 122
    const-string v0, "gift_bar_tab"

    .line 123
    .line 124
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object v16

    .line 128
    const-string v0, "gift_receiver_id"

    .line 129
    .line 130
    move-object/from16 v1, p4

    .line 131
    .line 132
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 133
    .line 134
    .line 135
    move-result-object v17

    .line 136
    const-string v0, "gift_press_type"

    .line 137
    .line 138
    const-string v1, "click"

    .line 139
    .line 140
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object v18

    .line 144
    filled-new-array/range {v5 .. v18}, [Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v2, v0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public static r(Ll/bjs;Ll/jjs;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;",
            "Ll/jjs;",
            "I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isSendGiftFromBatch()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Ll/qzj;->a:Ll/qzj$a;

    .line 8
    .line 9
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftBatchOriginalId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/qzj$a;->b(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftBatchOriginalId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/qzj$a;->a(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/q4f;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/q4f;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v2, "e_gift"

    .line 33
    .line 34
    iput-object v2, v1, Ll/q4f;->s:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p4, v1, Ll/q4f;->n:Ljava/lang/String;

    .line 37
    .line 38
    sget-object p4, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 39
    .line 40
    iput-object p4, v1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 41
    .line 42
    new-instance p4, Ll/vme0;

    .line 43
    .line 44
    const/16 v2, 0x2bc

    .line 45
    .line 46
    invoke-direct {p4, v2}, Ll/vme0;-><init>(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p4}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/util/List;

    .line 54
    .line 55
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    move-result p4

    .line 59
    const/4 v2, 0x1

    .line 60
    if-nez p4, :cond_2

    .line 61
    .line 62
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result p4

    .line 66
    const/4 v3, 0x2

    .line 67
    if-lt p4, v3, :cond_2

    .line 68
    .line 69
    move p4, v2

    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const/4 p4, 0x0

    .line 72
    :goto_0
    new-instance v3, Ljava/util/HashMap;

    .line 73
    .line 74
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 75
    .line 76
    .line 77
    add-int/2addr p2, v2

    .line 78
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    const-string v4, "index"

    .line 83
    .line 84
    invoke-interface {v3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    const-string p2, "module"

    .line 88
    .line 89
    const-string v4, "e_gift_bar"

    .line 90
    .line 91
    invoke-interface {v3, p2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    iget p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 95
    .line 96
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    const-string v4, "giftId"

    .line 101
    .line 102
    invoke-interface {v3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    const-string p2, "giftName"

    .line 106
    .line 107
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 108
    .line 109
    invoke-interface {v3, p2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    iget-wide v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 113
    .line 114
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    const-string v4, "giftUnitPrice"

    .line 119
    .line 120
    invoke-interface {v3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Ll/jjs;->k()I

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    add-int/2addr p2, v2

    .line 128
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    const-string v2, "giftBarPageId"

    .line 133
    .line 134
    invoke-interface {v3, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    const-string p2, "enoughCoin"

    .line 138
    .line 139
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 140
    .line 141
    invoke-interface {v3, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    iget p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 145
    .line 146
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    const-string v2, "giftCombos"

    .line 151
    .line 152
    invoke-interface {v3, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    const-string p2, "gift_type"

    .line 156
    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 158
    .line 159
    invoke-interface {v3, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    const-string p2, "combo_id"

    .line 163
    .line 164
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 165
    .line 166
    invoke-interface {v3, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    const-string p2, "gift_num"

    .line 170
    .line 171
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object p3

    .line 175
    invoke-interface {v3, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    const-string p2, "gift_bar_tab"

    .line 179
    .line 180
    invoke-virtual {p1}, Ll/jjs;->i()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-interface {v3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    const-string p1, "gift_send_type"

    .line 188
    .line 189
    invoke-interface {v3, p1, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    const-string p1, "gift_receiver_id"

    .line 193
    .line 194
    invoke-static {p7, p0, p4}, Ll/qzj;->c(Ljava/lang/String;Ljava/util/List;Z)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    if-eqz p8, :cond_3

    .line 202
    .line 203
    const-string p1, "long_press"

    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_3
    const-string p1, "click"

    .line 207
    .line 208
    :goto_1
    const-string p2, "gift_press_type"

    .line 209
    .line 210
    invoke-interface {v3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    if-eqz p4, :cond_4

    .line 214
    .line 215
    const-string p1, "1"

    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_4
    const-string p1, "0"

    .line 219
    .line 220
    :goto_2
    const-string p2, "is_send_all"

    .line 221
    .line 222
    invoke-interface {v3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    const-string p1, "receive_user_num"

    .line 234
    .line 235
    invoke-interface {v3, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    invoke-static {v1, v3}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 239
    .line 240
    .line 241
    return-void
.end method

.method public static s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;ILjava/lang/String;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/q4f;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/q4f;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "e_gift"

    .line 9
    .line 10
    iput-object v2, v1, Ll/q4f;->s:Ljava/lang/String;

    .line 11
    .line 12
    move-object/from16 v2, p1

    .line 13
    .line 14
    iput-object v2, v1, Ll/q4f;->n:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v2, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v2, v1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    const-string v2, "index"

    .line 21
    .line 22
    const-string v3, "NA"

    .line 23
    .line 24
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    const-string v2, "module"

    .line 29
    .line 30
    const-string v5, "new_user_treasure_box"

    .line 31
    .line 32
    invoke-static {v2, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 37
    .line 38
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v6, "giftId"

    .line 43
    .line 44
    invoke-static {v6, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    const-string v2, "giftName"

    .line 49
    .line 50
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v2, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    iget-wide v8, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 57
    .line 58
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v8, "giftUnitPrice"

    .line 63
    .line 64
    invoke-static {v8, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v8

    .line 68
    const-string v2, "giftBarPageId"

    .line 69
    .line 70
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    const-string v2, "enoughCoin"

    .line 75
    .line 76
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-static {v2, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v10

    .line 82
    const-string v2, "giftCombos"

    .line 83
    .line 84
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v11

    .line 88
    const-string v2, "gift_type"

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v12

    .line 96
    const-string v0, "combo_id"

    .line 97
    .line 98
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object v13

    .line 102
    const-string v0, "gift_num"

    .line 103
    .line 104
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v14

    .line 112
    const-string v0, "gift_bar_tab"

    .line 113
    .line 114
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v15

    .line 118
    const-string v0, "gift_send_type"

    .line 119
    .line 120
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v16

    .line 124
    const-string v0, "gift_receiver_id"

    .line 125
    .line 126
    move-object/from16 v2, p3

    .line 127
    .line 128
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 129
    .line 130
    .line 131
    move-result-object v17

    .line 132
    const-string v0, "gift_press_type"

    .line 133
    .line 134
    const-string v2, "click"

    .line 135
    .line 136
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object v18

    .line 140
    filled-new-array/range {v4 .. v18}, [Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-static {v1, v0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public static t(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "anchor_id"

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "live_id"

    .line 8
    .line 9
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    const-string v0, "is_not_show_required"

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "live_category"

    .line 24
    .line 25
    invoke-static {v0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string p5, "default"

    .line 36
    .line 37
    :cond_0
    const-string v0, "mc_type"

    .line 38
    .line 39
    invoke-static {v0, p5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p5

    .line 43
    filled-new-array {p2, p3, p1, p4, p5}, [Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "e_live_bottom_popup"

    .line 48
    .line 49
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static u(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "anchor_id"

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "live_id"

    .line 8
    .line 9
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    const-string v0, "is_not_show_required"

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "live_category"

    .line 24
    .line 25
    invoke-static {v0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    filled-new-array {p2, p3, p1, p4}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "e_live_bottom_popup"

    .line 34
    .line 35
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

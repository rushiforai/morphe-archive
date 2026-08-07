.class public Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;
    }
.end annotation


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

.method public static a(I)Landroid/util/Pair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "Beauty_beautyLive"

    .line 2
    .line 3
    const-string v1, "Reshape_beauty4Items"

    .line 4
    .line 5
    const-string v2, "Reshape_ReshapeLive"

    .line 6
    .line 7
    packed-switch p0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :pswitch_0
    new-instance p0, Landroid/util/Pair;

    .line 13
    .line 14
    const-string v0, "BEF_BEAUTY_WHITEN_TEETH"

    .line 15
    .line 16
    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :pswitch_1
    new-instance p0, Landroid/util/Pair;

    .line 21
    .line 22
    const-string v0, "BEF_BEAUTY_SMILES_FOLDS"

    .line 23
    .line 24
    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_2
    new-instance p0, Landroid/util/Pair;

    .line 29
    .line 30
    const-string v0, "BEF_BEAUTY_REMOVE_POUCH"

    .line 31
    .line 32
    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_3
    new-instance p0, Landroid/util/Pair;

    .line 37
    .line 38
    const-string v0, "BEF_BEAUTY_BRIGHTEN_EYE"

    .line 39
    .line 40
    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-object p0

    .line 44
    :pswitch_4
    new-instance p0, Landroid/util/Pair;

    .line 45
    .line 46
    const-string v0, "Internal_Deform_ZoomMouth"

    .line 47
    .line 48
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_5
    new-instance p0, Landroid/util/Pair;

    .line 53
    .line 54
    const-string v0, "Internal_Deform_MovNose"

    .line 55
    .line 56
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_6
    new-instance p0, Landroid/util/Pair;

    .line 61
    .line 62
    const-string v0, "Internal_Deform_Nose"

    .line 63
    .line 64
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-object p0

    .line 68
    :pswitch_7
    new-instance p0, Landroid/util/Pair;

    .line 69
    .line 70
    const-string v0, "Internal_Deform_Chin"

    .line 71
    .line 72
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-object p0

    .line 76
    :pswitch_8
    new-instance p0, Landroid/util/Pair;

    .line 77
    .line 78
    const-string v0, "Internal_Deform_Forehead"

    .line 79
    .line 80
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-object p0

    .line 84
    :pswitch_9
    new-instance p0, Landroid/util/Pair;

    .line 85
    .line 86
    const-string v0, "Internal_Deform_Zoom_Jawbone"

    .line 87
    .line 88
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-object p0

    .line 92
    :pswitch_a
    new-instance p0, Landroid/util/Pair;

    .line 93
    .line 94
    const-string v0, "Internal_Deform_Zoom_Cheekbone"

    .line 95
    .line 96
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-object p0

    .line 100
    :pswitch_b
    new-instance p0, Landroid/util/Pair;

    .line 101
    .line 102
    const-string v0, "Internal_Deform_CutFace"

    .line 103
    .line 104
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    return-object p0

    .line 108
    :pswitch_c
    new-instance p0, Landroid/util/Pair;

    .line 109
    .line 110
    const-string v0, "Internal_Deform_Overall"

    .line 111
    .line 112
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    return-object p0

    .line 116
    :pswitch_d
    new-instance p0, Landroid/util/Pair;

    .line 117
    .line 118
    const-string v0, "Internal_Deform_Eye"

    .line 119
    .line 120
    invoke-direct {p0, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    return-object p0

    .line 124
    :pswitch_e
    new-instance p0, Landroid/util/Pair;

    .line 125
    .line 126
    const-string v1, "sharp"

    .line 127
    .line 128
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    return-object p0

    .line 132
    :pswitch_f
    new-instance p0, Landroid/util/Pair;

    .line 133
    .line 134
    const-string v1, "whiten"

    .line 135
    .line 136
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    return-object p0

    .line 140
    :pswitch_10
    new-instance p0, Landroid/util/Pair;

    .line 141
    .line 142
    const-string v1, "smooth"

    .line 143
    .line 144
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    return-object p0

    .line 148
    nop

    .line 149
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static b(II)Landroid/util/Pair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    new-instance p0, Landroid/util/Pair;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "MakeupStyle_"

    .line 17
    .line 18
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->d(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-direct {p0, p1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->c(I)Landroid/util/Pair;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->a(I)Landroid/util/Pair;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static c(I)Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static d(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :pswitch_0
    const-string p0, "YY"

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_1
    const-string p0, "OM"

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_2
    const-string p0, "WN"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_3
    const-string p0, "DM"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_4
    const-string p0, "AD"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_5
    const-string p0, "YQ"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_6
    const-string p0, "NN"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_7
    const-string p0, "ZG"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_8
    const-string p0, "TM"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_9
    const-string p0, "CW"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_a
    const-string p0, "HX"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_b
    const-string p0, "SS"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_c
    const-string p0, "BX"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_d
    const-string p0, "QS"

    .line 46
    .line 47
    return-object p0

    .line 48
    nop

    .line 49
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static e(Ll/v6m;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string v0, "Makeup_ALL"

    .line 4
    .line 5
    const-string v1, "Filter_ALL"

    .line 6
    .line 7
    invoke-interface {p0, v0, v1}, Ll/v6m;->removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static f(Ll/v6m;IF)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->b(II)Landroid/util/Pair;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ljava/lang/CharSequence;

    .line 13
    .line 14
    const-string v1, "whiten"

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const v0, 0x3f19999a    # 0.6f

    .line 23
    .line 24
    .line 25
    mul-float/2addr p2, v0

    .line 26
    :cond_0
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Ljava/lang/String;

    .line 29
    .line 30
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, Ljava/lang/String;

    .line 33
    .line 34
    invoke-interface {p0, v0, p1, p2}, Ll/v6m;->e0(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public static g(Ll/v6m;ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->b(II)Landroid/util/Pair;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->FILTER:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 11
    .line 12
    if-ne p2, v0, :cond_0

    .line 13
    .line 14
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ljava/lang/String;

    .line 17
    .line 18
    const-string p2, "Filter_ALL"

    .line 19
    .line 20
    invoke-interface {p0, p1, p2, p3}, Ll/v6m;->updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->MAKEUP:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 25
    .line 26
    if-ne p2, v0, :cond_1

    .line 27
    .line 28
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Ljava/lang/String;

    .line 31
    .line 32
    const-string p2, "Makeup_ALL"

    .line 33
    .line 34
    invoke-interface {p0, p1, p2, p3}, Ll/v6m;->updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

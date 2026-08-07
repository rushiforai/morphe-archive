.class public Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;,
        Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;
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

.method public static A(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->W1()Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    aget p0, v1, p0

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    const-string v2, "https://auto.tancdn.com/v1/raw/"

    .line 23
    .line 24
    if-eq p0, v1, :cond_8

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    if-eq p0, v1, :cond_6

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    if-eq p0, v1, :cond_4

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    if-eq p0, v1, :cond_2

    .line 34
    .line 35
    const/4 v1, 0x5

    .line 36
    if-eq p0, v1, :cond_0

    .line 37
    .line 38
    const-string p0, ""

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    const-string p0, "https://auto.tancdn.com/v1/raw/296b1d3b-f19a-4b4e-87f9-d6aa2264fce410.svga"

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_2
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_3

    .line 74
    .line 75
    const-string p0, "https://auto.tancdn.com/v1/raw/22e435d4-c0b7-4ee5-a5bc-25d4c24677c411.svga"

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_4
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_5

    .line 100
    .line 101
    const-string p0, "https://auto.tancdn.com/v1/raw/5926720d-b9c1-4a2b-b08a-b0e9c9cbb8d911.svga"

    .line 102
    .line 103
    return-object p0

    .line 104
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_6
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-eqz p0, :cond_7

    .line 126
    .line 127
    const-string p0, "https://auto.tancdn.com/v1/raw/96212cc2-db38-4a85-bd5b-72c1dfc0d15010.svga"

    .line 128
    .line 129
    return-object p0

    .line 130
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0

    .line 145
    :cond_8
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_9

    .line 152
    .line 153
    const-string p0, "https://auto.tancdn.com/v1/raw/1e0dfaaa-44ae-48e8-b429-f7ea9c78d5a313.svga"

    .line 154
    .line 155
    return-object p0

    .line 156
    :cond_9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0
.end method

.method public static a()Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ll/r97;->m0()Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_zaima:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    const-string v2, "https://auto.tancdn.com/v1/raw/4a7a48e4-d738-412a-b85a-1a0b43ed87fe12.svga"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_zaima:Ljava/lang/String;

    .line 30
    .line 31
    :goto_0
    const-string v3, "\u5728\u5417"

    .line 32
    .line 33
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_jy:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    const-string v2, "https://auto.tancdn.com/v1/raw/666dc8ee-ebdf-4c4b-bf58-941b60d09c9512.svga"

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_jy:Ljava/lang/String;

    .line 48
    .line 49
    :goto_1
    const-string v3, "\u9707\u60ca"

    .line 50
    .line 51
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_dx:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    const-string v2, "https://auto.tancdn.com/v1/raw/6b431924-e985-4bf2-94ef-06e43ab9c47b13.svga"

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_dx:Ljava/lang/String;

    .line 66
    .line 67
    :goto_2
    const-string v3, "\u5927\u7b11"

    .line 68
    .line 69
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_dk:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    const-string v2, "https://auto.tancdn.com/v1/raw/3e21b430-83c2-4d65-a3e7-7ef1cb66117f12.svga"

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_3
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_dk:Ljava/lang/String;

    .line 84
    .line 85
    :goto_3
    const-string v3, "\u5927\u54ed"

    .line 86
    .line 87
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_bixin:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_4

    .line 97
    .line 98
    const-string v2, "https://auto.tancdn.com/v1/raw/573b4443-72ec-4619-b5f1-ee6c2637a5f313.svga"

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_4
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_bixin:Ljava/lang/String;

    .line 102
    .line 103
    :goto_4
    const-string v3, "\u6bd4\u5fc3"

    .line 104
    .line 105
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_wanan:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_5

    .line 115
    .line 116
    const-string v1, "https://auto.tancdn.com/v1/raw/5be8c9d1-e502-4ef4-9861-d5a469fe3abd13.svga"

    .line 117
    .line 118
    goto :goto_5

    .line 119
    :cond_5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;->poke_sticker_svga_wanan:Ljava/lang/String;

    .line 120
    .line 121
    :goto_5
    const-string v2, "\u665a\u5b89"

    .line 122
    .line 123
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    return-object v0
.end method

.method public static b(D)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    .line 2
    .line 3
    mul-double v2, p0, v0

    .line 4
    .line 5
    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    long-to-double v2, v2

    .line 10
    div-double/2addr v2, v0

    .line 11
    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    long-to-double v0, v0

    .line 16
    sub-double/2addr v0, p0

    .line 17
    const-wide/16 p0, 0x0

    .line 18
    .line 19
    cmpl-double p0, v0, p0

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    double-to-long p0, v2

    .line 24
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const/16 p0, -0x1221

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    const/16 p0, -0x1e22

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    const/16 p0, -0x182f

    .line 28
    .line 29
    return p0

    .line 30
    :cond_2
    const/16 p0, -0xc2a

    .line 31
    .line 32
    return p0

    .line 33
    :cond_3
    const p0, -0x290e01

    .line 34
    .line 35
    .line 36
    return p0
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "13"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, "2000013"

    .line 11
    .line 12
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/putong/core/data/ChatHeat;)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 15
    .line 16
    return-object p0
.end method

.method public static f(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;
    .locals 2

    .line 1
    const-wide/high16 v0, 0x4034000000000000L    # 20.0

    .line 2
    .line 3
    cmpl-double v0, p0, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->five:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-wide/high16 v0, 0x402e000000000000L    # 15.0

    .line 11
    .line 12
    cmpl-double v0, p0, v0

    .line 13
    .line 14
    if-ltz v0, :cond_1

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->four:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    .line 20
    .line 21
    cmpl-double v0, p0, v0

    .line 22
    .line 23
    if-ltz v0, :cond_2

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->third:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-wide/high16 v0, 0x4014000000000000L    # 5.0

    .line 29
    .line 30
    cmpl-double v0, p0, v0

    .line 31
    .line 32
    if-ltz v0, :cond_3

    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->second:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_3
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 38
    .line 39
    cmpl-double p0, p0, v0

    .line 40
    .line 41
    if-ltz p0, :cond_4

    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->first:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 47
    .line 48
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)D
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    return-wide v0

    .line 27
    :cond_0
    const-wide/high16 v0, 0x4034000000000000L    # 20.0

    .line 28
    .line 29
    return-wide v0

    .line 30
    :cond_1
    const-wide/high16 v0, 0x402e000000000000L    # 15.0

    .line 31
    .line 32
    return-wide v0

    .line 33
    :cond_2
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    .line 34
    .line 35
    return-wide v0

    .line 36
    :cond_3
    const-wide/high16 v0, 0x4014000000000000L    # 5.0

    .line 37
    .line 38
    return-wide v0

    .line 39
    :cond_4
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 40
    .line 41
    return-wide v0
.end method

.method public static h(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)D
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    return-wide v0

    .line 27
    :cond_0
    const-wide/high16 v0, 0x4041000000000000L    # 34.0

    .line 28
    .line 29
    return-wide v0

    .line 30
    :cond_1
    const-wide v0, 0x403e99999999999aL    # 30.6

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    return-wide v0

    .line 36
    :cond_2
    const-wide/high16 v0, 0x4037000000000000L    # 23.0

    .line 37
    .line 38
    return-wide v0

    .line 39
    :cond_3
    const-wide/high16 v0, 0x402e000000000000L    # 15.0

    .line 40
    .line 41
    return-wide v0

    .line 42
    :cond_4
    const-wide/high16 v0, 0x4014000000000000L    # 5.0

    .line 43
    .line 44
    return-wide v0
.end method

.method public static i(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const/16 p0, -0x1221

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    const/16 p0, -0x171a

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    const/16 p0, -0x1020

    .line 28
    .line 29
    return p0

    .line 30
    :cond_2
    const/16 p0, -0x71d

    .line 31
    .line 32
    return p0

    .line 33
    :cond_3
    const p0, -0x1c0901

    .line 34
    .line 35
    .line 36
    return p0
.end method

.method public static j(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_0
    const p0, -0x20b0d

    .line 27
    .line 28
    .line 29
    return p0

    .line 30
    :cond_1
    const p0, -0x2070d

    .line 31
    .line 32
    .line 33
    return p0

    .line 34
    :cond_2
    const p0, -0x20512

    .line 35
    .line 36
    .line 37
    return p0

    .line 38
    :cond_3
    const p0, -0xe0501

    .line 39
    .line 40
    .line 41
    return p0

    .line 42
    :cond_4
    const p0, -0x60607

    .line 43
    .line 44
    .line 45
    return p0
.end method

.method public static k(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_0
    sget p0, Ll/ibc0;->R3:I

    .line 27
    .line 28
    return p0

    .line 29
    :cond_1
    sget p0, Ll/ibc0;->o2:I

    .line 30
    .line 31
    return p0

    .line 32
    :cond_2
    sget p0, Ll/ibc0;->o4:I

    .line 33
    .line 34
    return p0

    .line 35
    :cond_3
    sget p0, Ll/ibc0;->w4:I

    .line 36
    .line 37
    return p0

    .line 38
    :cond_4
    sget p0, Ll/ibc0;->p4:I

    .line 39
    .line 40
    return p0
.end method

.method public static l(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_0
    const/16 p0, -0x7c88

    .line 27
    .line 28
    return p0

    .line 29
    :cond_1
    const/16 p0, -0x5eb6

    .line 30
    .line 31
    return p0

    .line 32
    :cond_2
    const/16 p0, -0x3bd2

    .line 33
    .line 34
    return p0

    .line 35
    :cond_3
    const p0, -0x9e3501

    .line 36
    .line 37
    .line 38
    return p0

    .line 39
    :cond_4
    const p0, -0x181e3

    .line 40
    .line 41
    .line 42
    return p0
.end method

.method public static m(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, -0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/16 p0, -0x171a

    .line 24
    .line 25
    return p0

    .line 26
    :cond_1
    const/16 p0, -0x1425

    .line 27
    .line 28
    return p0

    .line 29
    :cond_2
    const/16 p0, -0x622

    .line 30
    .line 31
    return p0

    .line 32
    :cond_3
    const p0, -0x190801

    .line 33
    .line 34
    .line 35
    return p0
.end method

.method public static n()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "14"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, "2000012"

    .line 11
    .line 12
    return-object v0
.end method

.method public static o(Lcom/p1/mobile/putong/core/data/Sticker;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->a()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public static p(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)D
    .locals 5

    .line 1
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 2
    .line 3
    cmpg-double v0, p1, v0

    .line 4
    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    return-wide v1

    .line 10
    :cond_0
    const-wide/high16 v3, 0x4034000000000000L    # 20.0

    .line 11
    .line 12
    cmpl-double v0, p1, v3

    .line 13
    .line 14
    if-ltz v0, :cond_1

    .line 15
    .line 16
    const-wide/high16 p0, 0x4041000000000000L    # 34.0

    .line 17
    .line 18
    return-wide p0

    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->next()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->g(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)D

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->g(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)D

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    sub-double/2addr p1, v1

    .line 38
    sub-double/2addr v3, v1

    .line 39
    div-double/2addr p1, v3

    .line 40
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->h(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)D

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->h(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)D

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    sub-double/2addr v3, v1

    .line 49
    mul-double/2addr v3, p1

    .line 50
    add-double/2addr v1, v3

    .line 51
    :cond_2
    return-wide v1
.end method

.method public static q(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;
    .locals 5

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v1}, Ll/r97;->W1()Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 37
    .line 38
    new-instance v3, Ljava/util/Random;

    .line 39
    .line 40
    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;

    .line 58
    .line 59
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->message:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 60
    .line 61
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->key:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v4, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->content:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->value:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v2, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->imageRes:Ljava/lang/String;

    .line 68
    .line 69
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->photo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 73
    .line 74
    const-string v3, "\u9009\u62e9\u7167\u7247"

    .line 75
    .line 76
    iput-object v3, v2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->content:Ljava/lang/String;

    .line 77
    .line 78
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 82
    .line 83
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->second:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 84
    .line 85
    iget v3, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 86
    .line 87
    if-lt v2, v3, :cond_4

    .line 88
    .line 89
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-nez v2, :cond_4

    .line 96
    .line 97
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 98
    .line 99
    new-instance v3, Ljava/util/Random;

    .line 100
    .line 101
    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 102
    .line 103
    .line 104
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;

    .line 119
    .line 120
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->chuEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 121
    .line 122
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->key:Ljava/lang/String;

    .line 123
    .line 124
    iput-object v4, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->content:Ljava/lang/String;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->value:Ljava/lang/String;

    .line 127
    .line 128
    iput-object v2, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->imageRes:Ljava/lang/String;

    .line 129
    .line 130
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 133
    .line 134
    invoke-virtual {v2, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-eqz v2, :cond_3

    .line 143
    .line 144
    iget-object v2, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->title:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eqz p1, :cond_2

    .line 151
    .line 152
    const-string p1, "\u5979"

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_2
    const-string p1, "\u4ed6"

    .line 156
    .line 157
    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iput-object p1, v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->title:Ljava/lang/String;

    .line 166
    .line 167
    :cond_3
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    :cond_4
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 171
    .line 172
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->four:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 173
    .line 174
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 175
    .line 176
    if-lt p0, p1, :cond_5

    .line 177
    .line 178
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 179
    .line 180
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-nez p0, :cond_5

    .line 185
    .line 186
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 187
    .line 188
    new-instance p1, Ljava/util/Random;

    .line 189
    .line 190
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    .line 191
    .line 192
    .line 193
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 194
    .line 195
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    invoke-virtual {p1, v1}, Ljava/util/Random;->nextInt(I)I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    check-cast p0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;

    .line 208
    .line 209
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->friendEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->key:Ljava/lang/String;

    .line 212
    .line 213
    iput-object v1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->content:Ljava/lang/String;

    .line 214
    .line 215
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->value:Ljava/lang/String;

    .line 216
    .line 217
    iput-object p0, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->imageRes:Ljava/lang/String;

    .line 218
    .line 219
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    :cond_5
    new-instance p0, Ljava/util/Random;

    .line 223
    .line 224
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 225
    .line 226
    .line 227
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    invoke-virtual {p0, p1}, Ljava/util/Random;->nextInt(I)I

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 240
    .line 241
    return-object p0

    .line 242
    :cond_6
    :goto_1
    const/4 p0, 0x0

    .line 243
    return-object p0
.end method

.method public static r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;
    .locals 2

    .line 1
    const-wide/high16 v0, 0x4041000000000000L    # 34.0

    .line 2
    .line 3
    cmpl-double v0, p0, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->five:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-wide v0, 0x403e99999999999aL    # 30.6

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    cmpl-double v0, p0, v0

    .line 16
    .line 17
    if-ltz v0, :cond_1

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->four:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    const-wide/high16 v0, 0x4037000000000000L    # 23.0

    .line 23
    .line 24
    cmpl-double v0, p0, v0

    .line 25
    .line 26
    if-ltz v0, :cond_2

    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->third:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    const-wide/high16 v0, 0x402e000000000000L    # 15.0

    .line 32
    .line 33
    cmpl-double v0, p0, v0

    .line 34
    .line 35
    if-ltz v0, :cond_3

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->second:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    const-wide/high16 v0, 0x4014000000000000L    # 5.0

    .line 41
    .line 42
    cmpl-double p0, p0, v0

    .line 43
    .line 44
    if-ltz p0, :cond_4

    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->first:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 50
    .line 51
    return-object p0
.end method

.method public static s(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const-string p0, ""

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string p0, "\u5df2\u89e3\u95011v1\u4e13\u5c5e\u804a\u5929"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p0, "\u5df2\u89e3\u9501\u5bc6\u53cb\u8868\u60c5"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    const-string p0, "\u5df2\u89e3\u9501\u7279\u522b\u63d0\u9192"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_3
    const-string p0, "\u5df2\u89e3\u9501\u6233\u6233\u8868\u60c5"

    .line 34
    .line 35
    return-object p0
.end method

.method public static t(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_0
    sget p0, Ll/ibc0;->T6:I

    .line 24
    .line 25
    return p0

    .line 26
    :cond_1
    sget p0, Ll/ibc0;->V6:I

    .line 27
    .line 28
    return p0

    .line 29
    :cond_2
    sget p0, Ll/ibc0;->X6:I

    .line 30
    .line 31
    return p0

    .line 32
    :cond_3
    sget p0, Ll/ibc0;->U6:I

    .line 33
    .line 34
    return p0
.end method

.method public static u(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const-string p0, ""

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string p0, "\u4f60\u4eec\u5df2\u8fbe\u5230\u62e5\u62b1\u7684\u6e29\u5ea6"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p0, "\u4f60\u4eec\u5df2\u8fbe\u5230\u638c\u5fc3\u7684\u6e29\u5ea6"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    const-string p0, "\u4f60\u4eec\u5df2\u8fbe\u5230\u6307\u5c16\u7684\u6e29\u5ea6"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_3
    const-string p0, "\u4f60\u4eec\u5df2\u8fbe\u5230\u6625\u5929\u7684\u6e29\u5ea6"

    .line 34
    .line 35
    return-object p0
.end method

.method public static v(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->W1()Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    aget p0, v1, p0

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    const-string v2, "https://auto.tancdn.com/v1/raw/"

    .line 23
    .line 24
    if-eq p0, v1, :cond_4

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    if-eq p0, v1, :cond_2

    .line 28
    .line 29
    const/4 v1, 0x4

    .line 30
    if-eq p0, v1, :cond_0

    .line 31
    .line 32
    const-string p0, ""

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const-string p0, "https://auto.tancdn.com/v1/raw/b10b7fb0-ff13-47df-a490-c71086bb296310.svga"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_2
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_3

    .line 68
    .line 69
    const-string p0, "https://auto.tancdn.com/v1/raw/0e25409e-210f-4307-8599-91b6b2d5fbd613.svga"

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_4
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_5

    .line 94
    .line 95
    const-string p0, "https://auto.tancdn.com/v1/raw/d6494004-0b4b-4e5d-8088-21bb70dba00711.svga"

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method

.method public static x()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->W1()Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string v0, "https://auto.tancdn.com/v1/raw/dc2dde91-7f17-492e-b083-8be8eb85aae810.svga"

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v2, "https://auto.tancdn.com/v1/raw/"

    .line 27
    .line 28
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    return-object v0
.end method

.method public static y(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->W1()Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    aget p0, v1, p0

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    const-string v2, "https://auto.tancdn.com/v1/raw/"

    .line 23
    .line 24
    if-eq p0, v1, :cond_6

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    if-eq p0, v1, :cond_4

    .line 28
    .line 29
    const/4 v1, 0x4

    .line 30
    if-eq p0, v1, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x5

    .line 33
    if-eq p0, v1, :cond_0

    .line 34
    .line 35
    const-string p0, ""

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    const-string p0, "https://auto.tancdn.com/v1/raw/9fbdde57-4a1d-4524-9898-8e0d46759d0211.svga"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_3

    .line 71
    .line 72
    const-string p0, "https://auto.tancdn.com/v1/raw/f036548c-76ce-411c-be48-bfde95b7c7b412.svga"

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :cond_4
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_5

    .line 97
    .line 98
    const-string p0, "https://auto.tancdn.com/v1/raw/b06d00c5-9fab-401c-bc8b-5b9c292558bf11.svga"

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0

    .line 116
    :cond_6
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_7

    .line 123
    .line 124
    const-string p0, "https://auto.tancdn.com/v1/raw/a40787d7-c5ef-4a6f-a9fd-cae2fc1865b710.svga"

    .line 125
    .line 126
    return-object p0

    .line 127
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0
.end method

.method public static z(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->W1()Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$a;->a:[I

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    aget p0, v1, p0

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    const-string v2, "https://auto.tancdn.com/v1/raw/"

    .line 23
    .line 24
    if-eq p0, v1, :cond_6

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    if-eq p0, v1, :cond_4

    .line 28
    .line 29
    const/4 v1, 0x4

    .line 30
    if-eq p0, v1, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x5

    .line 33
    if-eq p0, v1, :cond_0

    .line 34
    .line 35
    const-string p0, ""

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    const-string p0, "https://auto.tancdn.com/v1/raw/091f058c-fd0b-4267-8f01-5813bdbc4f5710.svga"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_3

    .line 71
    .line 72
    const-string p0, "https://auto.tancdn.com/v1/raw/5596492c-6f96-4bf3-a242-dfebec998f1510.svga"

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :cond_4
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_5

    .line 97
    .line 98
    const-string p0, "https://auto.tancdn.com/v1/raw/b3fc4229-dcf1-4e8b-985e-8cf014102b5c11.svga"

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0

    .line 116
    :cond_6
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_7

    .line 123
    .line 124
    const-string p0, "https://auto.tancdn.com/v1/raw/3b38b93c-11c7-410d-8604-0afde92bc6c611.svga"

    .line 125
    .line 126
    return-object p0

    .line 127
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0
.end method

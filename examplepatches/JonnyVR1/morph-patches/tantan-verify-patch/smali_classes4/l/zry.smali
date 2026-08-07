.class public final Ll/zry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zry$b;,
        Ll/zry$d;,
        Ll/zry$e;,
        Ll/zry$c;,
        Ll/zry$f;,
        Ll/zry$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static a:I = 0x1e

.field public static b:Ljava/text/NumberFormat;

.field public static c:Ljava/text/NumberFormat;

.field public static d:D

.field public static e:D


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/zry;->b:Ljava/text/NumberFormat;

    .line 6
    .line 7
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/zry;->c:Ljava/text/NumberFormat;

    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    sput-wide v0, Ll/zry;->d:D

    .line 16
    .line 17
    sput-wide v0, Ll/zry;->e:D

    .line 18
    .line 19
    return-void
.end method

.method public static A(I)I
    .locals 1

    .line 1
    const/16 v0, 0x12c

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x708

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const v0, 0x28de80

    .line 10
    .line 11
    .line 12
    if-eq p0, v0, :cond_1

    .line 13
    .line 14
    const v0, 0x1e28500

    .line 15
    .line 16
    .line 17
    if-eq p0, v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    return p0

    .line 21
    :cond_0
    const/16 p0, 0xc

    .line 22
    .line 23
    return p0

    .line 24
    :cond_1
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public static B(Landroid/content/Context;Ljava/util/List;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getVipToExpireTimeInMill()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ws()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    const-string v5, "tttVip"

    .line 28
    .line 29
    invoke-static {v5}, Ll/zry;->C(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v8

    .line 33
    const-string v5, "tttSeeWhoLikedMe"

    .line 34
    .line 35
    invoke-static {v5}, Ll/zry;->C(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v11

    .line 39
    const-string v5, "svip"

    .line 40
    .line 41
    invoke-static {v5}, Ll/zry;->C(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object v14

    .line 45
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget-object v5, v5, Ll/ijj;->c:Ll/wyd0;

    .line 50
    .line 51
    const-string v6, ""

    .line 52
    .line 53
    invoke-virtual {v5, v6}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    iget-object v5, v5, Ll/ijj;->d:Ll/wyd0;

    .line 61
    .line 62
    invoke-virtual {v5, v6}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    .line 70
    .line 71
    if-nez v5, :cond_0

    .line 72
    .line 73
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    invoke-virtual {v5}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-eqz v5, :cond_0

    .line 86
    .line 87
    sput-wide v6, Ll/zry;->e:D

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 94
    .line 95
    .line 96
    move-result-object v12

    .line 97
    const/4 v15, 0x1

    .line 98
    const-wide/16 v16, 0x1f4

    .line 99
    .line 100
    move-object/from16 v13, p0

    .line 101
    .line 102
    invoke-interface/range {v12 .. v17}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sm(Landroid/content/Context;Ljava/util/ArrayList;ZJ)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v1, Ll/try;

    .line 107
    .line 108
    invoke-direct {v1}, Ll/try;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_0
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-nez v5, :cond_1

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    invoke-virtual {v5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-nez v5, :cond_1

    .line 138
    .line 139
    sput-wide v6, Ll/zry;->e:D

    .line 140
    .line 141
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 146
    .line 147
    .line 148
    move-result-object v9

    .line 149
    const/4 v12, 0x1

    .line 150
    const-wide/16 v13, 0x1f4

    .line 151
    .line 152
    move-object/from16 v10, p0

    .line 153
    .line 154
    invoke-interface/range {v9 .. v14}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sm(Landroid/content/Context;Ljava/util/ArrayList;ZJ)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    new-instance v2, Ll/ury;

    .line 159
    .line 160
    invoke-direct {v2, v0, v3, v4}, Ll/ury;-><init>(Ljava/util/List;J)V

    .line 161
    .line 162
    .line 163
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_1
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    if-nez v3, :cond_2

    .line 176
    .line 177
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 178
    .line 179
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 180
    .line 181
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-eqz v3, :cond_2

    .line 190
    .line 191
    sput-wide v6, Ll/zry;->d:D

    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 198
    .line 199
    .line 200
    move-result-object v6

    .line 201
    const/4 v9, 0x1

    .line 202
    const-wide/16 v10, 0x1f4

    .line 203
    .line 204
    move-object/from16 v7, p0

    .line 205
    .line 206
    invoke-interface/range {v6 .. v11}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sm(Landroid/content/Context;Ljava/util/ArrayList;ZJ)Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    new-instance v4, Ll/vry;

    .line 211
    .line 212
    invoke-direct {v4, v0, v1, v2}, Ll/vry;-><init>(Ljava/util/List;J)V

    .line 213
    .line 214
    .line 215
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {v3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 220
    .line 221
    .line 222
    :cond_2
    return-void
.end method

.method public static C(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, -0x1

    .line 17
    sparse-switch v2, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_0
    const-string v2, "tttSeeWhoLikedMe"

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v4, 0x2

    .line 31
    goto :goto_0

    .line 32
    :sswitch_1
    const-string v2, "svip"

    .line 33
    .line 34
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v4, 0x1

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string v2, "tttVip"

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move v4, v3

    .line 53
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->U:Lrx/subjects/a;

    .line 62
    .line 63
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    move-object v1, p0

    .line 68
    check-cast v1, Ljava/util/List;

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->T:Lrx/subjects/a;

    .line 76
    .line 77
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    move-object v1, p0

    .line 82
    check-cast v1, Ljava/util/List;

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->S:Lrx/subjects/a;

    .line 90
    .line 91
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    move-object v1, p0

    .line 96
    check-cast v1, Ljava/util/List;

    .line 97
    .line 98
    :goto_1
    if-eqz v1, :cond_3

    .line 99
    .line 100
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_3

    .line 105
    .line 106
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    check-cast p0, Lcom/p1/mobile/putong/data/GPContract;

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/data/GPContract;->iapProductID:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    :cond_3
    return-object v0

    .line 118
    nop

    .line 119
    :sswitch_data_0
    .sparse-switch
        -0x33752677 -> :sswitch_2
        0x360eca -> :sswitch_1
        0x1ace97a6 -> :sswitch_0
    .end sparse-switch

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static D(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {p2}, Ll/zry;->H(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    return v2

    .line 13
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 16
    .line 17
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m4(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    invoke-static {p1, p0}, Ll/zry;->t(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_4

    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/zry;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    const/16 p0, 0xc

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_3
    move p0, v2

    .line 40
    :goto_0
    iget p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 41
    .line 42
    if-ne p1, p0, :cond_4

    .line 43
    .line 44
    return v2

    .line 45
    :cond_4
    return v0
.end method

.method public static E(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Ll/v5b0;->u(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public static F()Z
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 16
    .line 17
    double-to-long v3, v3

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-static {v1, v2, v3, v4, v0}, Ll/tzi0;->h(JJI)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    return v0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    return v0
.end method

.method public static G(Ljava/lang/String;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->T4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->P3()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->skuId:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    const-string v0, "tttSvipGoogleplay"

    .line 41
    .line 42
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-static {}, Ll/zry;->F()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_2

    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :cond_2
    return v1
.end method

.method public static H(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->T4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->P3()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    if-eqz p0, :cond_3

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->skuId:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_3

    .line 66
    .line 67
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_3

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_3

    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    return p0

    .line 81
    :cond_3
    :goto_0
    return v1
.end method

.method public static I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 34

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    const/4 v5, 0x0

    if-nez v3, :cond_0

    return-object v5

    .line 1
    :cond_0
    sget-object v6, Ll/zry;->b:Ljava/text/NumberFormat;

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 2
    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    iget-wide v8, v6, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 3
    sget-object v6, Ll/zry;->b:Ljava/text/NumberFormat;

    invoke-virtual {v6, v8, v9}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    .line 4
    iget-object v10, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    iget-object v10, v10, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    iget-wide v10, v10, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 5
    sget-object v12, Ll/zry;->b:Ljava/text/NumberFormat;

    invoke-virtual {v12, v10, v11}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v12

    .line 6
    sget-object v13, Ll/zry;->b:Ljava/text/NumberFormat;

    iget-object v14, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    iget-wide v14, v14, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 7
    invoke-virtual {v13, v14, v15}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 8
    iget-object v13, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    iget-wide v14, v13, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 9
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    move-object/from16 p2, v5

    .line 10
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v16

    const/16 v17, 0x3

    const-string v7, "tttSeeWhoLikedMe"

    move-wide/from16 v19, v10

    const-string v10, "svip"

    const-string v11, "svipPicksMembership"

    const/16 v21, -0x1

    move-wide/from16 v22, v14

    const-string v14, "tttVip"

    sparse-switch v16, :sswitch_data_0

    :goto_0
    move/from16 v5, v21

    goto :goto_1

    :sswitch_0
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_0

    :cond_1
    move/from16 v5, v17

    goto :goto_1

    :sswitch_1
    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x2

    goto :goto_1

    :sswitch_2
    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_0

    :cond_3
    const/4 v5, 0x1

    goto :goto_1

    :sswitch_3
    invoke-virtual {v5, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    goto :goto_0

    :cond_4
    const/4 v5, 0x0

    :goto_1
    packed-switch v5, :pswitch_data_0

    const-wide/16 v24, 0x0

    const/4 v5, 0x0

    :goto_2
    move-wide/from16 v32, v24

    move-wide/from16 v24, v8

    move-wide/from16 v8, v32

    goto :goto_3

    .line 11
    :pswitch_0
    invoke-static {v3}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    move-result v5

    .line 12
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    move-result-wide v24

    goto :goto_2

    .line 13
    :goto_3
    sget-object v15, Ll/zry;->b:Ljava/text/NumberFormat;

    invoke-virtual {v15, v8, v9}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v15

    move/from16 v26, v5

    .line 14
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    move-wide/from16 v27, v8

    .line 15
    iget v8, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 16
    invoke-static {v1, v3}, Ll/zry;->E(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    move-result v9

    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v29

    const-string v0, "quickchatMembership"

    move/from16 v30, v9

    const-string v9, "tttSvipGoogleplay"

    const/16 v31, 0xc

    sparse-switch v29, :sswitch_data_1

    :goto_4
    move/from16 v17, v21

    goto/16 :goto_5

    :sswitch_4
    const-string v7, "tttPremiumUpgradeToUltra"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_4

    :cond_5
    const/16 v17, 0x18

    goto/16 :goto_5

    :sswitch_5
    const-string v7, "picksMembership"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_4

    :cond_6
    const/16 v17, 0x17

    goto/16 :goto_5

    :sswitch_6
    const-string v7, "tttSeeUpgradeToPremium"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    goto :goto_4

    :cond_7
    const/16 v17, 0x16

    goto/16 :goto_5

    :sswitch_7
    const-string v7, "tttVipUpgradeToPremium"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    goto :goto_4

    :cond_8
    const/16 v17, 0x15

    goto/16 :goto_5

    :sswitch_8
    const-string v7, "tttCompliment"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    goto :goto_4

    :cond_9
    const/16 v17, 0x14

    goto/16 :goto_5

    :sswitch_9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    goto :goto_4

    :cond_a
    const/16 v17, 0x13

    goto/16 :goto_5

    :sswitch_a
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    goto :goto_4

    :cond_b
    const/16 v17, 0x12

    goto/16 :goto_5

    :sswitch_b
    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    goto :goto_4

    :cond_c
    const/16 v17, 0x11

    goto/16 :goto_5

    :sswitch_c
    const-string v7, "tttSuperLike"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    goto :goto_4

    :cond_d
    const/16 v17, 0x10

    goto/16 :goto_5

    :sswitch_d
    const-string v7, "boost"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    goto :goto_4

    :cond_e
    const/16 v17, 0xf

    goto/16 :goto_5

    :sswitch_e
    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    goto/16 :goto_4

    :cond_f
    const/16 v17, 0xe

    goto/16 :goto_5

    :sswitch_f
    const-string v7, "coin"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    goto/16 :goto_4

    :cond_10
    const/16 v17, 0xd

    goto/16 :goto_5

    :sswitch_10
    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    goto/16 :goto_4

    :cond_11
    move/from16 v17, v31

    goto/16 :goto_5

    :sswitch_11
    const-string v7, "superLike"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    goto/16 :goto_4

    :cond_12
    const/16 v17, 0xb

    goto/16 :goto_5

    :sswitch_12
    const-string v7, "tttUltraPremium"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    goto/16 :goto_4

    :cond_13
    const/16 v17, 0xa

    goto/16 :goto_5

    :sswitch_13
    const-string v7, "tttBoost"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    goto/16 :goto_4

    :cond_14
    const/16 v17, 0x9

    goto/16 :goto_5

    :sswitch_14
    const-string v7, "oDiamond"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    goto/16 :goto_4

    :cond_15
    const/16 v17, 0x8

    goto/16 :goto_5

    :sswitch_15
    const-string v7, "tttInstantChat"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    goto/16 :goto_4

    :cond_16
    const/16 v17, 0x7

    goto :goto_5

    :sswitch_16
    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    goto/16 :goto_4

    :cond_17
    const/16 v17, 0x6

    goto :goto_5

    :sswitch_17
    const-string v7, "tttCoin"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    goto/16 :goto_4

    :cond_18
    const/16 v17, 0x5

    goto :goto_5

    :sswitch_18
    const-string v7, "letter"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    goto/16 :goto_4

    :cond_19
    const/16 v17, 0x4

    goto :goto_5

    :sswitch_19
    const-string v7, "tttDiamond"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    goto/16 :goto_4

    :sswitch_1a
    const-string v7, "Promo_premiumUpgradeToUltra"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    goto/16 :goto_4

    :cond_1a
    const/16 v17, 0x2

    goto :goto_5

    :sswitch_1b
    const-string v7, "tttLiveCoin"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    goto/16 :goto_4

    :cond_1b
    const/16 v17, 0x1

    goto :goto_5

    :sswitch_1c
    const-string v7, "noneLiveCoin"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    goto/16 :goto_4

    :cond_1c
    const/16 v17, 0x0

    .line 18
    :cond_1d
    :goto_5
    const-string v1, "%1$s %2$s"

    const-string v7, "%1$s%2$s"

    const-string v10, ""

    packed-switch v17, :pswitch_data_1

    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    move-result-object v0

    const-string v1, " in parseMerchandise method."

    const-string v2, "You should add "

    invoke-static {v2, v0, v1}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p2

    .line 20
    :pswitch_1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->a3:I

    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 21
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->k:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v4

    .line 22
    invoke-virtual {v5, v1, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_6
    move-object/from16 v4, p2

    move-object v12, v4

    move-object v14, v0

    move-object v5, v1

    move-object v9, v10

    move-object v11, v9

    move-wide/from16 v6, v24

    const/4 v15, 0x0

    goto/16 :goto_24

    :pswitch_2
    const/4 v0, 0x1

    if-ne v8, v0, :cond_1e

    .line 23
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->t9:I

    goto :goto_7

    :cond_1e
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->u9:I

    .line 24
    :goto_7
    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 25
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v5, v1, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 26
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v7, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v12, p2

    move-object v14, v0

    move-object v9, v1

    :goto_8
    move-object v5, v4

    move-object v11, v10

    :goto_9
    move-wide/from16 v6, v24

    :goto_a
    const/4 v15, 0x0

    move-object v4, v12

    goto/16 :goto_24

    :pswitch_3
    const/4 v0, 0x1

    if-ne v8, v0, :cond_1f

    .line 27
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->F7:I

    goto :goto_b

    .line 28
    :cond_1f
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->G7:I

    .line 29
    :goto_b
    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 30
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->H7:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v6

    .line 31
    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v12, p2

    move-object v14, v1

    move-object v5, v4

    move-object v9, v10

    move-object v11, v9

    goto :goto_9

    :pswitch_4
    const/4 v0, 0x1

    if-ne v8, v0, :cond_20

    .line 32
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->l:I

    goto :goto_c

    :cond_20
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->m:I

    .line 33
    :goto_c
    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 34
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->k:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v4

    .line 35
    invoke-virtual {v5, v1, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_6

    .line 36
    :pswitch_5
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    if-ne v8, v0, :cond_21

    .line 37
    sget v9, Lcom/p1/mobile/putong/core/pay/R$string;->M1:I

    goto :goto_d

    :cond_21
    sget v9, Lcom/p1/mobile/putong/core/pay/R$string;->N1:I

    :goto_d
    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object v0, v9

    goto :goto_f

    :cond_22
    const/4 v0, 0x1

    if-ne v8, v0, :cond_23

    .line 38
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->t9:I

    goto :goto_e

    :cond_23
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->u9:I

    .line 39
    :goto_e
    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_f
    if-eqz p6, :cond_29

    if-eqz p7, :cond_24

    goto :goto_14

    .line 40
    :cond_24
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    move-result v7

    if-eqz v7, :cond_25

    .line 41
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v6, p2

    const/4 v15, 0x0

    goto :goto_12

    .line 42
    :cond_25
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->aa:I

    if-eqz v26, :cond_26

    move-object v6, v15

    .line 43
    :cond_26
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 44
    invoke-virtual {v5, v1, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 45
    invoke-static {v3, v4, v8}, Ll/zry;->r(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;I)I

    move-result v4

    if-nez v26, :cond_28

    if-eqz v30, :cond_27

    goto :goto_10

    :cond_27
    const/4 v15, 0x0

    goto :goto_11

    :cond_28
    :goto_10
    const/4 v15, 0x1

    .line 46
    :goto_11
    invoke-static {v3, v15}, Ll/zry;->n(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;

    move-result-object v6

    move v15, v4

    .line 47
    :goto_12
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v7

    .line 48
    invoke-virtual {v5, v4, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object v14, v0

    move-object v9, v1

    move-object v5, v4

    move-object v12, v6

    move-object v11, v10

    :goto_13
    move-wide/from16 v6, v24

    move-object/from16 v4, p2

    goto/16 :goto_24

    :cond_29
    :goto_14
    if-eqz v30, :cond_2a

    .line 49
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    move-result-object v1

    iget v7, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 50
    invoke-virtual {v1, v3, v7}, Ll/tab0;->t(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/String;

    move-result-object v1

    .line 51
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v7, v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 52
    const-string v7, "%1$s /%2$s"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_15

    .line 53
    :cond_2a
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 54
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->A6:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v9

    .line 55
    invoke-virtual {v5, v1, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 56
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_15

    .line 57
    :cond_2b
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v9

    .line 58
    invoke-virtual {v5, v1, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 59
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 60
    :goto_15
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    move-result v7

    if-eqz v7, :cond_2d

    if-nez p7, :cond_2d

    .line 61
    sget v7, Lcom/p1/mobile/putong/core/pay/R$string;->f9:I

    if-eqz v26, :cond_2c

    goto :goto_16

    :cond_2c
    move-wide/from16 v27, v19

    .line 62
    :goto_16
    sget v9, Ll/zry;->a:I

    int-to-double v11, v9

    div-double v27, v27, v11

    .line 63
    invoke-static/range {v27 .. v28}, Ll/a9g0;->e(D)Ljava/lang/String;

    move-result-object v9

    filled-new-array {v13, v9}, [Ljava/lang/Object;

    move-result-object v9

    .line 64
    invoke-virtual {v5, v7, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 65
    invoke-static {v3, v4, v8}, Ll/zry;->r(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;I)I

    move-result v7

    .line 66
    invoke-static {v7}, Ll/zry;->v(I)Ljava/lang/String;

    goto :goto_17

    :cond_2d
    move-object v5, v10

    .line 67
    :goto_17
    invoke-static {v3, v4, v8}, Ll/zry;->r(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;I)I

    move-result v4

    if-nez v26, :cond_2f

    if-eqz v30, :cond_2e

    goto :goto_18

    :cond_2e
    const/4 v15, 0x0

    goto :goto_19

    :cond_2f
    :goto_18
    const/4 v15, 0x1

    .line 68
    :goto_19
    invoke-static {v3, v15}, Ll/zry;->n(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;

    move-result-object v7

    move-object v14, v0

    move-object v9, v1

    move v15, v4

    move-object v11, v5

    move-object v5, v6

    move-object v12, v7

    goto/16 :goto_13

    .line 69
    :pswitch_6
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->L5:I

    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {v24 .. v25}, Ll/a9g0;->e(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_6

    .line 71
    :pswitch_7
    invoke-static {v2, v14}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_34

    .line 72
    invoke-static {v2, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_30

    goto :goto_1e

    .line 73
    :cond_30
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 74
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    const/4 v15, 0x0

    move-object/from16 v0, p2

    :goto_1a
    const/4 v4, 0x1

    goto :goto_1b

    .line 75
    :cond_31
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->aa:I

    if-eqz v26, :cond_32

    move-object v6, v15

    .line 76
    :cond_32
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v1

    .line 77
    invoke-virtual {v5, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 78
    invoke-static {v3, v4, v8}, Ll/zry;->r(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;I)I

    move-result v15

    .line 79
    invoke-static {v3}, Ll/zry;->y(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;

    move-result-object v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    goto :goto_1a

    :goto_1b
    if-ne v8, v4, :cond_33

    .line 80
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->t9:I

    goto :goto_1c

    :cond_33
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->u9:I

    .line 81
    :goto_1c
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 82
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v7

    .line 83
    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v12, p2

    move-object v9, v1

    move-object v14, v4

    move-object v11, v10

    move-wide/from16 v6, v24

    :goto_1d
    move-object v4, v0

    goto/16 :goto_24

    .line 84
    :cond_34
    :goto_1e
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    move-result v1

    if-eqz v1, :cond_36

    const/4 v4, 0x1

    if-ne v8, v4, :cond_35

    .line 85
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->M1:I

    goto :goto_1f

    :cond_35
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->N1:I

    :goto_1f
    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 86
    sget v9, Lcom/p1/mobile/putong/core/pay/R$string;->A6:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v11

    .line 87
    invoke-virtual {v5, v9, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto :goto_21

    :cond_36
    const/4 v4, 0x1

    if-ne v8, v4, :cond_37

    .line 88
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->t9:I

    goto :goto_20

    :cond_37
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->u9:I

    .line 89
    :goto_20
    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 90
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    filled-new-array {v13, v12}, [Ljava/lang/Object;

    move-result-object v9

    .line 91
    invoke-virtual {v5, v4, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object v9, v4

    .line 92
    :goto_21
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v7, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 93
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    move-result v6

    if-eqz v6, :cond_39

    .line 94
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 95
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->f9:I

    if-eqz v26, :cond_38

    goto :goto_22

    :cond_38
    move-wide/from16 v27, v19

    .line 96
    :goto_22
    sget v6, Ll/zry;->a:I

    int-to-double v6, v6

    div-double v27, v27, v6

    .line 97
    invoke-static/range {v27 .. v28}, Ll/a9g0;->e(D)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 98
    invoke-virtual {v5, v0, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move/from16 v0, v30

    .line 99
    invoke-static {v3, v0}, Ll/zry;->o(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v12, p2

    move-object v14, v1

    move-object v11, v5

    move-wide/from16 v6, v24

    const/4 v15, 0x0

    move-object v5, v4

    goto :goto_1d

    :cond_39
    move-object/from16 v12, p2

    move-object v14, v1

    goto/16 :goto_8

    .line 100
    :pswitch_8
    filled-new-array {v13, v6}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 101
    invoke-static/range {v19 .. v20}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v4, "%.1f"

    invoke-static {v4, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 102
    const-string v0, "\u6761"

    move-object/from16 v4, p2

    move-object v12, v4

    move-object v14, v0

    move-object v11, v5

    move-object v9, v10

    move-wide/from16 v6, v24

    const/4 v15, 0x0

    move-object v5, v1

    goto :goto_24

    :pswitch_9
    const/4 v0, 0x1

    if-ne v8, v0, :cond_3a

    .line 103
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->t9:I

    goto :goto_23

    :cond_3a
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->u9:I

    .line 104
    :goto_23
    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 105
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ll/zry;->b:Ljava/text/NumberFormat;

    move-wide/from16 v6, v24

    invoke-virtual {v5, v6, v7}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v12, p2

    move-object v14, v1

    move-object v5, v4

    move-object v9, v10

    move-object v11, v9

    goto/16 :goto_a

    :pswitch_a
    move-wide/from16 v6, v24

    const/4 v0, 0x1

    .line 106
    invoke-static {}, Ll/l9n;->e()I

    move-result v4

    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 107
    sget-object v5, Ll/zry;->c:Ljava/text/NumberFormat;

    const/4 v9, 0x2

    invoke-virtual {v5, v9}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 108
    sget-object v5, Ll/zry;->c:Ljava/text/NumberFormat;

    invoke-virtual {v5, v9}, Ljava/text/NumberFormat;->setMinimumFractionDigits(I)V

    .line 109
    sget-object v5, Ll/zry;->c:Ljava/text/NumberFormat;

    invoke-virtual {v5, v6, v7}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v13, v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v5, p2

    move-object v11, v5

    move-object v12, v11

    move-object v9, v1

    move-object v14, v4

    goto/16 :goto_a

    :goto_24
    int-to-double v0, v8

    mul-double v0, v0, v22

    sub-double v17, v0, v6

    div-double v17, v17, v0

    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    mul-double v0, v0, v17

    double-to-int v0, v0

    if-eqz v0, :cond_3c

    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->u()Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 111
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->d9:I

    rsub-int/lit8 v0, v0, 0x64

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v10, p0

    invoke-virtual {v10, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_25
    move-object/from16 v32, v10

    move-object v10, v0

    move-object/from16 v0, v32

    goto :goto_26

    :cond_3b
    move-object/from16 v10, p0

    .line 112
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->c9:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v10, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_25

    :cond_3c
    move-object/from16 v0, p0

    .line 113
    :goto_26
    invoke-static {v3}, Ll/zry;->H(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 114
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e:I

    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    move-result-object v10

    goto :goto_29

    .line 115
    :cond_3d
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m4(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 116
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c4()Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 117
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->P3:I

    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    move-result-object v10

    goto :goto_29

    .line 118
    :cond_3e
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e:I

    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    move-result-object v10

    goto :goto_29

    :cond_3f
    move-object/from16 v1, p1

    .line 119
    invoke-static {v1, v0}, Ll/zry;->t(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    move-result v17

    if-eqz v17, :cond_42

    .line 120
    invoke-static {v1, v0}, Ll/zry;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_40

    move/from16 v1, v31

    goto :goto_27

    :cond_40
    const/4 v1, 0x1

    :goto_27
    if-ne v8, v1, :cond_42

    if-eqz v0, :cond_41

    .line 121
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Q3:I

    goto :goto_28

    .line 122
    :cond_41
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->P3:I

    .line 123
    :goto_28
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    move-result-object v10

    .line 124
    :cond_42
    :goto_29
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 125
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->m(Lcom/p1/mobile/putong/core/data/Merchandise;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 126
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->p(I)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    move-object v1, v14

    .line 127
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 128
    invoke-virtual {v0, v9}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 129
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 130
    invoke-virtual {v0, v11}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 131
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->k(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 132
    invoke-virtual {v0, v12}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 133
    invoke-virtual {v0, v10}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 134
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->o(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    move-object/from16 v1, p2

    .line 135
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->g(Ll/t6c;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 136
    invoke-virtual {v0, v15}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->j(I)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 137
    invoke-virtual {v0, v6, v7}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->n(D)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 138
    invoke-virtual {v0, v13}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 139
    invoke-static/range {v22 .. v23}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    move-result-object v0

    .line 140
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->a()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    move-result-object v0

    return-object v0

    :sswitch_data_0
    .sparse-switch
        -0x33752677 -> :sswitch_3
        -0x59a8242 -> :sswitch_2
        0x360eca -> :sswitch_1
        0x1ace97a6 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :sswitch_data_1
    .sparse-switch
        -0x53a0270b -> :sswitch_1c
        -0x4fc2904f -> :sswitch_1b
        -0x4d8d88e4 -> :sswitch_1a
        -0x47cf6340 -> :sswitch_19
        -0x41eedbda -> :sswitch_18
        -0x3b38355b -> :sswitch_17
        -0x33752677 -> :sswitch_16
        -0x30a2c5bb -> :sswitch_15
        -0x2f7ed21b -> :sswitch_14
        -0x2bdc75f1 -> :sswitch_13
        -0x19ee22e1 -> :sswitch_12
        -0x13daa24e -> :sswitch_11
        -0x59a8242 -> :sswitch_10
        0x2eae91 -> :sswitch_f
        0x360eca -> :sswitch_e
        0x59923a3 -> :sswitch_d
        0x8feae1e -> :sswitch_c
        0xd13ae6b -> :sswitch_b
        0x1ace97a6 -> :sswitch_a
        0x458b6c7b -> :sswitch_9
        0x5e43c13e -> :sswitch_8
        0x62963849 -> :sswitch_7
        0x7003007f -> :sswitch_6
        0x718d81e8 -> :sswitch_5
        0x724158d8 -> :sswitch_4
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_a
        :pswitch_8
        :pswitch_a
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_5
        :pswitch_a
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_7
        :pswitch_2
        :pswitch_7
        :pswitch_1
        :pswitch_9
        :pswitch_9
        :pswitch_5
        :pswitch_9
    .end packed-switch
.end method

.method public static J(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pf(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z4()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    return v0
.end method

.method public static synthetic a(Lcom/google/common/base/Optional;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->T:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/util/List;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/data/GPContract;

    .line 25
    .line 26
    iget v0, p0, Lcom/p1/mobile/putong/data/GPContract;->chargeInterval:I

    .line 27
    .line 28
    invoke-static {v0}, Ll/zry;->w(I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-lez v0, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Ll/ijj;->a:Lrx/subjects/a;

    .line 39
    .line 40
    sget-wide v1, Ll/zry;->e:D

    .line 41
    .line 42
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Ll/ijj;->b:Lrx/subjects/a;

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/data/GPContract;->chargeInterval:I

    .line 56
    .line 57
    invoke-static {v1}, Ll/zry;->u(I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Ll/ijj;->c:Ll/wyd0;

    .line 73
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/data/GPContract;->iapProductID:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    sget-object p0, Ll/ijj;->e:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 90
    .line 91
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_0
    const/4 p0, 0x1

    .line 103
    invoke-static {p0}, Ll/zry;->s(I)V

    .line 104
    .line 105
    .line 106
    :cond_1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic c(Ljava/util/List;JLcom/google/common/base/Optional;)V
    .locals 12

    .line 1
    invoke-virtual {p3}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    invoke-virtual {p3}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    check-cast p3, Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_5

    .line 22
    .line 23
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/data/GPSkuDetails;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreProduct;->U:Lrx/subjects/a;

    .line 34
    .line 35
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/util/List;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/putong/data/GPContract;

    .line 47
    .line 48
    iget v2, v1, Lcom/p1/mobile/putong/data/GPContract;->chargeInterval:I

    .line 49
    .line 50
    invoke-static {v2}, Ll/zry;->w(I)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    const/4 v3, 0x1

    .line 55
    if-lez v2, :cond_4

    .line 56
    .line 57
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 62
    .line 63
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    :cond_1
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-eqz v5, :cond_2

    .line 72
    .line 73
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 78
    .line 79
    iget v6, v5, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 80
    .line 81
    iget v7, v1, Lcom/p1/mobile/putong/data/GPContract;->chargeInterval:I

    .line 82
    .line 83
    invoke-static {v7}, Ll/zry;->A(I)I

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    if-ne v6, v7, :cond_1

    .line 88
    .line 89
    move-object v3, v5

    .line 90
    goto :goto_1

    .line 91
    :cond_2
    long-to-double v4, p1

    .line 92
    const-wide v6, 0x408f400000000000L    # 1000.0

    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    div-double/2addr v4, v6

    .line 98
    int-to-double v6, v2

    .line 99
    div-double/2addr v4, v6

    .line 100
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 101
    .line 102
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 103
    .line 104
    iget-wide v6, v2, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 105
    .line 106
    iget-wide v8, v0, Lcom/p1/mobile/putong/data/GPSkuDetails;->priceAmountMicros:J

    .line 107
    .line 108
    const-wide/32 v10, 0xf4240

    .line 109
    .line 110
    .line 111
    div-long/2addr v8, v10

    .line 112
    long-to-double v8, v8

    .line 113
    sub-double/2addr v6, v8

    .line 114
    mul-double/2addr v4, v6

    .line 115
    sput-wide v4, Ll/zry;->e:D

    .line 116
    .line 117
    sget-wide v8, Ll/zry;->d:D

    .line 118
    .line 119
    const-wide/16 v10, 0x0

    .line 120
    .line 121
    cmpl-double v0, v8, v10

    .line 122
    .line 123
    if-ltz v0, :cond_0

    .line 124
    .line 125
    cmpl-double v0, v4, v8

    .line 126
    .line 127
    if-lez v0, :cond_0

    .line 128
    .line 129
    cmpl-double v0, v4, v6

    .line 130
    .line 131
    if-lez v0, :cond_3

    .line 132
    .line 133
    sput-wide v6, Ll/zry;->e:D

    .line 134
    .line 135
    :cond_3
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v0, v0, Ll/ijj;->a:Lrx/subjects/a;

    .line 140
    .line 141
    sget-wide v4, Ll/zry;->e:D

    .line 142
    .line 143
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iget-object v0, v0, Ll/ijj;->b:Lrx/subjects/a;

    .line 155
    .line 156
    iget v2, v1, Lcom/p1/mobile/putong/data/GPContract;->chargeInterval:I

    .line 157
    .line 158
    invoke-static {v2}, Ll/zry;->u(I)I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget-object v0, v0, Ll/ijj;->c:Ll/wyd0;

    .line 174
    .line 175
    new-instance v2, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    iget-object v1, v1, Lcom/p1/mobile/putong/data/GPContract;->iapProductID:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    sget-object v1, Ll/ijj;->e:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 191
    .line 192
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iget-object v0, v0, Ll/ijj;->d:Ll/wyd0;

    .line 207
    .line 208
    iget-object v1, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 209
    .line 210
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 211
    .line 212
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :cond_4
    invoke-static {v3}, Ll/zry;->s(I)V

    .line 220
    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :cond_5
    return-void
.end method

.method public static synthetic d(Ljava/util/List;JLcom/google/common/base/Optional;)V
    .locals 12

    .line 1
    invoke-virtual {p3}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    invoke-virtual {p3}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    check-cast p3, Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_5

    .line 22
    .line 23
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/data/GPSkuDetails;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreProduct;->S:Lrx/subjects/a;

    .line 34
    .line 35
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/util/List;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/putong/data/GPContract;

    .line 47
    .line 48
    iget v2, v1, Lcom/p1/mobile/putong/data/GPContract;->chargeInterval:I

    .line 49
    .line 50
    invoke-static {v2}, Ll/zry;->w(I)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    const/4 v3, 0x1

    .line 55
    if-lez v2, :cond_4

    .line 56
    .line 57
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 62
    .line 63
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    :cond_1
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-eqz v5, :cond_2

    .line 72
    .line 73
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 78
    .line 79
    iget v6, v5, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 80
    .line 81
    iget v7, v1, Lcom/p1/mobile/putong/data/GPContract;->chargeInterval:I

    .line 82
    .line 83
    invoke-static {v7}, Ll/zry;->A(I)I

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    if-ne v6, v7, :cond_1

    .line 88
    .line 89
    move-object v3, v5

    .line 90
    goto :goto_1

    .line 91
    :cond_2
    long-to-double v4, p1

    .line 92
    const-wide v6, 0x408f400000000000L    # 1000.0

    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    div-double/2addr v4, v6

    .line 98
    int-to-double v6, v2

    .line 99
    div-double/2addr v4, v6

    .line 100
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 101
    .line 102
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 103
    .line 104
    iget-wide v6, v2, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 105
    .line 106
    iget-wide v8, v0, Lcom/p1/mobile/putong/data/GPSkuDetails;->priceAmountMicros:J

    .line 107
    .line 108
    const-wide/32 v10, 0xf4240

    .line 109
    .line 110
    .line 111
    div-long/2addr v8, v10

    .line 112
    long-to-double v8, v8

    .line 113
    sub-double/2addr v6, v8

    .line 114
    mul-double/2addr v4, v6

    .line 115
    sput-wide v4, Ll/zry;->d:D

    .line 116
    .line 117
    sget-wide v8, Ll/zry;->e:D

    .line 118
    .line 119
    const-wide/16 v10, 0x0

    .line 120
    .line 121
    cmpl-double v0, v8, v10

    .line 122
    .line 123
    if-ltz v0, :cond_0

    .line 124
    .line 125
    cmpl-double v0, v4, v8

    .line 126
    .line 127
    if-lez v0, :cond_0

    .line 128
    .line 129
    cmpl-double v0, v4, v6

    .line 130
    .line 131
    if-lez v0, :cond_3

    .line 132
    .line 133
    sput-wide v6, Ll/zry;->d:D

    .line 134
    .line 135
    :cond_3
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v0, v0, Ll/ijj;->a:Lrx/subjects/a;

    .line 140
    .line 141
    sget-wide v4, Ll/zry;->d:D

    .line 142
    .line 143
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iget-object v0, v0, Ll/ijj;->b:Lrx/subjects/a;

    .line 155
    .line 156
    iget v2, v1, Lcom/p1/mobile/putong/data/GPContract;->chargeInterval:I

    .line 157
    .line 158
    invoke-static {v2}, Ll/zry;->u(I)I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget-object v0, v0, Ll/ijj;->c:Ll/wyd0;

    .line 174
    .line 175
    new-instance v2, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    iget-object v1, v1, Lcom/p1/mobile/putong/data/GPContract;->iapProductID:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    sget-object v1, Ll/ijj;->e:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 191
    .line 192
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iget-object v0, v0, Ll/ijj;->d:Ll/wyd0;

    .line 207
    .line 208
    iget-object v1, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 209
    .line 210
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 211
    .line 212
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :cond_4
    invoke-static {v3}, Ll/zry;->s(I)V

    .line 220
    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :cond_5
    return-void
.end method

.method public static bridge synthetic e()Ljava/text/NumberFormat;
    .locals 1

    .line 1
    sget-object v0, Ll/zry;->b:Ljava/text/NumberFormat;

    return-object v0
.end method

.method public static bridge synthetic f(Ljava/util/List;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zry;->p(Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic g(Ljava/util/List;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zry;->q(Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zry;->t(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic i(Landroid/content/Context;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zry;->B(Landroid/content/Context;Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic j(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zry;->C(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic k(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zry;->D(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zry;->H(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zry;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static n(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 6
    .line 7
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    sub-double/2addr v0, p0

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 26
    .line 27
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 28
    .line 29
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 30
    .line 31
    sub-double/2addr v0, p0

    .line 32
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 33
    .line 34
    .line 35
    move-result-wide p0

    .line 36
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static o(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 12
    .line 13
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 14
    .line 15
    div-double/2addr v2, p0

    .line 16
    mul-double/2addr v2, v0

    .line 17
    const/4 p0, 0x1

    .line 18
    invoke-static {v2, v3, p0}, Ll/q8g0;->F(DI)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 26
    .line 27
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 28
    .line 29
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 30
    .line 31
    div-double/2addr v2, p0

    .line 32
    mul-double/2addr v2, v0

    .line 33
    invoke-static {v2, v3}, Ll/q8g0;->H(D)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static p(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    const-string v1, "svipPicksMembership"

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "lowPriceSVIPPicks"

    .line 38
    .line 39
    invoke-static {v0, v1, v2}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    :cond_1
    const-string v1, "svip"

    .line 46
    .line 47
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v2, "lowPriceCustomerUpliftSVIP"

    .line 52
    .line 53
    invoke-static {v0, v1, v2}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    :cond_2
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_3
    const/4 p0, 0x0

    .line 62
    return p0
.end method

.method public static q(Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    invoke-static {v0}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static r(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;I)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {p0}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 19
    .line 20
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 21
    .line 22
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 27
    .line 28
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v3, Ll/wry;

    .line 33
    .line 34
    invoke-direct {v3}, Ll/wry;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p0, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 56
    .line 57
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_3

    .line 65
    .line 66
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 69
    .line 70
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    const-wide/16 p0, 0x0

    .line 74
    .line 75
    :goto_1
    int-to-double v3, p2

    .line 76
    mul-double/2addr p0, v3

    .line 77
    sub-double v0, p0, v1

    .line 78
    .line 79
    div-double/2addr v0, p0

    .line 80
    const-wide/high16 p0, 0x4059000000000000L    # 100.0

    .line 81
    .line 82
    mul-double/2addr v0, p0

    .line 83
    double-to-int p0, v0

    .line 84
    return p0
.end method

.method public static s(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/ijj;->b:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-static {p0}, Ll/zry;->u(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static t(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pf(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 31
    .line 32
    if-ne p0, p1, :cond_1

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 45
    .line 46
    if-ne p0, p1, :cond_3

    .line 47
    .line 48
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_3

    .line 57
    .line 58
    :cond_2
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_3
    return v0
.end method

.method public static u(I)I
    .locals 8

    .line 1
    invoke-static {}, Ll/t7a;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x2

    .line 7
    const/4 v3, 0x1

    .line 8
    const v4, 0x1e28500

    .line 9
    .line 10
    .line 11
    const v5, 0x28de80

    .line 12
    .line 13
    .line 14
    const/16 v6, 0x708

    .line 15
    .line 16
    const/16 v7, 0x12c

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    if-eq p0, v7, :cond_1

    .line 21
    .line 22
    if-eq p0, v6, :cond_0

    .line 23
    .line 24
    if-eq p0, v5, :cond_1

    .line 25
    .line 26
    if-eq p0, v4, :cond_0

    .line 27
    .line 28
    return v3

    .line 29
    :cond_0
    return v2

    .line 30
    :cond_1
    return v1

    .line 31
    :cond_2
    if-eq p0, v7, :cond_4

    .line 32
    .line 33
    if-eq p0, v6, :cond_3

    .line 34
    .line 35
    if-eq p0, v5, :cond_4

    .line 36
    .line 37
    if-eq p0, v4, :cond_3

    .line 38
    .line 39
    return v3

    .line 40
    :cond_3
    return v1

    .line 41
    :cond_4
    return v2
.end method

.method public static v(I)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 6
    .line 7
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->H0:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, "%"

    .line 22
    .line 23
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static w(I)I
    .locals 1

    .line 1
    const/16 v0, 0x12c

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x258

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x708

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const v0, 0x28de80

    .line 14
    .line 15
    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    const v0, 0x7a9b80

    .line 19
    .line 20
    .line 21
    if-eq p0, v0, :cond_0

    .line 22
    .line 23
    const v0, 0x1e28500

    .line 24
    .line 25
    .line 26
    if-eq p0, v0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_0
    return v0
.end method

.method public static x()Ll/jzl;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/zry$f;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/zry$f;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance v0, Ll/zry$a;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/zry$a;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static y(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 8
    .line 9
    div-double/2addr v0, v2

    .line 10
    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    .line 11
    .line 12
    mul-double/2addr v0, v2

    .line 13
    const/4 p0, 0x1

    .line 14
    invoke-static {v0, v1, p0}, Ll/q8g0;->F(DI)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "svip"

    .line 10
    .line 11
    sparse-switch v1, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_4

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "picksMembership"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_5

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :sswitch_1
    const-string v1, "tttCompliment"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_5

    .line 33
    .line 34
    goto/16 :goto_3

    .line 35
    .line 36
    :sswitch_2
    const-string v1, "quickchatMembership"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_5

    .line 43
    .line 44
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p0}, Ll/tab0;->d(Lcom/p1/mobile/putong/core/data/ProductCategory;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_0

    .line 53
    .line 54
    new-instance p0, Ll/zry$e;

    .line 55
    .line 56
    invoke-direct {p0}, Ll/zry$e;-><init>()V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_0
    new-instance p0, Ll/zry$d;

    .line 61
    .line 62
    invoke-direct {p0}, Ll/zry$d;-><init>()V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :sswitch_3
    const-string p0, "tttSeeWhoLikedMe"

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_5

    .line 73
    .line 74
    invoke-static {}, Ll/zry;->x()Ll/jzl;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :sswitch_4
    const-string p0, "tttSvipGoogleplay"

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_5

    .line 86
    .line 87
    goto/16 :goto_2

    .line 88
    .line 89
    :sswitch_5
    const-string v1, "tttSuperLike"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    goto/16 :goto_3

    .line 98
    .line 99
    :sswitch_6
    const-string p0, "picks"

    .line 100
    .line 101
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    goto/16 :goto_4

    .line 106
    .line 107
    :sswitch_7
    const-string v1, "boost"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_5

    .line 114
    .line 115
    goto/16 :goto_3

    .line 116
    .line 117
    :sswitch_8
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_5

    .line 122
    .line 123
    goto/16 :goto_3

    .line 124
    .line 125
    :sswitch_9
    const-string v1, "coin"

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_5

    .line 132
    .line 133
    goto/16 :goto_3

    .line 134
    .line 135
    :sswitch_a
    const-string p0, "svipPicksMembership"

    .line 136
    .line 137
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-eqz p0, :cond_5

    .line 142
    .line 143
    :goto_1
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0}, Ll/tab0;->z()Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_1

    .line 152
    .line 153
    new-instance p0, Ll/zry$b;

    .line 154
    .line 155
    invoke-direct {p0}, Ll/zry$b;-><init>()V

    .line 156
    .line 157
    .line 158
    return-object p0

    .line 159
    :cond_1
    new-instance p0, Ll/zry$d;

    .line 160
    .line 161
    invoke-direct {p0}, Ll/zry$d;-><init>()V

    .line 162
    .line 163
    .line 164
    return-object p0

    .line 165
    :sswitch_b
    const-string v1, "superLike"

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_5

    .line 172
    .line 173
    goto :goto_3

    .line 174
    :sswitch_c
    const-string p0, "tttUltraPremium"

    .line 175
    .line 176
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    if-eqz p0, :cond_5

    .line 181
    .line 182
    invoke-static {}, Ll/zry;->x()Ll/jzl;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    return-object p0

    .line 187
    :sswitch_d
    const-string v1, "tttBoost"

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_5

    .line 194
    .line 195
    goto :goto_3

    .line 196
    :sswitch_e
    const-string p0, "tttVip"

    .line 197
    .line 198
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    if-eqz p0, :cond_5

    .line 203
    .line 204
    :goto_2
    invoke-static {}, Ll/zry;->x()Ll/jzl;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    return-object p0

    .line 209
    :sswitch_f
    const-string v1, "tttCoin"

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-eqz v0, :cond_5

    .line 216
    .line 217
    goto :goto_3

    .line 218
    :sswitch_10
    const-string p0, "letter"

    .line 219
    .line 220
    goto :goto_0

    .line 221
    :sswitch_11
    const-string v1, "tttDiamond"

    .line 222
    .line 223
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-eqz v0, :cond_5

    .line 228
    .line 229
    goto :goto_3

    .line 230
    :sswitch_12
    const-string v1, "tttLiveCoin"

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    if-eqz v0, :cond_5

    .line 237
    .line 238
    goto :goto_3

    .line 239
    :sswitch_13
    const-string v1, "noneLiveCoin"

    .line 240
    .line 241
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-eqz v0, :cond_5

    .line 246
    .line 247
    goto :goto_3

    .line 248
    :sswitch_14
    const-string v1, "intlReadMessage"

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-eqz v0, :cond_5

    .line 255
    .line 256
    :goto_3
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v0}, Ll/tab0;->z()Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-eqz v0, :cond_2

    .line 265
    .line 266
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-eqz v0, :cond_2

    .line 271
    .line 272
    new-instance p0, Ll/zry$b;

    .line 273
    .line 274
    invoke-direct {p0}, Ll/zry$b;-><init>()V

    .line 275
    .line 276
    .line 277
    return-object p0

    .line 278
    :cond_2
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-virtual {v0, p0}, Ll/tab0;->d(Lcom/p1/mobile/putong/core/data/ProductCategory;)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-eqz v0, :cond_3

    .line 287
    .line 288
    new-instance p0, Ll/zry$e;

    .line 289
    .line 290
    invoke-direct {p0}, Ll/zry$e;-><init>()V

    .line 291
    .line 292
    .line 293
    return-object p0

    .line 294
    :cond_3
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz v0, :cond_4

    .line 299
    .line 300
    invoke-static {}, Ll/zry;->x()Ll/jzl;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    return-object p0

    .line 305
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    if-eqz v0, :cond_5

    .line 318
    .line 319
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 320
    .line 321
    .line 322
    move-result p0

    .line 323
    if-eqz p0, :cond_5

    .line 324
    .line 325
    new-instance p0, Ll/zry$d;

    .line 326
    .line 327
    invoke-direct {p0}, Ll/zry$d;-><init>()V

    .line 328
    .line 329
    .line 330
    return-object p0

    .line 331
    :sswitch_15
    const-string p0, "quickchatNumber"

    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :cond_5
    :goto_4
    new-instance p0, Ll/zry$c;

    .line 336
    .line 337
    invoke-direct {p0}, Ll/zry$c;-><init>()V

    .line 338
    .line 339
    .line 340
    return-object p0

    .line 341
    :sswitch_data_0
    .sparse-switch
        -0x7e2b2592 -> :sswitch_15
        -0x5522010c -> :sswitch_14
        -0x53a0270b -> :sswitch_13
        -0x4fc2904f -> :sswitch_12
        -0x47cf6340 -> :sswitch_11
        -0x41eedbda -> :sswitch_10
        -0x3b38355b -> :sswitch_f
        -0x33752677 -> :sswitch_e
        -0x2bdc75f1 -> :sswitch_d
        -0x19ee22e1 -> :sswitch_c
        -0x13daa24e -> :sswitch_b
        -0x59a8242 -> :sswitch_a
        0x2eae91 -> :sswitch_9
        0x360eca -> :sswitch_8
        0x59923a3 -> :sswitch_7
        0x65b8472 -> :sswitch_6
        0x8feae1e -> :sswitch_5
        0xd13ae6b -> :sswitch_4
        0x1ace97a6 -> :sswitch_3
        0x458b6c7b -> :sswitch_2
        0x5e43c13e -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch
.end method

.class public final Ll/gry;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hzl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/hzl<",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\'\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001f\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J!\u0010\u0014\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Ll/gry;",
        "Ll/hzl;",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "type",
        "detail",
        "",
        "d",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V",
        "",
        "percentage",
        "",
        "c",
        "(Landroid/content/Context;I)Ljava/lang/String;",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandise",
        "b",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
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


# virtual methods
.method public bridge synthetic a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/gry;->d(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const v1, -0x33752677    # -7.2797256E7f

    .line 12
    .line 13
    .line 14
    if-eq v0, v1, :cond_2

    .line 15
    .line 16
    const v1, 0x65b8472

    .line 17
    .line 18
    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    const v1, 0x1ace97a6

    .line 22
    .line 23
    .line 24
    if-eq v0, v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string v0, "tttSeeWhoLikedMe"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_4

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-string v0, "picks"

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_6

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const-string v0, "tttVip"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_4

    .line 52
    .line 53
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->j9:I

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_6

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->k9:I

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_4
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_6

    .line 92
    .line 93
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_5

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->k9:I

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :cond_5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_6

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->j9:I

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0

    .line 127
    :cond_6
    const/4 p0, 0x0

    .line 128
    return-object p0
.end method

.method public final c(Landroid/content/Context;I)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->H0:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p2, "%"

    .line 29
    .line 30
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 v0, 0x1

    .line 42
    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p0, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public d(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 14
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/ui/purchase/d$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->F()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E()Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->G()Z

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    const/4 v7, 0x0

    .line 40
    sparse-switch v6, :sswitch_data_0

    .line 41
    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :sswitch_0
    const-string v6, "picksMembership"

    .line 46
    .line 47
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_1

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :sswitch_1
    const-string v6, "undoMembership"

    .line 56
    .line 57
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-nez v2, :cond_1

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_2
    const-string v6, "roaming"

    .line 66
    .line 67
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :sswitch_3
    const-string v6, "quickchatMembership"

    .line 75
    .line 76
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-nez v2, :cond_0

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :sswitch_4
    const-string v6, "svip"

    .line 84
    .line 85
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-nez v2, :cond_1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :sswitch_5
    const-string v6, "svipPicksMembership"

    .line 93
    .line 94
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-nez v2, :cond_1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_6
    const-string v6, "unlimitedSwipes"

    .line 102
    .line 103
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-nez v2, :cond_1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_7
    const-string v6, "tttVip"

    .line 111
    .line 112
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-nez v2, :cond_0

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_2

    .line 124
    .line 125
    if-nez v4, :cond_2

    .line 126
    .line 127
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    invoke-virtual {p0, p1, v2}, Ll/gry;->c(Landroid/content/Context;I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    goto :goto_1

    .line 136
    :sswitch_8
    const-string v6, "superLikeMembership"

    .line 137
    .line 138
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-nez v2, :cond_1

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_1
    if-nez v3, :cond_2

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-eqz v2, :cond_2

    .line 152
    .line 153
    if-nez v4, :cond_2

    .line 154
    .line 155
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p()I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    invoke-virtual {p0, p1, v2}, Ll/gry;->c(Landroid/content/Context;I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    goto :goto_1

    .line 164
    :cond_2
    :goto_0
    move-object v2, v7

    .line 165
    :goto_1
    invoke-static/range {p2 .. p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    const-string v8, ""

    .line 170
    .line 171
    const-string v9, "\u8fde\u7eed\u5305\u6708"

    .line 172
    .line 173
    const-string v10, "\u5468\u4f1a\u5458"

    .line 174
    .line 175
    const-string v11, "\u8fde\u7eed\u5305\u5b63"

    .line 176
    .line 177
    const-string v12, "\u4eba\u6c14\u4e4b\u9009"

    .line 178
    .line 179
    const-string v13, "\u8fde\u7eed\u5305\u5e74"

    .line 180
    .line 181
    if-eqz v6, :cond_9

    .line 182
    .line 183
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_7

    .line 188
    .line 189
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    if-eqz p0, :cond_3

    .line 194
    .line 195
    move-object v7, v13

    .line 196
    goto :goto_2

    .line 197
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 198
    .line 199
    .line 200
    move-result p0

    .line 201
    if-eqz p0, :cond_4

    .line 202
    .line 203
    move-object v7, v12

    .line 204
    goto :goto_2

    .line 205
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    if-eqz p0, :cond_5

    .line 210
    .line 211
    move-object v7, v11

    .line 212
    goto :goto_2

    .line 213
    :cond_5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    if-eqz p0, :cond_6

    .line 218
    .line 219
    move-object v7, v10

    .line 220
    goto :goto_2

    .line 221
    :cond_6
    move-object v7, v9

    .line 222
    goto :goto_2

    .line 223
    :cond_7
    move-object v7, v8

    .line 224
    :cond_8
    :goto_2
    move-object/from16 p0, p3

    .line 225
    .line 226
    goto/16 :goto_6

    .line 227
    .line 228
    :cond_9
    invoke-static/range {p2 .. p2}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 229
    .line 230
    .line 231
    move-result v6

    .line 232
    if-nez v6, :cond_15

    .line 233
    .line 234
    invoke-static/range {p2 .. p2}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 235
    .line 236
    .line 237
    move-result v6

    .line 238
    if-eqz v6, :cond_a

    .line 239
    .line 240
    goto/16 :goto_4

    .line 241
    .line 242
    :cond_a
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 243
    .line 244
    .line 245
    move-result v6

    .line 246
    if-eqz v6, :cond_10

    .line 247
    .line 248
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 249
    .line 250
    .line 251
    move-result v6

    .line 252
    if-eqz v6, :cond_10

    .line 253
    .line 254
    if-eqz v5, :cond_b

    .line 255
    .line 256
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    iget v0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 261
    .line 262
    invoke-virtual {p0, v1, v0}, Ll/tab0;->s(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v7

    .line 266
    goto :goto_2

    .line 267
    :cond_b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    if-eqz p0, :cond_c

    .line 272
    .line 273
    move-object/from16 p0, p3

    .line 274
    .line 275
    move-object v7, v13

    .line 276
    goto/16 :goto_6

    .line 277
    .line 278
    :cond_c
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 279
    .line 280
    .line 281
    move-result p0

    .line 282
    if-eqz p0, :cond_d

    .line 283
    .line 284
    move-object/from16 p0, p3

    .line 285
    .line 286
    move-object v7, v12

    .line 287
    goto/16 :goto_6

    .line 288
    .line 289
    :cond_d
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    if-eqz p0, :cond_e

    .line 294
    .line 295
    move-object/from16 p0, p3

    .line 296
    .line 297
    move-object v7, v11

    .line 298
    goto/16 :goto_6

    .line 299
    .line 300
    :cond_e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 301
    .line 302
    .line 303
    move-result p0

    .line 304
    if-eqz p0, :cond_f

    .line 305
    .line 306
    move-object/from16 p0, p3

    .line 307
    .line 308
    move-object v7, v10

    .line 309
    goto/16 :goto_6

    .line 310
    .line 311
    :cond_f
    move-object/from16 p0, p3

    .line 312
    .line 313
    move-object v7, v9

    .line 314
    goto :goto_6

    .line 315
    :cond_10
    if-eqz v4, :cond_11

    .line 316
    .line 317
    if-eqz v5, :cond_8

    .line 318
    .line 319
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    iget v0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 324
    .line 325
    invoke-virtual {p0, v1, v0}, Ll/tab0;->s(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    goto :goto_2

    .line 330
    :cond_11
    if-eqz v3, :cond_13

    .line 331
    .line 332
    invoke-static/range {p2 .. p2}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 333
    .line 334
    .line 335
    move-result v4

    .line 336
    if-eqz v4, :cond_12

    .line 337
    .line 338
    goto :goto_3

    .line 339
    :cond_12
    invoke-virtual {p0, p1, v1}, Ll/gry;->b(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v7

    .line 343
    goto :goto_2

    .line 344
    :cond_13
    :goto_3
    iget p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 345
    .line 346
    const/4 v0, 0x1

    .line 347
    if-eq p0, v0, :cond_14

    .line 348
    .line 349
    move-object/from16 p0, p3

    .line 350
    .line 351
    move-object v7, v2

    .line 352
    goto :goto_6

    .line 353
    :cond_14
    if-eqz v3, :cond_8

    .line 354
    .line 355
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 356
    .line 357
    .line 358
    move-result p0

    .line 359
    if-eqz p0, :cond_8

    .line 360
    .line 361
    const-string p0, "lowPriceFirstMonth"

    .line 362
    .line 363
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 364
    .line 365
    .line 366
    move-result p0

    .line 367
    if-eqz p0, :cond_8

    .line 368
    .line 369
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 370
    .line 371
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->A:I

    .line 372
    .line 373
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v7

    .line 385
    goto/16 :goto_2

    .line 386
    .line 387
    :cond_15
    :goto_4
    iget p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 388
    .line 389
    const/16 v0, 0xa

    .line 390
    .line 391
    if-ne p0, v0, :cond_16

    .line 392
    .line 393
    const-string p0, "\u8d85\u503c\u4f18\u60e0"

    .line 394
    .line 395
    :goto_5
    move-object v7, p0

    .line 396
    goto/16 :goto_2

    .line 397
    .line 398
    :cond_16
    const/4 v0, 0x5

    .line 399
    if-ne p0, v0, :cond_7

    .line 400
    .line 401
    const-string p0, "\u70ed\u95e8"

    .line 402
    .line 403
    goto :goto_5

    .line 404
    :goto_6
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->e0(Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    return-void

    .line 408
    nop

    .line 409
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_8
        -0x33752677 -> :sswitch_7
        -0x199fff46 -> :sswitch_6
        -0x59a8242 -> :sswitch_5
        0x360eca -> :sswitch_4
        0x458b6c7b -> :sswitch_3
        0x517a5c19 -> :sswitch_2
        0x6e276fda -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch
.end method

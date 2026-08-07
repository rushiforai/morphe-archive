.class public final Ll/bum0;
.super Ll/sp2;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u001a\u0010\u000e\u001a\u00020\t8\u0010X\u0090D\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/bum0;",
        "Ll/sp2;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "x0",
        "()V",
        "",
        "j",
        "Ljava/lang/String;",
        "A0",
        "()Ljava/lang/String;",
        "TAG",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final j:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "voiceBuzz"

    .line 5
    .line 6
    invoke-direct {p0, v0, p1}, Ll/sp2;-><init>(Ljava/lang/String;Ll/ner;)V

    .line 7
    .line 8
    .line 9
    const-string p1, "VoiceBuzzCallPresenter"

    .line 10
    .line 11
    iput-object p1, p0, Ll/bum0;->j:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public A0()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bum0;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public x0()V
    .locals 9

    .line 1
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget v2, v1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 14
    .line 15
    const/4 v3, -0x1

    .line 16
    if-ne v2, v3, :cond_0

    .line 17
    .line 18
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/bum0;->A0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "delayVoiceBonus, no need bonus "

    .line 25
    .line 26
    invoke-virtual {v0, p0, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/haw;->B0()Ll/eqx;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v2, Ll/f8w;->INSTANCE:Ll/f8w;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/eqx;->b()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Ll/f8w;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "bonus_unknown"

    .line 49
    .line 50
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-nez v3, :cond_1

    .line 55
    .line 56
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/bum0;->A0()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance v1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v3, "delayVoiceBonus, buzzBonusStatus "

    .line 65
    .line 66
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v2, " "

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, p0, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 88
    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget v1, v1, Lcom/p1/mobile/putong/core/data/BonusThreshold;->voiceBuzz:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    const/16 v1, 0x4b

    .line 95
    .line 96
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 97
    .line 98
    .line 99
    move-result-wide v2

    .line 100
    invoke-virtual {v0}, Ll/eqx;->j()J

    .line 101
    .line 102
    .line 103
    move-result-wide v4

    .line 104
    sub-long/2addr v2, v4

    .line 105
    int-to-long v0, v1

    .line 106
    const-wide/16 v4, 0x3e8

    .line 107
    .line 108
    mul-long/2addr v0, v4

    .line 109
    sub-long/2addr v0, v2

    .line 110
    const-wide/16 v2, 0x3a98

    .line 111
    .line 112
    sub-long v2, v0, v2

    .line 113
    .line 114
    sget-object v4, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/bum0;->A0()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    new-instance v6, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v7, "delayVoiceBonus, time "

    .line 123
    .line 124
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v7, " delayTime "

    .line 131
    .line 132
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v7, " tipTime "

    .line 139
    .line 140
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    invoke-virtual {v4, v5, v6}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    const-wide/16 v4, 0x0

    .line 154
    .line 155
    cmp-long v6, v2, v4

    .line 156
    .line 157
    if-gtz v6, :cond_3

    .line 158
    .line 159
    const-wide/16 v7, 0x1388

    .line 160
    .line 161
    cmp-long v7, v0, v7

    .line 162
    .line 163
    if-lez v7, :cond_3

    .line 164
    .line 165
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 166
    .line 167
    check-cast v2, Ll/up2;

    .line 168
    .line 169
    if-eqz v2, :cond_4

    .line 170
    .line 171
    invoke-virtual {v2}, Ll/up2;->x()V

    .line 172
    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_3
    if-lez v6, :cond_4

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    invoke-virtual {p0}, Ll/sp2;->z0()Ljava/lang/Runnable;

    .line 182
    .line 183
    .line 184
    move-result-object v7

    .line 185
    invoke-static {v6, v7, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 186
    .line 187
    .line 188
    :cond_4
    :goto_1
    cmp-long v2, v0, v4

    .line 189
    .line 190
    if-gtz v2, :cond_5

    .line 191
    .line 192
    invoke-virtual {p0}, Ll/sp2;->D0()V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    invoke-virtual {p0}, Ll/sp2;->y0()Ljava/lang/Runnable;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-static {v2, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

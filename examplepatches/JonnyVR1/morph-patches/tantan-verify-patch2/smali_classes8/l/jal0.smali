.class public final Ll/jal0;
.super Ll/sp2;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u001a\u0010\u000e\u001a\u00020\t8\u0010X\u0090D\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/jal0;",
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
    const-string v0, "videoBuzz"

    .line 5
    .line 6
    invoke-direct {p0, v0, p1}, Ll/sp2;-><init>(Ljava/lang/String;Ll/ner;)V

    .line 7
    .line 8
    .line 9
    const-string p1, "VideoBuzzCallPresenter"

    .line 10
    .line 11
    iput-object p1, p0, Ll/jal0;->j:Ljava/lang/String;

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
    iget-object p0, p0, Ll/jal0;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public x0()V
    .locals 10

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
    iget v2, v1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

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
    invoke-virtual {p0}, Ll/jal0;->A0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "delayVideoBonus, no need bonus "

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
    move-result-object v0

    .line 44
    invoke-virtual {v2, v0}, Ll/f8w;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v2, "bonus_unknown"

    .line 49
    .line 50
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    const-string v3, " "

    .line 55
    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    sget-object v1, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/jal0;->A0()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance v2, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v4, "delayVideoBonus, buzzBonusStatus "

    .line 67
    .line 68
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v1, p0, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    iget v0, v0, Lcom/p1/mobile/putong/core/data/BonusThreshold;->videoBuzz:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    const/16 v0, 0x3c

    .line 95
    .line 96
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {p0}, Ll/sp2;->z0()Ljava/lang/Runnable;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    add-int/lit8 v4, v0, -0xf

    .line 105
    .line 106
    int-to-long v4, v4

    .line 107
    const-wide/16 v6, 0x3e8

    .line 108
    .line 109
    mul-long/2addr v4, v6

    .line 110
    const-wide/16 v8, 0x0

    .line 111
    .line 112
    invoke-static {v4, v5, v8, v9}, Lkotlin/ranges/a;->c(JJ)J

    .line 113
    .line 114
    .line 115
    move-result-wide v4

    .line 116
    invoke-static {v1, v2, v4, v5}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 117
    .line 118
    .line 119
    sget-object v1, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/jal0;->A0()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    new-instance v4, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v5, "delayVideoBonus, delayTime "

    .line 128
    .line 129
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v1, v2, v3}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    if-lez v0, :cond_3

    .line 146
    .line 147
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {p0}, Ll/sp2;->y0()Ljava/lang/Runnable;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    int-to-long v2, v0

    .line 156
    mul-long/2addr v2, v6

    .line 157
    invoke-static {v1, p0, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 158
    .line 159
    .line 160
    :cond_3
    return-void
.end method

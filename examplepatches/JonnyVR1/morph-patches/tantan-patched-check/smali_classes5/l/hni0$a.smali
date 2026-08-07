.class public final Ll/hni0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hni0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\u000b\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Ll/hni0$a;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "showDialog",
        "",
        "g",
        "(Lcom/p1/mobile/android/app/Act;Z)V",
        "h",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "b_core_intlGmsRelease"
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

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hni0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/TarotDataEnvelope;)Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TarotDataEnvelope;->data:Lcom/p1/mobile/putong/core/data/TarotData;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/core/data/TarotData;->cardType:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-gt v1, v0, :cond_0

    .line 7
    .line 8
    const/16 v1, 0x2d

    .line 9
    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    sget-object v0, Ll/oli0;->Companion:Ll/oli0$a;

    .line 13
    .line 14
    invoke-virtual {v0, p0, p1}, Ll/oli0$a;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/TarotData;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 18
    .line 19
    return-object p0
.end method

.method public static b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Aq:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/TarotDataEnvelope;)Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/TarotDataEnvelope;->data:Lcom/p1/mobile/putong/core/data/TarotData;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/core/data/TarotData;->cardType:I

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    const/16 v1, 0x2d

    .line 8
    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Ll/b8b;->r3(Lcom/p1/mobile/putong/core/data/TarotDataEnvelope;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/TarotDataEnvelope;->data:Lcom/p1/mobile/putong/core/data/TarotData;

    .line 23
    .line 24
    iget p2, p2, Lcom/p1/mobile/putong/core/data/TarotData;->cardType:I

    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ll/b8b;->q3(I)V

    .line 27
    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    sget-object p0, Ll/oli0;->Companion:Ll/oli0$a;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/oli0$a;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Aq:I

    .line 38
    .line 39
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 43
    .line 44
    return-object p0
.end method

.method public static d(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static f(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final g(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/b8b;->m3()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/bni0;

    .line 25
    .line 26
    invoke-direct {v0, p2, p1}, Ll/bni0;-><init>(ZLcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Ll/cni0;

    .line 30
    .line 31
    invoke-direct {p1, v0}, Ll/cni0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 32
    .line 33
    .line 34
    new-instance p2, Ll/dni0;

    .line 35
    .line 36
    invoke-direct {p2}, Ll/dni0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lrx/c;->subscribe(Ll/y20;Ll/y20;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final h(Lcom/p1/mobile/android/app/Act;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/ami0;->INSTANCE:Ll/ami0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ami0;->e()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, -0x1

    .line 11
    if-eq v0, v1, :cond_5

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dkb;->P0:Ll/byd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Number;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    invoke-virtual {p0}, Ll/ami0;->e()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    int-to-long v4, v0

    .line 34
    cmp-long v0, v2, v4

    .line 35
    .line 36
    if-gez v0, :cond_0

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/b8b;->i3()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_5

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/b8b;->i3()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-ne v0, v1, :cond_1

    .line 59
    .line 60
    goto/16 :goto_0

    .line 61
    .line 62
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/b8b;->j3()Ll/jxd0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/b8b;->l3()Ll/byd0;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    check-cast v0, Ljava/lang/Number;

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    .line 101
    .line 102
    .line 103
    move-result-wide v0

    .line 104
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    invoke-virtual {p0}, Ll/ami0;->d()J

    .line 112
    .line 113
    .line 114
    move-result-wide v0

    .line 115
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 116
    .line 117
    .line 118
    move-result-wide v2

    .line 119
    sub-long/2addr v0, v2

    .line 120
    const-wide/16 v2, 0x0

    .line 121
    .line 122
    cmp-long p0, v0, v2

    .line 123
    .line 124
    if-gtz p0, :cond_5

    .line 125
    .line 126
    const-wide/32 v2, -0x6ddd00

    .line 127
    .line 128
    .line 129
    cmp-long p0, v0, v2

    .line 130
    .line 131
    if-gez p0, :cond_4

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/b8b;->l3()Ll/byd0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 143
    .line 144
    .line 145
    move-result-wide v0

    .line 146
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 154
    .line 155
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->w1:Ll/b8b;

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/b8b;->o3()Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    new-instance v0, Ll/eni0;

    .line 174
    .line 175
    invoke-direct {v0, p1}, Ll/eni0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 176
    .line 177
    .line 178
    new-instance p1, Ll/fni0;

    .line 179
    .line 180
    invoke-direct {p1, v0}, Ll/fni0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 181
    .line 182
    .line 183
    new-instance v0, Ll/gni0;

    .line 184
    .line 185
    invoke-direct {v0}, Ll/gni0;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, p1, v0}, Lrx/c;->subscribe(Ll/y20;Ll/y20;)Ll/kcg0;

    .line 189
    .line 190
    .line 191
    :cond_5
    :goto_0
    return-void
.end method

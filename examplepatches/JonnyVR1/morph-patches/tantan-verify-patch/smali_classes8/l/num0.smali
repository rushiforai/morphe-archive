.class public final Ll/num0;
.super Ll/kg2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/num0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0018\u0000 \u001c2\u00020\u0001:\u0001\u001dB\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ+\u0010\u0012\u001a\u00020\t2\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u000bJ\u000f\u0010\u0015\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u000bJ\u000f\u0010\u0016\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u000bJ\u000f\u0010\u0018\u001a\u00020\u0017H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/num0;",
        "Ll/kg2;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "pageType",
        "modeType",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V",
        "",
        "r",
        "()V",
        "q",
        "Ll/pf60;",
        "",
        "pair",
        "",
        "bundle",
        "j0",
        "(Ll/pf60;Z)V",
        "v",
        "f0",
        "B",
        "",
        "M",
        "()I",
        "I",
        "()Ljava/lang/String;",
        "Companion",
        "a",
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


# static fields
.field public static final Companion:Ll/num0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/num0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/num0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/num0;->Companion:Ll/num0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1, p2, p3}, Ll/kg2;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public B()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->B()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_buzz_voice_connecting"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public I()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Ll/kq3;->INSTANCE:Ll/kq3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kq3;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public M()I
    .locals 0

    .line 1
    sget p0, Ll/ebc0;->l0:I

    .line 2
    .line 3
    return p0
.end method

.method public f0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->f0()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_intl_buzz_voice_waiting"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j0(Ll/pf60;Z)V
    .locals 1
    .param p1    # Ll/pf60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Ll/kg2;->j0(Ll/pf60;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    sget-object p1, Ll/haw;->Companion:Ll/haw$a;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    iget v0, p2, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/kg2;->L()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-ne v0, p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    invoke-static {v0, p0}, Lkotlin/ranges/a;->b(II)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    iput p0, p2, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/haw;->A0()Lrx/subjects/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->q()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_buzz_voice_searching"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/kg2;->r()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kg2;->P()Lv/VText;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Ll/ebc0;->t0:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/kg2;->W()Lv/VText;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Ll/ebc0;->v0:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/kg2;->V()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzCircleCountdownView;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Ll/d9c0;->c:I

    .line 27
    .line 28
    invoke-static {v1}, Ll/k3d0;->a(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    sget v2, Ll/d9c0;->d:I

    .line 33
    .line 34
    invoke-static {v2}, Ll/k3d0;->a(I)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    sget v3, Ll/qa00;->g:I

    .line 39
    .line 40
    int-to-float v3, v3

    .line 41
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzCircleCountdownView;->d(IIF)V

    .line 42
    .line 43
    .line 44
    const-string v0, "voiceBuzz"

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/kg2;->z(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Ll/haw;->G0()Lrx/subjects/a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ll/pf60;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    const/4 v2, 0x0

    .line 72
    const/4 v3, 0x2

    .line 73
    const/4 v4, 0x0

    .line 74
    invoke-static {p0, v1, v2, v3, v4}, Ll/kg2;->y(Ll/kg2;Ll/pf60;ZILjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ll/kg2;->A(Ll/pf60;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/kg2;->K()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v3, "passive"

    .line 88
    .line 89
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_0

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/num0;->v()V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_0
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 100
    .line 101
    instance-of v3, v2, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    .line 102
    .line 103
    if-eqz v3, :cond_1

    .line 104
    .line 105
    check-cast v2, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_1
    move-object v2, v4

    .line 109
    :goto_0
    if-eqz v2, :cond_2

    .line 110
    .line 111
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->channelToken:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    move-object v2, v4

    .line 115
    :goto_1
    invoke-virtual {p0, v2}, Ll/kg2;->E(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_3
    invoke-virtual {p0}, Ll/num0;->B()V

    .line 120
    .line 121
    .line 122
    :goto_2
    invoke-virtual {p0, v1}, Ll/kg2;->n0(Ll/pf60;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Ll/haw;->G0()Lrx/subjects/a;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    const-string v0, "intl.text.lovebuzz.close.notify"

    .line 134
    .line 135
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_4
    const-string v0, "p_buzz_voice_searching"

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/kg2;->v()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_intl_buzz_voice_paired"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {p0, v0, v1, v0}, Ll/nbw;->p(Ll/nbw;Ljava/lang/String;ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

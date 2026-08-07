.class public Ll/g500$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g500;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Lcom/p1/mobile/android/media/AudioPlayer$State;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/g500;


# direct methods
.method public constructor <init>(Ll/g500;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g500$a;->e:Ll/g500;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public g(Lcom/p1/mobile/android/media/AudioPlayer$State;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g500$a;->e:Ll/g500;

    .line 2
    .line 3
    invoke-static {v0}, Ll/g500;->y0(Ll/g500;)Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/g500$a;->e:Ll/g500;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/g500;->D0(Ll/g500;Lcom/p1/mobile/android/media/AudioPlayer$State;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->stopped:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 16
    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    iget-object p1, p0, Ll/g500$a;->e:Ll/g500;

    .line 20
    .line 21
    invoke-static {}, Ll/g500;->F0()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-static {p1, v0, v1}, Ll/g500;->C0(Ll/g500;J)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/g500$a;->e:Ll/g500;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-static {p1, v0}, Ll/g500;->A0(Ll/g500;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/g500$a;->e:Ll/g500;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/qzz;->B1()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/g500$a;->e:Ll/g500;

    .line 52
    .line 53
    invoke-static {p1}, Ll/g500;->E0(Ll/g500;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/g500$a;->e:Ll/g500;

    .line 57
    .line 58
    invoke-static {p0}, Ll/g500;->s0(Ll/g500;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p0, v0}, Ll/nam;->f(Z)V

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    return-void

    .line 76
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->finished:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 77
    .line 78
    iget-object v1, p0, Ll/g500$a;->e:Ll/g500;

    .line 79
    .line 80
    if-ne p1, v0, :cond_5

    .line 81
    .line 82
    invoke-static {v1}, Ll/g500;->t0(Ll/g500;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iget-object v0, p0, Ll/g500$a;->e:Ll/g500;

    .line 87
    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object v0, p0, Ll/g500$a;->e:Ll/g500;

    .line 99
    .line 100
    invoke-static {v0}, Ll/g500;->x0(Ll/g500;)J

    .line 101
    .line 102
    .line 103
    move-result-wide v0

    .line 104
    invoke-virtual {p1, v0, v1}, Ll/clz;->v3(J)Lcom/p1/mobile/putong/core/data/Message;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_4

    .line 113
    .line 114
    iget-object p0, p0, Ll/g500$a;->e:Ll/g500;

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Ll/g500;->c1(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_3
    const/4 p1, 0x1

    .line 121
    invoke-static {v0, p1}, Ll/g500;->z0(Ll/g500;Z)V

    .line 122
    .line 123
    .line 124
    :cond_4
    iget-object p1, p0, Ll/g500$a;->e:Ll/g500;

    .line 125
    .line 126
    invoke-static {p1}, Ll/g500;->u0(Ll/g500;)Lcom/p1/mobile/android/media/AudioPlayer;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p1}, Lcom/p1/mobile/android/media/AudioPlayer;->stop()V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Ll/g500$a;->e:Ll/g500;

    .line 134
    .line 135
    invoke-static {p0}, Ll/g500;->E0(Ll/g500;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_5
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0}, Ll/qzz;->B1()V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public onCompleted()V
    .locals 0

    .line 1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/psd0;->M(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/Exception;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "AudioPlayer error:"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    const/16 p1, 0x64

    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g500$a;->g(Lcom/p1/mobile/android/media/AudioPlayer$State;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

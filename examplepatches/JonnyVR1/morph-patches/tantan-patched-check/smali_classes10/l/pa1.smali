.class public Ll/pa1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/c0m;

.field public final b:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Ll/c0m;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    new-instance v1, Ll/oa1;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/oa1;-><init>(Ll/pa1;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/pa1;->b:Landroid/os/Handler;

    .line 15
    .line 16
    iput-object p1, p0, Ll/pa1;->a:Ll/c0m;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/pa1;Landroid/os/Message;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pa1;->c(Landroid/os/Message;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioEffectService changeAudioEffect:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->changeVoiceNo:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "voice_effect_gift"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->changeVoiceNo:I

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    if-eq p1, v0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    if-eq p1, v0, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x3

    .line 31
    if-eq p1, v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/pa1;->e()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0}, Ll/pa1;->f()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Ll/pa1;->h()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-virtual {p0}, Ll/pa1;->g()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic c(Landroid/os/Message;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pa1;->e()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pa1;->b:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pa1;->a:Ll/c0m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pa1;->a:Ll/c0m;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetOff:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-interface {p0, v0}, Ll/uzl;->h(I)I

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pa1;->a:Ll/c0m;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/wrv;->E0(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetVoiceChangerEffectBoy:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    sget-object v2, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetVoiceChangerEffectGirl:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object p0, p0, Ll/pa1;->a:Ll/c0m;

    .line 34
    .line 35
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 40
    .line 41
    const-string v3, "female"

    .line 42
    .line 43
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    move v1, v2

    .line 50
    :cond_0
    invoke-interface {p0, v1}, Ll/uzl;->h(I)I

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pa1;->a:Ll/c0m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetVoiceChangerEffectHulk:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object p0, p0, Ll/pa1;->a:Ll/c0m;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0, v0}, Ll/uzl;->h(I)I

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pa1;->a:Ll/c0m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetVoiceChangerEffectPigKin:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object p0, p0, Ll/pa1;->a:Ll/c0m;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0, v0}, Ll/uzl;->h(I)I

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public i(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/pa1;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pa1;->b:Landroid/os/Handler;

    .line 5
    .line 6
    int-to-long v0, p1

    .line 7
    const-wide/16 v2, 0x3e8

    .line 8
    .line 9
    mul-long/2addr v0, v2

    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

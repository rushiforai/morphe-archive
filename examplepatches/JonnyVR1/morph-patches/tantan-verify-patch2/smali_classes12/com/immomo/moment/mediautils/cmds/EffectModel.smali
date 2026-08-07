.class public Lcom/immomo/moment/mediautils/cmds/EffectModel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private audioEffects:Lcom/immomo/moment/mediautils/cmds/AudioEffects;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "audio"
    .end annotation
.end field

.field private mediaPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "media"
    .end annotation
.end field

.field private videoEffects:Lcom/immomo/moment/mediautils/cmds/VideoEffects;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "effects"
    .end annotation
.end field


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

.method public static getEffectModel(Ljava/lang/String;)Lcom/immomo/moment/mediautils/cmds/EffectModel;
    .locals 2

    .line 1
    invoke-static {}, Ll/vrq;->b()Ll/vrq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Ll/vrq;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 12
    .line 13
    return-object p0
.end method

.method public static toEffectCmd(Lcom/immomo/moment/mediautils/cmds/EffectModel;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/vrq;->b()Ll/vrq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/vrq;->d(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public getAudioEffects()Lcom/immomo/moment/mediautils/cmds/AudioEffects;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/EffectModel;->audioEffects:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/EffectModel;->mediaPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoEffects()Lcom/immomo/moment/mediautils/cmds/VideoEffects;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/EffectModel;->videoEffects:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAudioEffects(Lcom/immomo/moment/mediautils/cmds/AudioEffects;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/EffectModel;->audioEffects:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 2
    .line 3
    return-void
.end method

.method public setMediaPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/EffectModel;->mediaPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoEffects(Lcom/immomo/moment/mediautils/cmds/VideoEffects;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/EffectModel;->videoEffects:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 2
    .line 3
    return-void
.end method

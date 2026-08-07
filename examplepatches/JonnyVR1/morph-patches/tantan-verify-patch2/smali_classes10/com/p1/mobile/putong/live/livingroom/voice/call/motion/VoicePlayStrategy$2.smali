.class final enum Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$2;
.super Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$2;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getDeputyCount()I
    .locals 0

    const/16 p0, 0x9

    return p0
.end method

.method public getPlayStrategyView()Ll/sam;
    .locals 0

    .line 1
    new-instance p0, Ll/udo0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/udo0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

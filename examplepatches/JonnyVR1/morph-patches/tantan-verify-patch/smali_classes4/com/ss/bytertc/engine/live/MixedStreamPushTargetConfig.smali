.class public Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public pushCDNURL:Ljava/lang/String;

.field public pushTargetType:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

.field public pushWTNStreamID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;->PUSH_TO_CDN:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushTargetType:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushCDNURL:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushWTNStreamID:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;->PUSH_TO_CDN:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 17
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushTargetType:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 18
    iput-object p2, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushCDNURL:Ljava/lang/String;

    .line 19
    iput-object p3, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushWTNStreamID:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getMixedStreamPushTargetTypePushCDNURL()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushCDNURL:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getMixedStreamPushTargetTypePushTargetType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushTargetType:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;->value()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMixedStreamPushTargetTypePushWTNStreamID()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;->pushWTNStreamID:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

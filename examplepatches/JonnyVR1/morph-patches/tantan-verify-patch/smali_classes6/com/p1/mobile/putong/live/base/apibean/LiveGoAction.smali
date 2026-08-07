.class public Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# static fields
.field public static final TYPE_CUSTOM:I = 0x9

.field public static final TYPE_INTL_VOICE_ID:I = 0x5

.field public static final TYPE_LIVE_ID:I = 0x3

.field public static final TYPE_SCHEMA:I = 0x1

.field public static final TYPE_VIDEO_CHAT_ID:I = 0x4

.field public static final TYPE_VIRTUAL_VOICE_ID:I = 0x2


# instance fields
.field private goData:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "goData"
    .end annotation
.end field

.field private goExtra:Ljava/util/Map;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "goExtra"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private type:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getGoData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->goData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGoExtra()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->goExtra:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public setGoData(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->goData:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setGoExtra(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->goExtra:Ljava/util/Map;

    .line 2
    .line 3
    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->type:I

    .line 2
    .line 3
    return-void
.end method

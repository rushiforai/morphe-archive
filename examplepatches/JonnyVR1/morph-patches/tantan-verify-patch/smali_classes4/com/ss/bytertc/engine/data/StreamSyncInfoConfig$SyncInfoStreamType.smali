.class public final enum Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SyncInfoStreamType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

.field public static final enum SYNC_INFO_STREAM_TYPE_AUDIO:Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 2
    .line 3
    const-string v1, "SYNC_INFO_STREAM_TYPE_AUDIO"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;->SYNC_INFO_STREAM_TYPE_AUDIO:Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 10
    .line 11
    filled-new-array {v0}, [Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;->$VALUES:[Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;->$VALUES:[Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 8
    .line 9
    return-object v0
.end method

.class Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$UniqueIdManagerHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UniqueIdManagerHolder"
.end annotation


# static fields
.field static uniqueIdManager:Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;-><init>(Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$UniqueIdManagerHolder;->uniqueIdManager:Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

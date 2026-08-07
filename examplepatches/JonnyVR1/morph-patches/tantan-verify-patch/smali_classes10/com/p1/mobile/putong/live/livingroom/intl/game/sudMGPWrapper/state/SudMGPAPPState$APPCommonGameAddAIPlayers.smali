.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameAddAIPlayers;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "APPCommonGameAddAIPlayers"
.end annotation


# instance fields
.field public aiPlayers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AIPlayers;",
            ">;"
        }
    .end annotation
.end field

.field public isReady:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameAddAIPlayers;->isReady:I

    .line 6
    .line 7
    return-void
.end method

.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MGCommonGameState"
.end annotation


# static fields
.field public static final IDLE:I = 0x0

.field public static final LOADING:I = 0x1

.field public static final PLAYING:I = 0x2

.field public static final UNKNOW:I = -0x1


# instance fields
.field public gameState:I


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

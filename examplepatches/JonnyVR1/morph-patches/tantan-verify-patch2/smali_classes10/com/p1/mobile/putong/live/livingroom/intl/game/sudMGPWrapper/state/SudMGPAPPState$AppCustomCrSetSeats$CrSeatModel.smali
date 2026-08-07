.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomCrSetSeats$CrSeatModel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomCrSetSeats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CrSeatModel"
.end annotation


# static fields
.field public static final MICRO_STATE_LOCKED:I = 0x3

.field public static final MICRO_STATE_NO_ONE:I = 0x2

.field public static final MICRO_STATE_SOMEONE:I = 0x1


# instance fields
.field public gender:I

.field public giftValue:I

.field public level:I

.field public micphoneState:I

.field public microState:I

.field public name:Ljava/lang/String;

.field public photoUrl:Ljava/lang/String;

.field public seatIndex:I

.field public userId:Ljava/lang/String;


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

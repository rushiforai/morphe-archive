.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomRocketConfig;
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
    name = "AppCustomRocketConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomRocketConfig$ExtraModel;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomRocketConfig$HeadModel;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomRocketConfig$ComponentModel;
    }
.end annotation


# instance fields
.field public componentList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomRocketConfig$ComponentModel;",
            ">;"
        }
    .end annotation
.end field

.field public extraList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomRocketConfig$ExtraModel;",
            ">;"
        }
    .end annotation
.end field

.field public filterLayer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public filterModel:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public firePrice:D

.field public gameIntroduce:Ljava/lang/String;

.field public headList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCustomRocketConfig$HeadModel;",
            ">;"
        }
    .end annotation
.end field

.field public isDynamicPrice:I

.field public maxSeat:I

.field public monetaryUnit:Ljava/lang/String;

.field public serverTime:J


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

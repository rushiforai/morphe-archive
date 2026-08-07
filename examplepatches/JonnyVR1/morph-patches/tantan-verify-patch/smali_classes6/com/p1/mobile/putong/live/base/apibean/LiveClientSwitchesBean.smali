.class public Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveMaskLimitConfig;,
        Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;,
        Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;,
        Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;,
        Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;
    }
.end annotation


# instance fields
.field public switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "switches"
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

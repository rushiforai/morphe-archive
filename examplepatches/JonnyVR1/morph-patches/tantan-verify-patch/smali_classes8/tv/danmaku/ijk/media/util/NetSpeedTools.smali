.class public Ltv/danmaku/ijk/media/util/NetSpeedTools;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/util/netspeedutil/SpeedTask$OnPushCompleteListener;
.implements Ltv/danmaku/ijk/media/util/netspeedutil/SpeedTask$OnPingCompleteListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/util/NetSpeedTools$OnTaskCompleteListener;,
        Ltv/danmaku/ijk/media/util/NetSpeedTools$OnPingCompleteListener;
    }
.end annotation


# instance fields
.field private a:Ltv/danmaku/ijk/media/util/NetSpeedTools$OnTaskCompleteListener;

.field private b:Ltv/danmaku/ijk/media/util/NetSpeedTools$OnPingCompleteListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/NetSpeedTools;->a:Ltv/danmaku/ijk/media/util/NetSpeedTools$OnTaskCompleteListener;

    .line 6
    .line 7
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/NetSpeedTools;->b:Ltv/danmaku/ijk/media/util/NetSpeedTools$OnPingCompleteListener;

    .line 8
    .line 9
    return-void
.end method

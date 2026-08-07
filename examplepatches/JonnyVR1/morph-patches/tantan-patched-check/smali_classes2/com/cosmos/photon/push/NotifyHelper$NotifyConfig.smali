.class public Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/NotifyHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NotifyConfig"
.end annotation


# instance fields
.field public autoCancel:Z

.field public channelId:Ljava/lang/String;

.field public endMuteTime:J

.field public icon:Ljava/lang/String;

.field public isOpenMuteTime:Z

.field public isSound:Z

.field public isVibrate:Z

.field public popNotify:Z

.field public sound:Ljava/lang/String;

.field public startMuteTime:J


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

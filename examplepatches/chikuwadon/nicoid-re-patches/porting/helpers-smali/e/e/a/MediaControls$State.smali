.class Le/e/a/MediaControls$State;
.super Ljava/lang/Object;
.source "MediaControls.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MediaControls;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation


# instance fields
.field lastInfo:Landroid/os/Bundle;
.field context:Landroid/content/Context;

.field lastDuration:J

.field lastPlaying:Z

.field notification:Landroid/app/Notification;

.field notificationId:I

.field owner:Ljava/lang/Object;

.field player:Ljava/lang/Object;

.field popup:Z

.field receiver:Landroid/content/BroadcastReceiver;

.field session:Landroid/media/session/MediaSession;

.field tick:Ljava/lang/Runnable;

.field title:Ljava/lang/String;

.field video:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/MediaControls$State;->lastDuration:J

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/MediaControls$1;)V
    .registers 2

    .line 16
    invoke-direct {p0}, Le/e/a/MediaControls$State;-><init>()V

    return-void
.end method

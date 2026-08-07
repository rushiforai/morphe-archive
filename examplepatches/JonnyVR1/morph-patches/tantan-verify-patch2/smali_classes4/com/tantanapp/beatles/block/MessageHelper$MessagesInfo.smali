.class public Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/block/MessageHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessagesInfo"
.end annotation


# instance fields
.field public count:I

.field public cpuTime:J

.field public isIdle:Z

.field public msgInfo:Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;

.field public startTime:J

.field public wallTime:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->cpuTime:J

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->wallTime:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->startTime:J

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public reset()V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->cpuTime:J

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->wallTime:J

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->startTime:J

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->count:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-object v1, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->msgInfo:Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->isIdle:Z

    .line 18
    .line 19
    return-void
.end method

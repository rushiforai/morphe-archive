.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Tone"
.end annotation


# instance fields
.field public begin:J

.field public end:J

.field public fullText:Ljava/lang/String;

.field public isTitle:Z

.field public lang:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;

.field public pitch:I

.field public word:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;->Chinese:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->lang:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->pitch:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getDuration()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->end:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->begin:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

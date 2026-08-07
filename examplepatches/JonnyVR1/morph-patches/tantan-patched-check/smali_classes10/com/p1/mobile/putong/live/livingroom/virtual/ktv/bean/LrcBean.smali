.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;,
        Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;
    }
.end annotation


# instance fields
.field public tones:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;",
            ">;)V"
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getStartTime()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 20
    .line 21
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->begin:J

    .line 22
    .line 23
    return-wide v0

    .line 24
    :cond_1
    :goto_0
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    return-wide v0
.end method

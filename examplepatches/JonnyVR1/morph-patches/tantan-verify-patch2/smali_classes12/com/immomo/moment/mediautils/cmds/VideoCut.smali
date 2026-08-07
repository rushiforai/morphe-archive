.class public Lcom/immomo/moment/mediautils/cmds/VideoCut;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private centerx:F

.field private centery:F

.field private end:J

.field private media:Ljava/lang/String;

.field private reverse:Z

.field private rotation:J

.field private scalex:F

.field private scaley:F

.field private start:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->media:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->start:J

    .line 7
    .line 8
    iput-wide p4, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->end:J

    .line 9
    .line 10
    const/high16 p1, 0x3f000000    # 0.5f

    .line 11
    .line 12
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centerx:F

    .line 13
    .line 14
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centery:F

    .line 15
    .line 16
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scalex:F

    .line 19
    .line 20
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scaley:F

    .line 21
    .line 22
    const-wide/16 p1, 0x0

    .line 23
    .line 24
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->rotation:J

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->reverse:Z

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJFFFFJ)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->media:Ljava/lang/String;

    .line 43
    iput-wide p2, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->start:J

    .line 44
    iput-wide p4, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->end:J

    .line 45
    iput p6, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centerx:F

    .line 46
    iput p7, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centery:F

    .line 47
    iput p8, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scalex:F

    .line 48
    iput p9, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scaley:F

    .line 49
    iput-wide p10, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->rotation:J

    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->reverse:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJZ)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->media:Ljava/lang/String;

    .line 33
    iput-wide p2, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->start:J

    .line 34
    iput-wide p4, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->end:J

    const/high16 p1, 0x3f000000    # 0.5f

    .line 35
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centerx:F

    .line 36
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centery:F

    const/high16 p1, 0x3f800000    # 1.0f

    .line 37
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scalex:F

    .line 38
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scaley:F

    const-wide/16 p1, 0x0

    .line 39
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->rotation:J

    .line 40
    iput-boolean p6, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->reverse:Z

    return-void
.end method


# virtual methods
.method public getCenterx()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centerx:F

    .line 2
    .line 3
    return p0
.end method

.method public getCentery()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centery:F

    .line 2
    .line 3
    return p0
.end method

.method public getEnd()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->end:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getMedia()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->media:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRotation()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->rotation:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getScalex()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scalex:F

    .line 2
    .line 3
    return p0
.end method

.method public getScaley()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scaley:F

    .line 2
    .line 3
    return p0
.end method

.method public getStart()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->start:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public isReverse()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->reverse:Z

    .line 2
    .line 3
    return p0
.end method

.method public setCenterx(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centerx:F

    .line 2
    .line 3
    return-void
.end method

.method public setCentery(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->centery:F

    .line 2
    .line 3
    return-void
.end method

.method public setEnd(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->end:J

    .line 2
    .line 3
    return-void
.end method

.method public setMedia(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->media:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setReverse(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->reverse:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRotation(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->rotation:J

    .line 2
    .line 3
    return-void
.end method

.method public setScalex(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scalex:F

    .line 2
    .line 3
    return-void
.end method

.method public setScaley(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->scaley:F

    .line 2
    .line 3
    return-void
.end method

.method public setStart(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoCut;->start:J

    .line 2
    .line 3
    return-void
.end method

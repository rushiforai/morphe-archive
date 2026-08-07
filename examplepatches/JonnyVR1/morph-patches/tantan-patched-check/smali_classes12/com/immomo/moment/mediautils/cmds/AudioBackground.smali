.class public Lcom/immomo/moment/mediautils/cmds/AudioBackground;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private bgPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "path"
    .end annotation
.end field

.field private end:J

.field private isCycle:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cycle"
    .end annotation
.end field

.field private ratio:F

.field private start:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;FJJZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->bgPath:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->ratio:F

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->start:J

    .line 9
    .line 10
    iput-wide p5, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->end:J

    .line 11
    .line 12
    iput-boolean p7, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->isCycle:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getBgPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->bgPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEnd()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->end:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->ratio:F

    .line 2
    .line 3
    return p0
.end method

.method public getStart()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->start:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public isCycle()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->isCycle:Z

    .line 2
    .line 3
    return p0
.end method

.method public setBgPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->bgPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCycle(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->isCycle:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEnd(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->end:J

    .line 2
    .line 3
    return-void
.end method

.method public setRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->ratio:F

    .line 2
    .line 3
    return-void
.end method

.method public setStart(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->start:J

    .line 2
    .line 3
    return-void
.end method

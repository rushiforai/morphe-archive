.class public Lcom/immomo/moment/mediautils/cmds/VideoFilter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private end:J

.field private filterType:Ljava/lang/String;

.field private resource:Ljava/lang/String;

.field private start:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->filterType:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->start:J

    .line 7
    .line 8
    iput-wide p4, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->end:J

    .line 9
    .line 10
    iput-object p6, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->resource:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getEnd()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->end:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFilterType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->filterType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->resource:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStart()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->start:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setEnd(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->end:J

    .line 2
    .line 3
    return-void
.end method

.method public setFilterType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->filterType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->resource:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStart(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/VideoFilter;->start:J

    .line 2
    .line 3
    return-void
.end method

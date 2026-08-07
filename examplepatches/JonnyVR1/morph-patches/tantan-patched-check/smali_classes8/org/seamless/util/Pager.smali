.class public Lorg/seamless/util/Pager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private numOfRecords:Ljava/lang/Long;

.field private page:Ljava/lang/Integer;

.field private pageSize:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 38
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    const/4 v0, 0x1

    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    const-wide/16 v0, 0xf

    .line 40
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/seamless/util/Pager;->pageSize:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;)V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 33
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    const/4 v0, 0x1

    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    const-wide/16 v0, 0xf

    .line 35
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/seamless/util/Pager;->pageSize:Ljava/lang/Long;

    .line 36
    iput-object p1, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    .line 18
    .line 19
    const-wide/16 v0, 0xf

    .line 20
    .line 21
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lorg/seamless/util/Pager;->pageSize:Ljava/lang/Long;

    .line 26
    .line 27
    iput-object p1, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    .line 28
    .line 29
    iput-object p2, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Long;)V
    .locals 2

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 42
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    const/4 v0, 0x1

    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    .line 44
    iput-object p1, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    .line 45
    iput-object p2, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    .line 46
    iput-object p3, p0, Lorg/seamless/util/Pager;->pageSize:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public getFirstPage()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getIndexRangeBegin()J
    .locals 6

    .line 1
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getPage()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    int-to-long v0, v0

    .line 12
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getPageSize()Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    mul-long/2addr v0, v2

    .line 21
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getNumOfRecords()Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    const-wide/16 v4, 0x1

    .line 30
    .line 31
    sub-long/2addr v2, v4

    .line 32
    const-wide/16 v4, 0x0

    .line 33
    .line 34
    cmp-long p0, v0, v4

    .line 35
    .line 36
    if-ltz p0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move-wide v0, v4

    .line 40
    :goto_0
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    return-wide v0
.end method

.method public getIndexRangeEnd()J
    .locals 8

    .line 1
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getIndexRangeBegin()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getPageSize()Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    const-wide/16 v4, 0x1

    .line 14
    .line 15
    sub-long/2addr v2, v4

    .line 16
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getNumOfRecords()Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide v6

    .line 24
    sub-long/2addr v6, v4

    .line 25
    add-long/2addr v0, v2

    .line 26
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    return-wide v0
.end method

.method public getLastPage()J
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Lorg/seamless/util/Pager;->pageSize:Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    div-long/2addr v0, v2

    .line 14
    iget-object v2, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    iget-object p0, p0, Lorg/seamless/util/Pager;->pageSize:Ljava/lang/Long;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide v4

    .line 26
    rem-long/2addr v2, v4

    .line 27
    const-wide/16 v4, 0x0

    .line 28
    .line 29
    cmp-long p0, v2, v4

    .line 30
    .line 31
    const-wide/16 v2, 0x1

    .line 32
    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    sub-long/2addr v0, v2

    .line 36
    :cond_0
    add-long/2addr v0, v2

    .line 37
    return-wide v0
.end method

.method public getNextPage()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public getNumOfRecords()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPage()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageSize()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/Pager;->pageSize:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPreviousPage()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, -0x1

    .line 8
    .line 9
    return p0
.end method

.method public isNextPageAvailable()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x1

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getIndexRangeEnd()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    cmp-long p0, v0, v2

    .line 15
    .line 16
    if-lez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public isPreviousPageAvailable()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getIndexRangeBegin()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getPageSize()Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    cmp-long p0, v0, v2

    .line 17
    .line 18
    if-lez p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public isSeveralPages()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getNumOfRecords()Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getNumOfRecords()Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getPageSize()Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    cmp-long p0, v0, v2

    .line 32
    .line 33
    if-lez p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public setNumOfRecords(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/Pager;->numOfRecords:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setPage(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lorg/seamless/util/Pager;->page:Ljava/lang/Integer;

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public setPageSize(Ljava/lang/Long;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lorg/seamless/util/Pager;->pageSize:Ljava/lang/Long;

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Pager - Records: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getNumOfRecords()Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " Page size: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/seamless/util/Pager;->getPageSize()Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

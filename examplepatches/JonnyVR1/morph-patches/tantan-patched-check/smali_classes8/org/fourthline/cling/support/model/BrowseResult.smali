.class public Lorg/fourthline/cling/support/model/BrowseResult;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected containerUpdateID:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

.field protected count:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

.field protected result:Ljava/lang/String;

.field protected totalMatches:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;


# direct methods
.method public constructor <init>(Ljava/lang/String;JJ)V
    .locals 8

    const-wide/16 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    .line 20
    invoke-direct/range {v0 .. v7}, Lorg/fourthline/cling/support/model/BrowseResult;-><init>(Ljava/lang/String;JJJ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJJ)V
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 7
    .line 8
    invoke-direct {p2, p4, p5}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    .line 9
    .line 10
    .line 11
    new-instance p3, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 12
    .line 13
    invoke-direct {p3, p6, p7}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1, v0, p2, p3}, Lorg/fourthline/cling/support/model/BrowseResult;-><init>(Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lorg/fourthline/cling/support/model/BrowseResult;->result:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lorg/fourthline/cling/support/model/BrowseResult;->count:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 24
    iput-object p3, p0, Lorg/fourthline/cling/support/model/BrowseResult;->totalMatches:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 25
    iput-object p4, p0, Lorg/fourthline/cling/support/model/BrowseResult;->containerUpdateID:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    return-void
.end method


# virtual methods
.method public getContainerUpdateID()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/BrowseResult;->containerUpdateID:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContainerUpdateIDLong()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/BrowseResult;->containerUpdateID:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger;->getValue()Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public getCount()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/BrowseResult;->count:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCountLong()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/BrowseResult;->count:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger;->getValue()Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public getResult()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/BrowseResult;->result:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTotalMatches()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/BrowseResult;->totalMatches:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTotalMatchesLong()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/BrowseResult;->totalMatches:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger;->getValue()Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

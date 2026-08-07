.class public Lorg/fourthline/cling/support/model/Connection$StatusInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/model/Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StatusInfo"
.end annotation


# instance fields
.field private lastError:Lorg/fourthline/cling/support/model/Connection$Error;

.field private status:Lorg/fourthline/cling/support/model/Connection$Status;

.field private uptimeSeconds:J


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/model/Connection$Status;JLorg/fourthline/cling/support/model/Connection$Error;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->status:Lorg/fourthline/cling/support/model/Connection$Status;

    .line 15
    iput-wide p2, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->uptimeSeconds:J

    .line 16
    iput-object p4, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->lastError:Lorg/fourthline/cling/support/model/Connection$Error;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/Connection$Status;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Lorg/fourthline/cling/support/model/Connection$Error;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger;->getValue()Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-direct {p0, p1, v0, v1, p3}, Lorg/fourthline/cling/support/model/Connection$StatusInfo;-><init>(Lorg/fourthline/cling/support/model/Connection$Status;JLorg/fourthline/cling/support/model/Connection$Error;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lorg/fourthline/cling/support/model/Connection$StatusInfo;

    .line 20
    .line 21
    iget-wide v2, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->uptimeSeconds:J

    .line 22
    .line 23
    iget-wide v4, p1, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->uptimeSeconds:J

    .line 24
    .line 25
    cmp-long v2, v2, v4

    .line 26
    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    iget-object v2, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->lastError:Lorg/fourthline/cling/support/model/Connection$Error;

    .line 31
    .line 32
    iget-object v3, p1, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->lastError:Lorg/fourthline/cling/support/model/Connection$Error;

    .line 33
    .line 34
    if-eq v2, v3, :cond_3

    .line 35
    .line 36
    return v1

    .line 37
    :cond_3
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->status:Lorg/fourthline/cling/support/model/Connection$Status;

    .line 38
    .line 39
    iget-object p1, p1, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->status:Lorg/fourthline/cling/support/model/Connection$Status;

    .line 40
    .line 41
    if-eq p0, p1, :cond_4

    .line 42
    .line 43
    return v1

    .line 44
    :cond_4
    return v0

    .line 45
    :cond_5
    :goto_0
    return v1
.end method

.method public getLastError()Lorg/fourthline/cling/support/model/Connection$Error;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->lastError:Lorg/fourthline/cling/support/model/Connection$Error;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatus()Lorg/fourthline/cling/support/model/Connection$Status;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->status:Lorg/fourthline/cling/support/model/Connection$Status;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUptime()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
    .locals 3

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->getUptimeSeconds()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public getUptimeSeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->uptimeSeconds:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->status:Lorg/fourthline/cling/support/model/Connection$Status;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-wide v1, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->uptimeSeconds:J

    .line 10
    .line 11
    const/16 v3, 0x20

    .line 12
    .line 13
    ushr-long v3, v1, v3

    .line 14
    .line 15
    xor-long/2addr v1, v3

    .line 16
    long-to-int v1, v1

    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->lastError:Lorg/fourthline/cling/support/model/Connection$Error;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/2addr v0, p0

    .line 27
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ") "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Connection$StatusInfo;->getStatus()Lorg/fourthline/cling/support/model/Connection$Status;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

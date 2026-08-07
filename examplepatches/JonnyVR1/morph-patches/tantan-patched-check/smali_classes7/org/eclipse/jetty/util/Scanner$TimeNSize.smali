.class Lorg/eclipse/jetty/util/Scanner$TimeNSize;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/Scanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TimeNSize"
.end annotation


# instance fields
.field final _lastModified:J

.field final _size:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_lastModified:J

    .line 5
    .line 6
    iput-wide p3, p0, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_size:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    instance-of v0, p1, Lorg/eclipse/jetty/util/Scanner$TimeNSize;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lorg/eclipse/jetty/util/Scanner$TimeNSize;

    .line 7
    .line 8
    iget-wide v2, p1, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_lastModified:J

    .line 9
    .line 10
    iget-wide v4, p0, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_lastModified:J

    .line 11
    .line 12
    cmp-long v0, v2, v4

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-wide v2, p1, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_size:J

    .line 17
    .line 18
    iget-wide p0, p0, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_size:J

    .line 19
    .line 20
    cmp-long p0, v2, p0

    .line 21
    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_lastModified:J

    .line 2
    .line 3
    long-to-int v0, v0

    .line 4
    iget-wide v1, p0, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_size:J

    .line 5
    .line 6
    long-to-int p0, v1

    .line 7
    xor-int/2addr p0, v0

    .line 8
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "[lm="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_lastModified:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",s="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lorg/eclipse/jetty/util/Scanner$TimeNSize;->_size:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, "]"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

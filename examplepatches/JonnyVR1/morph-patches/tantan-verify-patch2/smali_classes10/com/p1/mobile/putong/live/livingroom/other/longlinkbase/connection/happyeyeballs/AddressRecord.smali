.class public Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;
    }
.end annotation


# instance fields
.field public final a:Ljava/net/InetAddress;

.field public final b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

.field public final c:Ljava/lang/String;

.field public final d:I


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    .line 17
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;-><init>(Ljava/net/InetAddress;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->a:Ljava/net/InetAddress;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->d:I

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->a(Ljava/net/InetAddress;)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Ljava/net/InetAddress;)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/net/InetAddress;->getAddress()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    array-length v0, p0

    .line 9
    const/4 v1, 0x4

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;->IPV4:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    array-length v0, p0

    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;->IPV6:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string v0, "Unknown address type with byte length: "

    .line 24
    .line 25
    array-length p0, p0

    .line 26
    invoke-static {v0, p0}, Ll/pvb;->a(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    return-object p1

    .line 30
    :cond_2
    const-string p0, "InetAddress bytes array is null"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-object p1
.end method

.method public b()Ljava/net/InetAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->a:Ljava/net/InetAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->a:Ljava/net/InetAddress;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

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
    if-eqz p1, :cond_2

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
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    .line 20
    .line 21
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->d:I

    .line 22
    .line 23
    iget v3, p1, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->d:I

    .line 24
    .line 25
    if-ne v2, v3, :cond_2

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->a:Ljava/net/InetAddress;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->a:Ljava/net/InetAddress;

    .line 30
    .line 31
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 40
    .line 41
    if-ne p0, p1, :cond_2

    .line 42
    .line 43
    return v0

    .line 44
    :cond_2
    :goto_0
    return v1
.end method

.method public f()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->a:Ljava/net/InetAddress;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->d:I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AddressRecord{address="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->c()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ", port="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->d:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ", type="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", hostname=\'"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->c:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p0, "\'}"

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

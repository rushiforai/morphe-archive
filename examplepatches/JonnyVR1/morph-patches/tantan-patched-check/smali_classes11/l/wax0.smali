.class public final Ll/wax0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/zww0;

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/zww0;ILjava/lang/String;Ljava/lang/String;Ll/vax0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wax0;->a:Ll/zww0;

    .line 5
    .line 6
    iput p2, p0, Ll/wax0;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/wax0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/wax0;->d:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wax0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Ll/wax0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Ll/wax0;

    .line 8
    .line 9
    iget-object v0, p0, Ll/wax0;->a:Ll/zww0;

    .line 10
    .line 11
    iget-object v2, p1, Ll/wax0;->a:Ll/zww0;

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget v0, p0, Ll/wax0;->b:I

    .line 16
    .line 17
    iget v2, p1, Ll/wax0;->b:I

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/wax0;->c:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p1, Ll/wax0;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Ll/wax0;->d:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p1, p1, Ll/wax0;->d:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_1
    return v1
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wax0;->a:Ll/zww0;

    .line 2
    .line 3
    iget v1, p0, Ll/wax0;->b:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/wax0;->c:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Ll/wax0;->d:Ljava/lang/String;

    .line 12
    .line 13
    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wax0;->a:Ll/zww0;

    .line 2
    .line 3
    iget v1, p0, Ll/wax0;->b:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/wax0;->c:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Ll/wax0;->d:Ljava/lang/String;

    .line 12
    .line 13
    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "(status=%s, keyId=%s, keyType=\'%s\', keyPrefix=\'%s\')"

    .line 18
    .line 19
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

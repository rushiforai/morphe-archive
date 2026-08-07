.class public final Ll/yax0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/nax0;

.field public final b:Ljava/util/List;

.field public final c:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Ll/nax0;Ljava/util/List;Ljava/lang/Integer;Ll/xax0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yax0;->a:Ll/nax0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yax0;->b:Ljava/util/List;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yax0;->c:Ljava/lang/Integer;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Ll/yax0;

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
    check-cast p1, Ll/yax0;

    .line 8
    .line 9
    iget-object v0, p0, Ll/yax0;->a:Ll/nax0;

    .line 10
    .line 11
    iget-object v2, p1, Ll/yax0;->a:Ll/nax0;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ll/nax0;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/yax0;->b:Ljava/util/List;

    .line 20
    .line 21
    iget-object v2, p1, Ll/yax0;->b:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/yax0;->c:Ljava/lang/Integer;

    .line 30
    .line 31
    iget-object p1, p1, Ll/yax0;->c:Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    return v1
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yax0;->a:Ll/nax0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/yax0;->b:Ljava/util/List;

    .line 4
    .line 5
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yax0;->a:Ll/nax0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yax0;->b:Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Ll/yax0;->c:Ljava/lang/Integer;

    .line 6
    .line 7
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "(annotations=%s, entries=%s, primaryKeyId=%s)"

    .line 12
    .line 13
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

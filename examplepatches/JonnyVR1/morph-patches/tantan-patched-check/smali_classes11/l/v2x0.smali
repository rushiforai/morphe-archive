.class public final Ll/v2x0;
.super Ll/gyw0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/t2x0;

.field public final c:Ll/gyw0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/t2x0;Ll/gyw0;Ll/u2x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gyw0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/v2x0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/v2x0;->b:Ll/t2x0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/v2x0;->c:Ll/gyw0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final b()Ll/gyw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v2x0;->c:Ll/gyw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v2x0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Ll/v2x0;

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
    check-cast p1, Ll/v2x0;

    .line 8
    .line 9
    iget-object v0, p1, Ll/v2x0;->b:Ll/t2x0;

    .line 10
    .line 11
    iget-object v2, p0, Ll/v2x0;->b:Ll/t2x0;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p1, Ll/v2x0;->c:Ll/gyw0;

    .line 20
    .line 21
    iget-object v2, p0, Ll/v2x0;->c:Ll/gyw0;

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
    iget-object p1, p1, Ll/v2x0;->a:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p0, p0, Ll/v2x0;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v2x0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v2x0;->b:Ll/t2x0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/v2x0;->c:Ll/gyw0;

    .line 6
    .line 7
    const-class v2, Ll/v2x0;

    .line 8
    .line 9
    filled-new-array {v2, v0, v1, p0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/v2x0;->c:Ll/gyw0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v2x0;->b:Ll/t2x0;

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "LegacyKmsEnvelopeAead Parameters (kekUri: "

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/v2x0;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, ", dekParsingStrategy: "

    .line 26
    .line 27
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, ", dekParametersForNewKeys: "

    .line 34
    .line 35
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p0, ")"

    .line 42
    .line 43
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

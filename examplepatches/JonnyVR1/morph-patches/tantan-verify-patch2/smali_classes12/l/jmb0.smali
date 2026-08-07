.class public Ll/jmb0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/jmb0;->f:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Ll/jmb0;
    .locals 2

    .line 1
    new-instance v0, Ll/jmb0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jmb0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/jmb0;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Ll/jmb0;->a:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Ll/jmb0;->b:I

    .line 11
    .line 12
    iput v1, v0, Ll/jmb0;->b:I

    .line 13
    .line 14
    iget v1, p0, Ll/jmb0;->c:I

    .line 15
    .line 16
    iput v1, v0, Ll/jmb0;->c:I

    .line 17
    .line 18
    iget v1, p0, Ll/jmb0;->d:I

    .line 19
    .line 20
    iput v1, v0, Ll/jmb0;->d:I

    .line 21
    .line 22
    iget v1, p0, Ll/jmb0;->e:I

    .line 23
    .line 24
    iput v1, v0, Ll/jmb0;->e:I

    .line 25
    .line 26
    iget v1, p0, Ll/jmb0;->f:I

    .line 27
    .line 28
    iput v1, v0, Ll/jmb0;->f:I

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/jmb0;->b()V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/jmb0;->b:I

    .line 3
    .line 4
    iput v0, p0, Ll/jmb0;->c:I

    .line 5
    .line 6
    iput v0, p0, Ll/jmb0;->d:I

    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/jmb0;->a()Ll/jmb0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/jmb0;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ";"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget v2, p0, Ll/jmb0;->b:I

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v2, p0, Ll/jmb0;->c:I

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget v2, p0, Ll/jmb0;->d:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v2, p0, Ll/jmb0;->e:I

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget p0, p0, Ll/jmb0;->f:I

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

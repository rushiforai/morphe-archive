.class public Ll/inf$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/inf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:F

.field public g:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    iput-object v0, p0, Ll/inf$a;->g:[F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Ll/inf$a;
    .locals 1

    .line 1
    new-instance v0, Ll/inf$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/inf$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/inf$a;->b(Ll/inf$a;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public b(Ll/inf$a;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/inf$a;->a:F

    .line 2
    .line 3
    iput v0, p1, Ll/inf$a;->a:F

    .line 4
    .line 5
    iget v0, p0, Ll/inf$a;->b:F

    .line 6
    .line 7
    iput v0, p1, Ll/inf$a;->b:F

    .line 8
    .line 9
    iget v0, p0, Ll/inf$a;->c:F

    .line 10
    .line 11
    iput v0, p1, Ll/inf$a;->c:F

    .line 12
    .line 13
    iget v0, p0, Ll/inf$a;->d:F

    .line 14
    .line 15
    iput v0, p1, Ll/inf$a;->d:F

    .line 16
    .line 17
    iget v0, p0, Ll/inf$a;->e:F

    .line 18
    .line 19
    iput v0, p1, Ll/inf$a;->e:F

    .line 20
    .line 21
    iget p0, p0, Ll/inf$a;->f:F

    .line 22
    .line 23
    iput p0, p1, Ll/inf$a;->f:F

    .line 24
    .line 25
    return-void
.end method

.method public c(FFFFFF)V
    .locals 0

    .line 1
    iput p1, p0, Ll/inf$a;->a:F

    .line 2
    .line 3
    iput p2, p0, Ll/inf$a;->b:F

    .line 4
    .line 5
    iput p3, p0, Ll/inf$a;->c:F

    .line 6
    .line 7
    iput p4, p0, Ll/inf$a;->d:F

    .line 8
    .line 9
    iput p5, p0, Ll/inf$a;->e:F

    .line 10
    .line 11
    iput p6, p0, Ll/inf$a;->f:F

    .line 12
    .line 13
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
    invoke-virtual {p0}, Ll/inf$a;->a()Ll/inf$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "l:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/inf$a;->a:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "|t:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/inf$a;->b:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "|r:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/inf$a;->c:F

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "|cb"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/inf$a;->d:F

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "|tr:"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ll/inf$a;->e:F

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "|br:"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget p0, p0, Ll/inf$a;->f:F

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

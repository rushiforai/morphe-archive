.class public final Ll/aqf0;
.super Ll/x1j0;
.source "SourceFile"


# instance fields
.field public final c:S

.field public final d:S


# direct methods
.method public constructor <init>(Ll/x1j0;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x1j0;-><init>(Ll/x1j0;)V

    .line 2
    .line 3
    .line 4
    int-to-short p1, p2

    .line 5
    iput-short p1, p0, Ll/aqf0;->c:S

    .line 6
    .line 7
    int-to-short p1, p3

    .line 8
    iput-short p1, p0, Ll/aqf0;->d:S

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public c(Ll/b13;[B)V
    .locals 0

    .line 1
    iget-short p2, p0, Ll/aqf0;->c:S

    .line 2
    .line 3
    iget-short p0, p0, Ll/aqf0;->d:S

    .line 4
    .line 5
    invoke-virtual {p1, p2, p0}, Ll/b13;->c(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-short v0, p0, Ll/aqf0;->c:S

    .line 2
    .line 3
    iget-short v1, p0, Ll/aqf0;->d:S

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    shl-int v3, v2, v1

    .line 7
    .line 8
    sub-int/2addr v3, v2

    .line 9
    and-int/2addr v0, v3

    .line 10
    shl-int v1, v2, v1

    .line 11
    .line 12
    or-int/2addr v0, v1

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "<"

    .line 16
    .line 17
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-short p0, p0, Ll/aqf0;->d:S

    .line 21
    .line 22
    shl-int p0, v2, p0

    .line 23
    .line 24
    or-int/2addr p0, v0

    .line 25
    invoke-static {p0}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x3e

    .line 37
    .line 38
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

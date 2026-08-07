.class public Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coremedia/iso/boxes/SampleDependencyTypeBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 2
    .line 3
    shr-int/lit8 p0, p0, 0x6

    .line 4
    .line 5
    and-int/lit8 p0, p0, 0x3

    .line 6
    .line 7
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 2
    .line 3
    shr-int/lit8 p0, p0, 0x4

    .line 4
    .line 5
    and-int/lit8 p0, p0, 0x3

    .line 6
    .line 7
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x3

    .line 4
    .line 5
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 2
    .line 3
    shr-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    and-int/lit8 p0, p0, 0x3

    .line 6
    .line 7
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
    if-eqz p1, :cond_3

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
    check-cast p1, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;

    .line 20
    .line 21
    iget p0, p0, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 22
    .line 23
    iget p1, p1, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 24
    .line 25
    if-eq p0, p1, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    return v0

    .line 29
    :cond_3
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Entry{reserved="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->b()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ", sampleDependsOn="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->c()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ", sampleIsDependentOn="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->e()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, ", sampleHasRedundancy="

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/coremedia/iso/boxes/SampleDependencyTypeBox$a;->d()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x7d

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

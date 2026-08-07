.class public Lorg/fourthline/cling/model/meta/UDAVersion;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/model/Validatable;


# instance fields
.field private major:I

.field private minor:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lorg/fourthline/cling/model/meta/UDAVersion;->major:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lorg/fourthline/cling/model/meta/UDAVersion;->minor:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput p1, p0, Lorg/fourthline/cling/model/meta/UDAVersion;->major:I

    .line 13
    iput p2, p0, Lorg/fourthline/cling/model/meta/UDAVersion;->minor:I

    return-void
.end method


# virtual methods
.method public getMajor()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/model/meta/UDAVersion;->major:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinor()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/model/meta/UDAVersion;->minor:I

    .line 2
    .line 3
    return p0
.end method

.method public validate()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/model/ValidationError;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/UDAVersion;->getMajor()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eq v1, v2, :cond_0

    .line 12
    .line 13
    new-instance v1, Lorg/fourthline/cling/model/ValidationError;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "major"

    .line 20
    .line 21
    const-string v4, "UDA major spec version must be 1"

    .line 22
    .line 23
    invoke-direct {v1, v2, v3, v4}, Lorg/fourthline/cling/model/ValidationError;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/UDAVersion;->getMajor()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-gez v1, :cond_1

    .line 34
    .line 35
    new-instance v1, Lorg/fourthline/cling/model/ValidationError;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v2, "minor"

    .line 42
    .line 43
    const-string v3, "UDA minor spec version must be equal or greater 0"

    .line 44
    .line 45
    invoke-direct {v1, p0, v2, v3}, Lorg/fourthline/cling/model/ValidationError;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    return-object v0
.end method

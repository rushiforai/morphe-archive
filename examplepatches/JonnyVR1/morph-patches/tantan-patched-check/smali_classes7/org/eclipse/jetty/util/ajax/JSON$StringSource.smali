.class public Lorg/eclipse/jetty/util/ajax/JSON$StringSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/ajax/JSON$Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/ajax/JSON;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StringSource"
.end annotation


# instance fields
.field private index:I

.field private scratch:[C

.field private final string:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->string:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->index:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->string:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->scratch:[C

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public next()C
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->string:Ljava/lang/String;

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->index:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->index:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public peek()C
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->string:Ljava/lang/String;

    .line 2
    .line 3
    iget p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->index:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->charAt(I)C

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public scratchBuffer()[C
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->scratch:[C

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->string:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-array v0, v0, [C

    .line 12
    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->scratch:[C

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->scratch:[C

    .line 16
    .line 17
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->string:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iget v3, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->index:I

    .line 10
    .line 11
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "|||"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->string:Ljava/lang/String;

    .line 24
    .line 25
    iget p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$StringSource;->index:I

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

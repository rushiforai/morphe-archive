.class Lorg/aspectj/runtime/reflect/SourceLocationImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/aspectj/lang/reflect/SourceLocation;


# instance fields
.field fileName:Ljava/lang/String;

.field line:I

.field withinType:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/aspectj/runtime/reflect/SourceLocationImpl;->withinType:Ljava/lang/Class;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/aspectj/runtime/reflect/SourceLocationImpl;->fileName:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Lorg/aspectj/runtime/reflect/SourceLocationImpl;->line:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getColumn()I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/aspectj/runtime/reflect/SourceLocationImpl;->fileName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLine()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/aspectj/runtime/reflect/SourceLocationImpl;->line:I

    .line 2
    .line 3
    return p0
.end method

.method public getWithinType()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/aspectj/runtime/reflect/SourceLocationImpl;->withinType:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/aspectj/runtime/reflect/SourceLocationImpl;->getFileName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 11
    .line 12
    .line 13
    const-string v1, ":"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/aspectj/runtime/reflect/SourceLocationImpl;->getLine()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.class public Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;
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
    name = "ReaderSource"
.end annotation


# instance fields
.field private _next:I

.field private _reader:Ljava/io/Reader;

.field private scratch:[C


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_next:I

    .line 6
    .line 7
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_reader:Ljava/io/Reader;

    .line 8
    .line 9
    return-void
.end method

.method private getNext()V
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_next:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_reader:Ljava/io/Reader;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/io/Reader;->read()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_next:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->getNext()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_next:I

    .line 5
    .line 6
    if-gez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->scratch:[C

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public next()C
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->getNext()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_next:I

    .line 5
    .line 6
    int-to-char v0, v0

    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_next:I

    .line 9
    .line 10
    return v0
.end method

.method public peek()C
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->getNext()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_next:I

    .line 5
    .line 6
    int-to-char p0, p0

    .line 7
    return p0
.end method

.method public scratchBuffer()[C
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->scratch:[C

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x400

    .line 6
    .line 7
    new-array v0, v0, [C

    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->scratch:[C

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->scratch:[C

    .line 12
    .line 13
    return-object p0
.end method

.method public setReader(Ljava/io/Reader;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_reader:Ljava/io/Reader;

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    iput p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ReaderSource;->_next:I

    .line 5
    .line 6
    return-void
.end method

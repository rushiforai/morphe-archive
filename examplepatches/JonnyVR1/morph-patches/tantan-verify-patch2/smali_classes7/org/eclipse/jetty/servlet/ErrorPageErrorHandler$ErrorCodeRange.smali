.class Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ErrorCodeRange"
.end annotation


# instance fields
.field private _from:I

.field private _to:I

.field private _uri:Ljava/lang/String;

.field final synthetic this$0:Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->this$0:Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    if-gt p2, p3, :cond_0

    .line 7
    .line 8
    iput p2, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_from:I

    .line 9
    .line 10
    iput p3, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_to:I

    .line 11
    .line 12
    iput-object p4, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_uri:Ljava/lang/String;

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "from>to"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    throw p0
.end method


# virtual methods
.method public getUri()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_uri:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isInRange(I)Z
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_from:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_to:I

    .line 6
    .line 7
    if-gt p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "from: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_from:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",to: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_to:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",uri: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ErrorPageErrorHandler$ErrorCodeRange;->_uri:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

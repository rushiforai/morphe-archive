.class public Lorg/eclipse/jetty/util/Utf8StringBuffer;
.super Lorg/eclipse/jetty/util/Utf8Appendable;
.source "SourceFile"


# instance fields
.field final _buffer:Ljava/lang/StringBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/Utf8Appendable;-><init>(Ljava/lang/Appendable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/util/Utf8Appendable;->_appendable:Ljava/lang/Appendable;

    .line 10
    .line 11
    check-cast v0, Ljava/lang/StringBuffer;

    .line 12
    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/util/Utf8StringBuffer;->_buffer:Ljava/lang/StringBuffer;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 16
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/Utf8Appendable;-><init>(Ljava/lang/Appendable;)V

    .line 17
    iget-object p1, p0, Lorg/eclipse/jetty/util/Utf8Appendable;->_appendable:Ljava/lang/Appendable;

    check-cast p1, Ljava/lang/StringBuffer;

    iput-object p1, p0, Lorg/eclipse/jetty/util/Utf8StringBuffer;->_buffer:Ljava/lang/StringBuffer;

    return-void
.end method

.method private checkState()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/Utf8Appendable;->isUtf8SequenceComplete()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "Tried to read incomplete UTF8 decoded String"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getStringBuffer()Ljava/lang/StringBuffer;
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->checkState()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/Utf8StringBuffer;->_buffer:Ljava/lang/StringBuffer;

    .line 5
    .line 6
    return-object p0
.end method

.method public length()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/Utf8StringBuffer;->_buffer:Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public reset()V
    .locals 1

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/util/Utf8Appendable;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/Utf8StringBuffer;->_buffer:Ljava/lang/StringBuffer;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->checkState()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/Utf8StringBuffer;->_buffer:Ljava/lang/StringBuffer;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.class final Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/ajax/JSON$Output;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/ajax/JSON;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ConvertableOutput"
.end annotation


# instance fields
.field private final _buffer:Ljava/lang/Appendable;

.field c:C

.field final synthetic this$0:Lorg/eclipse/jetty/util/ajax/JSON;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/util/ajax/JSON;Ljava/lang/Appendable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->this$0:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x7b

    .line 7
    .line 8
    iput-char p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    .line 9
    .line 10
    iput-object p2, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/util/ajax/JSON;Ljava/lang/Appendable;Lorg/eclipse/jetty/util/ajax/JSON$1;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;-><init>(Lorg/eclipse/jetty/util/ajax/JSON;Ljava/lang/Appendable;)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 2

    .line 76
    iget-char v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->this$0:Lorg/eclipse/jetty/util/ajax/JSON;

    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-virtual {v0, v1, p1}, Lorg/eclipse/jetty/util/ajax/JSON;->append(Ljava/lang/Appendable;Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 78
    iput-char p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    return-void

    .line 79
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    return-void
.end method

.method public add(Ljava/lang/String;D)V
    .locals 2

    .line 60
    :try_start_0
    iget-char v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    if-eqz v0, :cond_0

    .line 61
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 62
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-static {v0, p1}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quote(Ljava/lang/Appendable;Ljava/lang/String;)V

    .line 63
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    const/16 v0, 0x3a

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 64
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->this$0:Lorg/eclipse/jetty/util/ajax/JSON;

    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    new-instance v1, Ljava/lang/Double;

    invoke-direct {v1, p2, p3}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {p1, v0, v1}, Lorg/eclipse/jetty/util/ajax/JSON;->appendNumber(Ljava/lang/Appendable;Ljava/lang/Number;)V

    const/16 p1, 0x2c

    .line 65
    iput-char p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    return-void

    .line 66
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    .line 67
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-void
.end method

.method public add(Ljava/lang/String;J)V
    .locals 2

    .line 68
    :try_start_0
    iget-char v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    if-eqz v0, :cond_0

    .line 69
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 70
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-static {v0, p1}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quote(Ljava/lang/Appendable;Ljava/lang/String;)V

    .line 71
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    const/16 v0, 0x3a

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 72
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->this$0:Lorg/eclipse/jetty/util/ajax/JSON;

    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lorg/eclipse/jetty/util/ajax/JSON;->appendNumber(Ljava/lang/Appendable;Ljava/lang/Number;)V

    const/16 p1, 0x2c

    .line 73
    iput-char p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    return-void

    .line 74
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    .line 75
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-void
.end method

.method public add(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 52
    :try_start_0
    iget-char v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    if-eqz v0, :cond_0

    .line 53
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 54
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-static {v0, p1}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quote(Ljava/lang/Appendable;Ljava/lang/String;)V

    .line 55
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    const/16 v0, 0x3a

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 56
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->this$0:Lorg/eclipse/jetty/util/ajax/JSON;

    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    invoke-virtual {p1, v0, p2}, Lorg/eclipse/jetty/util/ajax/JSON;->append(Ljava/lang/Appendable;Ljava/lang/Object;)V

    const/16 p1, 0x2c

    .line 57
    iput-char p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    return-void

    .line 58
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    .line 59
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-void
.end method

.method public add(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    :try_start_0
    iget-char v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 6
    .line 7
    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quote(Ljava/lang/Appendable;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 16
    .line 17
    const/16 v0, 0x3a

    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->this$0:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 23
    .line 24
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 25
    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 32
    .line 33
    :goto_0
    invoke-virtual {p1, v0, p2}, Lorg/eclipse/jetty/util/ajax/JSON;->appendBoolean(Ljava/lang/Appendable;Ljava/lang/Boolean;)V

    .line 34
    .line 35
    .line 36
    const/16 p1, 0x2c

    .line 37
    .line 38
    iput-char p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 42
    .line 43
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 44
    .line 45
    .line 46
    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :catch_0
    move-exception p0

    .line 48
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public addClass(Ljava/lang/Class;)V
    .locals 2

    .line 1
    :try_start_0
    iget-char v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 6
    .line 7
    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 11
    .line 12
    const-string v1, "\"class\":"

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->this$0:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 18
    .line 19
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, v1, p1}, Lorg/eclipse/jetty/util/ajax/JSON;->append(Ljava/lang/Appendable;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/16 p1, 0x2c

    .line 29
    .line 30
    iput-char p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 34
    .line 35
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 36
    .line 37
    .line 38
    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public complete()V
    .locals 2

    .line 1
    :try_start_0
    iget-char v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->c:C

    .line 2
    .line 3
    const/16 v1, 0x7b

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 8
    .line 9
    const-string v0, "{}"

    .line 10
    .line 11
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$ConvertableOutput;->_buffer:Ljava/lang/Appendable;

    .line 18
    .line 19
    const-string v0, "}"

    .line 20
    .line 21
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

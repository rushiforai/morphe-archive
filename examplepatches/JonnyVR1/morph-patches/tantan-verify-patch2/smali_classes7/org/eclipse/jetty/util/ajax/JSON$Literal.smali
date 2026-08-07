.class public Lorg/eclipse/jetty/util/ajax/JSON$Literal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/ajax/JSON$Generator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/ajax/JSON;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Literal"
.end annotation


# instance fields
.field private _json:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lorg/eclipse/jetty/util/ajax/JSON;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 5
    .line 6
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Lorg/eclipse/jetty/util/ajax/JSON;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$Literal;->_json:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public addJSON(Ljava/lang/Appendable;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$Literal;->_json:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$Literal;->_json:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

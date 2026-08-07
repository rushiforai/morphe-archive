.class Lorg/eclipse/jetty/http/HttpFields$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/http/HttpFields;->getValues(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Enumeration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Enumeration<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/http/HttpFields;

.field tok:Lorg/eclipse/jetty/util/QuotedStringTokenizer;

.field final synthetic val$e:Ljava/util/Enumeration;

.field final synthetic val$separators:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/http/HttpFields;Ljava/util/Enumeration;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$6;->this$0:Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpFields$6;->val$e:Ljava/util/Enumeration;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/eclipse/jetty/http/HttpFields$6;->val$separators:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$6;->tok:Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$6;->tok:Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->hasMoreElements()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$6;->val$e:Ljava/util/Enumeration;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$6;->val$e:Ljava/util/Enumeration;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/String;

    .line 29
    .line 30
    new-instance v3, Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 31
    .line 32
    iget-object v4, p0, Lorg/eclipse/jetty/http/HttpFields$6;->val$separators:Ljava/lang/String;

    .line 33
    .line 34
    invoke-direct {v3, v0, v4, v2, v2}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 35
    .line 36
    .line 37
    iput-object v3, p0, Lorg/eclipse/jetty/http/HttpFields$6;->tok:Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 38
    .line 39
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->hasMoreElements()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    return v1

    .line 46
    :cond_1
    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$6;->tok:Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 48
    .line 49
    return v2
.end method

.method public bridge synthetic nextElement()Ljava/lang/Object;
    .locals 0

    .line 27
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$6;->nextElement()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public nextElement()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$6;->hasMoreElements()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$6;->tok:Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->nextElement()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    return-object p0

    .line 22
    :cond_1
    invoke-static {}, Ll/mor;->a()V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

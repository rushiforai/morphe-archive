.class Lorg/eclipse/jetty/http/HttpFields$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/http/HttpFields;->getValues(Lorg/eclipse/jetty/io/Buffer;)Ljava/util/Enumeration;
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
.field f:Lorg/eclipse/jetty/http/HttpFields$Field;

.field final synthetic this$0:Lorg/eclipse/jetty/http/HttpFields;

.field final synthetic val$field:Lorg/eclipse/jetty/http/HttpFields$Field;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/http/HttpFields;Lorg/eclipse/jetty/http/HttpFields$Field;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$5;->this$0:Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpFields$5;->val$field:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpFields$5;->f:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$5;->f:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public bridge synthetic nextElement()Ljava/lang/Object;
    .locals 0

    .line 21
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$5;->nextElement()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public nextElement()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$5;->f:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$700(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpFields$5;->f:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValue()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Ll/mor;->a()V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

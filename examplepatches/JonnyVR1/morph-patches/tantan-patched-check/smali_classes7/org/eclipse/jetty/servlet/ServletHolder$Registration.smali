.class public Lorg/eclipse/jetty/servlet/ServletHolder$Registration;
.super Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;
.source "SourceFile"

# interfaces
.implements Ll/fse0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/servlet/ServletHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Registration"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jetty/servlet/Holder<",
        "Ll/yre0;",
        ">.HolderRegistration;",
        "Ll/fse0$a;"
    }
.end annotation


# instance fields
.field protected _multipartConfig:Ll/lu10;

.field final synthetic this$0:Lorg/eclipse/jetty/servlet/ServletHolder;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/servlet/ServletHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;-><init>(Lorg/eclipse/jetty/servlet/Holder;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public varargs addMapping([Ljava/lang/String;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/servlet/Holder;->illegalStateIfContextStarted()V

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, v0, :cond_2

    .line 10
    .line 11
    aget-object v3, p1, v2

    .line 12
    .line 13
    iget-object v4, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 14
    .line 15
    iget-object v4, v4, Lorg/eclipse/jetty/servlet/Holder;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 16
    .line 17
    invoke-virtual {v4, v3}, Lorg/eclipse/jetty/servlet/ServletHandler;->getServletMapping(Ljava/lang/String;)Lorg/eclipse/jetty/servlet/ServletMapping;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    invoke-virtual {v4}, Lorg/eclipse/jetty/servlet/ServletMapping;->isDefault()Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-nez v4, :cond_1

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    new-instance v1, Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    if-eqz v1, :cond_3

    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_3
    new-instance v0, Lorg/eclipse/jetty/servlet/ServletMapping;

    .line 46
    .line 47
    invoke-direct {v0}, Lorg/eclipse/jetty/servlet/ServletMapping;-><init>()V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 51
    .line 52
    invoke-virtual {v1}, Lorg/eclipse/jetty/servlet/Holder;->getName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/servlet/ServletMapping;->setServletName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/servlet/ServletMapping;->setPathSpecs([Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 63
    .line 64
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/Holder;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/servlet/ServletHandler;->addServletMapping(Lorg/eclipse/jetty/servlet/ServletMapping;)V

    .line 67
    .line 68
    .line 69
    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 70
    .line 71
    return-object p0
.end method

.method public bridge synthetic getClassName()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;->getClassName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getInitOrder()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/ServletHolder;->getInitOrder()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic getInitParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getInitParameters()Ljava/util/Map;
    .locals 0

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;->getInitParameters()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMappings()Ljava/util/Collection;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/eclipse/jetty/servlet/Holder;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 4
    .line 5
    invoke-virtual {v0}, Lorg/eclipse/jetty/servlet/ServletHandler;->getServletMappings()[Lorg/eclipse/jetty/servlet/ServletMapping;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    array-length v2, v0

    .line 17
    const/4 v3, 0x0

    .line 18
    :goto_0
    if-ge v3, v2, :cond_2

    .line 19
    .line 20
    aget-object v4, v0, v3

    .line 21
    .line 22
    invoke-virtual {v4}, Lorg/eclipse/jetty/servlet/ServletMapping;->getServletName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-nez v5, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    invoke-virtual {v4}, Lorg/eclipse/jetty/servlet/ServletMapping;->getPathSpecs()[Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    if-eqz v4, :cond_1

    .line 42
    .line 43
    array-length v5, v4

    .line 44
    if-lez v5, :cond_1

    .line 45
    .line 46
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-interface {v1, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    return-object v1
.end method

.method public getMultipartConfig()Ll/lu10;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->_multipartConfig:Ll/lu10;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getName()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getRunAsRole()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/servlet/ServletHolder;->access$100(Lorg/eclipse/jetty/servlet/ServletHolder;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic setAsyncSupported(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;->setAsyncSupported(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setDescription(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;->setDescription(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setInitParameter(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;->setInitParameter(Ljava/lang/String;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic setInitParameters(Ljava/util/Map;)Ljava/util/Set;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/servlet/Holder$HolderRegistration;->setInitParameters(Ljava/util/Map;)Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setLoadOnStartup(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/servlet/Holder;->illegalStateIfContextStarted()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/ServletHolder;->setInitOrder(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMultipartConfig(Ll/lu10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->_multipartConfig:Ll/lu10;

    .line 2
    .line 3
    return-void
.end method

.method public setRunAsRole(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lorg/eclipse/jetty/servlet/ServletHolder;->access$102(Lorg/eclipse/jetty/servlet/ServletHolder;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setServletSecurity(Ll/nse0;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nse0;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Registration;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/eclipse/jetty/servlet/Holder;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/eclipse/jetty/servlet/ServletHandler;->setServletSecurity(Ll/fse0$a;Ll/nse0;)Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

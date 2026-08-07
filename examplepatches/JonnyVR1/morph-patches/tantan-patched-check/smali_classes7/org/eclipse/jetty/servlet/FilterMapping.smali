.class public Lorg/eclipse/jetty/servlet/FilterMapping;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/component/Dumpable;


# static fields
.field public static final ALL:I = 0x1f

.field public static final ASYNC:I = 0x10

.field public static final DEFAULT:I = 0x0

.field public static final ERROR:I = 0x8

.field public static final FORWARD:I = 0x2

.field public static final INCLUDE:I = 0x4

.field public static final REQUEST:I = 0x1


# instance fields
.field private _dispatches:I

.field private _filterName:Ljava/lang/String;

.field private transient _holder:Lorg/eclipse/jetty/servlet/FilterHolder;

.field private _pathSpecs:[Ljava/lang/String;

.field private _servletNames:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 6
    .line 7
    return-void
.end method

.method public static dispatch(Ljavax/servlet/DispatcherType;)I
    .locals 3

    .line 61
    sget-object v0, Lorg/eclipse/jetty/servlet/FilterMapping$1;->$SwitchMap$javax$servlet$DispatcherType:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/16 p0, 0x8

    return p0

    .line 62
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return v1

    :cond_2
    const/16 p0, 0x10

    return p0

    :cond_3
    return v1
.end method

.method public static dispatch(Ljava/lang/String;)Ljavax/servlet/DispatcherType;
    .locals 1

    .line 1
    const-string v0, "request"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ljavax/servlet/DispatcherType;->REQUEST:Ljavax/servlet/DispatcherType;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "forward"

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object p0, Ljavax/servlet/DispatcherType;->FORWARD:Ljavax/servlet/DispatcherType;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string v0, "include"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    sget-object p0, Ljavax/servlet/DispatcherType;->INCLUDE:Ljavax/servlet/DispatcherType;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string v0, "error"

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    sget-object p0, Ljavax/servlet/DispatcherType;->ERROR:Ljavax/servlet/DispatcherType;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    const-string v0, "async"

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    sget-object p0, Ljavax/servlet/DispatcherType;->ASYNC:Ljavax/servlet/DispatcherType;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_4
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method


# virtual methods
.method public appliesTo(I)Z
    .locals 3

    .line 30
    iget v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    if-eq p1, v2, :cond_1

    const/16 v0, 0x10

    if-ne p1, v0, :cond_0

    .line 31
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_holder:Lorg/eclipse/jetty/servlet/FilterHolder;

    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/Holder;->isAsyncSupported()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    :goto_0
    return v2

    :cond_2
    and-int p0, v0, p1

    if-eqz p0, :cond_3

    return v2

    :cond_3
    return v1
.end method

.method public appliesTo(Ljava/lang/String;I)Z
    .locals 3

    .line 1
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/servlet/FilterMapping;->appliesTo(I)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    move p2, v0

    .line 9
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_pathSpecs:[Ljava/lang/String;

    .line 10
    .line 11
    array-length v2, v1

    .line 12
    if-ge p2, v2, :cond_1

    .line 13
    .line 14
    aget-object v1, v1, p2

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-static {v1, p1, v2}, Lorg/eclipse/jetty/http/PathMap;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v0
.end method

.method public dump()Ljava/lang/String;
    .locals 0

    .line 15
    invoke-static {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->dump(Lorg/eclipse/jetty/util/component/Dumpable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public dump(Ljava/lang/Appendable;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "\n"

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getFilterHolder()Lorg/eclipse/jetty/servlet/FilterHolder;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_holder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFilterName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_filterName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPathSpecs()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_pathSpecs:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getServletNames()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_servletNames:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDispatcherTypes(Ljava/util/EnumSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet<",
            "Ljavax/servlet/DispatcherType;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 3
    .line 4
    if-eqz p1, :cond_4

    .line 5
    .line 6
    sget-object v0, Ljavax/servlet/DispatcherType;->ERROR:Ljavax/servlet/DispatcherType;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 15
    .line 16
    or-int/lit8 v0, v0, 0x8

    .line 17
    .line 18
    iput v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 19
    .line 20
    :cond_0
    sget-object v0, Ljavax/servlet/DispatcherType;->FORWARD:Ljavax/servlet/DispatcherType;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 29
    .line 30
    or-int/lit8 v0, v0, 0x2

    .line 31
    .line 32
    iput v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 33
    .line 34
    :cond_1
    sget-object v0, Ljavax/servlet/DispatcherType;->INCLUDE:Ljavax/servlet/DispatcherType;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 43
    .line 44
    or-int/lit8 v0, v0, 0x4

    .line 45
    .line 46
    iput v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 47
    .line 48
    :cond_2
    sget-object v0, Ljavax/servlet/DispatcherType;->REQUEST:Ljavax/servlet/DispatcherType;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 57
    .line 58
    or-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    iput v0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 61
    .line 62
    :cond_3
    sget-object v0, Ljavax/servlet/DispatcherType;->ASYNC:Ljavax/servlet/DispatcherType;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    iget p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 71
    .line 72
    or-int/lit8 p1, p1, 0x10

    .line 73
    .line 74
    iput p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 75
    .line 76
    :cond_4
    return-void
.end method

.method public setDispatches(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 2
    .line 3
    return-void
.end method

.method public setFilterHolder(Lorg/eclipse/jetty/servlet/FilterHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_holder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/eclipse/jetty/servlet/Holder;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/FilterMapping;->setFilterName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setFilterName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_filterName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPathSpec(Ljava/lang/String;)V
    .locals 0

    .line 1
    filled-new-array {p1}, [Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_pathSpecs:[Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public setPathSpecs([Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_pathSpecs:[Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setServletName(Ljava/lang/String;)V
    .locals 0

    .line 1
    filled-new-array {p1}, [Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_servletNames:[Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public setServletNames([Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_servletNames:[Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_pathSpecs:[Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1}, Lorg/eclipse/jetty/util/TypeUtil;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "/"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_servletNames:[Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Lorg/eclipse/jetty/util/TypeUtil;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "=="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_dispatches:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, "=>"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterMapping;->_filterName:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.class public final Ll/dpw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/bow0;

.field public final b:Ll/cpw0;


# direct methods
.method public constructor <init>(Ll/cpw0;)V
    .locals 1

    .line 1
    sget-object v0, Ll/aow0;->b:Ll/bow0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/dpw0;->b:Ll/cpw0;

    .line 7
    .line 8
    iput-object v0, p0, Ll/dpw0;->a:Ll/bow0;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Ll/dpw0;)Ll/bow0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dpw0;->a:Ll/bow0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static b(I)Ll/dpw0;
    .locals 2

    .line 1
    new-instance p0, Ll/dpw0;

    .line 2
    .line 3
    new-instance v0, Ll/zow0;

    .line 4
    .line 5
    const/16 v1, 0xfa0

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ll/zow0;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Ll/dpw0;-><init>(Ll/cpw0;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public static c(Ll/bow0;)Ll/dpw0;
    .locals 2

    .line 1
    new-instance v0, Ll/dpw0;

    .line 2
    .line 3
    new-instance v1, Ll/xow0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/xow0;-><init>(Ll/bow0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/dpw0;-><init>(Ll/cpw0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static bridge synthetic e(Ll/dpw0;Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dpw0;->g(Ljava/lang/CharSequence;)Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public final d(Ljava/lang/CharSequence;)Ljava/lang/Iterable;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/apw0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/apw0;-><init>(Ll/dpw0;Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public final f(Ljava/lang/CharSequence;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/dpw0;->g(Ljava/lang/CharSequence;)Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final g(Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dpw0;->b:Ll/cpw0;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Ll/cpw0;->a(Ll/dpw0;Ljava/lang/CharSequence;)Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

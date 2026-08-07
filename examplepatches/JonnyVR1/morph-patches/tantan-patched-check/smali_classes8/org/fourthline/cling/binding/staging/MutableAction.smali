.class public Lorg/fourthline/cling/binding/staging/MutableAction;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public arguments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/fourthline/cling/binding/staging/MutableActionArgument;",
            ">;"
        }
    .end annotation
.end field

.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/fourthline/cling/binding/staging/MutableAction;->arguments:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public build()Lorg/fourthline/cling/model/meta/Action;
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/meta/Action;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/fourthline/cling/binding/staging/MutableAction;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/fourthline/cling/binding/staging/MutableAction;->createActionArgumennts()[Lorg/fourthline/cling/model/meta/ActionArgument;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, v1, p0}, Lorg/fourthline/cling/model/meta/Action;-><init>(Ljava/lang/String;[Lorg/fourthline/cling/model/meta/ActionArgument;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public createActionArgumennts()[Lorg/fourthline/cling/model/meta/ActionArgument;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/binding/staging/MutableAction;->arguments:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [Lorg/fourthline/cling/model/meta/ActionArgument;

    .line 8
    .line 9
    iget-object p0, p0, Lorg/fourthline/cling/binding/staging/MutableAction;->arguments:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lorg/fourthline/cling/binding/staging/MutableActionArgument;

    .line 27
    .line 28
    add-int/lit8 v3, v1, 0x1

    .line 29
    .line 30
    invoke-virtual {v2}, Lorg/fourthline/cling/binding/staging/MutableActionArgument;->build()Lorg/fourthline/cling/model/meta/ActionArgument;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    aput-object v2, v0, v1

    .line 35
    .line 36
    move v1, v3

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object v0
.end method

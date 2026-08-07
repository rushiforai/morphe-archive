.class public final Lcom/hellogroup/fep/feppkg/core/FepPackageManager$b;
.super Ll/dgi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->u(ZLcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;Ll/tc60;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\t\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "com/hellogroup/fep/feppkg/core/FepPackageManager$b",
        "Ll/dgi;",
        "Lcom/hellogroup/fep/config/core/FepConfigManager;",
        "manager",
        "",
        "isLocalData",
        "Lcom/hellogroup/fep/config/model/FepConfigFetchType;",
        "type",
        "",
        "b",
        "(Lcom/hellogroup/fep/config/core/FepConfigManager;ZLcom/hellogroup/fep/config/model/FepConfigFetchType;)V",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/fep/feppkg/core/FepPackageManager;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/feppkg/core/FepPackageManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$b;->a:Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dgi;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/hellogroup/fep/config/core/FepConfigManager;ZLcom/hellogroup/fep/config/model/FepConfigFetchType;)V
    .locals 1
    .param p1    # Lcom/hellogroup/fep/config/core/FepConfigManager;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/hellogroup/fep/config/model/FepConfigFetchType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/hellogroup/fep/config/model/FepConfigFetchType;->LAUNCH:Lcom/hellogroup/fep/config/model/FepConfigFetchType;

    .line 8
    .line 9
    if-ne p3, v0, :cond_3

    .line 10
    .line 11
    if-nez p2, :cond_3

    .line 12
    .line 13
    const-string p2, "downloadMk"

    .line 14
    .line 15
    const/4 p3, 0x2

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, p2, v0, p3, v0}, Lcom/hellogroup/fep/config/core/FepConfigManager;->l(Lcom/hellogroup/fep/config/core/FepConfigManager;Ljava/lang/String;Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Ll/kt0;->l(Ljava/lang/Object;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    move-object p2, p1

    .line 28
    check-cast p2, Ljava/util/Collection;

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_0

    .line 35
    .line 36
    move-object v0, p1

    .line 37
    :cond_0
    if-eqz v0, :cond_3

    .line 38
    .line 39
    check-cast v0, Ljava/lang/Iterable;

    .line 40
    .line 41
    new-instance p1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    if-eqz p3, :cond_2

    .line 55
    .line 56
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    invoke-static {p3}, Ll/kt0;->n(Ljava/lang/Object;)Ljava/util/Map;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    if-eqz p3, :cond_1

    .line 65
    .line 66
    invoke-interface {p1, p3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$b;->a:Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->p(Ljava/util/List;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    return-void
.end method

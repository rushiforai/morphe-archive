.class public final Ll/qry;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/izl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/izl<",
        "Ll/hzl<",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0003\u0018\u00002\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J#\u0010\t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Ll/qry;",
        "Ll/izl;",
        "Ll/hzl;",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/data/ProductCategory;",
        "category",
        "",
        "a",
        "(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/ProductCategory;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            ")",
            "Ljava/util/List<",
            "Ll/hzl<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/hry;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/hry;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    new-instance p1, Ll/iry;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/iry;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance p1, Ll/kry;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/kry;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/fry;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/fry;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    new-instance p1, Ll/lry;

    .line 42
    .line 43
    invoke-direct {p1}, Ll/lry;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/jry;

    .line 50
    .line 51
    invoke-direct {p1}, Ll/jry;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    new-instance p1, Ll/bry;

    .line 58
    .line 59
    invoke-direct {p1}, Ll/bry;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    return-object p0
.end method

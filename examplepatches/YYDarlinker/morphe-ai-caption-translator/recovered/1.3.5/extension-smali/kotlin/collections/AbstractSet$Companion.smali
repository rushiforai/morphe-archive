.class public final Lkotlin/collections/AbstractSet$Companion;
.super Ljava/lang/Object;
.source "AbstractSet.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/collections/AbstractSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u001e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0010\"\n\u0002\u0008\u0003\u0008\u0080\u0003\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001b\u0010\u0004\u001a\u00020\u00052\n\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u0007H\u0080\u0080\u0004\u00a2\u0006\u0002\u0008\u0008J\'\u0010\t\u001a\u00020\n2\n\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u000b2\n\u0010\u000c\u001a\u0006\u0012\u0002\u0008\u00030\u000bH\u0080\u0080\u0004\u00a2\u0006\u0002\u0008\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lkotlin/collections/AbstractSet$Companion;",
        "",
        "<init>",
        "()V",
        "unorderedHashCode",
        "",
        "c",
        "",
        "unorderedHashCode$kotlin_stdlib",
        "setEquals",
        "",
        "",
        "other",
        "setEquals$kotlin_stdlib",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lkotlin/collections/AbstractSet$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final setEquals$kotlin_stdlib(Ljava/util/Set;Ljava/util/Set;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "*>;",
            "Ljava/util/Set<",
            "*>;)Z"
        }
    .end annotation

    const-string p0, "c"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "other"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result v0

    if-eq p0, v0, :cond_16

    const/4 p0, 0x0

    return p0

    .line 44
    :cond_16
    check-cast p2, Ljava/util/Collection;

    invoke-interface {p1, p2}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method public final unorderedHashCode$kotlin_stdlib(Ljava/util/Collection;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)I"
        }
    .end annotation

    const-string p0, "c"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 p1, 0x0

    move v0, p1

    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1c

    .line 37
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_1d

    :cond_1c
    move v1, p1

    :goto_1d
    add-int/2addr v0, v1

    goto :goto_b

    :cond_1f
    return v0
.end method

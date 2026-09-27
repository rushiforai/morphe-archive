.class public abstract Lkotlin/collections/AbstractMutableCollection;
.super Ljava/util/AbstractCollection;
.source "AbstractMutableCollection.kt"

# interfaces
.implements Ljava/util/Collection;
.implements Lkotlin/jvm/internal/markers/KMutableCollection;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractCollection<",
        "TE;>;",
        "Ljava/util/Collection<",
        "TE;>;",
        "Lkotlin/jvm/internal/markers/KMutableCollection;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u001f\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\'\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B\t\u0008D\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001b\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00028\u0000H\u00a7\u0080\u0008b\u0002\u0008\n\u00a2\u0006\u0002\u0010\t\u00ca\u0001\u000c\u0008\u000c\u0012\u0008\u0008\r\u0012\u0004\u0008\u0008(\u000e\u00a8\u0006\u000b"
    }
    d2 = {
        "Lkotlin/collections/AbstractMutableCollection;",
        "E",
        "",
        "Ljava/util/AbstractCollection;",
        "<init>",
        "()V",
        "add",
        "",
        "element",
        "(Ljava/lang/Object;)Z",
        "Lkotlin/IgnorableReturnValue;",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1"
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
.method protected constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract add(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .annotation runtime Lkotlin/IgnorableReturnValue;
    .end annotation
.end method

.method public abstract getSize()I
.end method

.method public final bridge size()I
    .registers 1

    .line 15
    invoke-virtual {p0}, Lkotlin/collections/AbstractMutableCollection;->getSize()I

    move-result p0

    return p0
.end method

.class public interface abstract Lkotlin/collections/Grouping;
.super Ljava/lang/Object;
.source "Grouping.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010(\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008g\u0018\u0000*\u0004\u0008\u0000\u0010\u0001*\u0006\u0008\u0001\u0010\u0002 \u00012\u00020\u0003J\u0010\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005H\u00a6\u0080\u0004J\u0017\u0010\u0006\u001a\u00028\u00012\u0006\u0010\u0007\u001a\u00028\u0000H\u00a6\u0080\u0004\u00a2\u0006\u0002\u0010\u0008\u00ca\u0001\u000c\u0008\n\u0012\u0008\u0008\u000b\u0012\u0004\u0008\u0008(\u000c\u00a8\u0006\t"
    }
    d2 = {
        "Lkotlin/collections/Grouping;",
        "T",
        "K",
        "",
        "sourceIterator",
        "",
        "keyOf",
        "element",
        "(Ljava/lang/Object;)Ljava/lang/Object;",
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


# virtual methods
.method public abstract keyOf(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TK;"
        }
    .end annotation
.end method

.method public abstract sourceIterator()Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation
.end method

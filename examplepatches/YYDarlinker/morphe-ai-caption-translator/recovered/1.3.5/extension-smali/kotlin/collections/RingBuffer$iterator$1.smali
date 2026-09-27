.class public final Lkotlin/collections/RingBuffer$iterator$1;
.super Lkotlin/collections/AbstractIterator;
.source "SlidingWindow.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/collections/RingBuffer;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/collections/AbstractIterator<",
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSlidingWindow.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SlidingWindow.kt\nkotlin/collections/RingBuffer$iterator$1\n+ 2 SlidingWindow.kt\nkotlin/collections/RingBuffer\n*L\n1#1,206:1\n204#2:207\n*S KotlinDebug\n*F\n+ 1 SlidingWindow.kt\nkotlin/collections/RingBuffer$iterator$1\n*L\n121#1:207\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00028\u00000\u0001J\n\u0010\u0005\u001a\u00020\u0006H\u0094\u0080\u0004R\u000f\u0010\u0002\u001a\u00020\u0003X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0004\u001a\u00020\u0003X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0007"
    }
    d2 = {
        "kotlin/collections/RingBuffer$iterator$1",
        "Lkotlin/collections/AbstractIterator;",
        "count",
        "",
        "index",
        "computeNext",
        "",
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


# instance fields
.field private count:I

.field private index:I

.field final synthetic this$0:Lkotlin/collections/RingBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/collections/RingBuffer<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lkotlin/collections/RingBuffer;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/collections/RingBuffer<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lkotlin/collections/RingBuffer$iterator$1;->this$0:Lkotlin/collections/RingBuffer;

    .line 111
    invoke-direct {p0}, Lkotlin/collections/AbstractIterator;-><init>()V

    .line 112
    invoke-virtual {p1}, Lkotlin/collections/RingBuffer;->size()I

    move-result v0

    iput v0, p0, Lkotlin/collections/RingBuffer$iterator$1;->count:I

    .line 113
    # getter for: Lkotlin/collections/RingBuffer;->startIndex:I
    invoke-static {p1}, Lkotlin/collections/RingBuffer;->access$getStartIndex$p(Lkotlin/collections/RingBuffer;)I

    move-result p1

    iput p1, p0, Lkotlin/collections/RingBuffer$iterator$1;->index:I

    return-void
.end method


# virtual methods
.method protected computeNext()V
    .registers 3

    .line 116
    iget v0, p0, Lkotlin/collections/RingBuffer$iterator$1;->count:I

    if-nez v0, :cond_8

    .line 117
    invoke-virtual {p0}, Lkotlin/collections/RingBuffer$iterator$1;->done()V

    return-void

    .line 120
    :cond_8
    iget-object v0, p0, Lkotlin/collections/RingBuffer$iterator$1;->this$0:Lkotlin/collections/RingBuffer;

    # getter for: Lkotlin/collections/RingBuffer;->buffer:[Ljava/lang/Object;
    invoke-static {v0}, Lkotlin/collections/RingBuffer;->access$getBuffer$p(Lkotlin/collections/RingBuffer;)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lkotlin/collections/RingBuffer$iterator$1;->index:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lkotlin/collections/RingBuffer$iterator$1;->setNext(Ljava/lang/Object;)V

    .line 121
    iget-object v0, p0, Lkotlin/collections/RingBuffer$iterator$1;->this$0:Lkotlin/collections/RingBuffer;

    iget v1, p0, Lkotlin/collections/RingBuffer$iterator$1;->index:I

    add-int/lit8 v1, v1, 0x1

    .line 207
    # getter for: Lkotlin/collections/RingBuffer;->capacity:I
    invoke-static {v0}, Lkotlin/collections/RingBuffer;->access$getCapacity$p(Lkotlin/collections/RingBuffer;)I

    move-result v0

    rem-int/2addr v1, v0

    .line 121
    iput v1, p0, Lkotlin/collections/RingBuffer$iterator$1;->index:I

    .line 122
    iget v0, p0, Lkotlin/collections/RingBuffer$iterator$1;->count:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lkotlin/collections/RingBuffer$iterator$1;->count:I

    return-void
.end method

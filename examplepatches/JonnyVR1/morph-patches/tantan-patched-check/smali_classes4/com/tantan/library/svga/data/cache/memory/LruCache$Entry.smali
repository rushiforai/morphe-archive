.class public final Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/cache/memory/LruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Y:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0080\u0008\u0018\u0000*\u0004\u0008\u0002\u0010\u00012\u00020\u0002B\u0015\u0012\u0006\u0010\u0003\u001a\u00028\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u000e\u0010\u000e\u001a\u00028\u0002H\u00c6\u0003\u00a2\u0006\u0002\u0010\u000cJ\t\u0010\u000f\u001a\u00020\u0005H\u00c6\u0003J(\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00028\u00020\u00002\u0008\u0008\u0002\u0010\u0003\u001a\u00028\u00022\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005H\u00c6\u0001\u00a2\u0006\u0002\u0010\u0011J\u0013\u0010\u0012\u001a\u00020\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0002H\u00d6\u0003J\t\u0010\u0015\u001a\u00020\u0016H\u00d6\u0001J\t\u0010\u0017\u001a\u00020\u0018H\u00d6\u0001R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u0013\u0010\u0003\u001a\u00028\u0002\u00a2\u0006\n\n\u0002\u0010\r\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;",
        "Y",
        "",
        "value",
        "size",
        "",
        "(Ljava/lang/Object;J)V",
        "getSize",
        "()J",
        "setSize",
        "(J)V",
        "getValue",
        "()Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "component1",
        "component2",
        "copy",
        "(Ljava/lang/Object;J)Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private size:J

.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TY;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TY;J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->value:Ljava/lang/Object;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic copy$default(Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;Ljava/lang/Object;JILjava/lang/Object;)Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->value:Ljava/lang/Object;

    :cond_0
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_1

    iget-wide p2, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->copy(Ljava/lang/Object;J)Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TY;"
        }
    .end annotation

    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->value:Ljava/lang/Object;

    return-object p0
.end method

.method public final component2()J
    .locals 2

    iget-wide v0, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    return-wide v0
.end method

.method public final copy(Ljava/lang/Object;J)Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TY;J)",
            "Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry<",
            "TY;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;

    invoke-direct {p0, p1, p2, p3}, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;-><init>(Ljava/lang/Object;J)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;

    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->value:Ljava/lang/Object;

    iget-object v3, p1, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->value:Ljava/lang/Object;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-wide v3, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    iget-wide p0, p1, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    cmp-long p0, v3, p0

    if-eqz p0, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final getSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getValue()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TY;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->value:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public final setSize(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Entry(value="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/tantan/library/svga/data/cache/memory/LruCache$Entry;->size:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

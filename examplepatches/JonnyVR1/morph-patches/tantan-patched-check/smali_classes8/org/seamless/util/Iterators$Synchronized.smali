.class public abstract Lorg/seamless/util/Iterators$Synchronized;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/util/Iterators;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Synchronized"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TE;>;"
    }
.end annotation


# instance fields
.field nextIndex:I

.field removedCurrent:Z

.field final wrapped:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "TE;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/seamless/util/Iterators$Synchronized;->nextIndex:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lorg/seamless/util/Iterators$Synchronized;->removedCurrent:Z

    .line 8
    .line 9
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lorg/seamless/util/Iterators$Synchronized;->wrapped:Ljava/util/Iterator;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/Iterators$Synchronized;->wrapped:Ljava/util/Iterator;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lorg/seamless/util/Iterators$Synchronized;->removedCurrent:Z

    .line 3
    .line 4
    iget v0, p0, Lorg/seamless/util/Iterators$Synchronized;->nextIndex:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, Lorg/seamless/util/Iterators$Synchronized;->nextIndex:I

    .line 9
    .line 10
    iget-object p0, p0, Lorg/seamless/util/Iterators$Synchronized;->wrapped:Ljava/util/Iterator;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public remove()V
    .locals 2

    .line 1
    iget v0, p0, Lorg/seamless/util/Iterators$Synchronized;->nextIndex:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lorg/seamless/util/Iterators$Synchronized;->removedCurrent:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    sub-int/2addr v0, v1

    .line 11
    invoke-virtual {p0, v0}, Lorg/seamless/util/Iterators$Synchronized;->synchronizedRemove(I)V

    .line 12
    .line 13
    .line 14
    iput-boolean v1, p0, Lorg/seamless/util/Iterators$Synchronized;->removedCurrent:Z

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "Already removed current, call next()"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string p0, "Call next() first"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public abstract synchronizedRemove(I)V
.end method

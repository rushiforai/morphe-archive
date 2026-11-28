.class final Lnicoid/network238/okhttp3/internal/LinkedTags;
.super Lnicoid/network238/okhttp3/internal/Tags;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Lnicoid/network238/okhttp3/internal/Tags;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u000e\n\u0000\u0008\u0002\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u00020\u0003B%\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005\u0012\u0006\u0010\u0006\u001a\u00028\u0000\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0008\u0010\tJ/\u0010\u000b\u001a\u00020\u0003\"\u0008\u0008\u0001\u0010\u000c*\u00020\u00022\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u0002H\u000c0\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u0001H\u000cH\u0016\u00a2\u0006\u0002\u0010\rJ(\u0010\u000e\u001a\u0004\u0018\u0001H\u000c\"\u0008\u0008\u0001\u0010\u000c*\u00020\u00022\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u0002H\u000c0\u0005H\u0096\u0002\u00a2\u0006\u0002\u0010\u000fJ\u0008\u0010\u0010\u001a\u00020\u0011H\u0016R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00028\u0000X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\nR\u000e\u0010\u0007\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/LinkedTags;",
        "K",
        "",
        "Lnicoid/network238/okhttp3/internal/Tags;",
        "key",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "value",
        "next",
        "<init>",
        "(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;Lnicoid/network238/okhttp3/internal/Tags;)V",
        "Ljava/lang/Object;",
        "plus",
        "T",
        "(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;",
        "get",
        "(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;",
        "toString",
        "",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final key:Lnicoid/network238/kotlin/reflect/KClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/kotlin/reflect/KClass;"
        }
    .end annotation
.end field

.field private final next:Lnicoid/network238/okhttp3/internal/Tags;

.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;Lnicoid/network238/okhttp3/internal/Tags;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            "TK;",
            "Lnicoid/network238/okhttp3/internal/Tags;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/Tags;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 66
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->key:Lnicoid/network238/kotlin/reflect/KClass;

    .line 67
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->value:Ljava/lang/Object;

    .line 68
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->next:Lnicoid/network238/okhttp3/internal/Tags;

    return-void
.end method

.method static final toString$lambda$0(Lnicoid/network238/okhttp3/internal/LinkedTags;)Lnicoid/network238/okhttp3/internal/LinkedTags;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->next:Lnicoid/network238/okhttp3/internal/Tags;

    instance-of v0, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;

    if-eqz v0, :cond_0

    check-cast p0, Lnicoid/network238/okhttp3/internal/LinkedTags;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method static final toString$lambda$1(Lnicoid/network238/okhttp3/internal/LinkedTags;)Ljava/lang/CharSequence;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->key:Lnicoid/network238/kotlin/reflect/KClass;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->value:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public get(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->key:Lnicoid/network238/kotlin/reflect/KClass;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getJavaClass(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->value:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 104
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->next:Lnicoid/network238/okhttp3/internal/Tags;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/Tags;->get(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public plus(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            "TT;)",
            "Lnicoid/network238/okhttp3/internal/Tags;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->key:Lnicoid/network238/kotlin/reflect/KClass;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 84
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->next:Lnicoid/network238/okhttp3/internal/Tags;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {v1, p1, v0}, Lnicoid/network238/okhttp3/internal/Tags;->plus(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;

    move-result-object v0

    .line 86
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->next:Lnicoid/network238/okhttp3/internal/Tags;

    if-ne v0, v1, :cond_0

    move-object v1, p0

    goto :goto_0

    .line 89
    :cond_0
    new-instance v1, Lnicoid/network238/okhttp3/internal/LinkedTags;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->key:Lnicoid/network238/kotlin/reflect/KClass;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/LinkedTags;->value:Ljava/lang/Object;

    invoke-direct {v1, v2, v3, v0}, Lnicoid/network238/okhttp3/internal/LinkedTags;-><init>(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;Lnicoid/network238/okhttp3/internal/Tags;)V

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 96
    new-instance v0, Lnicoid/network238/okhttp3/internal/LinkedTags;

    invoke-direct {v0, p1, p2, v1}, Lnicoid/network238/okhttp3/internal/LinkedTags;-><init>(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;Lnicoid/network238/okhttp3/internal/Tags;)V

    return-object v0

    :cond_2
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 11

    .line 109
    new-instance v0, Lnicoid/network238/okhttp3/internal/LinkedTags$0;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/LinkedTags$0;-><init>()V

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/sequences/SequencesKt;->generateSequence(Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object v0

    .line 110
    invoke-static {v0}, Lnicoid/network238/kotlin/sequences/SequencesKt;->toList(Lnicoid/network238/kotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v0

    .line 111
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->reversed(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    .line 112
    new-instance v7, Lnicoid/network238/okhttp3/internal/LinkedTags$1;

    invoke-direct {v7}, Lnicoid/network238/okhttp3/internal/LinkedTags$1;-><init>()V

    const/16 v8, 0x19

    const/4 v9, 0x0

    const/4 v2, 0x0

    const-string v3, "{"

    const-string v4, "}"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v1 .. v9}, Lnicoid/network238/kotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

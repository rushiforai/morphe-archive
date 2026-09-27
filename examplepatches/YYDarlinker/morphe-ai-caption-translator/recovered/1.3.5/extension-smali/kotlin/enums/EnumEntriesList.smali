.class final Lkotlin/enums/EnumEntriesList;
.super Lkotlin/collections/AbstractList;
.source "EnumEntries.kt"

# interfaces
.implements Lkotlin/enums/EnumEntries;
.implements Ljava/util/RandomAccess;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Enum<",
        "TT;>;>",
        "Lkotlin/collections/AbstractList<",
        "TT;>;",
        "Lkotlin/enums/EnumEntries<",
        "TT;>;",
        "Ljava/util/RandomAccess;",
        "Ljava/io/Serializable;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0003\u0018\u0000*\u000e\u0008\u0000\u0010\u0001*\u0008\u0012\u0004\u0012\u0002H\u00010\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u00032\u0008\u0012\u0004\u0012\u0002H\u00010\u00042\u00060\u0005j\u0002`\u00062\u00060\u0007j\u0002`\u0008B\u0017\u0008F\u0012\u000c\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00000\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020\u000fH\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u0014J\u0017\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00028\u0000H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u0018J\u0017\u0010\u0019\u001a\u00020\u000f2\u0006\u0010\u0017\u001a\u00028\u0000H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010\u001aJ\u0017\u0010\u001b\u001a\u00020\u000f2\u0006\u0010\u0017\u001a\u00028\u0000H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010\u001aJ\n\u0010\u001c\u001a\u00020\u001dH\u0082\u0080\u0004J\u001b\u0010\u001e\u001a\u00020\u001f2\n\u0010 \u001a\u00060!j\u0002`\"H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010#R\u0017\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00000\nX\u0082\u0084\u0008\u00a2\u0006\u0004\n\u0002\u0010\rR\u0015\u0010\u000e\u001a\u00020\u000f8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011\u00ca\u0001\u000c\u0008%\u0012\u0008\u0008&\u0012\u0004\u0008\u0008(\'\u00a8\u0006$"
    }
    d2 = {
        "Lkotlin/enums/EnumEntriesList;",
        "T",
        "",
        "Lkotlin/enums/EnumEntries;",
        "Lkotlin/collections/AbstractList;",
        "Ljava/util/RandomAccess;",
        "Lkotlin/collections/RandomAccess;",
        "Ljava/io/Serializable;",
        "Lkotlin/io/Serializable;",
        "entries",
        "",
        "<init>",
        "([Ljava/lang/Enum;)V",
        "[Ljava/lang/Enum;",
        "size",
        "",
        "getSize",
        "()I",
        "get",
        "index",
        "(I)Ljava/lang/Enum;",
        "contains",
        "",
        "element",
        "(Ljava/lang/Enum;)Z",
        "indexOf",
        "(Ljava/lang/Enum;)I",
        "lastIndexOf",
        "writeReplace",
        "",
        "readObject",
        "",
        "input",
        "Ljava/io/ObjectInputStream;",
        "Lkotlin/internal/ReadObjectParameterType;",
        "(Ljava/io/ObjectInputStream;)V",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.8"
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
.field private final entries:[Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Ljava/lang/Enum;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    const-string v0, "entries"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    invoke-direct {p0}, Lkotlin/collections/AbstractList;-><init>()V

    .line 54
    iput-object p1, p0, Lkotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    return-void
.end method

.method private final readObject(Ljava/io/ObjectInputStream;)V
    .registers 2

    .line 97
    new-instance p0, Ljava/io/InvalidObjectException;

    const-string p1, "Deserialization is supported via proxy only"

    invoke-direct {p0, p1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final writeReplace()Ljava/lang/Object;
    .registers 2

    .line 93
    new-instance v0, Lkotlin/enums/EnumEntriesSerializationProxy;

    iget-object p0, p0, Lkotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    invoke-direct {v0, p0}, Lkotlin/enums/EnumEntriesSerializationProxy;-><init>([Ljava/lang/Enum;)V

    return-object v0
.end method


# virtual methods
.method public contains(Ljava/lang/Enum;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    iget-object p0, p0, Lkotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {p0, v0}, Lkotlin/collections/ArraysKt;->getOrNull([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Enum;

    if-ne p0, p1, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    .line 53
    instance-of v0, p1, Ljava/lang/Enum;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1}, Lkotlin/enums/EnumEntriesList;->contains(Ljava/lang/Enum;)Z

    move-result p0

    return p0
.end method

.method public get(I)Ljava/lang/Enum;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 64
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget-object v1, p0, Lkotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    array-length v1, v1

    invoke-virtual {v0, p1, v1}, Lkotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 65
    iget-object p0, p0, Lkotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 53
    invoke-virtual {p0, p1}, Lkotlin/enums/EnumEntriesList;->get(I)Ljava/lang/Enum;

    move-result-object p0

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 61
    iget-object p0, p0, Lkotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    array-length p0, p0

    return p0
.end method

.method public indexOf(Ljava/lang/Enum;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    .line 84
    iget-object p0, p0, Lkotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    invoke-static {p0, v0}, Lkotlin/collections/ArraysKt;->getOrNull([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Enum;

    if-ne p0, p1, :cond_14

    return v0

    :cond_14
    const/4 p0, -0x1

    return p0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 3

    .line 53
    instance-of v0, p1, Ljava/lang/Enum;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1}, Lkotlin/enums/EnumEntriesList;->indexOf(Ljava/lang/Enum;)I

    move-result p0

    return p0
.end method

.method public lastIndexOf(Ljava/lang/Enum;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 88
    invoke-virtual {p0, p1}, Lkotlin/enums/EnumEntriesList;->indexOf(Ljava/lang/Enum;)I

    move-result p0

    return p0
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 3

    .line 53
    instance-of v0, p1, Ljava/lang/Enum;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1}, Lkotlin/enums/EnumEntriesList;->lastIndexOf(Ljava/lang/Enum;)I

    move-result p0

    return p0
.end method

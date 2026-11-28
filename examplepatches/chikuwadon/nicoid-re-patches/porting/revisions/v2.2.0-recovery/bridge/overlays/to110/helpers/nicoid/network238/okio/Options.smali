.class public final Lnicoid/network238/okio/Options;
.super Lnicoid/network238/kotlin/collections/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/Options$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lnicoid/network238/kotlin/collections/AbstractList;",
        "Ljava/util/RandomAccess;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0008\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0018\u0000 \u00162\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00060\u0003j\u0002`\u0004:\u0001\u0016B!\u0008\u0002\u0012\u000e\u0010\u0005\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0011\u0010\u0014\u001a\u00020\u00022\u0006\u0010\u0015\u001a\u00020\u0011H\u0096\u0002R\u001e\u0010\u0005\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u0006X\u0080\u0004\u00a2\u0006\n\n\u0002\u0010\r\u001a\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\u0007\u001a\u00020\u0008X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0014\u0010\u0010\u001a\u00020\u00118VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0017"
    }
    d2 = {
        "Lnicoid/network238/okio/Options;",
        "Lnicoid/network238/kotlin/collections/AbstractList;",
        "Lnicoid/network238/okio/ByteString;",
        "Ljava/util/RandomAccess;",
        "Lnicoid/network238/kotlin/collections/RandomAccess;",
        "byteStrings",
        "",
        "trie",
        "",
        "<init>",
        "([Lnicoid/network238/okio/ByteString;[I)V",
        "getByteStrings$okio",
        "()[Lnicoid/network238/okio/ByteString;",
        "[Lnicoid/network238/okio/ByteString;",
        "getTrie$okio",
        "()[I",
        "size",
        "",
        "getSize",
        "()I",
        "get",
        "index",
        "Companion",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/okio/Options$Companion;


# instance fields
.field private final byteStrings:[Lnicoid/network238/okio/ByteString;

.field private final trie:[I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okio/Options$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/Options$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/Options;->Companion:Lnicoid/network238/okio/Options$Companion;

    return-void
.end method

.method private constructor <init>([Lnicoid/network238/okio/ByteString;[I)V
    .registers 3

    .line 25
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractList;-><init>()V

    .line 26
    iput-object p1, p0, Lnicoid/network238/okio/Options;->byteStrings:[Lnicoid/network238/okio/ByteString;

    .line 27
    iput-object p2, p0, Lnicoid/network238/okio/Options;->trie:[I

    return-void
.end method

.method public synthetic constructor <init>([Lnicoid/network238/okio/ByteString;[ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okio/Options;-><init>([Lnicoid/network238/okio/ByteString;[I)V

    return-void
.end method

.method public static final varargs of([Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Options;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/Options;->Companion:Lnicoid/network238/okio/Options$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/Options$Companion;->of([Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Options;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    .line 25
    instance-of v0, p1, Lnicoid/network238/okio/ByteString;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Options;->contains(Lnicoid/network238/okio/ByteString;)Z

    move-result p1

    return p1
.end method

.method public bridge contains(Lnicoid/network238/okio/ByteString;)Z
    .registers 2

    .line 25
    invoke-super {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 25
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Options;->get(I)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public get(I)Lnicoid/network238/okio/ByteString;
    .registers 3

    .line 33
    iget-object v0, p0, Lnicoid/network238/okio/Options;->byteStrings:[Lnicoid/network238/okio/ByteString;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public final getByteStrings$okio()[Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 26
    iget-object v0, p0, Lnicoid/network238/okio/Options;->byteStrings:[Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public getSize()I
    .registers 2

    .line 31
    iget-object v0, p0, Lnicoid/network238/okio/Options;->byteStrings:[Lnicoid/network238/okio/ByteString;

    array-length v0, v0

    return v0
.end method

.method public final getTrie$okio()[I
    .registers 2

    .line 27
    iget-object v0, p0, Lnicoid/network238/okio/Options;->trie:[I

    return-object v0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 3

    .line 25
    instance-of v0, p1, Lnicoid/network238/okio/ByteString;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    check-cast p1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Options;->indexOf(Lnicoid/network238/okio/ByteString;)I

    move-result p1

    return p1
.end method

.method public bridge indexOf(Lnicoid/network238/okio/ByteString;)I
    .registers 2

    .line 25
    invoke-super {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 3

    .line 25
    instance-of v0, p1, Lnicoid/network238/okio/ByteString;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    check-cast p1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Options;->lastIndexOf(Lnicoid/network238/okio/ByteString;)I

    move-result p1

    return p1
.end method

.method public bridge lastIndexOf(Lnicoid/network238/okio/ByteString;)I
    .registers 2

    .line 25
    invoke-super {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractList;->lastIndexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

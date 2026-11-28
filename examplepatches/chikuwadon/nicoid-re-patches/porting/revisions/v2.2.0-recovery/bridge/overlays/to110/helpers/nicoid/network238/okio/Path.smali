.class public final Lnicoid/network238/okio/Path;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/Path$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lnicoid/network238/okio/Path;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000c\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0004\u0018\u0000 /2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001/B\u0011\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\rH\u0087\u0002\u00a2\u0006\u0002\u0008 J\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u0003H\u0087\u0002\u00a2\u0006\u0002\u0008 J\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u0000H\u0087\u0002\u00a2\u0006\u0002\u0008 J\u0018\u0010 \u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\r2\u0008\u0008\u0002\u0010!\u001a\u00020\u0013J\u0018\u0010 \u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u00032\u0008\u0008\u0002\u0010!\u001a\u00020\u0013J\u0018\u0010 \u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u00002\u0008\u0008\u0002\u0010!\u001a\u00020\u0013J\u000e\u0010\"\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u0000J\u0006\u0010$\u001a\u00020\u0000J\u0006\u0010%\u001a\u00020&J\u0006\u0010\'\u001a\u00020(J\u0011\u0010)\u001a\u00020*2\u0006\u0010#\u001a\u00020\u0000H\u0096\u0002J\u0013\u0010+\u001a\u00020\u00132\u0008\u0010#\u001a\u0004\u0018\u00010,H\u0096\u0002J\u0008\u0010-\u001a\u00020*H\u0016J\u0008\u0010.\u001a\u00020\rH\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0013\u0010\u0008\u001a\u0004\u0018\u00010\u00008F\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\nR\u0017\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c8F\u00a2\u0006\u0006\u001a\u0004\u0008\u000e\u0010\u000fR\u0017\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u000c8F\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u000fR\u0011\u0010\u0012\u001a\u00020\u00138F\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0014R\u0011\u0010\u0015\u001a\u00020\u00138F\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0014R\u0013\u0010\u0016\u001a\u0004\u0018\u00010\u00178G\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0018R\u0011\u0010\u0019\u001a\u00020\u00038G\u00a2\u0006\u0006\u001a\u0004\u0008\u0019\u0010\u0007R\u0011\u0010\u001a\u001a\u00020\r8G\u00a2\u0006\u0006\u001a\u0004\u0008\u001a\u0010\u001bR\u0013\u0010\u001c\u001a\u0004\u0018\u00010\u00008G\u00a2\u0006\u0006\u001a\u0004\u0008\u001c\u0010\nR\u0011\u0010\u001d\u001a\u00020\u00138F\u00a2\u0006\u0006\u001a\u0004\u0008\u001d\u0010\u0014\u00a8\u00060"
    }
    d2 = {
        "Lnicoid/network238/okio/Path;",
        "",
        "bytes",
        "Lnicoid/network238/okio/ByteString;",
        "<init>",
        "(Lnicoid/network238/okio/ByteString;)V",
        "getBytes$okio",
        "()Lnicoid/network238/okio/ByteString;",
        "root",
        "getRoot",
        "()Lnicoid/network238/okio/Path;",
        "segments",
        "",
        "",
        "getSegments",
        "()Ljava/util/List;",
        "segmentsBytes",
        "getSegmentsBytes",
        "isAbsolute",
        "",
        "()Z",
        "isRelative",
        "volumeLetter",
        "",
        "()Ljava/lang/Character;",
        "nameBytes",
        "name",
        "()Ljava/lang/String;",
        "parent",
        "isRoot",
        "div",
        "child",
        "resolve",
        "normalize",
        "relativeTo",
        "other",
        "normalized",
        "toFile",
        "Ljava/io/File;",
        "toNioPath",
        "Ljava/nio/file/Path;",
        "compareTo",
        "",
        "equals",
        "",
        "hashCode",
        "toString",
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
.field public static final Companion:Lnicoid/network238/okio/Path$Companion;

.field public static final DIRECTORY_SEPARATOR:Ljava/lang/String;


# instance fields
.field private final bytes:Lnicoid/network238/okio/ByteString;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okio/Path$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/Path$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    .line 114
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sput-object v0, Lnicoid/network238/okio/Path;->DIRECTORY_SEPARATOR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/ByteString;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lnicoid/network238/okio/Path;->bytes:Lnicoid/network238/okio/ByteString;

    return-void
.end method

.method public static final get(Ljava/io/File;)Lnicoid/network238/okio/Path;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/io/File;)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static final get(Ljava/io/File;Z)Lnicoid/network238/okio/Path;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/io/File;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static final get(Ljava/lang/String;)Lnicoid/network238/okio/Path;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static final get(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static final get(Ljava/nio/file/Path;)Lnicoid/network238/okio/Path;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/nio/file/Path;)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static final get(Ljava/nio/file/Path;Z)Lnicoid/network238/okio/Path;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/nio/file/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic resolve$default(Lnicoid/network238/okio/Path;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 86
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic resolve$default(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 89
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Path;->resolve(Lnicoid/network238/okio/ByteString;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic resolve$default(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 92
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Path;->resolve(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 40
    check-cast p1, Lnicoid/network238/okio/Path;

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Path;->compareTo(Lnicoid/network238/okio/Path;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lnicoid/network238/okio/Path;)I
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 306
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString;->compareTo(Lnicoid/network238/okio/ByteString;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    .line 307
    instance-of v0, p1, Lnicoid/network238/okio/Path;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okio/Path;

    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final getBytes$okio()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 41
    iget-object v0, p0, Lnicoid/network238/okio/Path;->bytes:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public final getRoot()Lnicoid/network238/okio/Path;
    .registers 5

    .line 133
    # invokes: Lnicoid/network238/okio/internal/-Path;->rootLength(Lnicoid/network238/okio/Path;)I
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$rootLength(Lnicoid/network238/okio/Path;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 135
    :cond_0
    new-instance v1, Lnicoid/network238/okio/Path;

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Lnicoid/network238/okio/ByteString;->substring(II)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-direct {v1, v0}, Lnicoid/network238/okio/Path;-><init>(Lnicoid/network238/okio/ByteString;)V

    return-object v1
.end method

.method public final getSegments()Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 142
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 143
    # invokes: Lnicoid/network238/okio/internal/-Path;->rootLength(Lnicoid/network238/okio/Path;)I
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$rootLength(Lnicoid/network238/okio/Path;)I

    move-result v1

    const/4 v2, -0x1

    const/16 v3, 0x5c

    const/4 v4, 0x0

    if-ne v1, v2, :cond_0

    move v1, v4

    goto :goto_0

    .line 148
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v2, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v2

    if-ne v2, v3, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 152
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    move v5, v1

    :goto_1
    if-ge v1, v2, :cond_3

    .line 153
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-virtual {v6, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v6

    const/16 v7, 0x2f

    if-eq v6, v7, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-virtual {v6, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v6

    if-eq v6, v3, :cond_2

    goto :goto_2

    .line 154
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-virtual {v6, v5, v1}, Lnicoid/network238/okio/ByteString;->substring(II)Lnicoid/network238/okio/ByteString;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v1, 0x1

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 159
    :cond_3
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    if-ge v5, v1, :cond_4

    .line 160
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    invoke-virtual {v1, v5, v2}, Lnicoid/network238/okio/ByteString;->substring(II)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 164
    :cond_4
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 165
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_3
    if-ge v4, v2, :cond_5

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, v4, 0x1

    .line 166
    check-cast v3, Lnicoid/network238/okio/ByteString;

    .line 136
    invoke-virtual {v3}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v3

    .line 166
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_5
    return-object v1
.end method

.method public final getSegmentsBytes()Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/ByteString;",
            ">;"
        }
    .end annotation

    .line 168
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 169
    # invokes: Lnicoid/network238/okio/internal/-Path;->rootLength(Lnicoid/network238/okio/Path;)I
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$rootLength(Lnicoid/network238/okio/Path;)I

    move-result v1

    const/4 v2, -0x1

    const/16 v3, 0x5c

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 174
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v2, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v2

    if-ne v2, v3, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 178
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    move v4, v1

    :goto_1
    if-ge v1, v2, :cond_3

    .line 179
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    invoke-virtual {v5, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v5

    const/16 v6, 0x2f

    if-eq v5, v6, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    invoke-virtual {v5, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v5

    if-eq v5, v3, :cond_2

    goto :goto_2

    .line 180
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    invoke-virtual {v5, v4, v1}, Lnicoid/network238/okio/ByteString;->substring(II)Lnicoid/network238/okio/ByteString;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v1, 0x1

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 185
    :cond_3
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    if-ge v4, v1, :cond_4

    .line 186
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    invoke-virtual {v1, v4, v2}, Lnicoid/network238/okio/ByteString;->substring(II)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_4
    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .line 308
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->hashCode()I

    move-result v0

    return v0
.end method

.method public final isAbsolute()Z
    .registers 3

    .line 190
    # invokes: Lnicoid/network238/okio/internal/-Path;->rootLength(Lnicoid/network238/okio/Path;)I
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$rootLength(Lnicoid/network238/okio/Path;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isRelative()Z
    .registers 3

    .line 191
    # invokes: Lnicoid/network238/okio/internal/-Path;->rootLength(Lnicoid/network238/okio/Path;)I
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$rootLength(Lnicoid/network238/okio/Path;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isRoot()Z
    .registers 3

    .line 229
    # invokes: Lnicoid/network238/okio/internal/-Path;->rootLength(Lnicoid/network238/okio/Path;)I
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$rootLength(Lnicoid/network238/okio/Path;)I

    move-result v0

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final name()Ljava/lang/String;
    .registers 2

    .line 203
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->nameBytes()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final nameBytes()Lnicoid/network238/okio/ByteString;
    .registers 6

    .line 198
    # invokes: Lnicoid/network238/okio/internal/-Path;->getIndexOfLastSlash(Lnicoid/network238/okio/Path;)I
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$getIndexOfLastSlash(Lnicoid/network238/okio/Path;)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x2

    if-eq v0, v1, :cond_0

    .line 200
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v1, v0, v3, v2, v4}, Lnicoid/network238/okio/ByteString;->substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0

    .line 201
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->volumeLetter()Ljava/lang/Character;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    if-ne v0, v2, :cond_1

    sget-object v0, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    return-object v0

    .line 202
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final normalized()Lnicoid/network238/okio/Path;
    .registers 4

    .line 305
    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;

    move-result-object v0

    return-object v0
.end method

.method public final parent()Lnicoid/network238/okio/Path;
    .registers 8

    .line 204
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    # getter for: Lnicoid/network238/okio/internal/-Path;->DOT:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getDOT$p()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    # getter for: Lnicoid/network238/okio/internal/-Path;->SLASH:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getSLASH$p()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    # getter for: Lnicoid/network238/okio/internal/-Path;->BACKSLASH:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getBACKSLASH$p()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    # invokes: Lnicoid/network238/okio/internal/-Path;->lastSegmentIsDotDot(Lnicoid/network238/okio/Path;)Z
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$lastSegmentIsDotDot(Lnicoid/network238/okio/Path;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 208
    # invokes: Lnicoid/network238/okio/internal/-Path;->getIndexOfLastSlash(Lnicoid/network238/okio/Path;)I
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$getIndexOfLastSlash(Lnicoid/network238/okio/Path;)I

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v0, v2, :cond_1

    .line 210
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->volumeLetter()Ljava/lang/Character;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 211
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 212
    :cond_0
    new-instance v0, Lnicoid/network238/okio/Path;

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    invoke-static {v5, v3, v2, v4, v1}, Lnicoid/network238/okio/ByteString;->substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-direct {v0, v1}, Lnicoid/network238/okio/Path;-><init>(Lnicoid/network238/okio/ByteString;)V

    return-object v0

    :cond_1
    if-ne v0, v4, :cond_2

    .line 214
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    # getter for: Lnicoid/network238/okio/internal/-Path;->BACKSLASH:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getBACKSLASH$p()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-virtual {v5, v6}, Lnicoid/network238/okio/ByteString;->startsWith(Lnicoid/network238/okio/ByteString;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, -0x1

    if-ne v0, v5, :cond_4

    .line 217
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->volumeLetter()Ljava/lang/Character;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 218
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    if-ne v0, v2, :cond_3

    goto :goto_0

    .line 219
    :cond_3
    new-instance v0, Lnicoid/network238/okio/Path;

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    invoke-static {v5, v3, v2, v4, v1}, Lnicoid/network238/okio/ByteString;->substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-direct {v0, v1}, Lnicoid/network238/okio/Path;-><init>(Lnicoid/network238/okio/ByteString;)V

    return-object v0

    :cond_4
    if-ne v0, v5, :cond_5

    .line 222
    new-instance v0, Lnicoid/network238/okio/Path;

    # getter for: Lnicoid/network238/okio/internal/-Path;->DOT:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getDOT$p()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-direct {v0, v1}, Lnicoid/network238/okio/Path;-><init>(Lnicoid/network238/okio/ByteString;)V

    return-object v0

    :cond_5
    if-nez v0, :cond_6

    .line 225
    new-instance v0, Lnicoid/network238/okio/Path;

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-static {v2, v3, v4, v4, v1}, Lnicoid/network238/okio/ByteString;->substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-direct {v0, v1}, Lnicoid/network238/okio/Path;-><init>(Lnicoid/network238/okio/ByteString;)V

    return-object v0

    .line 228
    :cond_6
    new-instance v2, Lnicoid/network238/okio/Path;

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    invoke-static {v5, v3, v0, v4, v1}, Lnicoid/network238/okio/ByteString;->substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-direct {v2, v0}, Lnicoid/network238/okio/Path;-><init>(Lnicoid/network238/okio/ByteString;)V

    return-object v2

    :cond_7
    :goto_0
    return-object v1
.end method

.method public final relativeTo(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 264
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getRoot()Lnicoid/network238/okio/Path;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->getRoot()Lnicoid/network238/okio/Path;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const-string v1, " and "

    if-eqz v0, :cond_7

    .line 268
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getSegmentsBytes()Ljava/util/List;

    move-result-object v0

    .line 269
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->getSegmentsBytes()Ljava/util/List;

    move-result-object v2

    .line 273
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_0

    .line 275
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v6, v7}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    if-ne v5, v3, :cond_1

    .line 280
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v3

    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v6

    if-ne v3, v6, :cond_1

    .line 282
    sget-object p1, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    const-string v0, "."

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p1, v0, v4, v2, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1

    .line 285
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2, v5, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    # getter for: Lnicoid/network238/okio/internal/-Path;->DOT_DOT:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getDOT_DOT$p()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    const/4 v6, -0x1

    if-ne v3, v6, :cond_6

    .line 289
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    # getter for: Lnicoid/network238/okio/internal/-Path;->DOT:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getDOT$p()Lnicoid/network238/okio/ByteString;

    move-result-object v3

    invoke-static {v1, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object p0

    .line 294
    :cond_2
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 295
    # invokes: Lnicoid/network238/okio/internal/-Path;->getSlash(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/ByteString;
    invoke-static {p1}, Lnicoid/network238/okio/internal/-Path;->access$getSlash(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    if-nez p1, :cond_3

    # invokes: Lnicoid/network238/okio/internal/-Path;->getSlash(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/ByteString;
    invoke-static {p0}, Lnicoid/network238/okio/internal/-Path;->access$getSlash(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    if-nez p1, :cond_3

    sget-object p1, Lnicoid/network238/okio/Path;->DIRECTORY_SEPARATOR:Ljava/lang/String;

    # invokes: Lnicoid/network238/okio/internal/-Path;->toSlash(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    invoke-static {p1}, Lnicoid/network238/okio/internal/-Path;->access$toSlash(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    .line 296
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    move v3, v5

    :goto_1
    if-ge v3, v2, :cond_4

    .line 297
    # getter for: Lnicoid/network238/okio/internal/-Path;->DOT_DOT:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getDOT_DOT$p()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-virtual {v1, v6}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 298
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 300
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    :goto_2
    if-ge v5, v2, :cond_5

    .line 301
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v1, v3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 302
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_5
    nop

    .line 304
    invoke-static {v1, v4}, Lnicoid/network238/okio/internal/-Path;->toPath(Lnicoid/network238/okio/Buffer;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1

    .line 286
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Impossible relative path to resolve: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 285
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 265
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Paths of different roots cannot be relative to each other: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 264
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 230
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 240
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnicoid/network238/okio/internal/-Path;->toPath(Lnicoid/network238/okio/Buffer;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    invoke-static {p0, p1, v0}, Lnicoid/network238/okio/internal/-Path;->commonResolve(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final resolve(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 247
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 257
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnicoid/network238/okio/internal/-Path;->toPath(Lnicoid/network238/okio/Buffer;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/-Path;->commonResolve(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final resolve(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Path;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 241
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 246
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnicoid/network238/okio/internal/-Path;->toPath(Lnicoid/network238/okio/Buffer;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    invoke-static {p0, p1, v0}, Lnicoid/network238/okio/internal/-Path;->commonResolve(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final resolve(Lnicoid/network238/okio/ByteString;Z)Lnicoid/network238/okio/Path;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 258
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 263
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnicoid/network238/okio/internal/-Path;->toPath(Lnicoid/network238/okio/Buffer;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/-Path;->commonResolve(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final resolve(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lnicoid/network238/okio/internal/-Path;->commonResolve(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final resolve(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/-Path;->commonResolve(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final toFile()Ljava/io/File;
    .registers 3

    .line 99
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public final toNioPath()Ljava/nio/file/Path;
    .registers 3

    .line 102
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 309
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final volumeLetter()Ljava/lang/Character;
    .registers 6

    .line 192
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    # getter for: Lnicoid/network238/okio/internal/-Path;->SLASH:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okio/internal/-Path;->access$getSLASH$p()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lnicoid/network238/okio/ByteString;->indexOf$default(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;IILjava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 193
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    if-ge v0, v3, :cond_1

    goto :goto_0

    .line 194
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v0

    const/16 v1, 0x3a

    if-eq v0, v1, :cond_2

    goto :goto_0

    .line 195
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okio/Path;->getBytes$okio()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0, v2}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v0

    int-to-char v0, v0

    const/16 v1, 0x61

    if-gt v1, v0, :cond_3

    const/16 v1, 0x7b

    if-lt v0, v1, :cond_4

    :cond_3
    const/16 v1, 0x41

    if-gt v1, v0, :cond_5

    const/16 v1, 0x5b

    if-ge v0, v1, :cond_5

    .line 197
    :cond_4
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    return-object v0

    :cond_5
    :goto_0
    return-object v4
.end method

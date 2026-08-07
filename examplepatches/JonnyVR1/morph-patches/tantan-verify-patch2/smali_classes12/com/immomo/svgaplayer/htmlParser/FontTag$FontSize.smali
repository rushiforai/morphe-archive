.class public final Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/htmlParser/FontTag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FontSize"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003H\u00c6\u0003J\u0013\u0010\u0008\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\t\u001a\u00020\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u000c\u001a\u00020\u0003H\u00d6\u0001J\t\u0010\r\u001a\u00020\u000eH\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;",
        "",
        "size",
        "",
        "(I)V",
        "getSize",
        "()I",
        "component1",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
        "",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private final size:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->size:I

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic copy$default(Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;IILjava/lang/Object;)Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    iget p1, p0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->size:I

    :cond_0
    invoke-virtual {p0, p1}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->copy(I)Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 0

    iget p0, p0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->size:I

    return p0
.end method

.method public final copy(I)Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;

    invoke-direct {p0, p1}, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;-><init>(I)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;

    iget p0, p0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->size:I

    iget p1, p1, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->size:I

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final getSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->size:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 0

    iget p0, p0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->size:I

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FontSize(size="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lcom/immomo/svgaplayer/htmlParser/FontTag$FontSize;->size:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

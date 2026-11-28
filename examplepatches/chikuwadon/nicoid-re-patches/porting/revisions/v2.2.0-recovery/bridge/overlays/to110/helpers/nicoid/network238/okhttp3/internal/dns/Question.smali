.class public final Lnicoid/network238/okhttp3/internal/dns/Question;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0087\u0008\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\t\u0010\u000e\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u000f\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0010\u001a\u00020\u0005H\u00c6\u0003J\'\u0010\u0011\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0005H\u00c6\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0015\u001a\u00020\u0005H\u00d6\u0001J\t\u0010\u0016\u001a\u00020\u0003H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000c\u00a8\u0006\u0017"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "",
        "name",
        "",
        "type",
        "",
        "class",
        "<init>",
        "(Ljava/lang/String;II)V",
        "getName",
        "()Ljava/lang/String;",
        "getType",
        "()I",
        "getClass",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
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
.field private final class:I

.field private final name:Ljava/lang/String;

.field private final type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->name:Ljava/lang/String;

    .line 74
    iput p2, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->type:I

    .line 75
    iput p3, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->class:I

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 6

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x1

    .line 72
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/Question;-><init>(Ljava/lang/String;II)V

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/dns/Question;Ljava/lang/String;IIILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/Question;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->name:Ljava/lang/String;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget p2, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->type:I

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget p3, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->class:I

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/Question;->copy(Ljava/lang/String;II)Lnicoid/network238/okhttp3/internal/dns/Question;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()I
    .registers 2

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->type:I

    return v0
.end method

.method public final component3()I
    .registers 2

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->class:I

    return v0
.end method

.method public final copy(Ljava/lang/String;II)Lnicoid/network238/okhttp3/internal/dns/Question;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-direct {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/Question;-><init>(Ljava/lang/String;II)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/dns/Question;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/Question;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->name:Ljava/lang/String;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/Question;->name:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->type:I

    iget v1, p1, Lnicoid/network238/okhttp3/internal/dns/Question;->type:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->class:I

    iget p1, p1, Lnicoid/network238/okhttp3/internal/dns/Question;->class:I

    if-eq v0, p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public final getClass()I
    .registers 2

    .line 75
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->class:I

    return v0
.end method

.method public final getName()Ljava/lang/String;
    .registers 2

    .line 73
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getType()I
    .registers 2

    .line 74
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->type:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->type:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->class:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Question(name="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", class="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/Question;->class:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

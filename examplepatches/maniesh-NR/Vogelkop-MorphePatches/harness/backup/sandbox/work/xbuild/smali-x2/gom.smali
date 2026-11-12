.class public final Lgom;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Llom;

.field public final b:Lkom;

.field public final c:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Llom;Lkom;Ljava/lang/Integer;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgom;->a:Llom;

    iput-object p2, p0, Lgom;->b:Lkom;

    iput-object p3, p0, Lgom;->c:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lgom;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lgom;

    iget-object v1, p0, Lgom;->a:Llom;

    iget-object v3, p1, Lgom;->a:Llom;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lgom;->b:Lkom;

    iget-object v3, p1, Lgom;->b:Lkom;

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget-object p0, p0, Lgom;->c:Ljava/lang/Integer;

    iget-object p1, p1, Lgom;->c:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    return v2

    :cond_25
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lgom;->a:Llom;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lgom;->b:Lkom;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lgom;->c:Ljava/lang/Integer;

    if-nez p0, :cond_17

    const/4 p0, 0x0

    goto :goto_1b

    :cond_17
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_1b
    add-int/2addr v1, p0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

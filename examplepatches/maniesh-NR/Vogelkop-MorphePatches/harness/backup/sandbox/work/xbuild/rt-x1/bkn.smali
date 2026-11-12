.class public final Lbkn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Laln;

.field public final b:I


# direct methods
.method public constructor <init>(Laln;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbkn;->a:Laln;

    iput p2, p0, Lbkn;->b:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lbkn;

    if-eqz v0, :cond_18

    check-cast p1, Lbkn;

    iget-object v0, p0, Lbkn;->a:Laln;

    iget-object v1, p1, Lbkn;->a:Laln;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget p0, p0, Lbkn;->b:I

    iget p1, p1, Lbkn;->b:I

    if-eq p0, p1, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lbkn;->a:Laln;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lbkn;->b:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

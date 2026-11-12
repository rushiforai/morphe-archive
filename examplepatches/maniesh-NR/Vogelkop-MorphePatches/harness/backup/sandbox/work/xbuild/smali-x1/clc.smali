.class public final Lclc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkmc;

.field public final b:Z


# direct methods
.method public constructor <init>(Lkmc;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lclc;->a:Lkmc;

    iput-boolean p2, p0, Lclc;->b:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lclc;

    if-eqz v0, :cond_18

    check-cast p1, Lclc;

    iget-object v0, p0, Lclc;->a:Lkmc;

    iget-object v1, p1, Lclc;->a:Lkmc;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-boolean p0, p0, Lclc;->b:Z

    iget-boolean p1, p1, Lclc;->b:Z

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

    iget-object v0, p0, Lclc;->a:Lkmc;

    iget-object v0, v0, Lkmc;->a:Llmc;

    invoke-virtual {v0}, Llmc;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lclc;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.class public final Lkbf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbl0;

.field public final b:I


# direct methods
.method public constructor <init>(Lbl0;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkbf;->a:Lbl0;

    iput p2, p0, Lkbf;->b:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_17

    instance-of v0, p1, Lkbf;

    const/4 v1, 0x0

    if-eqz v0, :cond_16

    check-cast p1, Lkbf;

    iget-object v0, p0, Lkbf;->a:Lbl0;

    iget-object v2, p1, Lkbf;->a:Lbl0;

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    iget p0, p0, Lkbf;->b:I

    iget p1, p1, Lkbf;->b:I

    if-eq p0, p1, :cond_17

    :cond_16
    return v1

    :cond_17
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lkbf;->a:Lbl0;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lkbf;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

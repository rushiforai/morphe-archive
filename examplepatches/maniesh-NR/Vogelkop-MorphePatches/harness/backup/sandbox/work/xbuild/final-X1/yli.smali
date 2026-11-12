.class public final Lyli;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltli;

.field public final b:Ltli;

.field public final c:Landroid/view/View$OnClickListener;

.field public final d:Landroid/view/View$OnClickListener;

.field public final e:La4h;

.field public final f:Z


# direct methods
.method public constructor <init>(Ltli;Ltli;Lh4i;Lj5g;La4h;I)V
    .registers 9

    and-int/lit8 v0, p6, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    move-object p1, v1

    :cond_6
    and-int/lit8 v0, p6, 0x2

    if-eqz v0, :cond_b

    move-object p2, v1

    :cond_b
    and-int/lit8 v0, p6, 0x4

    if-eqz v0, :cond_10

    move-object p3, v1

    :cond_10
    and-int/lit8 v0, p6, 0x8

    if-eqz v0, :cond_15

    move-object p4, v1

    :cond_15
    and-int/lit8 v0, p6, 0x10

    if-eqz v0, :cond_1b

    sget-object p5, Lvli;->b:Lvli;

    :cond_1b
    and-int/lit8 p6, p6, 0x20

    if-eqz p6, :cond_21

    const/4 p6, 0x0

    goto :goto_22

    :cond_21
    const/4 p6, 0x1

    :goto_22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyli;->a:Ltli;

    iput-object p2, p0, Lyli;->b:Ltli;

    iput-object p3, p0, Lyli;->c:Landroid/view/View$OnClickListener;

    iput-object p4, p0, Lyli;->d:Landroid/view/View$OnClickListener;

    iput-object p5, p0, Lyli;->e:La4h;

    iput-boolean p6, p0, Lyli;->f:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_42

    instance-of v0, p1, Lyli;

    if-eqz v0, :cond_40

    check-cast p1, Lyli;

    iget-object v0, p0, Lyli;->a:Ltli;

    iget-object v1, p1, Lyli;->a:Ltli;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p0, Lyli;->b:Ltli;

    iget-object v1, p1, Lyli;->b:Ltli;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p0, Lyli;->c:Landroid/view/View$OnClickListener;

    iget-object v1, p1, Lyli;->c:Landroid/view/View$OnClickListener;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p0, Lyli;->d:Landroid/view/View$OnClickListener;

    iget-object v1, p1, Lyli;->d:Landroid/view/View$OnClickListener;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p0, Lyli;->e:La4h;

    iget-object v1, p1, Lyli;->e:La4h;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-boolean p0, p0, Lyli;->f:Z

    iget-boolean p1, p1, Lyli;->f:Z

    if-eq p0, p1, :cond_42

    :cond_40
    const/4 p0, 0x0

    return p0

    :cond_42
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    const/4 v0, 0x0

    iget-object v1, p0, Lyli;->a:Ltli;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ltli;->hashCode()I

    move-result v1

    :goto_b
    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lyli;->b:Ltli;

    if-nez v2, :cond_13

    move v2, v0

    goto :goto_17

    :cond_13
    invoke-virtual {v2}, Ltli;->hashCode()I

    move-result v2

    :goto_17
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lyli;->c:Landroid/view/View$OnClickListener;

    if-nez v2, :cond_20

    move v2, v0

    goto :goto_24

    :cond_20
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_24
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lyli;->d:Landroid/view/View$OnClickListener;

    if-eqz v2, :cond_2f

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_2f
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lyli;->e:La4h;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lyli;->f:Z

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

.class public final Lyif;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk2g;

.field public final b:Lr3g;

.field public final c:Landroid/widget/inline/InlinePresentationSpec;

.field public final d:Ls3g;


# direct methods
.method public constructor <init>(Lk2g;Lr3g;Landroid/widget/inline/InlinePresentationSpec;Ls3g;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyif;->a:Lk2g;

    iput-object p2, p0, Lyif;->b:Lr3g;

    iput-object p3, p0, Lyif;->c:Landroid/widget/inline/InlinePresentationSpec;

    iput-object p4, p0, Lyif;->d:Ls3g;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lyif;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lyif;

    iget-object v1, p0, Lyif;->a:Lk2g;

    iget-object v3, p1, Lyif;->a:Lk2g;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lyif;->b:Lr3g;

    iget-object v3, p1, Lyif;->b:Lr3g;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lyif;->c:Landroid/widget/inline/InlinePresentationSpec;

    iget-object v3, p1, Lyif;->c:Landroid/widget/inline/InlinePresentationSpec;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object p0, p0, Lyif;->d:Ls3g;

    iget-object p1, p1, Lyif;->d:Ls3g;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    return v2

    :cond_38
    return v0
.end method

.method public final hashCode()I
    .registers 4

    const/4 v0, 0x0

    iget-object v1, p0, Lyif;->a:Lk2g;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_b
    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lyif;->b:Lr3g;

    if-nez v2, :cond_13

    move v2, v0

    goto :goto_17

    :cond_13
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_17
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lyif;->c:Landroid/widget/inline/InlinePresentationSpec;

    if-nez v2, :cond_20

    move v2, v0

    goto :goto_24

    :cond_20
    invoke-virtual {v2}, Landroid/widget/inline/InlinePresentationSpec;->hashCode()I

    move-result v2

    :goto_24
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lyif;->d:Ls3g;

    if-eqz p0, :cond_2f

    invoke-virtual {p0}, Ls3g;->hashCode()I

    move-result v0

    :cond_2f
    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.class public final Lgtd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrxh;

.field public final b:Llxh;

.field public final c:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgtd;->a:Lrxh;

    iput-object p2, p0, Lgtd;->b:Llxh;

    iput-object p3, p0, Lgtd;->c:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lgtd;

    if-eqz v0, :cond_26

    check-cast p1, Lgtd;

    iget-object v0, p0, Lgtd;->a:Lrxh;

    iget-object v1, p1, Lgtd;->a:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lgtd;->b:Llxh;

    iget-object v1, p1, Lgtd;->b:Llxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lgtd;->c:Landroid/view/View$OnClickListener;

    iget-object p1, p1, Lgtd;->c:Landroid/view/View$OnClickListener;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lgtd;->a:Lrxh;

    iget v0, v0, Lrxh;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lgtd;->b:Llxh;

    if-nez v1, :cond_10

    const/4 v1, 0x0

    goto :goto_16

    :cond_10
    iget v1, v1, Llxh;->a:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    :goto_16
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lgtd;->c:Landroid/view/View$OnClickListener;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

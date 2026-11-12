.class public final Loc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrxh;

.field public final b:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Lrxh;Landroid/view/View$OnClickListener;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loc;->a:Lrxh;

    iput-object p2, p0, Loc;->b:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Loc;

    if-eqz v0, :cond_1c

    check-cast p1, Loc;

    iget-object v0, p0, Loc;->a:Lrxh;

    iget-object v1, p1, Loc;->a:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Loc;->b:Landroid/view/View$OnClickListener;

    iget-object p1, p1, Loc;->b:Landroid/view/View$OnClickListener;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Loc;->a:Lrxh;

    iget v0, v0, Lrxh;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Loc;->b:Landroid/view/View$OnClickListener;

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

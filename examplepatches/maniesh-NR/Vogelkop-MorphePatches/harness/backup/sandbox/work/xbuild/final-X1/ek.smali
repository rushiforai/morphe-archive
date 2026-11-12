.class public final Lek;
.super Lhk;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/ui/catalog/widget/OperaListItem;


# direct methods
.method public constructor <init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 2

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lek;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_14

    instance-of v0, p1, Lek;

    if-eqz v0, :cond_12

    check-cast p1, Lek;

    iget-object p0, p0, Lek;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p1, Lek;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lek;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

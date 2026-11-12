.class public final Ldmf;
.super Lbpd;
.source "SourceFile"


# instance fields
.field public final synthetic e:Lcom/opera/android/ui/catalog/widget/OperaListItem;


# direct methods
.method public constructor <init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V
    .registers 5

    iput-object p1, p0, Ldmf;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/16 v0, 0x1c

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Lbpd;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    return-void
.end method


# virtual methods
.method public final V(Lpxh;)V
    .registers 4

    invoke-super {p0, p1}, Lbpd;->V(Lpxh;)V

    iget-object p1, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object p0, p0, Ldmf;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-nez p1, :cond_16

    const/4 p1, 0x2

    invoke-static {p0, v1, v0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->H(Lcom/opera/android/ui/catalog/widget/OperaListItem;III)V

    return-void

    :cond_16
    invoke-static {p0, v0, v1, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->H(Lcom/opera/android/ui/catalog/widget/OperaListItem;III)V

    return-void
.end method

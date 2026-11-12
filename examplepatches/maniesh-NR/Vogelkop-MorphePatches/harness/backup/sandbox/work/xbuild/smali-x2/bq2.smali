.class public final Lbq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/autofill/AddressEditorManager$RegionsReceiver;


# instance fields
.field public final synthetic a:Liq2;


# direct methods
.method public constructor <init>(Liq2;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbq2;->a:Liq2;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/util/Map;)V
    .registers 6

    iget-object p0, p0, Lbq2;->a:Liq2;

    iget-object v0, p0, Liq2;->D:Ljava/util/ArrayList;

    invoke-virtual {p0}, Liq2;->I0()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_12

    iget-boolean p1, p0, Liq2;->E:Z

    if-eqz p1, :cond_13

    :cond_12
    return-void

    :cond_13
    const/4 p1, 0x1

    iput-boolean p1, p0, Liq2;->E:Z

    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_38

    new-instance p1, Lsp2;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f140204

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-direct {p1, v2, v1}, Lsp2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p2}, Liq2;->L0(Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_38
    iget-object p1, p0, Liq2;->u:Ldt1;

    const/4 p2, 0x0

    :goto_3b
    iget-object v0, p1, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_5c

    iget-object v0, p1, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfw;

    iget-object v0, v0, Lfw;->a:Lew;

    sget-object v1, Lew;->c:Lew;

    if-ne v0, v1, :cond_59

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    goto :goto_5c

    :cond_59
    add-int/lit8 p2, p2, 0x1

    goto :goto_3b

    :cond_5c
    :goto_5c
    iget-object p1, p0, Liq2;->z:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_6b

    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_6b

    iget-object p1, p0, Liq2;->z:Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    :cond_6b
    const/4 p1, 0x0

    iput-object p1, p0, Liq2;->z:Landroid/app/ProgressDialog;

    return-void
.end method

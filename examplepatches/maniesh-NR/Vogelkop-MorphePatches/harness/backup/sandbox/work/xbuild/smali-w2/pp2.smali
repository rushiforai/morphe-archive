.class public final synthetic Lpp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liq2;


# direct methods
.method public synthetic constructor <init>(Liq2;B)V
    .registers 3

    iput-byte p2, p0, Lpp2;->a:B

    iput-object p1, p0, Lpp2;->b:Liq2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    iget-byte p1, p0, Lpp2;->a:B

    iget-object p0, p0, Lpp2;->b:Liq2;

    packed-switch p1, :pswitch_data_c4

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_14
    iget-object p1, p0, Liq2;->K:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/HashSet;->size()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_25

    invoke-virtual {p0}, Liq2;->G0()Z

    move-result p1

    xor-int/2addr p1, v1

    goto/16 :goto_9a

    :cond_25
    iget-object p1, p0, Liq2;->u:Ldt1;

    invoke-virtual {p0}, Liq2;->J0()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_30

    iput-object v2, p0, Liq2;->J:Ljava/lang/String;

    move v1, v0

    :cond_30
    iget-object v2, p0, Liq2;->K:Ljava/util/HashSet;

    sget-object v3, Lyp2;->b:Lyp2;

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_43

    iget-object v2, p0, Liq2;->I:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v2

    if-nez v2, :cond_43

    move v1, v0

    :cond_43
    iget-object v2, p1, Ldt1;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4b
    :goto_4b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_94

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfw;

    iget-object v4, p0, Liq2;->K:Ljava/util/HashSet;

    sget-object v5, Lyp2;->a:Lyp2;

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_65

    iget-boolean v4, v3, Lfw;->c:Z

    if-nez v4, :cond_75

    :cond_65
    iget-object v4, p0, Liq2;->K:Ljava/util/HashSet;

    sget-object v5, Lyp2;->c:Lyp2;

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4b

    iget-object v4, v3, Lfw;->a:Lew;

    sget-object v5, Lew;->j:Lew;

    if-ne v4, v5, :cond_4b

    :cond_75
    iget-object v4, p0, Liq2;->v:Ljava/util/HashMap;

    iget-object v5, v3, Lfw;->a:Lew;

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v4

    if-nez v4, :cond_90

    const v1, 0x7f140d35

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v3, Lfw;->e:Ljava/lang/String;

    move v1, v0

    goto :goto_4b

    :cond_90
    const/4 v4, 0x0

    iput-object v4, v3, Lfw;->e:Ljava/lang/String;

    goto :goto_4b

    :cond_94
    if-nez v1, :cond_99

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    :cond_99
    move p1, v1

    :goto_9a
    if-eqz p1, :cond_b4

    iget-object p1, p0, Liq2;->H:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_b0

    iget-object p1, p0, Liq2;->H:Ljava/lang/String;

    invoke-virtual {p0}, Liq2;->I0()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, LJ/N;->MQ1o0vJQ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b4

    :cond_b0
    invoke-virtual {p0}, Liq2;->M0()Z

    move-result v0

    :cond_b4
    if-eqz v0, :cond_c2

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_c2
    return-void

    nop

    :pswitch_data_c4
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

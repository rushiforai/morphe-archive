.class public final synthetic Lovk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lghf;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lghf;Ljava/util/List;B)V
    .registers 4

    iput-byte p3, p0, Lovk;->a:B

    iput-object p1, p0, Lovk;->b:Lghf;

    iput-object p2, p0, Lovk;->c:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-byte v0, p0, Lovk;->a:B

    iget-object v1, p0, Lovk;->c:Ljava/util/List;

    iget-object p0, p0, Lovk;->b:Lghf;

    packed-switch v0, :pswitch_data_6e

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Lgnh;

    invoke-virtual {p0, v1}, Lgnh;->d(Ljava/util/List;)V

    return-void

    :pswitch_11
    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Lgnh;

    move-object v0, v1

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    :cond_1d
    :goto_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lenh;

    iget-object v5, p0, Lgnh;->f:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1d

    iget-object v2, p0, Lgnh;->b:Lfnh;

    iget-object v2, v2, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    iget-wide v5, v2, Lcom/opera/android/browser/SessionStore;->a:J

    iget v2, v3, Lenh;->c:I

    invoke-static {v5, v6, v2}, LJ/N;->MKH2wY$N(JI)V

    move v2, v4

    goto :goto_1d

    :cond_3f
    if-eqz v2, :cond_6d

    invoke-virtual {p0}, Lgnh;->e()V

    iget-object p0, p0, Lgnh;->e:Lknh;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lknh;->A:Ly83;

    if-nez v1, :cond_4f

    const/4 v1, 0x0

    :cond_4f
    iget-object v1, v1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f120068

    invoke-virtual {v1, v3, v0, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v4}, Lknh;->G0(Ljava/lang/String;Z)V

    :cond_6d
    return-void

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

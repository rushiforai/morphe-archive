.class public final synthetic Lj1e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwj9;


# direct methods
.method public synthetic constructor <init>(Lwj9;B)V
    .registers 3

    iput-byte p2, p0, Lj1e;->a:B

    iput-object p1, p0, Lj1e;->b:Lwj9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lj1e;->a:B

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object p0, p0, Lj1e;->b:Lwj9;

    check-cast p1, Landroid/view/View;

    check-cast p2, Lef;

    packed-switch v0, :pswitch_data_a8

    new-instance p2, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-direct {p2, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {p2, p1}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b
    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    new-array p1, v3, [Ln6h;

    new-instance v4, Lwzg;

    const-class p2, Lwg7;

    invoke-direct {v4, v2, p2, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lzhj;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v3 .. v10}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v3, p0}, Lzhj;->c(Landroid/content/Context;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_40
    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    const-wide/16 p1, -0x1

    const-string v0, ""

    invoke-static {p1, p2, v0, v0}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    new-instance v4, Lyr;

    invoke-direct {v4}, Lyr;-><init>()V

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    invoke-interface {v0}, Lal3;->getId()J

    move-result-wide v6

    cmp-long p1, v6, p1

    if-nez p1, :cond_6f

    const-string p1, "bookmark"

    invoke-static {v0}, Ljkj;->j(Lal3;)Ljkj;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_78

    :cond_6f
    const-string p1, "bookmark-id"

    invoke-interface {v0}, Lal3;->getId()J

    move-result-wide v6

    invoke-virtual {v5, p1, v6, v7}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    :goto_78
    const-string p1, "show-snackbar"

    invoke-virtual {v5, p1, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p1, "dialog-source"

    const/4 p2, 0x2

    invoke-virtual {v5, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v4, v5}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iput-object v2, v4, Lss7;->x:Lole;

    new-array p1, v3, [Ln6h;

    new-instance v6, Lwzg;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-direct {v6, v4, p2, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Lzhj;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/16 v9, 0x1003

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v5 .. v12}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v5, p0}, Lzhj;->c(Landroid/content/Context;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_40
        :pswitch_1b
    .end packed-switch
.end method

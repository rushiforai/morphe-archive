.class public final synthetic Lnri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lakg;


# direct methods
.method public synthetic constructor <init>(Lakg;B)V
    .registers 3

    iput-byte p2, p0, Lnri;->a:B

    iput-object p1, p0, Lnri;->b:Lakg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lnri;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lnri;->b:Lakg;

    packed-switch v0, :pswitch_data_50

    check-cast p1, Leri;

    iget-boolean p1, p0, Lakg;->k:Z

    if-nez p1, :cond_2b

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p1

    if-eqz p1, :cond_1f

    iget-object v0, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lo66;

    invoke-virtual {v0}, Lo66;->j()Z

    move-result v0

    if-eqz v0, :cond_1f

    move-object v1, p1

    :cond_1f
    if-eqz v1, :cond_2b

    iget-object p1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    invoke-virtual {p1}, Litd;->clear()V

    invoke-virtual {p0, p1}, Lakg;->t(Landroid/view/Menu;)V

    :cond_2b
    return-void

    :pswitch_2c
    check-cast p1, Ljava/util/List;

    iget-boolean p1, p0, Lakg;->k:Z

    if-nez p1, :cond_4f

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p1

    if-eqz p1, :cond_43

    iget-object v0, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lo66;

    invoke-virtual {v0}, Lo66;->j()Z

    move-result v0

    if-eqz v0, :cond_43

    move-object v1, p1

    :cond_43
    if-eqz v1, :cond_4f

    iget-object p1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    invoke-virtual {p1}, Litd;->clear()V

    invoke-virtual {p0, p1}, Lakg;->t(Landroid/view/Menu;)V

    :cond_4f
    return-void

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method

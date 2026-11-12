.class public final synthetic Lds5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Les5;
.implements Lls5;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld5o;


# direct methods
.method public synthetic constructor <init>(Ld5o;B)V
    .registers 3

    iput-byte p2, p0, Lds5;->a:B

    iput-object p1, p0, Lds5;->b:Ld5o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 10

    iget-byte v0, p0, Lds5;->a:B

    iget-object p0, p0, Lds5;->b:Ld5o;

    packed-switch v0, :pswitch_data_5e

    :pswitch_7
    iget-object p0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast p0, Lk73;

    iget-object p0, p0, Lk73;->e:Ljava/lang/Object;

    check-cast p0, Ljv0;

    new-instance p2, Lu92;

    sget-object v0, Lo29;->k:Lo29;

    const-string v1, ""

    invoke-direct {p2, p1, v0, v1, v1}, Lu92;-><init>(Landroid/net/Uri;Lo29;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    sget-object p2, Lx92;->a:Lx92;

    invoke-interface {p0, p1, p2}, Ljv0;->j(Ljava/util/List;Lx92;)V

    return-void

    :pswitch_22
    new-instance v0, Lghf;

    new-instance v1, Li4d;

    new-instance v2, Lvvf;

    const/16 v3, 0x13

    invoke-direct {v2, p1, p2, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v2}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v0, v1}, Lghf;-><init>(Li4d;)V

    iget-object p0, p0, Ld5o;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {v0, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return-void

    :pswitch_3b
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v1, Lcmn;

    const/4 v4, 0x0

    const/4 v5, 0x5

    const/4 v2, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lcmn;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    iget-object p1, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast p1, Lk73;

    iget-object p1, p1, Lk73;->f:Ljava/lang/Object;

    check-cast p1, Lwln;

    iget-object p0, p0, Ld5o;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance p2, Ldmn;

    invoke-direct {p2, p1, v1}, Ldmn;-><init>(Lwln;Lcmn;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p2, p1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_3b
        :pswitch_7
        :pswitch_22
    .end packed-switch
.end method

.method public final e(II[BII)V
    .registers 6

    if-eqz p3, :cond_1f

    array-length p1, p3

    if-eqz p1, :cond_1f

    iget-object p0, p0, Lds5;->b:Ld5o;

    iget-object p0, p0, Ld5o;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    new-instance p1, Lvk2;

    const/16 p2, 0x9

    invoke-direct {p1, p2}, Lvk2;-><init>(B)V

    new-instance p2, Lldj;

    const-string p4, ".png"

    invoke-direct {p2, p0, p4, p3, p1}, Lldj;-><init>(Landroid/content/Context;Ljava/lang/String;[BLcom/opera/api/Callback;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    invoke-virtual {p2, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_1f
    return-void
.end method

.class public final synthetic Lbq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldq;


# direct methods
.method public synthetic constructor <init>(Ldq;B)V
    .registers 3

    iput-byte p2, p0, Lbq;->a:B

    iput-object p1, p0, Lbq;->b:Ldq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lbq;->a:B

    iget-object p0, p0, Lbq;->b:Ldq;

    packed-switch v0, :pswitch_data_40

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Ldq;->c:Lmq;

    iget-object v1, p0, Ldq;->g:Ljava/util/List;

    invoke-static {p1}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object p1

    new-instance v2, Lcp;

    const v3, 0x7f14009f

    invoke-direct {v2, v0, v3, v1}, Lcp;-><init>(Lmq;ILjava/util/List;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, v2, v0}, Lr22;->b(Ljjm;Lijm;)V

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_27
    iget-object p1, p0, Ldq;->e:Ljava/lang/String;

    sget-object v0, Llqm;->d:Llqm;

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lvx3;->c(Z)V

    new-instance v0, Lay3;

    invoke-direct {v0, p1}, Lay3;-><init>(Lvx3;)V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method

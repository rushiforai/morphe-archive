.class public final synthetic Lss5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lat5;

.field public final synthetic c:Lwcj;


# direct methods
.method public synthetic constructor <init>(Lat5;Lwcj;B)V
    .registers 4

    iput-byte p3, p0, Lss5;->a:B

    iput-object p1, p0, Lss5;->b:Lat5;

    iput-object p2, p0, Lss5;->c:Lwcj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lss5;->a:B

    iget-object v1, p0, Lss5;->c:Lwcj;

    iget-object p0, p0, Lss5;->b:Lat5;

    packed-switch v0, :pswitch_data_2e

    invoke-virtual {p0}, Ldej;->b()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-interface {v1, p0}, Lwcj;->a(Landroid/content/Context;)V

    return-void

    :pswitch_14
    invoke-virtual {p0}, Ldej;->b()V

    iget-object p0, p0, Lat5;->f:Ld5o;

    new-instance v0, Lge5;

    const/4 v2, 0x4

    invoke-direct {v0, v1, p1, v2}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast p1, Lk73;

    new-instance v1, Lge5;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v0, v2}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Lk73;->t(Lge5;)V

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

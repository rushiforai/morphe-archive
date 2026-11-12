.class public final synthetic Liz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Lzp1;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Lzp1;B)V
    .registers 4

    iput-byte p3, p0, Liz0;->a:B

    iput-object p1, p0, Liz0;->b:Ljava/lang/Object;

    iput-object p2, p0, Liz0;->c:Lzp1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 3

    iget-byte p1, p0, Liz0;->a:B

    iget-object v0, p0, Liz0;->c:Lzp1;

    iget-object p0, p0, Liz0;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_20

    check-cast p0, Lav2;

    check-cast v0, Lev2;

    iget-object p1, v0, Lev2;->z:Ljava/lang/Integer;

    invoke-interface {p0, p1}, Lav2;->f(Ljava/lang/Integer;)V

    return-void

    :pswitch_13
    check-cast p0, Lnz0;

    check-cast v0, Lbz0;

    iget-object p1, p0, Ld63;->mDismissReason:Lhjm;

    invoke-virtual {p0, v0, p1}, Lnz0;->onDismissDialog(Lbz0;Lhjm;)V

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

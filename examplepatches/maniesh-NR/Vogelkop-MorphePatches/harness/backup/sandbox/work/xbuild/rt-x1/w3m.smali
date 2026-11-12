.class public final synthetic Lw3m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz3m;

.field public final synthetic c:Ly3m;


# direct methods
.method public synthetic constructor <init>(Lz3m;Ly3m;B)V
    .registers 4

    iput-byte p3, p0, Lw3m;->a:B

    iput-object p1, p0, Lw3m;->b:Lz3m;

    iput-object p2, p0, Lw3m;->c:Ly3m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 4

    iget-byte p1, p0, Lw3m;->a:B

    const/4 v0, 0x1

    iget-object v1, p0, Lw3m;->c:Ly3m;

    iget-object p0, p0, Lw3m;->b:Lz3m;

    packed-switch p1, :pswitch_data_1e

    iget-object p0, p0, Lz3m;->o:Lcom/opera/api/Callback;

    if-eqz p0, :cond_13

    iget-object p1, v1, Ly3m;->a:Lszb;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_13
    return v0

    :pswitch_14
    iget-object p0, p0, Lz3m;->o:Lcom/opera/api/Callback;

    if-eqz p0, :cond_1d

    iget-object p1, v1, Ly3m;->a:Lszb;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_1d
    return v0

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.class public final synthetic Ly4b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz4b;

.field public final synthetic c:Lb5b;

.field public final synthetic d:Lx4b;


# direct methods
.method public synthetic constructor <init>(Lz4b;Lb5b;Lx4b;B)V
    .registers 5

    iput-byte p4, p0, Ly4b;->a:B

    iput-object p1, p0, Ly4b;->b:Lz4b;

    iput-object p2, p0, Ly4b;->c:Lb5b;

    iput-object p3, p0, Ly4b;->d:Lx4b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Ly4b;->a:B

    iget-object v1, p0, Ly4b;->d:Lx4b;

    iget-object v2, p0, Ly4b;->c:Lb5b;

    iget-object p0, p0, Ly4b;->b:Lz4b;

    packed-switch v0, :pswitch_data_34

    invoke-virtual {p0}, Ldej;->b()V

    invoke-interface {v2}, Lb5b;->b()La5b;

    move-result-object p0

    sget-object v0, Lvb0;->c:Lvb0;

    invoke-virtual {p0, v0}, La5b;->a(Lvb0;)V

    iget-object p0, v1, Lx4b;->b:Lnf;

    if-eqz p0, :cond_1e

    invoke-virtual {p0, p1}, Lnf;->onClick(Landroid/view/View;)V

    :cond_1e
    return-void

    :pswitch_1f
    invoke-virtual {p0}, Ldej;->b()V

    invoke-interface {v2}, Lb5b;->b()La5b;

    move-result-object p0

    sget-object v0, Lvb0;->b:Lvb0;

    invoke-virtual {p0, v0}, La5b;->a(Lvb0;)V

    iget-object p0, v1, Lx4b;->b:Lnf;

    if-eqz p0, :cond_32

    invoke-virtual {p0, p1}, Lnf;->onClick(Landroid/view/View;)V

    :cond_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method

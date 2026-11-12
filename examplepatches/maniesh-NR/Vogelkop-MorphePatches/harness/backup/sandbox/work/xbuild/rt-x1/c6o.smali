.class public final synthetic Lc6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li6o;

.field public final synthetic c:Lx6o;


# direct methods
.method public synthetic constructor <init>(Li6o;Lx6o;B)V
    .registers 4

    iput-byte p3, p0, Lc6o;->a:B

    iput-object p1, p0, Lc6o;->b:Li6o;

    iput-object p2, p0, Lc6o;->c:Lx6o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lc6o;->a:B

    iget-object v0, p0, Lc6o;->c:Lx6o;

    iget-object p0, p0, Lc6o;->b:Li6o;

    packed-switch p1, :pswitch_data_34

    iget-object p0, p0, Li6o;->g:Loyj;

    iget-object p1, v0, Lx6o;->f:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lr7o;->e:Lavj;

    const-wide/32 v0, 0x1c43a

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Loyj;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1e
    iget-object p0, p0, Li6o;->g:Loyj;

    iget-object p1, v0, Lx6o;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lr7o;->e:Lavj;

    const-wide/32 v0, 0x1c447

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Loyj;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method

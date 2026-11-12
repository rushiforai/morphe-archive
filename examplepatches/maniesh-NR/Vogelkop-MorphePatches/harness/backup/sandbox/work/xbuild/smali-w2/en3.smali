.class public final synthetic Len3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldn3;


# direct methods
.method public synthetic constructor <init>(Ldn3;B)V
    .registers 3

    iput-byte p2, p0, Len3;->a:B

    iput-object p1, p0, Len3;->b:Ldn3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Len3;->a:B

    iget-object p0, p0, Len3;->b:Ldn3;

    packed-switch v0, :pswitch_data_28

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Ldn3;->k:Lgn3;

    iget-object v0, v0, Lgn3;->h:Lzwk;

    new-instance v1, Lfv2;

    const/16 v2, 0xe

    invoke-direct {v1, p0, v2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, v0, v1, p0}, Lxih;->y(Landroid/content/Context;Lzwk;Ljava/lang/Runnable;Ll31;)V

    return-void

    :pswitch_1b
    const/4 p1, 0x1

    sput-boolean p1, Lxgh;->a:Z

    iget-object p1, p0, Ldn3;->k:Lgn3;

    iget-object p1, p1, Lgn3;->s:Lxm3;

    iget-object p0, p0, Le7n;->i:Lqhc;

    invoke-virtual {p1, p0}, Lxm3;->K(Lqhc;)V

    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method

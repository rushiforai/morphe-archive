.class public final synthetic Lk4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lala;


# direct methods
.method public synthetic constructor <init>(Lala;B)V
    .registers 3

    iput-byte p2, p0, Lk4m;->a:B

    iput-object p1, p0, Lk4m;->b:Lala;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lk4m;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lk4m;->b:Lala;

    packed-switch v0, :pswitch_data_26

    iget-object v0, p0, Lala;->e:Ljava/lang/Object;

    check-cast v0, Ly0f;

    sget-object v2, Lrs0;->f:Lrs0;

    invoke-virtual {v0, v2}, Ly0f;->c(Lrs0;)V

    iget-object p0, p0, Lala;->g:Ljava/lang/Object;

    check-cast p0, Lr4m;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lo4m;

    invoke-direct {v0, p0, v1}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {p0, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return-void

    :pswitch_21
    invoke-virtual {p0, v1}, Lala;->p(Z)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method

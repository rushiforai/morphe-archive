.class public final synthetic Ldua;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgua;

.field public final synthetic c:Lqf;


# direct methods
.method public synthetic constructor <init>(Lgua;Lqf;B)V
    .registers 4

    iput-byte p3, p0, Ldua;->a:B

    iput-object p1, p0, Ldua;->b:Lgua;

    iput-object p2, p0, Ldua;->c:Lqf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Ldua;->a:B

    iget-object v0, p0, Ldua;->c:Lqf;

    iget-object p0, p0, Ldua;->b:Lgua;

    packed-switch p1, :pswitch_data_2e

    iget-object p0, p0, Lgua;->o:Lm98;

    if-eqz p0, :cond_10

    invoke-virtual {p0}, Lm98;->run()V

    :cond_10
    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_14
    iget-object p1, p0, Lgua;->k:Leua;

    if-eqz p1, :cond_1b

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_1b
    iget-boolean p0, p0, Lgua;->l:Z

    if-eqz p0, :cond_22

    invoke-virtual {v0}, Ldej;->b()V

    :cond_22
    return-void

    :pswitch_23
    iget-object p0, p0, Lgua;->i:Leua;

    if-eqz p0, :cond_2a

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_2a
    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_23
        :pswitch_14
    .end packed-switch
.end method

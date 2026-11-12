.class public final synthetic Lsdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lydn;


# direct methods
.method public synthetic constructor <init>(Lydn;B)V
    .registers 3

    iput-byte p2, p0, Lsdn;->a:B

    iput-object p1, p0, Lsdn;->b:Lydn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Lsdn;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lsdn;->b:Lydn;

    packed-switch v0, :pswitch_data_4e

    check-cast p1, Lren;

    invoke-virtual {p0, p1}, Lydn;->y(Lren;)V

    return-void

    :pswitch_f
    check-cast p1, Lefn;

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v3, v0, Lvdn;->a:Z

    invoke-virtual {v0}, Lvdn;->b()Z

    move-result v0

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v4

    iget-boolean v4, v4, Lwdn;->a:Z

    if-eqz v4, :cond_25

    if-eqz v3, :cond_25

    const/4 v3, 0x1

    goto :goto_26

    :cond_25
    move v3, v1

    :goto_26
    iget-object v4, p0, Lydn;->c:Lgfn;

    invoke-interface {v4}, Lgfn;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_2f

    move v1, v0

    :cond_2f
    new-instance v0, Lvdn;

    invoke-direct {v0, v3, v1, p1, v2}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    invoke-virtual {p0, v0}, Lydn;->I(Lvdn;)V

    return-void

    :pswitch_38
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_4a

    iget-object p1, p0, Lydn;->I:Lefn;

    if-eqz p1, :cond_46

    iput-object v2, p0, Lydn;->I:Lefn;

    :cond_46
    invoke-virtual {p0}, Lydn;->e()V

    goto :goto_4d

    :cond_4a
    invoke-virtual {p0, v1}, Lydn;->C(Z)V

    :goto_4d
    return-void

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_38
        :pswitch_f
    .end packed-switch
.end method

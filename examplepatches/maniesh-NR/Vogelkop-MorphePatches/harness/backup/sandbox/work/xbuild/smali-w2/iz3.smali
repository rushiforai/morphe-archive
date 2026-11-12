.class public final synthetic Liz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llz3;


# direct methods
.method public synthetic constructor <init>(Llz3;B)V
    .registers 3

    iput-byte p2, p0, Liz3;->a:B

    iput-object p1, p0, Liz3;->b:Llz3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Liz3;->a:B

    sget-object v0, Lhjm;->a:Lhjm;

    iget-object p0, p0, Liz3;->b:Llz3;

    packed-switch p1, :pswitch_data_42

    iget-object p1, p0, Llz3;->c:Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :goto_f
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkz3;

    invoke-interface {v1}, Lkz3;->e()V

    goto :goto_f

    :cond_1f
    invoke-virtual {p0, v0}, Llz3;->b(Lhjm;)Z

    return-void

    :pswitch_23
    iget-object p1, p0, Llz3;->c:Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :goto_29
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkz3;

    invoke-interface {v1}, Lkz3;->d()V

    goto :goto_29

    :cond_39
    invoke-virtual {p0, v0}, Llz3;->b(Lhjm;)Z

    return-void

    :pswitch_3d
    invoke-virtual {p0, v0}, Llz3;->b(Lhjm;)Z

    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_3d
        :pswitch_23
    .end packed-switch
.end method

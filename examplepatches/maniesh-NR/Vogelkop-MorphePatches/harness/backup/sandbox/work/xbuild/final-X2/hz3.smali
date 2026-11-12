.class public final synthetic Lhz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    iput-byte p1, p0, Lhz3;->a:B

    iput-object p2, p0, Lhz3;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Lhz3;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lhz3;->a:B

    iget-boolean v0, p0, Lhz3;->b:Z

    iget-object p0, p0, Lhz3;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_4a

    check-cast p0, Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    const/4 p1, 0x1

    iput-boolean p1, p0, Ljs6;->b:Z

    iget-object p1, p0, Ljs6;->g:Ljava/lang/Object;

    check-cast p1, Lxoc;

    if-eqz v0, :cond_19

    sget-object v1, Ltg0;->l:Ltg0;

    goto :goto_1b

    :cond_19
    sget-object v1, Ltg0;->m:Ltg0;

    :goto_1b
    invoke-virtual {p1, v1}, Lxoc;->a(Ltg0;)V

    iget-object p0, p0, Ljs6;->d:Ljava/lang/Object;

    check-cast p0, Lfs6;

    iget-object p0, p0, Lfs6;->a:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "live_scores_odds_enabled"

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_2a
    check-cast p0, Llz3;

    iget-object p1, p0, Llz3;->c:Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :goto_32
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkz3;

    invoke-interface {v1}, Lkz3;->f()V

    goto :goto_32

    :cond_42
    if-eqz v0, :cond_49

    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Llz3;->b(Lhjm;)Z

    :cond_49
    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_2a
    .end packed-switch
.end method

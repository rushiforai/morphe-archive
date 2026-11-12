.class public final synthetic Ld6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf6g;


# direct methods
.method public synthetic constructor <init>(Lf6g;B)V
    .registers 3

    iput-byte p2, p0, Ld6g;->a:B

    iput-object p1, p0, Ld6g;->b:Lf6g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-byte p1, p0, Ld6g;->a:B

    iget-object p0, p0, Ld6g;->b:Lf6g;

    packed-switch p1, :pswitch_data_40

    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    if-eqz p2, :cond_19

    iget-object p1, p0, Lm6g;->d:Lot2;

    new-instance p2, Ll6g;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ll6g;-><init>(Lm6g;B)V

    invoke-virtual {p1, p2}, Lot2;->f(Ljava/lang/Runnable;)V

    goto :goto_32

    :cond_19
    iget-object p1, p0, Lm6g;->i:Lyu2;

    invoke-virtual {p1}, Lyu2;->b()Z

    invoke-virtual {p1}, Lyu2;->a()Z

    move-result p2

    if-eqz p2, :cond_2f

    iget-object p1, p1, Lyu2;->a:Lyhe;

    :try_start_26
    iget-object p1, p1, Lyhe;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/autofill/AutofillManager;

    if-eqz p1, :cond_2f

    invoke-virtual {p1}, Landroid/view/autofill/AutofillManager;->disableAutofillServices()V
    :try_end_2f
    .catchall {:try_start_26 .. :try_end_2f} :catchall_2f

    :catchall_2f
    :cond_2f
    invoke-virtual {p0}, Lm6g;->g()V

    :goto_32
    return-void

    :pswitch_33
    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iget-object p0, p0, Lm6g;->g:Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, LJ/N;->MivZ5HZZ(Z)V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_33
    .end packed-switch
.end method

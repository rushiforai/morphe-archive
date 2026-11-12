.class public final synthetic Lu4g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leua;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv4g;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lv4g;Landroid/content/Context;B)V
    .registers 4

    iput-byte p3, p0, Lu4g;->a:B

    iput-object p1, p0, Lu4g;->b:Lv4g;

    iput-object p2, p0, Lu4g;->c:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lu4g;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lu4g;->c:Landroid/content/Context;

    iget-object p0, p0, Lu4g;->b:Lv4g;

    packed-switch v0, :pswitch_data_42

    iget-object v0, p0, Lv4g;->d:Ljava/lang/Object;

    check-cast v0, Lodf;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lodf;->l(Landroid/content/Context;Z)V

    iget-object v0, p0, Lv4g;->e:Ljava/lang/Object;

    check-cast v0, Llld;

    iget-object v0, v0, Llld;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;

    iget-object v2, v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    if-ne v2, p0, :cond_25

    iput-object v1, v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    iget-wide v0, v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->e:J

    invoke-static {v0, v1, v3}, LJ/N;->M1EqC_CK(JZ)V

    :cond_25
    return-void

    :pswitch_26
    iget-object v0, p0, Lv4g;->d:Ljava/lang/Object;

    check-cast v0, Lodf;

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Lodf;->l(Landroid/content/Context;Z)V

    iget-object v0, p0, Lv4g;->e:Ljava/lang/Object;

    check-cast v0, Llld;

    iget-object v0, v0, Llld;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;

    iget-object v2, v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    if-ne v2, p0, :cond_41

    iput-object v1, v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    iget-wide v0, v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->e:J

    invoke-static {v0, v1, v3}, LJ/N;->M1EqC_CK(JZ)V

    :cond_41
    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_26
    .end packed-switch
.end method

.class public final synthetic Los2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrs2;


# direct methods
.method public synthetic constructor <init>(Lrs2;B)V
    .registers 3

    iput-byte p2, p0, Los2;->a:B

    iput-object p1, p0, Los2;->b:Lrs2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Los2;->a:B

    iget-object p0, p0, Los2;->b:Lrs2;

    packed-switch v0, :pswitch_data_34

    iget-object v0, p0, Lrs2;->d:Lcom/opera/android/autofill/AutofillManager;

    new-instance v1, Lps2;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lps2;-><init>(Lrs2;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/autofill/AutofillManager;->c(Lcom/opera/api/Callback;)V

    new-instance v1, Lps2;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lps2;-><init>(Lrs2;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/autofill/AutofillManager;->e(Lcom/opera/api/Callback;)V

    new-instance v1, Lps2;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lps2;-><init>(Lrs2;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/autofill/AutofillManager;->d(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_25
    iget-object v0, p0, Lrs2;->b:Lcom/opera/android/autofill/PasswordManager;

    new-instance v1, Lps2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lps2;-><init>(Lrs2;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lcom/opera/android/autofill/PasswordManager;->a(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method

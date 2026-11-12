.class public final Lrs2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li7f;

.field public final b:Lcom/opera/android/autofill/PasswordManager;

.field public final c:Lcom/opera/android/autofill/PasswordDataMonitor;

.field public final d:Lcom/opera/android/autofill/AutofillManager;

.field public final e:Lcom/opera/android/autofill/PersonalDataMonitor;

.field public f:I

.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>()V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lrs2;->a:Li7f;

    new-instance v0, Lcom/opera/android/autofill/PasswordManager;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrs2;->b:Lcom/opera/android/autofill/PasswordManager;

    new-instance v0, Los2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Los2;-><init>(Lrs2;B)V

    new-instance v2, Lcom/opera/android/autofill/PasswordDataMonitor;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v0, v2, Lcom/opera/android/autofill/PasswordDataMonitor;->a:Ljava/lang/Runnable;

    invoke-static {v2}, LJ/N;->MtK05rRq(Ljava/lang/Object;)J

    move-result-wide v3

    iput-wide v3, v2, Lcom/opera/android/autofill/PasswordDataMonitor;->b:J

    iput-object v2, p0, Lrs2;->c:Lcom/opera/android/autofill/PasswordDataMonitor;

    new-instance v0, Lps2;

    invoke-direct {v0, p0, v1}, Lps2;-><init>(Lrs2;B)V

    invoke-static {v0}, Lcom/opera/android/autofill/PasswordManager;->a(Lcom/opera/api/Callback;)V

    new-instance v0, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v0}, Lcom/opera/android/autofill/AutofillManager;-><init>()V

    iput-object v0, p0, Lrs2;->d:Lcom/opera/android/autofill/AutofillManager;

    new-instance v1, Los2;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Los2;-><init>(Lrs2;B)V

    invoke-static {v1}, Lcom/opera/android/autofill/AutofillManager;->b(Ljava/lang/Runnable;)Lcom/opera/android/autofill/PersonalDataMonitor;

    move-result-object v1

    iput-object v1, p0, Lrs2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    new-instance v1, Lps2;

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
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object p0, p0, Lrs2;->a:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt53;

    iget-byte v1, v0, Lt53;->a:B

    iget-object v0, v0, Lt53;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_30

    check-cast v0, Lkcg;

    iget-object v1, v0, Lkcg;->c:Lxb;

    iget-object v1, v1, Lxb;->d:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lipf;

    invoke-virtual {v0, v1}, Lkcg;->a(Lipf;)V

    goto :goto_6

    :pswitch_29
    check-cast v0, Lr53;

    invoke-virtual {v0}, Lr53;->run()V

    goto :goto_6

    :cond_2f
    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method

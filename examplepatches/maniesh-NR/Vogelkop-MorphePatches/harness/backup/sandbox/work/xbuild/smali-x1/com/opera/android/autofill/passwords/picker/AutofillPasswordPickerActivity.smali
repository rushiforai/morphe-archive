.class public final Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;
.super Lhjf;
.source "SourceFile"

# interfaces
.implements Ln7n;
.implements Lm24;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003:\u0001\u0006B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;",
        "Lhjf;",
        "Ln7n;",
        "Lm24;",
        "<init>",
        "()V",
        "he",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic o:I


# instance fields
.field public j:Lv78;

.field public k:Lgwi;

.field public final l:Ld5o;

.field public final m:Lpad;

.field public n:Liz9;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lhjf;-><init>()V

    new-instance v0, Ld5o;

    iget-object v1, p0, Lhjf;->e:Lxbf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Ld5o;->a:Ljava/lang/Object;

    iput-object p0, v0, Ld5o;->b:Ljava/lang/Object;

    new-instance v1, Lay;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Ld5o;->c:Ljava/lang/Object;

    iput-object v0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->l:Ld5o;

    new-instance v0, Lpad;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lpad;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->m:Lpad;

    return-void
.end method


# virtual methods
.method public final F()Lgjm;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->l:Ld5o;

    iget-object p0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast p0, Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    return-object p0
.end method

.method public final G(Lw3g;Ljava/lang/String;)V
    .registers 14

    iget-object v0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->n:Liz9;

    if-eqz v0, :cond_14

    iget-object v1, p1, Lw3g;->f:Ljava/lang/String;

    new-instance v2, Lab;

    const/16 v3, 0x1d

    invoke-direct {v2, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    iget v3, v0, Liz9;->a:I

    iget v0, v0, Liz9;->b:I

    invoke-static {v1, p2, v3, v0, v2}, LJ/N;->MJtaqBis(Ljava/lang/Object;Ljava/lang/Object;IILjava/lang/Object;)V

    :cond_14
    new-instance v4, Ln3g;

    iget v0, p1, Lw3g;->a:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p1, Lw3g;->c:Ljava/lang/String;

    iget-object v7, p1, Lw3g;->g:Ljava/lang/String;

    iget-object v8, p1, Lw3g;->f:Ljava/lang/String;

    iget-boolean v0, p1, Lw3g;->h:Z

    if-nez v0, :cond_31

    iget-boolean v0, p1, Lw3g;->i:Z

    if-nez v0, :cond_31

    iget-object p1, p1, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object p1, p1, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    move-object v10, p1

    :goto_2f
    move-object v9, p2

    goto :goto_33

    :cond_31
    move-object v10, v7

    goto :goto_2f

    :goto_33
    invoke-direct/range {v4 .. v10}, Ln3g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string p2, "AutofillIntent.EXTRA_DATA"

    invoke-virtual {p1, p2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p1

    const/4 p2, -0x1

    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final H(Lkotlin/jvm/functions/Function0;)V
    .registers 6

    invoke-virtual {p0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->F()Lgjm;

    move-result-object v0

    new-instance v1, Lmmm;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lp01;

    const/4 v3, 0x3

    invoke-direct {v2, p1, v3}, Lp01;-><init>(Lkotlin/jvm/functions/Function0;B)V

    new-instance p1, Lug;

    const/4 v3, 0x7

    invoke-direct {p1, v2, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, p0, p1}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void
.end method

.method public final a(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->m:Lpad;

    invoke-virtual {p0, p1}, Lpad;->t(Ll24;)V

    return-void
.end method

.method public final c(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->m:Lpad;

    invoke-virtual {p0, p1}, Lpad;->A(Ll24;)V

    return-void
.end method

.method public final getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    const-string v0, "com.opera.android.BPR_SERVICE"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p0

    :cond_9
    const-string v0, "com.opera.android.ui.SECURE_WINDOW_SERVICE"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object p0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->k:Lgwi;

    if-nez p0, :cond_16

    const/4 p0, 0x0

    :cond_16
    return-object p0

    :cond_17
    invoke-super {p0, p1}, Lhjf;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final j()Lr7n;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->j:Lv78;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    return-object p0
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 14

    invoke-super {p0, p1}, Lhjf;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0d0086

    invoke-virtual {p0, p1}, Lfp1;->setContentView(I)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance p1, Lx7j;

    sget-object v7, Lvml;->d:Lumi;

    invoke-virtual {p0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->F()Lgjm;

    move-result-object v8

    new-instance v9, Lvx;

    const/16 v11, 0xa

    invoke-direct {v9, p0, v11}, Lvx;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lli;

    const/4 v5, 0x0

    const/16 v6, 0x9

    const-class v2, Lcom/opera/android/OperaApplication;

    const-string v3, "usageReporter"

    const-string v4, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    invoke-direct/range {v0 .. v6}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v6, Lki;

    const/4 v1, 0x1

    invoke-direct {v6, v0, v1}, Lki;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->l:Ld5o;

    iget-object v0, v0, Ld5o;->a:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lmi;

    move-object v3, v7

    iget-object v7, v0, Lmi;->i:Lhi;

    move-object v4, v8

    iget-object v8, v0, Lmi;->o:Lhi;

    iget-object v0, v0, Lmi;->r:Lhi;

    const/4 v10, 0x1

    move-object v2, p1

    move-object v5, v9

    move-object v9, v0

    invoke-direct/range {v2 .. v10}, Lx7j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lesk;Lesk;Ljava/lang/Object;Lesk;Lesk;B)V

    new-instance p1, Llm3;

    invoke-virtual {p0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->F()Lgjm;

    move-result-object v0

    new-instance v3, Lva2;

    invoke-direct {v3, p0, v11}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0, v3}, Llm3;-><init>(Lgjm;Lqcf;)V

    new-instance v0, Lv78;

    invoke-static {v2}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v3

    invoke-direct {v0, v3, v1}, Lv78;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->j:Lv78;

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    new-instance v3, Lul9;

    invoke-static {v2, p1}, Lh1b;->w(Ljava/lang/Object;Ljava/lang/Object;)Lcsh;

    move-result-object p1

    invoke-direct {v3, p1, v1}, Lul9;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v0, Landroidx/fragment/app/w;->B:Lol9;

    new-instance p1, Lgwi;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-direct {p1, v0}, Lgwi;-><init>(Landroid/view/Window;)V

    iput-object p1, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->k:Lgwi;

    new-instance p1, Lhe;

    invoke-direct {p1, p0, v1}, Lhe;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->a(Ll24;)V

    invoke-virtual {p0}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object p1

    new-instance v0, Lxt2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lxt2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v0}, Lkcf;->a(Lndc;Lgcf;)V

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    new-instance v0, Lvt2;

    invoke-direct {v0, p1, p0}, Lvt2;-><init>(Landroidx/fragment/app/w;Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;)V

    iget-object p1, p1, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lwt2;

    invoke-direct {p1, p0, v1}, Lwt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return-void
.end method

.method public final s()Lfi;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->l:Ld5o;

    return-object p0
.end method

.method public final t()Lijf;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->l:Ld5o;

    return-object p0
.end method

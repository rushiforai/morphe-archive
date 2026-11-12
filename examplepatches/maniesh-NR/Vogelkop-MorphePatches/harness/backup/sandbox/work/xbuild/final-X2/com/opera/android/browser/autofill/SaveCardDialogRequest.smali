.class public final Lcom/opera/android/browser/autofill/SaveCardDialogRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li16;

.field public final b:Landroid/content/Context;

.field public final c:Leej;

.field public final d:Lrii;

.field public final e:J


# direct methods
.method public constructor <init>(JLdx3;Lumi;Leej;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    iput-object p3, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->b:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->u:Lt1;

    invoke-static {p3, p4, v0}, Li16;->r(Landroid/content/Context;Lumi;Lt1;)Li16;

    move-result-object p3

    iput-object p3, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->a:Li16;

    iput-object p5, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->c:Leej;

    iput-wide p1, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->e:J

    new-instance p1, Lrii;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lrii;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->d:Lrii;

    return-void
.end method

.method public static create(JLcom/opera/android/browser/chromium/ChromiumContent;)Lcom/opera/android/browser/autofill/SaveCardDialogRequest;
    .registers 9
    .param p2    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v3

    sget-object v4, Lvml;->d:Lumi;

    iget-object v5, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->G:Leej;

    if-eqz v5, :cond_11

    move-wide v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;-><init>(JLdx3;Lumi;Leej;)V

    return-object v0

    :cond_11
    const-string p0, "Error"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final showDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "automatic_card_save_ask"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-wide v1, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->e:J

    if-nez v0, :cond_1c

    invoke-static {v1, v2}, LJ/N;->MltfAxC5(J)V

    return-void

    :cond_1c
    iget-object v0, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->a:Li16;

    invoke-virtual {v0, p5, p6}, Li16;->m(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-static {v1, v2}, LJ/N;->MltfAxC5(J)V

    return-void

    :cond_28
    new-instance v0, Lpr;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Lpr;->b:Ljava/lang/Object;

    iput-object p2, v0, Lpr;->c:Ljava/lang/Object;

    iput-object p3, v0, Lpr;->d:Ljava/lang/Object;

    iput p4, v0, Lpr;->a:I

    iput-object p5, v0, Lpr;->e:Ljava/lang/Object;

    iput-object p6, v0, Lpr;->f:Ljava/lang/Object;

    iget-object p1, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->c:Leej;

    iget-object p1, p1, Leej;->a:Lnej;

    new-instance p2, Lxq3;

    const/16 p3, 0x9

    iget-object p0, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->d:Lrii;

    invoke-direct {p2, v0, p0, p3}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, p2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

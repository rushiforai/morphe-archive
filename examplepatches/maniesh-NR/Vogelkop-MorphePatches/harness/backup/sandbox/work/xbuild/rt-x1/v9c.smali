.class public final Lv9c;
.super Lcom/leanplum/callbacks/ActionCallback;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 3

    iput-byte p2, p0, Lv9c;->a:B

    packed-switch p2, :pswitch_data_24

    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lv9c;->b:Landroid/content/Context;

    return-void

    :pswitch_f
    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lv9c;->b:Landroid/content/Context;

    return-void

    :pswitch_19
    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lv9c;->b:Landroid/content/Context;

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_19
        :pswitch_f
    .end packed-switch
.end method


# virtual methods
.method public final onResponse(Lcom/leanplum/ActionContext;)Z
    .registers 8

    iget-byte v0, p0, Lv9c;->a:B

    const-string v1, "URL"

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_74

    invoke-virtual {p1, v1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_27

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_27

    invoke-static {p1}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_27

    new-instance v0, Lt9c;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Lt9c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    move v2, v3

    :cond_27
    return v2

    :pswitch_28
    invoke-virtual {p1, v1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "intent"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_49

    :try_start_3c
    invoke-static {p1, v3}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_3f
    .catch Ljava/net/URISyntaxException; {:try_start_3c .. :try_end_3f} :catch_49

    new-instance p1, Lt9c;

    const/4 v1, 0x2

    invoke-direct {p1, p0, v0, v1}, Lt9c;-><init>(Lcom/leanplum/callbacks/ActionCallback;Ljava/lang/Comparable;B)V

    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    move v2, v3

    :catch_49
    :cond_49
    return v2

    :pswitch_4a
    invoke-virtual {p1, v1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->s(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_73

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Llk6;->a:Llk6;

    sget-object v1, Lik6;->b:Lik6;

    sget-object v4, Llqm;->K:Llqm;

    iget-object v5, p0, Lv9c;->b:Landroid/content/Context;

    invoke-static {v2, v1, v4, v5, v0}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_72

    new-instance v0, Lt9c;

    invoke-direct {v0, p0, p1, v3}, Lt9c;-><init>(Lcom/leanplum/callbacks/ActionCallback;Ljava/lang/Comparable;B)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    :cond_72
    move v2, v3

    :cond_73
    return v2

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_4a
        :pswitch_28
    .end packed-switch
.end method

.class public final Lu9c;
.super Lcom/leanplum/callbacks/ActionCallback;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lc37;


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;)V
    .registers 5

    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lu9c;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lc37;

    new-instance v1, Lt1;

    const/16 v2, 0xc

    invoke-direct {v1, p1, v2}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance p1, Lrqd;

    const/16 v2, 0x1a

    invoke-direct {p1, v2}, Lrqd;-><init>(B)V

    invoke-direct {v0, v1, p1}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lu9c;->b:Lc37;

    return-void
.end method


# virtual methods
.method public final onResponse(Lcom/leanplum/ActionContext;)Z
    .registers 4

    const-string v0, "URL"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lu9c;->b:Lc37;

    invoke-virtual {v0, p1}, Lc37;->A(Ljava/lang/String;)Lz0c;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_19

    new-instance v1, Lt9c;

    invoke-direct {v1, p1, p0, v0}, Lt9c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0

    :cond_19
    return v0
.end method

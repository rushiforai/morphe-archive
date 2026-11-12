.class public final synthetic Lcom/leanplum/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;

.field public final synthetic b:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;Landroid/os/Bundle;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/a;->a:Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;

    iput-object p2, p0, Lcom/leanplum/a;->b:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/a;->a:Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;

    iget-object p0, p0, Lcom/leanplum/a;->b:Landroid/os/Bundle;

    invoke-static {v0, p0}, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;->a(Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;Landroid/os/Bundle;)V

    return-void
.end method

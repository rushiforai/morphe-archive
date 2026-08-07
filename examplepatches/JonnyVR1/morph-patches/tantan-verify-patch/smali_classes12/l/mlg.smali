.class public final synthetic Ll/mlg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/content/Intent;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mlg;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/mlg;->b:Landroid/content/Intent;

    iput-boolean p3, p0, Ll/mlg;->c:Z

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mlg;->a:Landroid/content/Context;

    iget-object v1, p0, Ll/mlg;->b:Landroid/content/Intent;

    iget-boolean p0, p0, Ll/mlg;->c:Z

    invoke-static {v0, v1, p0, p1}, Lcom/google/firebase/messaging/FcmBroadcastProcessor;->a(Landroid/content/Context;Landroid/content/Intent;ZLcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

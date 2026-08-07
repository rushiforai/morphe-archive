.class public final synthetic Ll/k6z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic a:Ll/vnd0;

.field public final synthetic b:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Ll/vnd0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/k6z0;->a:Ll/vnd0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/k6z0;->b:Landroid/os/Bundle;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k6z0;->a:Ll/vnd0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/k6z0;->b:Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/vnd0;->f(Landroid/os/Bundle;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.class public final Lx5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lcom/opera/android/autofill/PasswordManager;

.field public final b:Li7f;

.field public c:Lcom/opera/android/autofill/PasswordDataMonitor;

.field public final d:Lw4g;

.field public e:La4g;

.field public f:La4g;


# direct methods
.method public constructor <init>(Lcom/opera/android/autofill/PasswordManager;Lvnj;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx5g;->a:Lcom/opera/android/autofill/PasswordManager;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lx5g;->b:Li7f;

    new-instance p1, Lw4g;

    invoke-direct {p1, p2}, Lw4g;-><init>(Lvnj;)V

    iput-object p1, p0, Lx5g;->d:Lw4g;

    invoke-virtual {p0}, Lx5g;->c()V

    return-void
.end method

.method public static b(Lx5g;Lcom/opera/api/Callback;)V
    .registers 3

    iget-object v0, p0, Lx5g;->e:La4g;

    if-eqz v0, :cond_8

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_8
    invoke-virtual {p0, p1}, Lx5g;->a(Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lw5g;

    invoke-virtual {p0}, Lx5g;->c()V

    iget-object p0, p0, Lx5g;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lw5g;

    iget-object p0, p0, Lx5g;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lcom/opera/api/Callback;)V
    .registers 4

    invoke-virtual {p0}, Lx5g;->c()V

    new-instance v0, Leof;

    const/4 v1, 0x6

    invoke-direct {v0, p0, p1, v1}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lx5g;->a:Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lcom/opera/android/autofill/PasswordManager;->a(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final c()V
    .registers 6

    iget-object v0, p0, Lx5g;->c:Lcom/opera/android/autofill/PasswordDataMonitor;

    if-nez v0, :cond_38

    new-instance v0, Lvdf;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lx5g;->a:Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lcom/opera/android/autofill/PasswordDataMonitor;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v0, v2, Lcom/opera/android/autofill/PasswordDataMonitor;->a:Ljava/lang/Runnable;

    invoke-static {v2}, LJ/N;->MtK05rRq(Ljava/lang/Object;)J

    move-result-wide v3

    iput-wide v3, v2, Lcom/opera/android/autofill/PasswordDataMonitor;->b:J

    iput-object v2, p0, Lx5g;->c:Lcom/opera/android/autofill/PasswordDataMonitor;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lx5g;->a(Lcom/opera/api/Callback;)V

    invoke-virtual {p0}, Lx5g;->c()V

    new-instance v0, Lo8f;

    const/16 v2, 0xd

    invoke-direct {v0, p0, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, p0}, LJ/N;->MwwLnzkg(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_38
    return-void
.end method

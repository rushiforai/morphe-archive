.class public final Llyk;
.super Lcb;
.source "SourceFile"

# interfaces
.implements Lih4;


# instance fields
.field public final a:Ljava/lang/Runnable;

.field public final b:Lcom/opera/api/Callback;

.field public c:Ljava/lang/String;

.field public d:Z

.field public final synthetic e:Lmyk;


# direct methods
.method public constructor <init>(Lmyk;Ljava/lang/Runnable;Lcom/opera/api/Callback;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llyk;->e:Lmyk;

    iput-object p2, p0, Llyk;->a:Ljava/lang/Runnable;

    iput-object p3, p0, Llyk;->b:Lcom/opera/api/Callback;

    iput-object p4, p0, Llyk;->c:Ljava/lang/String;

    iget-object p1, p1, Lmyk;->b:Ldb;

    invoke-virtual {p1, p0}, Ldb;->a(Lcb;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 2

    const-string v0, "Failed to sign in"

    invoke-virtual {p0, v0}, Llyk;->h(Ljava/lang/String;)V

    return-void
.end method

.method public final c()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Llyk;->h(Ljava/lang/String;)V

    return-void
.end method

.method public final cancel()V
    .registers 2

    const-string v0, "Cancelled"

    invoke-virtual {p0, v0}, Llyk;->h(Ljava/lang/String;)V

    return-void
.end method

.method public final h(Ljava/lang/String;)V
    .registers 5

    iget-boolean v0, p0, Llyk;->d:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Llyk;->d:Z

    iget-object v0, p0, Llyk;->e:Lmyk;

    iget-object v1, v0, Lmyk;->i:Llyk;

    const/4 v2, 0x0

    if-ne v1, p0, :cond_11

    iput-object v2, v0, Lmyk;->i:Llyk;

    :cond_11
    iget-object v1, v0, Lmyk;->b:Ldb;

    invoke-virtual {v1, p0}, Ldb;->h(Lcb;)V

    if-nez p1, :cond_25

    iget-object p1, p0, Llyk;->c:Ljava/lang/String;

    if-eqz p1, :cond_1f

    invoke-virtual {v0, p1}, Lmyk;->c(Ljava/lang/String;)V

    :cond_1f
    iget-object p1, p0, Llyk;->a:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_2a

    :cond_25
    iget-object v0, p0, Llyk;->b:Lcom/opera/api/Callback;

    invoke-interface {v0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_2a
    iput-object v2, p0, Llyk;->c:Ljava/lang/String;

    return-void
.end method

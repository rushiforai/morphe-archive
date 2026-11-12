.class public final Lb7f;
.super Lu73;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Supplier;
.implements Ls37;
.implements Lj4f;
.implements Le9e;


# instance fields
.field public a:Lh7f;

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb7f;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lorg/chromium/base/Callback;)V
    .registers 2

    iget-object p0, p0, Lb7f;->a:Lh7f;

    if-eqz p0, :cond_7

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    :cond_7
    return-void
.end method

.method public final b(Lorg/chromium/base/Callback;)Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0, p1}, Lb7f;->c(Lorg/chromium/base/Callback;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final c(Lorg/chromium/base/Callback;)Ljava/lang/Object;
    .registers 5

    iget-object v0, p0, Lb7f;->a:Lh7f;

    if-nez v0, :cond_b

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lb7f;->a:Lh7f;

    :cond_b
    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v0, p0, Lb7f;->b:Ljava/lang/Object;

    if-nez v0, :cond_13

    return-object v0

    :cond_13
    new-instance v1, Ljbd;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v0, p1, v2}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lorg/chromium/base/ThreadUtils;->c(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 4

    iget-object v0, p0, Lb7f;->b:Ljava/lang/Object;

    iput-object p1, p0, Lb7f;->b:Ljava/lang/Object;

    iget-object v1, p0, Lb7f;->a:Lh7f;

    if-eqz v1, :cond_24

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    iget-object p0, p0, Lb7f;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_14
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/Callback;

    invoke-interface {v0, p1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    goto :goto_14

    :cond_24
    return-void
.end method

.method public final get()Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Lb7f;->b:Ljava/lang/Object;

    return-object p0
.end method

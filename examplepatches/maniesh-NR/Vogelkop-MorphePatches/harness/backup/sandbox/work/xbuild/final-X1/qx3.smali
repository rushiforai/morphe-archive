.class public final Lqx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final a:Lb7f;

.field public b:Lb2l;


# direct methods
.method public constructor <init>(Lk6l;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lb7f;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lb7f;-><init>(Ljava/lang/Object;Z)V

    iput-object v0, p0, Lqx3;->a:Lb7f;

    invoke-virtual {p1, p0}, Lk6l;->c(Lj6l;)V

    iget-object p1, p1, Lk6l;->s:Lg6l;

    new-instance v0, Lqz;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lg6l;->F(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    invoke-virtual {p0, p2}, Lqx3;->a(Lb2l;)V

    return-void
.end method

.method public final a(Lb2l;)V
    .registers 5

    invoke-static {p1}, Luy3;->F(Lb9l;)Luy3;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    iget-object v0, v0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_b

    :cond_a
    move-object v0, v1

    :goto_b
    iget-object v2, p0, Lqx3;->a:Lb7f;

    if-eqz v0, :cond_15

    iput-object v1, p0, Lqx3;->b:Lb2l;

    invoke-virtual {v2, v0}, Lb7f;->d(Ljava/lang/Object;)V

    return-void

    :cond_15
    iget-object v0, p0, Lqx3;->b:Lb2l;

    if-eq p1, v0, :cond_1e

    iput-object p1, p0, Lqx3;->b:Lb2l;

    invoke-virtual {v2, v1}, Lb7f;->d(Ljava/lang/Object;)V

    :cond_1e
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object p0, p0, Lqx3;->a:Lb7f;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lb7f;->d(Ljava/lang/Object;)V

    return-void
.end method

.class public final Lan;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lh7f;

.field public b:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lan;->a:Lh7f;

    return-void
.end method


# virtual methods
.method public final onPause(Lndc;)V
    .registers 3

    const/4 p1, 0x0

    iput-boolean p1, p0, Lan;->b:Z

    new-instance v0, Lg7f;

    iget-object p0, p0, Lan;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_a
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1a

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldr;

    invoke-virtual {p0, p1}, Ldr;->d(Z)V

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 3

    const/4 p1, 0x1

    iput-boolean p1, p0, Lan;->b:Z

    new-instance v0, Lg7f;

    iget-object p0, p0, Lan;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_a
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1a

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldr;

    invoke-virtual {p0, p1}, Ldr;->d(Z)V

    goto :goto_a

    :cond_1a
    return-void
.end method

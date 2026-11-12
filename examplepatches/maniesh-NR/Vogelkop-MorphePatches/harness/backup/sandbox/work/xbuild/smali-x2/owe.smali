.class public final Lowe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static final c:Lowe;


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final b:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lowe;

    invoke-direct {v0}, Lowe;-><init>()V

    sput-object v0, Lowe;->c:Lowe;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lowe;->b:Li7f;

    return-void
.end method


# virtual methods
.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lnwe;

    invoke-virtual {p0, p1}, Lowe;->a(Lnwe;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lnwe;

    invoke-virtual {p0, p1}, Lowe;->b(Lnwe;)V

    return-void
.end method

.method public final a(Lnwe;)V
    .registers 2

    iget-object p0, p0, Lowe;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Lnwe;)V
    .registers 2

    iget-object p0, p0, Lowe;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Z)V
    .registers 3

    iget-object v0, p0, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eq v0, p1, :cond_1f

    new-instance v0, Lg7f;

    iget-object p0, p0, Lowe;->b:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnwe;

    invoke-interface {p0, p1}, Lnwe;->y(Z)V

    goto :goto_f

    :cond_1f
    return-void
.end method

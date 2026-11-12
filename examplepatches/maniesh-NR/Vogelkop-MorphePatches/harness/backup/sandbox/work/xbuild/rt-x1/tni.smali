.class public final Ltni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static final c:Ltni;


# instance fields
.field public final a:Li7f;

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ltni;

    invoke-direct {v0}, Ltni;-><init>()V

    sput-object v0, Ltni;->c:Ltni;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Ltni;->a:Li7f;

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltni;->b:Z

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lsni;

    invoke-virtual {p0, p1}, Ltni;->a(Lsni;)V

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lsni;

    invoke-virtual {p0, p1}, Ltni;->c(Lsni;)V

    return-void
.end method

.method public final a(Lsni;)V
    .registers 2

    iget-object p0, p0, Ltni;->a:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Landroid/content/res/Configuration;)V
    .registers 4

    sget-object v0, Ltni;->c:Ltni;

    const/4 v1, 0x1

    if-eq p0, v0, :cond_a

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq p1, v1, :cond_a

    const/4 v1, 0x0

    :cond_a
    iget-boolean p1, p0, Ltni;->b:Z

    if-eq p1, v1, :cond_27

    iput-boolean v1, p0, Ltni;->b:Z

    new-instance p1, Lg7f;

    iget-object p0, p0, Ltni;->a:Li7f;

    invoke-direct {p1, p0}, Lg7f;-><init>(Li7f;)V

    :goto_17
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_27

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsni;

    invoke-interface {p0, v1}, Lsni;->Y(Z)V

    goto :goto_17

    :cond_27
    return-void
.end method

.method public final c(Lsni;)V
    .registers 2

    iget-object p0, p0, Ltni;->a:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

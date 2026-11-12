.class public final Lwvj;
.super Lqw4;
.source "SourceFile"


# instance fields
.field public final a:Lqw4;

.field public final b:Ldc3;


# direct methods
.method public constructor <init>(Lqw4;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwvj;->a:Lqw4;

    new-instance v0, Ldc3;

    invoke-direct {v0, p1}, Ldc3;-><init>(Lsic;)V

    iput-object v0, p0, Lwvj;->b:Ldc3;

    return-void
.end method


# virtual methods
.method public final I(IILjava/lang/Object;)V
    .registers 4

    iget-object p0, p0, Lwvj;->b:Ldc3;

    invoke-virtual {p0, p1, p2, p3}, Ldc3;->I(IILjava/lang/Object;)V

    return-void
.end method

.method public final S(II)V
    .registers 3

    iget-object p0, p0, Lwvj;->b:Ldc3;

    invoke-virtual {p0, p1, p2}, Ldc3;->S(II)V

    return-void
.end method

.method public final a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    iget-object p0, p0, Lwvj;->a:Lqw4;

    invoke-virtual {p0, p1, p2}, Lqw4;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final b(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    iget-object p0, p0, Lwvj;->a:Lqw4;

    invoke-virtual {p0, p1, p2}, Lqw4;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    iget-object p0, p0, Lwvj;->a:Lqw4;

    invoke-virtual {p0, p1, p2}, Lqw4;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-object p0, p0, Lwvj;->a:Lqw4;

    invoke-virtual {p0, p1, p2}, Lqw4;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final f(II)V
    .registers 3

    iget-object p0, p0, Lwvj;->b:Ldc3;

    invoke-virtual {p0, p1, p2}, Ldc3;->f(II)V

    return-void
.end method

.method public final t(II)V
    .registers 3

    iget-object p0, p0, Lwvj;->b:Ldc3;

    invoke-virtual {p0, p1, p2}, Ldc3;->t(II)V

    return-void
.end method

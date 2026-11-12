.class public abstract Llj;
.super Lltl;
.source "SourceFile"


# direct methods
.method public constructor <init>(II)V
    .registers 4

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    invoke-virtual {v0, p1}, Lu7k;->s(I)V

    iget-object p1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Litl;

    iput p2, p1, Litl;->b:I

    invoke-direct {p0, p1}, Lltl;-><init>(Litl;)V

    return-void
.end method

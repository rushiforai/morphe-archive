.class public final Ldll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public a:I

.field public final b:Li7f;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Ldll;->b:Li7f;

    return-void
.end method


# virtual methods
.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcll;

    invoke-virtual {p0, p1}, Ldll;->a(Lcll;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcll;

    invoke-virtual {p0, p1}, Ldll;->b(Lcll;)V

    return-void
.end method

.method public final a(Lcll;)V
    .registers 2

    iget-object p0, p0, Ldll;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Lcll;)V
    .registers 2

    iget-object p0, p0, Ldll;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

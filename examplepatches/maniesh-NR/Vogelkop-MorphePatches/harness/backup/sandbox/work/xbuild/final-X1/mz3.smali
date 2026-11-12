.class public final Lmz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:Llz3;

.field public final synthetic b:Lz8b;


# direct methods
.method public constructor <init>(Lz8b;Llz3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lmz3;->a:Llz3;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lmz3;->b:Lz8b;

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 3

    iget-object v0, p0, Lmz3;->a:Llz3;

    iget-object v0, v0, Llz3;->c:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Lmz3;->b:Lz8b;

    iget-object v0, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast v0, Landroid/util/Pair;

    if-eqz v0, :cond_16

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lpz3;

    invoke-interface {v0, p1}, Ljjm;->finish(Lhjm;)V

    :cond_16
    const/4 p1, 0x0

    iput-object p1, p0, Lz8b;->a:Ljava/lang/Object;

    return-void
.end method

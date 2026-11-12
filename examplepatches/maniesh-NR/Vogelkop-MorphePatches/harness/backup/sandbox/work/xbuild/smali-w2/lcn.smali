.class public final Llcn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final a:Lrn9;

.field public final synthetic b:Lrcn;


# direct methods
.method public constructor <init>(Lrcn;Lx5f;Lmf0;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llcn;->b:Lrcn;

    new-instance p1, Lrn9;

    const/16 v0, 0x12

    invoke-direct {p1, p2, p3, v0}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Llcn;->a:Lrn9;

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object v0, p0, Llcn;->a:Lrn9;

    iget-object v1, p0, Llcn;->b:Lrcn;

    if-eqz p1, :cond_19

    const/4 v2, 0x1

    if-eq p1, v2, :cond_e

    return-void

    :cond_e
    iget-object p1, v1, Llz3;->c:Li7f;

    invoke-virtual {p1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    sget-object p0, Lkf0;->e:Lkf0;

    invoke-virtual {v0, p0}, Lrn9;->J(Lkf0;)V

    return-void

    :cond_19
    iget-object p1, v1, Llz3;->c:Li7f;

    invoke-virtual {p1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    sget-object p0, Lkf0;->b:Lkf0;

    invoke-virtual {v0, p0}, Lrn9;->J(Lkf0;)V

    return-void
.end method

.method public final d()V
    .registers 2

    iget-object v0, p0, Llcn;->b:Lrcn;

    iget-object v0, v0, Llz3;->c:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Llcn;->a:Lrn9;

    sget-object v0, Lkf0;->d:Lkf0;

    invoke-virtual {p0, v0}, Lrn9;->J(Lkf0;)V

    return-void
.end method

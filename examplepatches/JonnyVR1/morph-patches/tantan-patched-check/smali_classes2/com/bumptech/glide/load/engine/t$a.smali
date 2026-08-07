.class Lcom/bumptech/glide/load/engine/t$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t5c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bumptech/glide/load/engine/t;->j(Ll/re00$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/t5c$a<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ll/re00$a;

.field final synthetic b:Lcom/bumptech/glide/load/engine/t;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/t;Ll/re00$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/t$a;->b:Lcom/bumptech/glide/load/engine/t;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/t$a;->a:Ll/re00$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t$a;->b:Lcom/bumptech/glide/load/engine/t;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t$a;->a:Ll/re00$a;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/t;->d(Ll/re00$a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t$a;->b:Lcom/bumptech/glide/load/engine/t;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t$a;->a:Ll/re00$a;

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/load/engine/t;->e(Ll/re00$a;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/Exception;)V
    .locals 2
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t$a;->b:Lcom/bumptech/glide/load/engine/t;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t$a;->a:Ll/re00$a;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/t;->d(Ll/re00$a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t$a;->b:Lcom/bumptech/glide/load/engine/t;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t$a;->a:Ll/re00$a;

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/load/engine/t;->i(Ll/re00$a;Ljava/lang/Exception;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.class Lcom/bumptech/glide/load/engine/h$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mxf$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/h$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/mxf$d<",
        "Lcom/bumptech/glide/load/engine/i<",
        "*>;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/bumptech/glide/load/engine/h$b;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/h$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/h$b$a;->a:Lcom/bumptech/glide/load/engine/h$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lcom/bumptech/glide/load/engine/i;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/load/engine/i<",
            "*>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/engine/i;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/h$b$a;->a:Lcom/bumptech/glide/load/engine/h$b;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/h$b;->a:Ll/a4k;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/h$b;->b:Ll/a4k;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/h$b;->c:Ll/a4k;

    .line 10
    .line 11
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/h$b;->d:Ll/a4k;

    .line 12
    .line 13
    iget-object v5, p0, Lcom/bumptech/glide/load/engine/h$b;->e:Lcom/bumptech/glide/load/engine/j;

    .line 14
    .line 15
    iget-object v6, p0, Lcom/bumptech/glide/load/engine/h$b;->f:Lcom/bumptech/glide/load/engine/m$a;

    .line 16
    .line 17
    iget-object v7, p0, Lcom/bumptech/glide/load/engine/h$b;->g:Ll/nj80;

    .line 18
    .line 19
    invoke-direct/range {v0 .. v7}, Lcom/bumptech/glide/load/engine/i;-><init>(Ll/a4k;Ll/a4k;Ll/a4k;Ll/a4k;Lcom/bumptech/glide/load/engine/j;Lcom/bumptech/glide/load/engine/m$a;Ll/nj80;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public bridge synthetic create()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/h$b$a;->a()Lcom/bumptech/glide/load/engine/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

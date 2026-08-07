.class Lcom/bumptech/glide/load/engine/h$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field final a:Ll/a4k;

.field final b:Ll/a4k;

.field final c:Ll/a4k;

.field final d:Ll/a4k;

.field final e:Lcom/bumptech/glide/load/engine/j;

.field final f:Lcom/bumptech/glide/load/engine/m$a;

.field final g:Ll/nj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "Lcom/bumptech/glide/load/engine/i<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/a4k;Ll/a4k;Ll/a4k;Ll/a4k;Lcom/bumptech/glide/load/engine/j;Lcom/bumptech/glide/load/engine/m$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/bumptech/glide/load/engine/h$b$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/h$b$a;-><init>(Lcom/bumptech/glide/load/engine/h$b;)V

    .line 7
    .line 8
    .line 9
    const/16 v1, 0x96

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/mxf;->d(ILl/mxf$d;)Ll/nj80;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/h$b;->g:Ll/nj80;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/h$b;->a:Ll/a4k;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/h$b;->b:Ll/a4k;

    .line 20
    .line 21
    iput-object p3, p0, Lcom/bumptech/glide/load/engine/h$b;->c:Ll/a4k;

    .line 22
    .line 23
    iput-object p4, p0, Lcom/bumptech/glide/load/engine/h$b;->d:Ll/a4k;

    .line 24
    .line 25
    iput-object p5, p0, Lcom/bumptech/glide/load/engine/h$b;->e:Lcom/bumptech/glide/load/engine/j;

    .line 26
    .line 27
    iput-object p6, p0, Lcom/bumptech/glide/load/engine/h$b;->f:Lcom/bumptech/glide/load/engine/m$a;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a(Ll/kzq;ZZZZ)Lcom/bumptech/glide/load/engine/i;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/kzq;",
            "ZZZZ)",
            "Lcom/bumptech/glide/load/engine/i<",
            "TR;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/h$b;->g:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bumptech/glide/load/engine/i;

    .line 8
    .line 9
    invoke-static {p0}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    move-object v0, p0

    .line 14
    check-cast v0, Lcom/bumptech/glide/load/engine/i;

    .line 15
    .line 16
    move-object v1, p1

    .line 17
    move v2, p2

    .line 18
    move v3, p3

    .line 19
    move v4, p4

    .line 20
    move v5, p5

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/i;->l(Ll/kzq;ZZZZ)Lcom/bumptech/glide/load/engine/i;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.class public Ltech/sud/runtime/a/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/a/a;


# instance fields
.field private a:Ltech/sud/runtime/core/b;

.field private final b:Ltech/sud/runtime/core/g;

.field private final c:Ltech/sud/runtime/component/d/a;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ltech/sud/runtime/core/g;

    .line 5
    .line 6
    invoke-direct {v0}, Ltech/sud/runtime/core/g;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/runtime/a/c;->b:Ltech/sud/runtime/core/g;

    .line 10
    .line 11
    new-instance v1, Ltech/sud/runtime/component/d/a;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ltech/sud/runtime/component/d/a;-><init>(Ltech/sud/runtime/core/g;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ltech/sud/runtime/a/c;->c:Ltech/sud/runtime/component/d/a;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .locals 0

    .line 15
    iget-object p0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    iget-object p0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    return-object p0
.end method

.method public a(Landroid/app/Activity;Ljava/util/HashMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 19
    new-instance v0, Ltech/sud/runtime/core/b;

    iget-object v1, p0, Ltech/sud/runtime/a/c;->b:Ltech/sud/runtime/core/g;

    iget-object v2, p0, Ltech/sud/runtime/a/c;->c:Ltech/sud/runtime/component/d/a;

    invoke-direct {v0, p1, v1, p2, v2}, Ltech/sud/runtime/core/b;-><init>(Landroid/app/Activity;Ltech/sud/runtime/core/g;Ljava/util/HashMap;Ltech/sud/runtime/component/d/a;)V

    iput-object v0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    return-void
.end method

.method public a(Landroid/widget/FrameLayout;)V
    .locals 0

    .line 16
    iget-object p0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    invoke-virtual {p0, p1}, Ltech/sud/runtime/core/b;->a(Landroid/widget/FrameLayout;)V

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, v0, Ltech/sud/runtime/core/b;->b:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltech/sud/runtime/a/c;->c:Ltech/sud/runtime/component/d/a;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ltech/sud/runtime/component/d/a;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V
    .locals 0

    .line 18
    iget-object p0, p0, Ltech/sud/runtime/a/c;->c:Ltech/sud/runtime/component/d/a;

    invoke-virtual {p0, p1, p2}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    return-void
.end method

.method public a(Ltech/sud/runtime/a/b;)V
    .locals 0

    .line 20
    invoke-static {p1}, Ltech/sud/runtime/core/g;->a(Ltech/sud/runtime/a/b;)V

    .line 21
    invoke-static {p1}, Ltech/sud/runtime/component/h/f;->a(Ltech/sud/runtime/a/b;)V

    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 17
    iget-object p0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    invoke-virtual {p0}, Ltech/sud/runtime/core/b;->a()V

    return-void
.end method

.method public b()V
    .locals 0

    .line 9
    iget-object p0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    invoke-virtual {p0}, Ltech/sud/runtime/core/b;->h()V

    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ltech/sud/runtime/core/b;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ltech/sud/runtime/core/b;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/a/c;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ltech/sud/runtime/core/b;->i()[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

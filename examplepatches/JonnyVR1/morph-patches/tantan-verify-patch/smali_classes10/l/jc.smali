.class public Ll/jc;
.super Ll/fc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/fc<",
        "Ll/ic;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/fc;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/jc;->k:Z

    .line 6
    .line 7
    new-instance v0, Ll/ic;

    .line 8
    .line 9
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/ic;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jc;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/ely;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/ely;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/ic;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ic;->b()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "\u966a\u4f34\u699c"

    .line 13
    .line 14
    invoke-direct {v0, v2, p0, v1}, Ll/ely;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public U3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/jc;->k:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    check-cast v1, Ll/ic;

    .line 8
    .line 9
    invoke-static {p1}, Ll/efv;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v1, p1}, Ll/ic;->c(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Ll/jc;->k:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    check-cast v1, Ll/ic;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/ic;->d()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public init()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ic;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ic;->init()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

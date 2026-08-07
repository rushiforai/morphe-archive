.class public Ll/bfj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ll/zej;

.field private b:Ll/z5m;


# direct methods
.method public constructor <init>(Ll/z5m;Ll/zej;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bfj;->b:Ll/z5m;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bfj;->a:Ll/zej;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {p2, p0}, Ll/zej;->T1(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Ll/gfj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bfj;->b:Ll/z5m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/z5m;->getInput()Ll/gfj;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Ll/zej;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bfj;->a:Ll/zej;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/z5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bfj;->b:Ll/z5m;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/bfj;->a:Ll/zej;

    .line 3
    .line 4
    iput-object v0, p0, Ll/bfj;->b:Ll/z5m;

    .line 5
    .line 6
    return-void
.end method

.method public e(Ll/zej;)V
    .locals 0
    .param p1    # Ll/zej;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/bfj;->a:Ll/zej;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-virtual {p1, p0}, Ll/zej;->T1(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

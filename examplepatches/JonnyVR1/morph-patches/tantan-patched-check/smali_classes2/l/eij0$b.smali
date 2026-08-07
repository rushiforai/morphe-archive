.class public Ll/eij0$b;
.super Ll/yhj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/eij0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ll/eij0;


# direct methods
.method public constructor <init>(Ll/eij0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yhj0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eij0$b;->a:Ll/eij0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/ygj0;)V
    .locals 1
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/eij0$b;->a:Ll/eij0;

    .line 2
    .line 3
    iget-boolean v0, p1, Ll/eij0;->d:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/ygj0;->start()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/eij0$b;->a:Ll/eij0;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Ll/eij0;->d:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public c(Ll/ygj0;)V
    .locals 2
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/eij0$b;->a:Ll/eij0;

    .line 2
    .line 3
    iget v1, v0, Ll/eij0;->c:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, -0x1

    .line 6
    .line 7
    iput v1, v0, Ll/eij0;->c:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-boolean v1, v0, Ll/eij0;->d:Z

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/ygj0;->end()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1, p0}, Ll/ygj0;->removeListener(Ll/ygj0$g;)Ll/ygj0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

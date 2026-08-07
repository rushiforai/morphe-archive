.class public final Ll/qd20$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qd20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:Z

.field public d:Ll/kfl0;

.field public e:I

.field public f:Z

.field public g:Z

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/qd20$a;->a:Z

    .line 6
    .line 7
    iput v0, p0, Ll/qd20$a;->b:I

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/qd20$a;->c:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput v1, p0, Ll/qd20$a;->e:I

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/qd20$a;->f:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/qd20$a;->g:Z

    .line 17
    .line 18
    iput v0, p0, Ll/qd20$a;->h:I

    .line 19
    .line 20
    iput v1, p0, Ll/qd20$a;->i:I

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic i(Ll/qd20$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/qd20$a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic j(Ll/qd20$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/qd20$a;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic k(Ll/qd20$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/qd20$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic l(Ll/qd20$a;)Ll/kfl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qd20$a;->d:Ll/kfl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic m(Ll/qd20$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qd20$a;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic n(Ll/qd20$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qd20$a;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic o(Ll/qd20$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qd20$a;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic p(Ll/qd20$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qd20$a;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic r(Ll/qd20$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/qd20$a;->i:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a()Ll/qd20;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/qd20;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/qd20;-><init>(Ll/qd20$a;Ll/z8r0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public b(IZ)Ll/qd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-boolean p2, p0, Ll/qd20$a;->g:Z

    .line 2
    .line 3
    iput p1, p0, Ll/qd20$a;->h:I

    .line 4
    .line 5
    return-object p0
.end method

.method public c(I)Ll/qd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput p1, p0, Ll/qd20$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/qd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput p1, p0, Ll/qd20$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Z)Ll/qd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Ll/qd20$a;->f:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Z)Ll/qd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Ll/qd20$a;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Z)Ll/qd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Ll/qd20$a;->a:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/kfl0;)Ll/qd20$a;
    .locals 0
    .param p1    # Ll/kfl0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qd20$a;->d:Ll/kfl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final q(I)Ll/qd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput p1, p0, Ll/qd20$a;->i:I

    .line 2
    .line 3
    return-object p0
.end method

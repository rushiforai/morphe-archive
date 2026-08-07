.class public final Ll/pd20$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pd20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:Z

.field public e:Ll/kfl0;

.field public f:I

.field public g:Z


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
    iput-boolean v0, p0, Ll/pd20$a;->a:Z

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Ll/pd20$a;->b:I

    .line 9
    .line 10
    iput v0, p0, Ll/pd20$a;->c:I

    .line 11
    .line 12
    iput-boolean v0, p0, Ll/pd20$a;->d:Z

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput v1, p0, Ll/pd20$a;->f:I

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/pd20$a;->g:Z

    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic i(Ll/pd20$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/pd20$a;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic j(Ll/pd20$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/pd20$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic k(Ll/pd20$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/pd20$a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic l(Ll/pd20$a;)Ll/kfl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd20$a;->e:Ll/kfl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic m(Ll/pd20$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd20$a;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic n(Ll/pd20$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd20$a;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic o(Ll/pd20$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd20$a;->g:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a()Ll/pd20;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/pd20;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/pd20;-><init>(Ll/pd20$a;Ll/v4u0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public b(I)Ll/pd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput p1, p0, Ll/pd20$a;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Ll/pd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput p1, p0, Ll/pd20$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/pd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput p1, p0, Ll/pd20$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Z)Ll/pd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Ll/pd20$a;->g:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Z)Ll/pd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Ll/pd20$a;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Z)Ll/pd20$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Ll/pd20$a;->a:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/kfl0;)Ll/pd20$a;
    .locals 0
    .param p1    # Ll/kfl0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/pd20$a;->e:Ll/kfl0;

    .line 2
    .line 3
    return-object p0
.end method

.class public Ll/nxp$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nxp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:I

.field public l:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41600000    # 14.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/nxp$a;->k:I

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->j:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->i:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->f:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/nxp$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/nxp$a;->d:I

    return p0
.end method

.method public static bridge synthetic f(Ll/nxp$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/nxp$a;->k:I

    return p0
.end method

.method public static bridge synthetic g(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/nxp$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nxp$a;->l:Z

    return p0
.end method

.method public static bridge synthetic i(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->h:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->g:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/nxp$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxp$a;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static n()Ll/nxp$a;
    .locals 1

    .line 1
    new-instance v0, Ll/nxp$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/nxp$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public m()Ll/nxp;
    .locals 2

    .line 1
    new-instance v0, Ll/nxp;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/nxp;-><init>(Ll/nxp$a;Ll/oxp;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public o(Ljava/lang/String;)Ll/nxp$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxp$a;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ljava/lang/String;)Ll/nxp$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxp$a;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ljava/lang/String;)Ll/nxp$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxp$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Ljava/lang/String;)Ll/nxp$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxp$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(I)Ll/nxp$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/nxp$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public t(I)Ll/nxp$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/nxp$a;->k:I

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Ljava/lang/String;)Ll/nxp$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxp$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Z)Ll/nxp$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/nxp$a;->l:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ljava/lang/String;)Ll/nxp$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxp$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ljava/lang/String;)Ll/nxp$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxp$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Ljava/lang/String;)Ll/nxp$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxp$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Ljava/lang/String;)Ll/nxp$a;
    .locals 1

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/xau;->F(Ljava/lang/String;I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/nxp$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

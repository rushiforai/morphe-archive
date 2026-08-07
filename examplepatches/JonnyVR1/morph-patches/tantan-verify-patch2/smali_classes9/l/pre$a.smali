.class public Ll/pre$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pre;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Z

.field public k:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/pre$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pre$a;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/pre$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pre$a;->h:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/pre$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/pre$a;->b:I

    return p0
.end method

.method public static bridge synthetic d(Ll/pre$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/pre$a;->k:I

    return p0
.end method

.method public static bridge synthetic e(Ll/pre$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pre$a;->f:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/pre$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pre$a;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/pre$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/pre$a;->i:I

    return p0
.end method

.method public static bridge synthetic h(Ll/pre$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pre$a;->j:Z

    return p0
.end method

.method public static bridge synthetic i(Ll/pre$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pre$a;->g:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/pre$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pre$a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/pre$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pre$a;->a:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public l()Ll/pre;
    .locals 2

    .line 1
    new-instance v0, Ll/pre;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/pre;-><init>(Ll/pre$a;Ll/qre;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public m(Ljava/lang/String;I)Ll/pre$a;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, "_"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/pre$a;->a:Ljava/lang/String;

    .line 22
    .line 23
    return-object p0
.end method

.method public n(Z)Ll/pre$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pre$a;->j:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ljava/lang/String;)Ll/pre$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pre$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ljava/lang/String;)Ll/pre$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pre$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(I)Ll/pre$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/pre$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public r(I)Ll/pre$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/pre$a;->k:I

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ljava/lang/String;)Ll/pre$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pre$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Ljava/lang/String;)Ll/pre$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pre$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(I)Ll/pre$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/pre$a;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ljava/lang/String;)Ll/pre$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pre$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ljava/lang/String;)Ll/pre$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pre$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

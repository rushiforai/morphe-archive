.class public Ll/r230$j;
.super Ll/r230$f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r230;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "j"
.end annotation


# instance fields
.field public d:I

.field public e:I

.field public f:Z

.field public g:Z

.field public h:Ll/fn2;

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:I

.field public m:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r230$f;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/r230$j;->d:I

    .line 6
    .line 7
    iput p1, p0, Ll/r230$j;->e:I

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/r230$j;->f:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/r230$j;->g:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/r230$j;->i:Z

    .line 14
    .line 15
    iput-boolean p1, p0, Ll/r230$j;->j:Z

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Ll/r230$j;->k:Z

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic c(Ll/r230$j;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/r230$j;->m:I

    return p0
.end method

.method public static bridge synthetic d(Ll/r230$j;)Ll/fn2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r230$j;->h:Ll/fn2;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/r230$j;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/r230$j;->j:Z

    return p0
.end method

.method public static bridge synthetic f(Ll/r230$j;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/r230$j;->f:Z

    return p0
.end method

.method public static bridge synthetic g(Ll/r230$j;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/r230$j;->l:I

    return p0
.end method

.method public static bridge synthetic h(Ll/r230$j;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/r230$j;->i:Z

    return p0
.end method

.method public static bridge synthetic i(Ll/r230$j;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/r230$j;->g:Z

    return p0
.end method

.method public static bridge synthetic j(Ll/r230$j;Ll/fn2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$j;->h:Ll/fn2;

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ll/r230$f;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/r230$f;->a(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ll/r230$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b(Ljava/lang/String;)Ll/r230$f;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/r230$f;->b(Ljava/lang/String;)Ll/r230$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()Ll/r230;
    .locals 1

    .line 1
    new-instance v0, Ll/r230;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r230;-><init>(Ll/r230$j;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public l(Z)Ll/r230$j;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/r230$j;->k:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public m(II)Ll/r230$j;
    .locals 0

    .line 1
    iput p1, p0, Ll/r230$j;->l:I

    .line 2
    .line 3
    iput p2, p0, Ll/r230$j;->m:I

    .line 4
    .line 5
    return-object p0
.end method

.method public n(Ll/fn2;)Ll/r230$j;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$j;->h:Ll/fn2;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(II)Ll/r230$j;
    .locals 0

    .line 1
    iput p1, p0, Ll/r230$j;->d:I

    .line 2
    .line 3
    iput p2, p0, Ll/r230$j;->e:I

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Ll/r230$j;->j:Z

    .line 7
    .line 8
    return-object p0
.end method

.method public p(Z)Ll/r230$j;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/r230$j;->f:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Z)Ll/r230$j;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/r230$j;->i:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Z)Ll/r230$j;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/r230$j;->g:Z

    .line 2
    .line 3
    return-object p0
.end method

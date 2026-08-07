.class public Ll/z8j$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z8j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public c:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/CharSequence;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ll/x20;

.field public j:Ll/x20;

.field public k:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/z8j$a;->b:I

    .line 6
    .line 7
    iput v0, p0, Ll/z8j$a;->c:I

    .line 8
    .line 9
    iput-object p1, p0, Ll/z8j$a;->a:Landroid/content/Context;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic a(Ll/z8j$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/z8j$a;->b:I

    return p0
.end method

.method public static bridge synthetic b(Ll/z8j$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->f:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/z8j$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->h:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/z8j$a;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->j:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/z8j$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->g:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/z8j$a;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->i:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/z8j$a;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->a:Landroid/content/Context;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/z8j$a;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->k:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/z8j$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/z8j$a;->c:I

    return p0
.end method

.method public static bridge synthetic j(Ll/z8j$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->e:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/z8j$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8j$a;->d:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public l(I)Ll/z8j$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/z8j$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/lang/String;)Ll/z8j$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z8j$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;Ll/x20;)Ll/z8j$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z8j$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z8j$a;->j:Ll/x20;

    .line 4
    .line 5
    return-object p0
.end method

.method public o(Ljava/lang/String;Ll/x20;)Ll/z8j$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z8j$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z8j$a;->i:Ll/x20;

    .line 4
    .line 5
    return-object p0
.end method

.method public p(Ll/x20;)Ll/z8j$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z8j$a;->k:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(I)Ll/z8j$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/z8j$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Ljava/lang/CharSequence;)Ll/z8j$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z8j$a;->e:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ljava/lang/String;)Ll/z8j$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z8j$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Ll/z8j;
    .locals 1

    .line 1
    new-instance v0, Ll/z8j;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/z8j;-><init>(Ll/z8j$a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/g1e;->show()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

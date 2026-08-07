.class public final Ll/qse0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qse0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/google/common/collect/ImmutableList$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList$a<",
            "Ll/ksx;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public d:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public l:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qse0$b;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Lcom/google/common/collect/ImmutableList$a;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/google/common/collect/ImmutableList$a;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/qse0$b;->b:Lcom/google/common/collect/ImmutableList$a;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Ll/qse0$b;->c:I

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/qse0$b;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/qse0$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/qse0$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/qse0$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/qse0$b;)Lcom/google/common/collect/ImmutableList$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->b:Lcom/google/common/collect/ImmutableList$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/qse0$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/qse0$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ll/qse0$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ll/qse0$b;)Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->g:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ll/qse0$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Ll/qse0$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/qse0$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Ll/qse0$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qse0$b;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public m(Ljava/lang/String;Ljava/lang/String;)Ll/qse0$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qse0$b;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public n(Ll/ksx;)Ll/qse0$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qse0$b;->b:Lcom/google/common/collect/ImmutableList$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList$a;->i(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public o()Ll/qse0;
    .locals 2

    .line 1
    new-instance v0, Ll/qse0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/qse0;-><init>(Ll/qse0$b;Ll/qse0$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public p(I)Ll/qse0$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/qse0$b;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ljava/lang/String;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Ljava/lang/String;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ljava/lang/String;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Ljava/lang/String;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Ljava/lang/String;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ljava/lang/String;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ljava/lang/String;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ljava/lang/String;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Landroid/net/Uri;)Ll/qse0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qse0$b;->g:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

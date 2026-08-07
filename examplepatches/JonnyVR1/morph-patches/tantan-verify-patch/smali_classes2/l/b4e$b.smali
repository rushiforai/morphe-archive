.class public final Ll/b4e$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b4e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public d:J

.field public e:J

.field public f:J

.field public g:Ll/v2f;

.field public h:Lcom/facebook/cache/common/CacheErrorLogger;

.field public i:Lcom/facebook/cache/common/CacheEventListener;

.field public j:Ll/e5e;

.field public k:Z

.field public final l:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/b4e$b;->a:I

    .line 6
    .line 7
    const-string v0, "image_cache"

    .line 8
    .line 9
    iput-object v0, p0, Ll/b4e$b;->b:Ljava/lang/String;

    .line 10
    .line 11
    const-wide/32 v0, 0x2800000

    .line 12
    .line 13
    .line 14
    iput-wide v0, p0, Ll/b4e$b;->d:J

    .line 15
    .line 16
    const-wide/32 v0, 0xa00000

    .line 17
    .line 18
    .line 19
    iput-wide v0, p0, Ll/b4e$b;->e:J

    .line 20
    .line 21
    const-wide/32 v0, 0x200000

    .line 22
    .line 23
    .line 24
    iput-wide v0, p0, Ll/b4e$b;->f:J

    .line 25
    .line 26
    new-instance v0, Lcom/facebook/cache/disk/a;

    .line 27
    .line 28
    invoke-direct {v0}, Lcom/facebook/cache/disk/a;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/b4e$b;->g:Ll/v2f;

    .line 32
    .line 33
    iput-object p1, p0, Ll/b4e$b;->l:Landroid/content/Context;

    .line 34
    .line 35
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ll/c4e;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Ll/b4e$b;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static bridge synthetic a(Ll/b4e$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e$b;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/b4e$b;)Ll/a7h0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e$b;->c:Ll/a7h0;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/b4e$b;)Lcom/facebook/cache/common/CacheErrorLogger;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e$b;->h:Lcom/facebook/cache/common/CacheErrorLogger;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/b4e$b;)Lcom/facebook/cache/common/CacheEventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e$b;->i:Lcom/facebook/cache/common/CacheEventListener;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/b4e$b;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e$b;->l:Landroid/content/Context;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/b4e$b;)Ll/e5e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e$b;->j:Ll/e5e;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/b4e$b;)Ll/v2f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e$b;->g:Ll/v2f;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/b4e$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/b4e$b;->k:Z

    return p0
.end method

.method public static bridge synthetic i(Ll/b4e$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b4e$b;->d:J

    return-wide v0
.end method

.method public static bridge synthetic j(Ll/b4e$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b4e$b;->e:J

    return-wide v0
.end method

.method public static bridge synthetic k(Ll/b4e$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b4e$b;->f:J

    return-wide v0
.end method

.method public static bridge synthetic l(Ll/b4e$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/b4e$b;->a:I

    return p0
.end method

.method public static bridge synthetic m(Ll/b4e$b;Ll/a7h0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b4e$b;->c:Ll/a7h0;

    return-void
.end method


# virtual methods
.method public n()Ll/b4e;
    .locals 1

    .line 1
    new-instance v0, Ll/b4e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/b4e;-><init>(Ll/b4e$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public o(Ljava/lang/String;)Ll/b4e$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b4e$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ljava/io/File;)Ll/b4e$b;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/d7h0;->a(Ljava/lang/Object;)Ll/a7h0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/b4e$b;->c:Ll/a7h0;

    .line 6
    .line 7
    return-object p0
.end method

.method public q(J)Ll/b4e$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/b4e$b;->d:J

    .line 2
    .line 3
    return-object p0
.end method

.method public r(J)Ll/b4e$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/b4e$b;->e:J

    .line 2
    .line 3
    return-object p0
.end method

.method public s(J)Ll/b4e$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/b4e$b;->f:J

    .line 2
    .line 3
    return-object p0
.end method

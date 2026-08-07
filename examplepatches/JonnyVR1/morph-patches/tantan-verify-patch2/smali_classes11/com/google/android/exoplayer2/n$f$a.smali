.class public final Lcom/google/android/exoplayer2/n$f$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/n$f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/util/UUID;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public h:[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/n$f$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 46
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/n$f$a;->g:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n$a;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/google/android/exoplayer2/n$f$a;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/n$f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$f;->a:Ljava/util/UUID;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$f$a;->a:Ljava/util/UUID;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$f;->c:Landroid/net/Uri;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$f$a;->b:Landroid/net/Uri;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$f;->e:Lcom/google/common/collect/ImmutableMap;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$f$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 15
    .line 16
    iget-boolean v0, p1, Lcom/google/android/exoplayer2/n$f;->f:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/n$f$a;->d:Z

    .line 19
    .line 20
    iget-boolean v0, p1, Lcom/google/android/exoplayer2/n$f;->g:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/n$f$a;->e:Z

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/google/android/exoplayer2/n$f;->h:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/n$f$a;->f:Z

    .line 27
    .line 28
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$f;->j:Lcom/google/common/collect/ImmutableList;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$f$a;->g:Lcom/google/common/collect/ImmutableList;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/google/android/exoplayer2/n$f;->b(Lcom/google/android/exoplayer2/n$f;)[B

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$f$a;->h:[B

    .line 37
    .line 38
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n$f;Lcom/google/android/exoplayer2/n$a;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/n$f$a;-><init>(Lcom/google/android/exoplayer2/n$f;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$f$a;->a:Ljava/util/UUID;

    .line 42
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/exoplayer2/n$f$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 43
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/exoplayer2/n$f$a;->g:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/n$f$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/n$f$a;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/n$f$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/n$f$a;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/n$f$a;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$f$a;->g:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/n$f$a;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$f$a;->h:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/google/android/exoplayer2/n$f$a;)Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$f$a;->b:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/google/android/exoplayer2/n$f$a;)Ljava/util/UUID;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$f$a;->a:Ljava/util/UUID;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/google/android/exoplayer2/n$f$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/n$f$a;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Lcom/google/android/exoplayer2/n$f$a;)Lcom/google/common/collect/ImmutableMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$f$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public i()Lcom/google/android/exoplayer2/n$f;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/n$f;-><init>(Lcom/google/android/exoplayer2/n$f$a;Lcom/google/android/exoplayer2/n$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public j(Z)Lcom/google/android/exoplayer2/n$f$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/n$f$a;->f:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/util/List;)Lcom/google/android/exoplayer2/n$f$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/google/android/exoplayer2/n$f$a;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$f$a;->g:Lcom/google/common/collect/ImmutableList;

    .line 6
    .line 7
    return-object p0
.end method

.method public l([B)Lcom/google/android/exoplayer2/n$f$a;
    .locals 1
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$f$a;->h:[B

    .line 11
    .line 12
    return-object p0
.end method

.method public m(Ljava/util/Map;)Lcom/google/android/exoplayer2/n$f$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/exoplayer2/n$f$a;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$f$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 6
    .line 7
    return-object p0
.end method

.method public n(Landroid/net/Uri;)Lcom/google/android/exoplayer2/n$f$a;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$f$a;->b:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Z)Lcom/google/android/exoplayer2/n$f$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/n$f$a;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Z)Lcom/google/android/exoplayer2/n$f$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/n$f$a;->e:Z

    .line 2
    .line 3
    return-object p0
.end method

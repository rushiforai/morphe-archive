.class public final Ll/ksx$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ksx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:I

.field public g:Ljava/lang/String;
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


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ksx$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/ksx$b;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/ksx$b;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Ll/ksx$b;->d:I

    .line 11
    .line 12
    new-instance p1, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/ksx$b;->e:Ljava/util/HashMap;

    .line 18
    .line 19
    const/4 p1, -0x1

    .line 20
    iput p1, p0, Ll/ksx$b;->f:I

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/ksx$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksx$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/ksx$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ksx$b;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/ksx$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksx$b;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/ksx$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ksx$b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/ksx$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksx$b;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/ksx$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksx$b;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/ksx$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ksx$b;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Ll/ksx$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksx$b;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static k(ILjava/lang/String;II)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "%d %s/%d/%d"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static l(I)Ljava/lang/String;
    .locals 4

    .line 1
    const/16 v0, 0x60

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ge p0, v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 11
    .line 12
    .line 13
    const/16 v0, 0x1f40

    .line 14
    .line 15
    if-eqz p0, :cond_4

    .line 16
    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    if-eq p0, v1, :cond_3

    .line 20
    .line 21
    const v0, 0xac44

    .line 22
    .line 23
    .line 24
    const-string v1, "L16"

    .line 25
    .line 26
    const/16 v3, 0xa

    .line 27
    .line 28
    if-eq p0, v3, :cond_2

    .line 29
    .line 30
    const/16 v3, 0xb

    .line 31
    .line 32
    if-ne p0, v3, :cond_1

    .line 33
    .line 34
    invoke-static {v3, v1, v0, v2}, Ll/ksx$b;->k(ILjava/lang/String;II)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    const-string v0, "Unsupported static paylod type "

    .line 40
    .line 41
    invoke-static {v0, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return-object p0

    .line 46
    :cond_2
    const/4 p0, 0x2

    .line 47
    invoke-static {v3, v1, v0, p0}, Ll/ksx$b;->k(ILjava/lang/String;II)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_3
    const-string p0, "PCMA"

    .line 53
    .line 54
    invoke-static {v1, p0, v0, v2}, Ll/ksx$b;->k(ILjava/lang/String;II)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_4
    const-string p0, "PCMU"

    .line 60
    .line 61
    invoke-static {v1, p0, v0, v2}, Ll/ksx$b;->k(ILjava/lang/String;II)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method


# virtual methods
.method public i(Ljava/lang/String;Ljava/lang/String;)Ll/ksx$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ksx$b;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public j()Ll/ksx;
    .locals 4

    .line 1
    const-string v0, "rtpmap"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/ksx$b;->e:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/ksx$b;->e:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Ll/ksx$c;->a(Ljava/lang/String;)Ll/ksx$c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget v0, p0, Ll/ksx$b;->d:I

    .line 31
    .line 32
    invoke-static {v0}, Ll/ksx$b;->l(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Ll/ksx$c;->a(Ljava/lang/String;)Ll/ksx$c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_0
    new-instance v1, Ll/ksx;

    .line 41
    .line 42
    iget-object v2, p0, Ll/ksx$b;->e:Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-direct {v1, p0, v2, v0, v3}, Ll/ksx;-><init>(Ll/ksx$b;Lcom/google/common/collect/ImmutableMap;Ll/ksx$c;Ll/ksx$a;)V
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    return-object v1

    .line 53
    :catch_0
    move-exception p0

    .line 54
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    return-object p0
.end method

.method public m(I)Ll/ksx$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/ksx$b;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ll/ksx$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ksx$b;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ljava/lang/String;)Ll/ksx$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ksx$b;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ljava/lang/String;)Ll/ksx$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ksx$b;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

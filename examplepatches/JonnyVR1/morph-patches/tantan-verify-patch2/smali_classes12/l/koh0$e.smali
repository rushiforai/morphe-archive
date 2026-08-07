.class Ll/koh0$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/koh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field private a:Ll/loh0;

.field private b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ll/aje;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final c:I

.field private d:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile e:I


# direct methods
.method public constructor <init>(Ll/loh0;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/ArrayMap;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/koh0$e;->b:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/koh0$e;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    iput-object p1, p0, Ll/koh0$e;->a:Ll/loh0;

    .line 20
    .line 21
    iget-object v0, p1, Ll/loh0;->b:[Ll/aje;

    .line 22
    .line 23
    array-length v2, v0

    .line 24
    :goto_0
    if-ge v1, v2, :cond_0

    .line 25
    .line 26
    aget-object v3, v0, v1

    .line 27
    .line 28
    iget-object v4, p0, Ll/koh0$e;->b:Ljava/util/Map;

    .line 29
    .line 30
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p1, p1, Ll/loh0;->b:[Ll/aje;

    .line 39
    .line 40
    array-length p1, p1

    .line 41
    iput p1, p0, Ll/koh0$e;->c:I

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic a(Ll/koh0$e;)Ll/loh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/koh0$e;->a:Ll/loh0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    new-instance v0, Ll/koh0$e$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/koh0$e$b;-><init>(Ll/koh0$e;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/osw;->b(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/koh0$e$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/koh0$e$a;-><init>(Ll/koh0$e;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/osw;->b(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Ll/aje;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/koh0$e;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/koh0$e;->b:Ljava/util/Map;

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/koh0$e;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Ll/koh0$e;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget v0, p0, Ll/koh0$e;->c:I

    .line 34
    .line 35
    if-ne p1, v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/koh0$e;->b()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public e(FDLl/aje;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/koh0$e;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    mul-float/2addr v0, v1

    .line 11
    iget v2, p0, Ll/koh0$e;->c:I

    .line 12
    .line 13
    int-to-float v3, v2

    .line 14
    div-float v10, v0, v3

    .line 15
    .line 16
    int-to-float v0, v2

    .line 17
    div-float/2addr v1, v0

    .line 18
    mul-float/2addr v1, p1

    .line 19
    const/high16 p1, 0x42c80000    # 100.0f

    .line 20
    .line 21
    mul-float/2addr p1, v10

    .line 22
    add-float/2addr v1, p1

    .line 23
    float-to-int v6, v1

    .line 24
    iget p1, p0, Ll/koh0$e;->e:I

    .line 25
    .line 26
    if-lt p1, v6, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iput v6, p0, Ll/koh0$e;->e:I

    .line 30
    .line 31
    new-instance v4, Ll/koh0$e$c;

    .line 32
    .line 33
    move-object v5, p0

    .line 34
    move-wide v7, p2

    .line 35
    move-object v9, p4

    .line 36
    invoke-direct/range {v4 .. v10}, Ll/koh0$e$c;-><init>(Ll/koh0$e;IDLl/aje;F)V

    .line 37
    .line 38
    .line 39
    invoke-static {v4}, Ll/osw;->b(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

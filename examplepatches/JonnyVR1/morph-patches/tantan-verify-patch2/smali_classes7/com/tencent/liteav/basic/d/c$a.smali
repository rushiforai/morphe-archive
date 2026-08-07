.class Lcom/tencent/liteav/basic/d/c$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/basic/d/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:I

.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:I

.field private f:[I

.field private g:I

.field private h:Ljava/lang/String;

.field private i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:Lorg/json/JSONObject;

.field private p:I

.field private q:I


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tencent/liteav/basic/d/c$a;->a:I

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/basic/d/c$a;->b:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/tencent/liteav/basic/d/c$a;->c:I

    .line 13
    .line 14
    iput v1, p0, Lcom/tencent/liteav/basic/d/c$a;->d:I

    .line 15
    .line 16
    iput v1, p0, Lcom/tencent/liteav/basic/d/c$a;->e:I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iput-object v2, p0, Lcom/tencent/liteav/basic/d/c$a;->f:[I

    .line 20
    .line 21
    iput v1, p0, Lcom/tencent/liteav/basic/d/c$a;->g:I

    .line 22
    .line 23
    iput-object v0, p0, Lcom/tencent/liteav/basic/d/c$a;->h:Ljava/lang/String;

    .line 24
    .line 25
    const/16 v0, 0x3c

    .line 26
    .line 27
    iput v0, p0, Lcom/tencent/liteav/basic/d/c$a;->i:I

    .line 28
    .line 29
    const/16 v0, 0x46

    .line 30
    .line 31
    iput v0, p0, Lcom/tencent/liteav/basic/d/c$a;->j:I

    .line 32
    .line 33
    const/16 v0, 0x50

    .line 34
    .line 35
    iput v0, p0, Lcom/tencent/liteav/basic/d/c$a;->k:I

    .line 36
    .line 37
    const/16 v0, 0x32

    .line 38
    .line 39
    iput v0, p0, Lcom/tencent/liteav/basic/d/c$a;->l:I

    .line 40
    .line 41
    const/16 v0, 0xa

    .line 42
    .line 43
    iput v0, p0, Lcom/tencent/liteav/basic/d/c$a;->m:I

    .line 44
    .line 45
    iput v1, p0, Lcom/tencent/liteav/basic/d/c$a;->n:I

    .line 46
    .line 47
    new-instance v0, Lorg/json/JSONObject;

    .line 48
    .line 49
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/tencent/liteav/basic/d/c$a;->o:Lorg/json/JSONObject;

    .line 53
    .line 54
    const/4 v0, -0x1

    .line 55
    iput v0, p0, Lcom/tencent/liteav/basic/d/c$a;->p:I

    .line 56
    .line 57
    iput v1, p0, Lcom/tencent/liteav/basic/d/c$a;->q:I

    .line 58
    .line 59
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/liteav/basic/d/c$1;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lcom/tencent/liteav/basic/d/c$a;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->d:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/d/c$a;)Ljava/lang/String;
    .locals 0

    .line 4
    iget-object p0, p0, Lcom/tencent/liteav/basic/d/c$a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/d/c$a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 5
    iput-object p1, p0, Lcom/tencent/liteav/basic/d/c$a;->h:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/d/c$a;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0

    .line 6
    iput-object p1, p0, Lcom/tencent/liteav/basic/d/c$a;->o:Lorg/json/JSONObject;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/d/c$a;[I)[I
    .locals 0

    .line 7
    iput-object p1, p0, Lcom/tencent/liteav/basic/d/c$a;->f:[I

    return-object p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->e:I

    return p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/basic/d/c$a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 5
    iput-object p1, p0, Lcom/tencent/liteav/basic/d/c$a;->b:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic c(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->g:I

    return p1
.end method

.method public static synthetic d(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->p:I

    return p1
.end method

.method public static synthetic e(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->i:I

    return p1
.end method

.method public static synthetic f(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->j:I

    return p1
.end method

.method public static synthetic g(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->k:I

    return p1
.end method

.method public static synthetic h(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->l:I

    return p1
.end method

.method public static synthetic i(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->m:I

    return p1
.end method

.method public static synthetic j(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->c:I

    return p1
.end method

.method public static synthetic k(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->a:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic k(Lcom/tencent/liteav/basic/d/c$a;)Ljava/lang/String;
    .locals 0

    .line 4
    iget-object p0, p0, Lcom/tencent/liteav/basic/d/c$a;->h:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic l(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->n:I

    return p1
.end method

.method public static synthetic m(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m(Lcom/tencent/liteav/basic/d/c$a;I)I
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/d/c$a;->q:I

    return p1
.end method

.method public static synthetic n(Lcom/tencent/liteav/basic/d/c$a;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/d/c$a;->f:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic p(Lcom/tencent/liteav/basic/d/c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/d/c$a;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic q(Lcom/tencent/liteav/basic/d/c$a;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/d/c$a;->o:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

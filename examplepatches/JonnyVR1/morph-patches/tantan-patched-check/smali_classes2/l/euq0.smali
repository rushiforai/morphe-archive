.class public Ll/euq0;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/euq0$b;
    }
.end annotation


# static fields
.field private static A:J = -0x1L

.field private static volatile B:Ll/euq0; = null

.field private static v:Z = true

.field private static w:Z = false

.field private static x:Z = false

.field private static y:I = 0x1

.field private static z:Z


# instance fields
.field private a:Landroid/app/Application;

.field private b:Landroid/content/Context;

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/euq0$b;",
            ">;"
        }
    .end annotation
.end field

.field private h:Ljava/lang/String;

.field private i:J

.field private j:Ljava/lang/String;

.field private k:J

.field private l:Ljava/lang/String;

.field private m:J

.field private n:Ljava/lang/String;

.field private o:J

.field private p:Ljava/lang/String;

.field private q:J

.field private r:Z

.field private s:J

.field private t:I

.field private u:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>(Landroid/app/Application;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/euq0;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/euq0;->d:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/euq0;->e:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/euq0;->f:Ljava/util/List;

    .line 31
    .line 32
    new-instance v0, Ljava/util/LinkedList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/euq0;->g:Ljava/util/LinkedList;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Ll/euq0;->r:Z

    .line 41
    .line 42
    const-wide/16 v0, -0x1

    .line 43
    .line 44
    iput-wide v0, p0, Ll/euq0;->s:J

    .line 45
    .line 46
    const/16 v0, 0x32

    .line 47
    .line 48
    iput v0, p0, Ll/euq0;->t:I

    .line 49
    .line 50
    iput-object p1, p0, Ll/euq0;->b:Landroid/content/Context;

    .line 51
    .line 52
    iput-object p1, p0, Ll/euq0;->a:Landroid/app/Application;

    .line 53
    .line 54
    :try_start_0
    invoke-direct {p0}, Ll/euq0;->V()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    :catchall_0
    return-void
.end method

.method public static A()Ll/euq0;
    .locals 3

    .line 1
    sget-object v0, Ll/euq0;->B:Ll/euq0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/euq0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/euq0;->B:Ll/euq0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/euq0;

    .line 13
    .line 14
    invoke-static {}, Ll/n0r0;->j()Landroid/app/Application;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v1, v2}, Ll/euq0;-><init>(Landroid/app/Application;)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Ll/euq0;->B:Ll/euq0;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    goto :goto_2

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw v1

    .line 30
    :cond_1
    :goto_2
    sget-object v0, Ll/euq0;->B:Ll/euq0;

    .line 31
    .line 32
    return-object v0
.end method

.method public static synthetic C(Ll/euq0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/euq0;->s:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic D(Ll/euq0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic E(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/euq0;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic F(Ll/euq0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/euq0;->k:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic G(Ll/euq0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/euq0;->q:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic I(Ll/euq0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/euq0;->u:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/euq0;->u:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic L(Ll/euq0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/euq0;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic M(Ll/euq0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/euq0;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic O(Ll/euq0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/euq0;->v:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic Q(Ll/euq0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/euq0;->x:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic S(Ll/euq0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/euq0;->u:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Ll/euq0;->u:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic T()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/euq0;->w:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic U(Ll/euq0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/euq0;->u:I

    .line 2
    .line 3
    return p0
.end method

.method private V()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/euq0;->a:Landroid/app/Application;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/euq0$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/euq0$a;-><init>(Ll/euq0;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/euq0;->a:Landroid/app/Application;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic W(Ll/euq0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/euq0;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private X()Lorg/json/JSONArray;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/euq0;->c:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/4 v1, 0x0

    .line 18
    :goto_0
    iget-object v2, p0, Ll/euq0;->c:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    :try_start_0
    iget-object v2, p0, Ll/euq0;->c:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/String;

    .line 33
    .line 34
    iget-object v3, p0, Ll/euq0;->d:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    invoke-direct {p0, v2, v3, v4}, Ll/euq0;->h(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    :cond_1
    :goto_1
    return-object v0
.end method

.method public static synthetic Y(Ll/euq0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private Z()Lorg/json/JSONArray;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/euq0;->e:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/4 v1, 0x0

    .line 18
    :goto_0
    iget-object v2, p0, Ll/euq0;->e:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    :try_start_0
    iget-object v2, p0, Ll/euq0;->e:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/String;

    .line 33
    .line 34
    iget-object v3, p0, Ll/euq0;->f:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    invoke-direct {p0, v2, v3, v4}, Ll/euq0;->h(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    :cond_1
    :goto_1
    return-object v0
.end method

.method public static synthetic a(I)I
    .locals 0

    .line 1
    sput p0, Ll/euq0;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic a0(Ll/euq0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/euq0;->q:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic b(Ll/euq0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/euq0;->u:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic b0(Ll/euq0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(J)J
    .locals 0

    .line 1
    sput-wide p0, Ll/euq0;->A:J

    .line 2
    .line 3
    return-wide p0
.end method

.method public static synthetic c0(Ll/euq0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/euq0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/euq0;->i:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic e(Ll/euq0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/euq0;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method private g(Ljava/lang/String;Ljava/lang/String;J)Ll/euq0$b;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/euq0;->g:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Ll/euq0;->t:I

    .line 8
    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/euq0;->g:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/euq0$b;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/euq0;->g:Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :cond_1
    :goto_0
    if-nez v0, :cond_2

    .line 29
    .line 30
    new-instance v0, Ll/euq0$b;

    .line 31
    .line 32
    invoke-direct {v0, p1, p2, p3, p4}, Ll/euq0$b;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/euq0;->g:Ljava/util/LinkedList;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_2
    return-object v0
.end method

.method private h(Ljava/lang/String;J)Lorg/json/JSONObject;
    .locals 1

    .line 1
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "name"

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p1, "time"

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    return-object p0
.end method

.method public static i()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Ll/euq0;->z:Z

    .line 3
    .line 4
    return-void
.end method

.method private j(Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p4, p2, p3}, Ll/euq0;->g(Ljava/lang/String;Ljava/lang/String;J)Ll/euq0$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p4, p0, Ll/euq0$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Ll/euq0$b;->a:Ljava/lang/String;

    .line 8
    .line 9
    iput-wide p2, p0, Ll/euq0$b;->c:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    :catchall_0
    return-void
.end method

.method public static synthetic k(Ll/euq0;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/euq0;->j(Ljava/lang/String;JLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/euq0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/euq0;->r:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic m(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/euq0;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public static n()I
    .locals 2

    .line 1
    sget v0, Ll/euq0;->y:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    sget-boolean v0, Ll/euq0;->z:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    return v0

    .line 12
    :cond_0
    return v1

    .line 13
    :cond_1
    return v0
.end method

.method public static synthetic o(Ll/euq0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/euq0;->k:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic p(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/euq0;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic q(Ll/euq0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/euq0;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public static s()J
    .locals 2

    .line 1
    sget-wide v0, Ll/euq0;->A:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic t(Ll/euq0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/euq0;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic u(Ll/euq0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/euq0;->m:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic v(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/euq0;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic w(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/euq0;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic x(Ll/euq0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/euq0;->o:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic y(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/euq0;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic z(Ll/euq0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public B()J
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/euq0;->s:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    return-wide v0
.end method

.method public H()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/euq0;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public J()Lorg/json/JSONObject;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "last_create_activity"

    .line 7
    .line 8
    iget-object v2, p0, Ll/euq0;->h:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v3, p0, Ll/euq0;->i:J

    .line 11
    .line 12
    invoke-direct {p0, v2, v3, v4}, Ll/euq0;->h(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    const-string v1, "last_start_activity"

    .line 20
    .line 21
    iget-object v2, p0, Ll/euq0;->j:Ljava/lang/String;

    .line 22
    .line 23
    iget-wide v3, p0, Ll/euq0;->k:J

    .line 24
    .line 25
    invoke-direct {p0, v2, v3, v4}, Ll/euq0;->h(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    .line 31
    .line 32
    const-string v1, "last_resume_activity"

    .line 33
    .line 34
    iget-object v2, p0, Ll/euq0;->l:Ljava/lang/String;

    .line 35
    .line 36
    iget-wide v3, p0, Ll/euq0;->m:J

    .line 37
    .line 38
    invoke-direct {p0, v2, v3, v4}, Ll/euq0;->h(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    const-string v1, "last_pause_activity"

    .line 46
    .line 47
    iget-object v2, p0, Ll/euq0;->n:Ljava/lang/String;

    .line 48
    .line 49
    iget-wide v3, p0, Ll/euq0;->o:J

    .line 50
    .line 51
    invoke-direct {p0, v2, v3, v4}, Ll/euq0;->h(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    const-string v1, "last_stop_activity"

    .line 59
    .line 60
    iget-object v2, p0, Ll/euq0;->p:Ljava/lang/String;

    .line 61
    .line 62
    iget-wide v3, p0, Ll/euq0;->q:J

    .line 63
    .line 64
    invoke-direct {p0, v2, v3, v4}, Ll/euq0;->h(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    const-string v1, "alive_activities"

    .line 72
    .line 73
    invoke-direct {p0}, Ll/euq0;->X()Lorg/json/JSONArray;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    const-string v1, "finish_activities"

    .line 81
    .line 82
    invoke-direct {p0}, Ll/euq0;->Z()Lorg/json/JSONArray;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    :catch_0
    return-object v0
.end method

.method public K()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/euq0;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public N()Lorg/json/JSONArray;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object p0, p0, Ll/euq0;->g:Ljava/util/LinkedList;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/euq0$b;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/euq0$b;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-object v0
.end method

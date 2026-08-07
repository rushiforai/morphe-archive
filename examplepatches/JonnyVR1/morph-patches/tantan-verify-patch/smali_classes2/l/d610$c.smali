.class public Ll/d610$c;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d610;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/d610$c$b;,
        Ll/d610$c$a;
    }
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:J

.field e:Ljava/lang/String;

.field f:[Ljava/lang/String;

.field g:[Ljava/lang/String;

.field h:Ll/r31;

.field private i:Ljava/lang/String;

.field j:Ll/puq0;

.field k:Z

.field l:Ljava/lang/String;

.field private m:Ll/d610$c$a;

.field n:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/d610$c;->d:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/d610$c;->k:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/d610$c;->n:Ljava/util/Map;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Ll/d610$a;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ll/d610$c;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/d610$c;Ll/d610$c$a;)Ll/d610$c$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d610$c;->m:Ll/d610$c$a;

    .line 2
    .line 3
    return-object p1
.end method

.method public static d(Ljava/lang/String;)Ll/d610$c$b;
    .locals 2

    .line 1
    new-instance v0, Ll/d610$c$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/d610$c$b;-><init>(Ljava/lang/String;Ll/d610$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610$c;->m:Ll/d610$c$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/d610$c;->i:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-interface {v0}, Ll/d610$c$a;->getDid()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d610$c;->m:Ll/d610$c$a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-interface {p0}, Ll/d610$c$a;->getUserId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public e(Ljava/lang/String;Z)Ll/d610$c;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/d610$c;->i:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/d610$c;->j:Ll/puq0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/puq0;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/huq0;->e()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-object p0
.end method

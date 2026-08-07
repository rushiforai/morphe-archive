.class public Ll/quq0;
.super Ljava/lang/Object;


# static fields
.field private static d:J


# instance fields
.field private final a:Ll/grq0;

.field private b:Z

.field private final c:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/grq0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/quq0;->b:Z

    .line 6
    .line 7
    new-instance v0, Ll/quq0$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/quq0$a;-><init>(Ll/quq0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/quq0;->c:Ljava/lang/Runnable;

    .line 13
    .line 14
    iput-object p1, p0, Ll/quq0;->a:Ll/grq0;

    .line 15
    .line 16
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-wide/16 v1, 0x1388

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, v2}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(J)J
    .locals 0

    .line 1
    sput-wide p0, Ll/quq0;->d:J

    .line 2
    .line 3
    return-wide p0
.end method

.method public static synthetic c(Ll/quq0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/quq0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d()J
    .locals 2

    .line 1
    sget-wide v0, Ll/quq0;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic e(Ll/quq0;)Ll/grq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/quq0;->a:Ll/grq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/quq0;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/quq0;->c:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/quq0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/quq0;->c:Ljava/lang/Runnable;

    .line 11
    .line 12
    const-wide/16 v1, 0x1388

    .line 13
    .line 14
    invoke-virtual {v0, p0, v1, v2}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

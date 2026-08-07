.class public Ll/uv5$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uv5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:Ljava/lang/String;

.field private e:J

.field private f:J

.field private g:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/uv5$b;->a:I

    .line 6
    .line 7
    iput v0, p0, Ll/uv5$b;->b:I

    .line 8
    .line 9
    iput v0, p0, Ll/uv5$b;->c:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/uv5$b;->d:Ljava/lang/String;

    .line 13
    .line 14
    const-wide/16 v0, -0x1

    .line 15
    .line 16
    iput-wide v0, p0, Ll/uv5$b;->e:J

    .line 17
    .line 18
    iput-wide v0, p0, Ll/uv5$b;->f:J

    .line 19
    .line 20
    iput-wide v0, p0, Ll/uv5$b;->g:J

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/uv5$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/uv5$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/uv5$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uv5$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/uv5$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uv5$b;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic d(Ll/uv5$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uv5$b;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic e(Ll/uv5$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uv5$b;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f(Ll/uv5$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/uv5$b;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ll/uv5$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/uv5$b;->c:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public h(Landroid/content/Context;)Ll/uv5;
    .locals 2

    .line 1
    new-instance v0, Ll/uv5;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, p0, v1}, Ll/uv5;-><init>(Landroid/content/Context;Ll/uv5$b;Ll/uv5$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public i(Ljava/lang/String;)Ll/uv5$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uv5$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Z)Ll/uv5$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/uv5$b;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public k(J)Ll/uv5$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/uv5$b;->f:J

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Z)Ll/uv5$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/uv5$b;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(J)Ll/uv5$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/uv5$b;->e:J

    .line 2
    .line 3
    return-object p0
.end method

.method public n(J)Ll/uv5$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/uv5$b;->g:J

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Z)Ll/uv5$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/uv5$b;->c:I

    .line 2
    .line 3
    return-object p0
.end method

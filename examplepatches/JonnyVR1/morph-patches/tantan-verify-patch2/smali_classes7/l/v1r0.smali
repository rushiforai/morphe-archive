.class public Ll/v1r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static a:Ljava/lang/String; = "wcc-ml-test10.bj"

.field public static b:Ljava/lang/String;


# instance fields
.field private a:I

.field private a:Ll/y1r0;

.field private a:Z

.field private b:Z

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;ILjava/lang/String;Ll/y1r0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/lang/String;",
            "Ll/y1r0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Ll/u1r0;->s:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/v1r0;->a:Z

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/v1r0;->b:Z

    .line 10
    .line 11
    invoke-direct {p0, p1, p2, p3, p4}, Ll/v1r0;->a(Ljava/util/Map;ILjava/lang/String;Ll/y1r0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static final a()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/v1r0;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-static {}, Ll/m6r0;->c()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const-string v0, "sandbox.xmpush.xiaomi.com"

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_1
    invoke-static {}, Ll/m6r0;->d()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const-string v0, "10.38.162.35"

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_2
    const-string v0, "app.chat.xiaomi.net"

    .line 25
    .line 26
    return-object v0
.end method

.method public static final a(Ljava/lang/String;)V
    .locals 1

    .line 27
    invoke-static {}, Ll/m6r0;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 28
    :cond_0
    sput-object p0, Ll/v1r0;->b:Ljava/lang/String;

    return-void
.end method

.method private a(Ljava/util/Map;ILjava/lang/String;Ll/y1r0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/lang/String;",
            "Ll/y1r0;",
            ")V"
        }
    .end annotation

    .line 29
    iput p2, p0, Ll/v1r0;->a:I

    .line 30
    iput-object p3, p0, Ll/v1r0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 32
    iget p0, p0, Ll/v1r0;->a:I

    return p0
.end method

.method public a(Z)V
    .locals 0

    .line 34
    iput-boolean p1, p0, Ll/v1r0;->a:Z

    return-void
.end method

.method public a()Z
    .locals 0

    .line 33
    iget-boolean p0, p0, Ll/v1r0;->a:Z

    return p0
.end method

.method public a()[B
    .locals 0

    .line 31
    const/4 p0, 0x0

    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 4
    iget-object p0, p0, Ll/v1r0;->e:Ljava/lang/String;

    return-object p0
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v1r0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v1r0;->d:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/v1r0;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/v1r0;->d:Ljava/lang/String;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/v1r0;->d:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 14
    iput-object p1, p0, Ll/v1r0;->d:Ljava/lang/String;

    return-void
.end method

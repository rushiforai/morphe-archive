.class public Ll/xjw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static b:Ll/xjw;


# instance fields
.field private a:Ll/lxl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/xjw;
    .locals 1

    .line 1
    sget-object v0, Ll/xjw;->b:Ll/xjw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/xjw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/xjw;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/xjw;->b:Ll/xjw;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/xjw;->b:Ll/xjw;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xjw;->a:Ll/lxl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/lxl;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public c(Ljava/lang/String;Z)[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xjw;->a:Ll/lxl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/lxl;->b(Ljava/lang/String;Z)[Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    new-array p0, p0, [Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public d(Ll/lxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xjw;->a:Ll/lxl;

    .line 2
    .line 3
    return-void
.end method

.method public e(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xjw;->a:Ll/lxl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/lxl;->a(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

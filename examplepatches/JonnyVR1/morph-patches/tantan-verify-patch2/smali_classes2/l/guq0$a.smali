.class Ll/guq0$a;
.super Ljava/lang/Object;

# interfaces
.implements Ll/vuq0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/guq0;->i(Ll/guq0$f;ZLl/d3r0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/wxq0;

.field final synthetic b:Ljava/io/File;

.field final synthetic c:Ll/guq0$f;

.field final synthetic d:Ll/guq0;


# direct methods
.method public constructor <init>(Ll/guq0;Ll/wxq0;Ljava/io/File;Ll/guq0$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/guq0$a;->d:Ll/guq0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/guq0$a;->a:Ll/wxq0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/guq0$a;->b:Ljava/io/File;

    .line 6
    .line 7
    iput-object p4, p0, Ll/guq0$a;->c:Ll/guq0$f;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/guq0$a;->a:Ll/wxq0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wxq0;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v1, Ljava/io/File;

    .line 12
    .line 13
    iget-object v2, p0, Ll/guq0$a;->b:Ljava/io/File;

    .line 14
    .line 15
    const-string v3, "logZip"

    .line 16
    .line 17
    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ll/guq0$a;->d:Ll/guq0;

    .line 21
    .line 22
    invoke-static {v2}, Ll/guq0;->q(Ll/guq0;)Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object p0, p0, Ll/guq0$a;->c:Ll/guq0$f;

    .line 27
    .line 28
    iget-object p0, p0, Ll/guq0$f;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v2, p0}, Ll/j5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    filled-new-array {v1, p0}, [Ljava/io/File;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v0, p1, p0}, Lcom/apm/lite/j/e;->g(Ljava/lang/String;Ljava/lang/String;[Ljava/io/File;)Ll/r4r0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

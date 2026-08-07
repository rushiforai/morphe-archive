.class Ll/guq0$b;
.super Ljava/lang/Object;

# interfaces
.implements Ll/vuq0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/guq0;->o(Ll/guq0$f;ZLl/d3r0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/io/File;

.field final synthetic b:Ll/guq0$f;

.field final synthetic c:Ll/guq0;


# direct methods
.method public constructor <init>(Ll/guq0;Ljava/io/File;Ll/guq0$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/guq0$b;->c:Ll/guq0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/guq0$b;->a:Ljava/io/File;

    .line 4
    .line 5
    iput-object p3, p0, Ll/guq0$b;->b:Ll/guq0$f;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/yxq0;->a()Ll/yxq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/guq0$b;->a:Ljava/io/File;

    .line 6
    .line 7
    iget-object v2, p0, Ll/guq0$b;->c:Ll/guq0;

    .line 8
    .line 9
    invoke-static {v2}, Ll/guq0;->q(Ll/guq0;)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object p0, p0, Ll/guq0$b;->b:Ll/guq0$f;

    .line 14
    .line 15
    iget-object p0, p0, Ll/guq0$f;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2, p0}, Ll/j5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p1, v1, p0}, Ll/yxq0;->c(Lorg/json/JSONObject;Ljava/io/File;Ljava/io/File;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.class Ll/fqq$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fqq;->m(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/qpl;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lorg/json/JSONObject;

.field final synthetic e:Ll/fqq;


# direct methods
.method public constructor <init>(Ll/fqq;Ll/qpl;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fqq$b;->e:Ll/fqq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fqq$b;->a:Ll/qpl;

    .line 4
    .line 5
    iput-object p3, p0, Ll/fqq$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/fqq$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/fqq$b;->d:Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/fqq$b;->a:Ll/qpl;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fqq$b;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/fqq$b;->c:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/fqq$b;->d:Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Ll/qpl;->p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/fqq$b;->e:Ll/fqq;

    .line 16
    .line 17
    iget-object p0, p0, Ll/fqq$b;->d:Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/fqq;->b(Ll/fqq;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    const-string v0, "JsBridgeProcessor"

    .line 25
    .line 26
    const-string v1, ""

    .line 27
    .line 28
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    .line 30
    .line 31
    return-void
.end method

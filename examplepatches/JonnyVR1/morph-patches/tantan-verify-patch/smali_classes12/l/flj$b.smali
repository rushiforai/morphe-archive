.class Ll/flj$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/flj;->j(Ljava/lang/String;Ll/yjw;Ll/elj;ZLl/okj;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/elj;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Z

.field final synthetic e:Ll/okj;

.field final synthetic f:Ll/flj;


# direct methods
.method public constructor <init>(Ll/flj;Ljava/lang/String;Ll/elj;Ljava/lang/String;ZLl/okj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/flj$b;->f:Ll/flj;

    .line 2
    .line 3
    iput-object p2, p0, Ll/flj$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/flj$b;->b:Ll/elj;

    .line 6
    .line 7
    iput-object p4, p0, Ll/flj$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-boolean p5, p0, Ll/flj$b;->d:Z

    .line 10
    .line 11
    iput-object p6, p0, Ll/flj$b;->e:Ll/okj;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    new-instance v3, Ljava/io/File;

    .line 2
    .line 3
    iget-object v0, p0, Ll/flj$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v6, 0x1

    .line 9
    :try_start_0
    iget-object v0, p0, Ll/flj$b;->f:Ll/flj;

    .line 10
    .line 11
    iget-object v1, p0, Ll/flj$b;->b:Ll/elj;

    .line 12
    .line 13
    invoke-static {v0, v3, v1}, Ll/flj;->c(Ll/flj;Ljava/io/File;Ll/elj;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/flj$b;->f:Ll/flj;

    .line 17
    .line 18
    iget-object v1, p0, Ll/flj$b;->c:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p0, Ll/flj$b;->b:Ll/elj;

    .line 21
    .line 22
    iget-boolean v4, p0, Ll/flj$b;->d:Z

    .line 23
    .line 24
    iget-object v5, p0, Ll/flj$b;->e:Ll/okj;

    .line 25
    .line 26
    invoke-static/range {v0 .. v5}, Ll/flj;->d(Ll/flj;Ljava/lang/String;Ll/elj;Ljava/io/File;ZLl/okj;)V
    :try_end_0
    .catch Lcom/hellogroup/mk/core/offlinedownload/UnzipErrorException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/flj$b;->e:Ll/okj;

    .line 30
    .line 31
    iget-object p0, p0, Ll/flj$b;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v0, p0, v6}, Ll/okj;->c(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception v0

    .line 38
    goto :goto_0

    .line 39
    :catch_1
    move-exception v0

    .line 40
    goto :goto_1

    .line 41
    :goto_0
    iget-object v1, p0, Ll/flj$b;->e:Ll/okj;

    .line 42
    .line 43
    iget-object p0, p0, Ll/flj$b;->c:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-interface {v1, p0, v2, v0}, Ll/okj;->b(Ljava/lang/String;ILjava/lang/Exception;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :goto_1
    iget-object v1, p0, Ll/flj$b;->e:Ll/okj;

    .line 51
    .line 52
    iget-object p0, p0, Ll/flj$b;->c:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {v1, p0, v6, v0}, Ll/okj;->b(Ljava/lang/String;ILjava/lang/Exception;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

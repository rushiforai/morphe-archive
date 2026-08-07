.class public abstract Ll/l4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/wpq0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wpq0;

    .line 5
    .line 6
    invoke-static {}, Ll/zpe;->b()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Ll/wpq0;-><init>(Ljava/io/File;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/l4;->a:Ll/wpq0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()Ll/wpq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;
.end method

.method public c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;
    .locals 0

    .line 1
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public abstract d(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Z
.end method

.method public e(Ljava/lang/String;ZLl/w8e;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/l4;->f(Ljava/lang/String;ZLl/w8e;Ll/e4d0;)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public abstract f(Ljava/lang/String;ZLl/w8e;Ll/e4d0;)Z
.end method

.method public g(Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Ll/l4;->e(Ljava/lang/String;ZLl/w8e;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

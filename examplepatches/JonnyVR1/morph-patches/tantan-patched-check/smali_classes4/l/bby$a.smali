.class public Ll/bby$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VTexturePlayer$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bby;->N()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:Ll/bby;


# direct methods
.method public constructor <init>(Ll/bby;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bby$a;->c:Ll/bby;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bby$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Ll/bby$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public O()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/bby$a;->c:Ll/bby;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {p0, v0, v1}, Ll/bby;->w(Ll/bby;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v2

    .line 5
    iget-object v0, p0, Ll/bby$a;->c:Ll/bby;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bby;->s(Ll/bby;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-object v4, p0, Ll/bby$a;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget v5, p0, Ll/bby$a;->b:I

    .line 14
    .line 15
    invoke-static/range {v0 .. v5}, Ll/c7y;->c(JJLjava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/bby$a;->c:Ll/bby;

    .line 19
    .line 20
    invoke-static {v0}, Ll/bby;->u(Ll/bby;)Lv/VTexturePlayer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/cey;->j()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setVolume(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/bby$a;->c:Ll/bby;

    .line 36
    .line 37
    invoke-static {p0}, Ll/bby;->u(Ll/bby;)Lv/VTexturePlayer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 v0, 0x1

    .line 42
    invoke-virtual {p0, v0}, Lv/VTexturePlayer;->setLooping(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public b(II)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iget-object v1, p0, Ll/bby$a;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget p0, p0, Ll/bby$a;->b:I

    .line 12
    .line 13
    invoke-static {p1, p2, v0, v1, p0}, Ll/c7y;->e(IIZLjava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c(J)V
    .locals 8

    .line 1
    iget-object p1, p0, Ll/bby$a;->c:Ll/bby;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bby;->t(Ll/bby;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    cmp-long p1, p1, v0

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Ll/bby$a;->c:Ll/bby;

    .line 14
    .line 15
    invoke-static {p1}, Ll/bby;->v(Ll/bby;)Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    iget-object p1, p0, Ll/bby$a;->c:Ll/bby;

    .line 30
    .line 31
    invoke-static {p1}, Ll/bby;->t(Ll/bby;)J

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    sub-long p1, v4, p1

    .line 36
    .line 37
    const-wide/16 v2, 0xc8

    .line 38
    .line 39
    cmp-long p1, p1, v2

    .line 40
    .line 41
    if-ltz p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Ll/bby$a;->c:Ll/bby;

    .line 44
    .line 45
    invoke-static {p1}, Ll/bby;->t(Ll/bby;)J

    .line 46
    .line 47
    .line 48
    move-result-wide p1

    .line 49
    sub-long p1, v4, p1

    .line 50
    .line 51
    const/4 v2, 0x0

    .line 52
    iget-object v3, p0, Ll/bby$a;->a:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p1, p2, v2, v3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->h0(JLjava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/bby$a;->c:Ll/bby;

    .line 58
    .line 59
    invoke-static {p1}, Ll/bby;->t(Ll/bby;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v2

    .line 63
    iget-object v6, p0, Ll/bby$a;->a:Ljava/lang/String;

    .line 64
    .line 65
    iget v7, p0, Ll/bby$a;->b:I

    .line 66
    .line 67
    invoke-static/range {v2 .. v7}, Ll/c7y;->b(JJLjava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object p0, p0, Ll/bby$a;->c:Ll/bby;

    .line 71
    .line 72
    invoke-static {p0, v0, v1}, Ll/bby;->w(Ll/bby;J)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

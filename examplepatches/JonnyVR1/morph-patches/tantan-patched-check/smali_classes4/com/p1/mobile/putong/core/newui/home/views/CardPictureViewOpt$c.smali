.class public Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VTexturePlayer$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->s()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:J

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->c:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    const-wide/16 p1, -0x1

    .line 11
    .line 12
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->a:J

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public O()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->a:J

    .line 6
    .line 7
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->n(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->b:Ljava/lang/String;

    .line 12
    .line 13
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->c:I

    .line 14
    .line 15
    invoke-static/range {v0 .. v5}, Ll/c7y;->c(JJLjava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)Lv/VTexturePlayer;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Lv/VTexturePlayer;->setLooping(Z)V

    .line 26
    .line 27
    .line 28
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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->b:Ljava/lang/String;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->c:I

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
    iget-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->a:J

    .line 2
    .line 3
    const-wide/16 v0, -0x1

    .line 4
    .line 5
    cmp-long p1, p1, v0

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->j:Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v4

    .line 23
    iget-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->a:J

    .line 24
    .line 25
    sub-long v2, v4, p1

    .line 26
    .line 27
    const-wide/16 v6, 0xc8

    .line 28
    .line 29
    cmp-long v2, v2, v6

    .line 30
    .line 31
    if-ltz v2, :cond_0

    .line 32
    .line 33
    sub-long p1, v4, p1

    .line 34
    .line 35
    const-string v2, "profile"

    .line 36
    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p1, p2, v2, v3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->h0(JLjava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->a:J

    .line 43
    .line 44
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->b:Ljava/lang/String;

    .line 45
    .line 46
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->c:I

    .line 47
    .line 48
    invoke-static/range {v2 .. v7}, Ll/c7y;->b(JJLjava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;->a:J

    .line 52
    .line 53
    :cond_1
    return-void
.end method

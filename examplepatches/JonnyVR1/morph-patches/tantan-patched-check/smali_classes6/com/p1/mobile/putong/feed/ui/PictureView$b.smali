.class public Lcom/p1/mobile/putong/feed/ui/PictureView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VTexturePlayer$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/ui/PictureView;->E()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/ui/PictureView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/PictureView;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->b:I

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->n(Lcom/p1/mobile/putong/feed/ui/PictureView;J)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->l(Lcom/p1/mobile/putong/feed/ui/PictureView;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget v5, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->b:I

    .line 14
    .line 15
    invoke-static/range {v0 .. v5}, Ll/c7y;->c(JJLjava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b(II)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->b:I

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->m(Lcom/p1/mobile/putong/feed/ui/PictureView;)J

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
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/PictureView;->l:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v4

    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->m(Lcom/p1/mobile/putong/feed/ui/PictureView;)J

    .line 30
    .line 31
    .line 32
    move-result-wide p1

    .line 33
    sub-long p1, v4, p1

    .line 34
    .line 35
    const-wide/16 v2, 0xc8

    .line 36
    .line 37
    cmp-long p1, p1, v2

    .line 38
    .line 39
    if-ltz p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->m(Lcom/p1/mobile/putong/feed/ui/PictureView;)J

    .line 44
    .line 45
    .line 46
    move-result-wide p1

    .line 47
    sub-long p1, v4, p1

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 50
    .line 51
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/ui/PictureView;->j(Lcom/p1/mobile/putong/feed/ui/PictureView;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    const-string v2, "profile"

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 61
    .line 62
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/ui/PictureView;->i(Lcom/p1/mobile/putong/feed/ui/PictureView;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->a:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p1, p2, v2, v3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->h0(JLjava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->m(Lcom/p1/mobile/putong/feed/ui/PictureView;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->a:Ljava/lang/String;

    .line 78
    .line 79
    iget v7, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->b:I

    .line 80
    .line 81
    invoke-static/range {v2 .. v7}, Ll/c7y;->b(JJLjava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView$b;->c:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 85
    .line 86
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->n(Lcom/p1/mobile/putong/feed/ui/PictureView;J)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method

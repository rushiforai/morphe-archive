.class public final Ll/vmg0;
.super Ll/hug0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/ukg0;

.field public final synthetic b:Ll/dng0;


# direct methods
.method public constructor <init>(Ll/dng0;Ll/ukg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vmg0;->b:Ll/dng0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vmg0;->a:Ll/ukg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/hug0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ll/bxg0;)V
    .locals 7

    .line 1
    iget-object p1, p0, Ll/vmg0;->b:Ll/dng0;

    .line 2
    .line 3
    iget-object v0, p1, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    add-int/lit8 v3, v3, 0x1

    .line 18
    .line 19
    check-cast v4, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;

    .line 20
    .line 21
    iget-wide v5, p1, Ll/dng0;->a:J

    .line 22
    .line 23
    invoke-interface {v4, v5, v6}, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;->onPreloadSuccess(J)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iput-boolean v2, p1, Ll/dng0;->c:Z

    .line 28
    .line 29
    iget-object v0, p1, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p1, Ll/dng0;->h:Ll/qxg0;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-wide v3, p1, Ll/dng0;->a:J

    .line 39
    .line 40
    iget-object p1, v0, Ll/qxg0;->a:Ll/wxg0;

    .line 41
    .line 42
    iget-object p1, p1, Ll/wxg0;->a:Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object p0, p0, Ll/vmg0;->a:Ll/ukg0;

    .line 52
    .line 53
    iput v2, p0, Ll/ukg0;->e:I

    .line 54
    .line 55
    const-string p1, "success"

    .line 56
    .line 57
    iput-object p1, p0, Ll/ukg0;->f:Ljava/lang/String;

    .line 58
    .line 59
    iput-object p2, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 60
    .line 61
    sget-object p1, Ll/fug0;->a:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p1, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    new-instance p2, Ll/nog0;

    .line 70
    .line 71
    invoke-direct {p2, p0, v2, p1, v2}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 72
    .line 73
    .line 74
    invoke-static {p2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final c(JJLtech/sud/gip/core/PkgDownloadStatus;)V
    .locals 11

    .line 1
    iget-object p0, p0, Ll/vmg0;->b:Ll/dng0;

    .line 2
    .line 3
    iput-wide p1, p0, Ll/dng0;->f:J

    .line 4
    .line 5
    iput-wide p3, p0, Ll/dng0;->g:J

    .line 6
    .line 7
    iget-object v8, p0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v9

    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    if-ge v0, v9, :cond_0

    .line 15
    .line 16
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    add-int/lit8 v10, v0, 0x1

    .line 21
    .line 22
    move-object v0, v1

    .line 23
    check-cast v0, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;

    .line 24
    .line 25
    iget-wide v1, p0, Ll/dng0;->a:J

    .line 26
    .line 27
    move-wide v3, p1

    .line 28
    move-wide v5, p3

    .line 29
    move-object/from16 v7, p5

    .line 30
    .line 31
    invoke-interface/range {v0 .. v7}, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;->onPreloadStatus(JJJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 32
    .line 33
    .line 34
    move v0, v10

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method

.method public final e(ILjava/lang/String;Ll/bxg0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmg0;->b:Ll/dng0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/dng0;->a(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vmg0;->a:Ll/ukg0;

    .line 7
    .line 8
    iput p1, p0, Ll/ukg0;->e:I

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    iput-object p2, p0, Ll/ukg0;->f:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iput-object p3, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 15
    .line 16
    sget-object p2, Ll/fug0;->a:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p2, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p3, Ll/nog0;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-direct {p3, p0, v0, p2, p1}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    invoke-static {p3}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

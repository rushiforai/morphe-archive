.class public final Ll/rmg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field public final synthetic b:Ll/tpg0;


# direct methods
.method public constructor <init>(Ll/tpg0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rmg0;->b:Ll/tpg0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rmg0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PKG_DOWNLOAD_COMPLETED onCompleted mgId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/rmg0;->b:Ll/tpg0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/tpg0;->b:Ll/pvg0;

    .line 11
    .line 12
    iget-object v1, v1, Ll/pvg0;->a:Ll/sgg0;

    .line 13
    .line 14
    iget-wide v1, v1, Ll/sgg0;->b:J

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "SudDownloadTask"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/rmg0;->b:Ll/tpg0;

    .line 29
    .line 30
    iget-object v0, v0, Ll/tpg0;->b:Ll/pvg0;

    .line 31
    .line 32
    iget-object v0, v0, Ll/pvg0;->a:Ll/sgg0;

    .line 33
    .line 34
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_COMPLETED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 35
    .line 36
    iput-object v1, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    iput-wide v2, v0, Ll/sgg0;->r:J

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/rmg0;->b:Ll/tpg0;

    .line 48
    .line 49
    iget-object v1, v0, Ll/tpg0;->b:Ll/pvg0;

    .line 50
    .line 51
    iget-object v1, v1, Ll/pvg0;->a:Ll/sgg0;

    .line 52
    .line 53
    iget-object v3, v0, Ll/tpg0;->a:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v6, p0, Ll/rmg0;->a:Ljava/lang/Object;

    .line 56
    .line 57
    iget-object p0, v1, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const/4 v2, 0x0

    .line 64
    :goto_0
    if-ge v2, v0, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    add-int/lit8 v8, v2, 0x1

    .line 71
    .line 72
    move-object v2, v4

    .line 73
    check-cast v2, Ll/wfg0;

    .line 74
    .line 75
    iget-wide v4, v1, Ll/sgg0;->p:J

    .line 76
    .line 77
    iget-object v7, v1, Ll/sgg0;->o:Ll/bxg0;

    .line 78
    .line 79
    invoke-interface/range {v2 .. v7}, Ll/wfg0;->f(Ljava/lang/String;JLjava/lang/Object;Ll/bxg0;)V

    .line 80
    .line 81
    .line 82
    move v2, v8

    .line 83
    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual {v1}, Ll/sgg0;->a()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

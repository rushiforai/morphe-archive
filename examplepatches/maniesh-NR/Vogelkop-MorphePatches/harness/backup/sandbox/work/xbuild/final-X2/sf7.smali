.class public final Lsf7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrf7;

.field public final b:Ligi;

.field public final c:Lfg7;

.field public final d:Lev4;

.field public final e:Ljnm;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lydn;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lrf7;

    invoke-direct {v0, p1}, Lrf7;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lsf7;->a:Lrf7;

    new-instance v1, Ligi;

    const/16 v2, 0x13

    invoke-direct {v1, p1, v2}, Ligi;-><init>(Landroid/content/Context;B)V

    iput-object v1, p0, Lsf7;->b:Ligi;

    iget-object v1, v1, Ligi;->g:Ljava/lang/Object;

    check-cast v1, Lag;

    invoke-virtual {v0, v1}, Lrf7;->b(Lqf7;)V

    new-instance v1, Lc5o;

    const/16 v2, 0xd

    invoke-direct {v1, p1, v2}, Lc5o;-><init>(Landroid/content/Context;B)V

    iget-object v1, v1, Lc5o;->b:Ljava/lang/Object;

    check-cast v1, Lag;

    invoke-virtual {v0, v1}, Lrf7;->b(Lqf7;)V

    new-instance v1, Lfg7;

    invoke-direct {v1, v0}, Lfg7;-><init>(Lrf7;)V

    iput-object v1, p0, Lsf7;->c:Lfg7;

    new-instance v1, Lev4;

    invoke-direct {v1, p1, v0}, Lev4;-><init>(Landroid/content/Context;Lrf7;)V

    iput-object v1, p0, Lsf7;->d:Lev4;

    new-instance v1, Ljnm;

    invoke-direct {v1, p1, p2}, Ljnm;-><init>(Landroid/content/Context;Lumi;)V

    iput-object v1, p0, Lsf7;->e:Ljnm;

    new-instance v3, Lnpl;

    invoke-direct {v3, v1, v0, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v0, Lrf7;->g:Lnrl;

    invoke-virtual {v1, v3}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    new-instance v2, Lff7;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    sget-object v3, Lorg/chromium/components/download/DownloadCollectionBridge;->a:Ljava/util/ArrayList;

    invoke-static {}, Ltgk;->l()Ltgk;

    move-result-object v3

    :try_start_52
    sput-object v2, Lorg/chromium/components/download/DownloadCollectionBridge;->b:Lir5;
    :try_end_54
    .catchall {:try_start_52 .. :try_end_54} :catchall_66

    invoke-virtual {v3}, Ltgk;->close()V

    new-instance v2, Llen;

    invoke-direct {v2, p2, p3, v0}, Llen;-><init>(Lumi;Lydn;Lrf7;)V

    new-instance p3, Lgl6;

    const/4 v0, 0x7

    invoke-direct {p3, p0, p1, p2, v0}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, p3}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void

    :catchall_66
    move-exception p0

    :try_start_67
    invoke-virtual {v3}, Ltgk;->close()V
    :try_end_6a
    .catchall {:try_start_67 .. :try_end_6a} :catchall_6b

    goto :goto_6f

    :catchall_6b
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6f
    throw p0
.end method

.class public final Lag7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Landroid/content/Context;

.field private final c:Lyf7;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field private final d:Lzf7;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public e:Lcv3;


# direct methods
.method public constructor <init>(Lrf7;Lumi;Landroid/content/Context;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lag7;->a:Ljava/util/ArrayList;

    iput-object p3, p0, Lag7;->b:Landroid/content/Context;

    new-instance p3, Lyf7;

    invoke-direct {p3, p0, p1, p2}, Lyf7;-><init>(Lag7;Lrf7;Lumi;)V

    iput-object p3, p0, Lag7;->c:Lyf7;

    new-instance v0, Lzf7;

    new-instance v1, Lcom/opera/android/browser/chromium/OperaBrowserContext;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/opera/android/browser/chromium/OperaBrowserContext;-><init>(Z)V

    invoke-direct {v0, p0, v1, p2}, Lxf7;-><init>(Lag7;Lcom/opera/android/browser/chromium/OperaBrowserContext;Lumi;)V

    iput-object v0, p0, Lag7;->d:Lzf7;

    iput-boolean v2, p3, Lyf7;->g:Z

    new-instance p2, Lbl6;

    const/16 v0, 0x16

    invoke-direct {p2, p3, v0}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, LJ/N;->MN7xR1SP(Ljava/lang/Object;)V

    new-instance p2, Lof7;

    invoke-direct {p2, p1, v2}, Lof7;-><init>(Lrf7;B)V

    invoke-virtual {p0, p2}, Lag7;->a(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Runnable;)V
    .registers 3

    iget-object p0, p0, Lag7;->c:Lyf7;

    iget-boolean v0, p0, Lyf7;->g:Z

    if-nez v0, :cond_a

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_a
    iget-object p0, p0, Lyf7;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Landroid/net/Uri;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;[BJLcom/opera/api/Callback;)V
    .registers 18

    invoke-static {}, LJ/N;->MraTr5Xy()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v2, "file"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    :goto_17
    move-object v3, v0

    goto :goto_1e

    :cond_19
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_17

    :goto_1e
    iget-object v0, p0, Lag7;->c:Lyf7;

    iget-object v0, v0, Lyf7;->h:Ljava/util/HashMap;

    move-object/from16 v2, p8

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v5, p3

    move-object v4, p4

    move-object v6, p5

    move-wide v7, p6

    invoke-static/range {v1 .. v8}, LJ/N;->MEKma8rK(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;J)V

    iget-object p0, p0, Lag7;->b:Landroid/content/Context;

    invoke-static {p0, p2}, Llg7;->a(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

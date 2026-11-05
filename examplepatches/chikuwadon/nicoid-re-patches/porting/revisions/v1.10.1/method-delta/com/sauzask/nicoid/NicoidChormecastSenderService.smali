.class public Lcom/sauzask/nicoid/NicoidChormecastSenderService;
.super Landroid/app/Service;
.source ""

# interfaces
.implements Le/e/a/l3/m;


# static fields
.field public static D:Z = false

.field public static E:Le/e/a/v; = null

.field public static F:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation
.end field

.field public static G:Z = false

.field public static H:I = 0x0

.field public static I:Ljava/lang/String; = ""

.field public static J:Ljava/lang/String; = ""

.field public static K:Le/e/a/l3/a;

.field public static L:Landroid/os/Bundle;

.field public static M:Ljava/lang/String;

.field public static N:I

.field public static O:I

.field public static P:Z

.field public static Q:Z


# instance fields
.field public A:Le/d/b/b/d/a$d;

.field public B:Le/d/b/b/e/k/e$b;

.field public C:Le/d/b/b/e/k/e$c;

.field public a:I

.field public b:Ljava/lang/String;

.field public c:Le/d/b/b/e/k/e;

.field public d:Lcom/google/android/gms/cast/CastDevice;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:D

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Landroid/content/Context;

.field public n:Le/e/a/o2;

.field public o:Landroid/content/SharedPreferences;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Ljava/lang/String;

.field public u:Le/e/a/d0;

.field public v:Ljava/lang/String;

.field public w:Le/e/a/g0;

.field public x:Landroid/os/Handler;

.field public y:Le/e/a/p2;

.field public final z:Le/d/b/b/d/a$e;


# virtual methods
.method public final a(Z)Z
    .registers 11

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->G:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_ba

    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->F:Ljava/util/ArrayList;

    if-eqz v0, :cond_ba

    const/4 v0, 0x1

    sget v2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->H:I

    if-eqz p1, :cond_10

    add-int/2addr v2, v0

    goto :goto_11

    :cond_10
    sub-int/2addr v2, v0

    :goto_11
    sget-object v3, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->F:Ljava/util/ArrayList;

    if-eqz p1, :cond_1d

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v2, v4, :cond_24

    const/4 v2, 0x0

    goto :goto_24

    :cond_1d
    if-gez v2, :cond_24

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v0

    :cond_24
    :goto_24
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/x1;

    iget-object v4, v4, Le/e/a/x1;->j:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_39

    sput v2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->H:I

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a(Z)Z

    move-result p1

    return p1

    :cond_39
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    const-string v4, "videourl"

    invoke-virtual {p1, v4}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/x1;

    const-string v5, "title"

    invoke-virtual {v4, v5}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v6, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v7, "$1$2"

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a()V

    sput-object p1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    iput-object v4, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->k:Ljava/lang/String;

    new-instance v6, Landroid/content/Intent;

    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    const-class v8, Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-direct {v6, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v6, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v7, "url"

    invoke-virtual {v6, v7, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v7, "type"

    invoke-virtual {v6, v7, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-static {v6, v3, v2, v1}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    invoke-static {v7, v6}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    sget-object v6, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    if-eqz v6, :cond_b9

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v6, "android.intent.action.VIEW"

    const-string v7, "com.sauzask.nicoid.hls"

    const-string v8, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v6, p1, v7, v8}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v4, "intentselect"

    invoke-virtual {p1, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p1, v3, v2, v1}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    sget-object v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    invoke-interface {v1, p1}, Le/e/a/l3/a;->a(Landroid/content/Intent;)V

    :cond_b9
    return v0

    :cond_ba
    return v1
.end method

.method public final b()V
    .registers 11

    invoke-static {p0}, Le/e/a/v0;->e(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->p:Z

    invoke-static {p0}, Le/e/a/v0;->d(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->q:Z

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->t:Ljava/lang/String;

    const-string v4, ".mp4"

    invoke-static {v2, v3, v4}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_40

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->r:Z

    goto :goto_42

    :cond_40
    iput-boolean v2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->r:Z

    :goto_42
    new-instance v0, Le/e/a/g0;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    iget-boolean v4, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->q:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Le/e/a/g0;-><init>(Landroid/content/Context;Ljava/lang/Boolean;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->w:Le/e/a/g0;

    new-instance v0, Le/e/a/v;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->w:Le/e/a/g0;

    invoke-direct {v0, p0, v3}, Le/e/a/v;-><init>(Landroid/content/Context;Le/e/a/g0;)V

    sput-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->E:Le/e/a/v;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->w:Le/e/a/g0;

    sget-object v3, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->E:Le/e/a/v;

    .line 1
    iput-object v3, v0, Le/e/a/g0;->f:Le/e/a/v;

    .line 2
    new-instance v0, Le/e/a/d0;

    invoke-direct {v0, p0}, Le/e/a/d0;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->u:Le/e/a/d0;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->u:Le/e/a/d0;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->t:Ljava/lang/String;

    sget-object v5, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->E:Le/e/a/v;

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->p:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->q:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->r:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    iget-boolean v9, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->s:Z

    .line 3
    iput-boolean v2, v3, Le/e/a/d0;->s:Z

    iput-boolean v1, v3, Le/e/a/d0;->t:Z

    invoke-virtual/range {v3 .. v9}, Le/e/a/d0;->a(Ljava/lang/String;Le/e/a/v;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Z)V

    .line 4
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->u:Le/e/a/d0;

    new-instance v1, Le/e/a/p;

    invoke-direct {v1, p0}, Le/e/a/p;-><init>(Lcom/sauzask/nicoid/NicoidChormecastSenderService;)V

    .line 5
    iput-object v1, v0, Le/e/a/d0;->k:Le/e/a/l3/j;

    .line 6
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->u:Le/e/a/d0;

    if-eqz v0, :cond_a8

    invoke-virtual {v0}, Le/e/a/d0;->c()Z

    move-result v0

    if-nez v0, :cond_a8

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->u:Le/e/a/d0;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_a8

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->u:Le/e/a/d0;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_a8
    return-void
.end method

.method public e()V
    .registers 8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->i:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "comment.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " / "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->j:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_23
    const-string v4, "type"

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v4, "loadurl"

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->j:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "videoid"

    sget-object v5, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "title"

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->k:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "comhide"

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->o:Landroid/content/SharedPreferences;

    const-string v6, "comment_hide"

    invoke-interface {v5, v6, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v4, "commin"

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->o:Landroid/content/SharedPreferences;

    const-string v6, "comment_cast_min"

    invoke-interface {v5, v6, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v4, "commenturl"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->i:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_6d} :catch_6e

    goto :goto_6f

    :catch_6e
    nop

    :goto_6f
    sget-object v1, Le/d/b/b/d/a;->c:Le/d/b/b/d/a$b;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->c:Le/d/b/b/e/k/e;

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->f:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/CastPlayback216;->message(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    check-cast v1, Le/d/b/b/d/a$b$a;

    invoke-virtual {v1, v4, v5, v0}, Le/d/b/b/d/a$b$a;->a(Le/d/b/b/e/k/e;Ljava/lang/String;Ljava/lang/String;)Le/d/b/b/e/k/g;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastDiagnostics;->sent(Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    const-string v4, "com.sauzask.nicoid.hls"

    const-string v5, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v1, v0, v4, v5}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "intentselect"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->H:I

    const-string v2, "playlistposition"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    invoke-static {v1, v3, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->k:Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u518d\u751f\u4e2d"

    invoke-virtual {p0, v1, v3, v2, v0}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    if-eqz v0, :cond_c9

    invoke-interface {v0}, Le/e/a/l3/a;->l()V

    :cond_c9
    const-string v0, "chormecast : \u518d\u751f\u6e96\u5099\u5b8c\u4e86"

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->L:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 12

    const-string v0, "posi"

    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    invoke-static {p2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->o:Landroid/content/SharedPreferences;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->s:Z

    sget-boolean p3, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    if-eqz p3, :cond_26

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v1, p3, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p3, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    :cond_26
    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->d:Lcom/google/android/gms/cast/CastDevice;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p3, :cond_185

    const-string p3, "url"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_208

    const-string v4, "type"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_45

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    const-string p3, "type\u306a\u3057"

    .line 1
    invoke-static {p3, p2, p1}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return v1

    .line 2
    :cond_45
    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v7, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5f

    sget-object v5, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->t:Ljava/lang/String;

    if-eq v5, v7, :cond_ff

    :cond_5f
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v7, 0x7

    if-eq v5, v7, :cond_ff

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v7, 0x8

    if-ne v5, v7, :cond_70

    goto/16 :goto_ff

    :cond_70
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a()V

    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->t:Ljava/lang/String;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->t:Ljava/lang/String;

    if-nez p3, :cond_80

    const-string p3, "sm9"

    goto :goto_88

    :cond_80
    const-string v0, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v5, "$1$2"

    invoke-virtual {p3, v0, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    :goto_88
    iput-object p3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->t:Ljava/lang/String;

    const-string p3, "title"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->k:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz v0, :cond_a8

    const-string v0, "isContinuousPlay"

    invoke-virtual {p1, v0, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_a8

    invoke-static {}, Le/e/a/v0;->c()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->F:Ljava/util/ArrayList;

    :cond_a8
    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->F:Ljava/util/ArrayList;

    if-eqz v0, :cond_b7

    const-string p2, "playlistposition"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    sput p1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->H:I

    sput-boolean v2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->G:Z

    goto :goto_b9

    :cond_b7
    sput-boolean p2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->G:Z

    :goto_b9
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const/4 p2, -0x1

    :try_start_bf
    invoke-virtual {p1, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->k:Ljava/lang/String;

    invoke-virtual {p1, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "videoid"

    sget-object p3, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "isPlaylistMode"

    sget-boolean p3, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->G:Z

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_d5
    .catch Ljava/lang/Exception; {:try_start_bf .. :try_end_d5} :catch_d6

    goto :goto_d7

    :catch_d6
    nop

    :goto_d7
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Le/d/b/b/d/a;->c:Le/d/b/b/d/a$b;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->c:Le/d/b/b/e/k/e;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->f:Ljava/lang/String;

    check-cast p2, Le/d/b/b/d/a$b$a;

    invoke-virtual {p2, p3, v0, p1}, Le/d/b/b/d/a$b$a;->a(Le/d/b/b/e/k/e;Ljava/lang/String;Ljava/lang/String;)Le/d/b/b/e/k/g;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->k:Ljava/lang/String;

    const-string p2, "\u518d\u751f\u6e96\u5099\u4e2d"

    .line 3
    invoke-virtual {p0, p1, p2, p1, v3}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 4
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->t:Ljava/lang/String;

    sput-object p1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->n:Le/e/a/o2;

    if-eqz p1, :cond_fa

    invoke-virtual {p1}, Le/e/a/o2;->b()V

    iput-object v3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->n:Le/e/a/o2;

    :cond_fa
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->b()V

    goto/16 :goto_208

    :cond_ff
    :goto_ff
    new-instance p3, Lorg/json/JSONObject;

    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-wide v5, 0x3fa1eb851eb851ecL    # 0.035

    packed-switch v3, :pswitch_data_20a

    goto/16 :goto_208

    :pswitch_112
    iget-wide p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D

    sub-double/2addr p1, v5

    iput-wide p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D

    iget-wide p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D

    const-wide/16 v2, 0x0

    cmpg-double p3, p1, v2

    if-gez p3, :cond_121

    iput-wide v2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D

    :cond_121
    :try_start_121
    sget-object p1, Le/d/b/b/d/a;->c:Le/d/b/b/d/a$b;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->c:Le/d/b/b/e/k/e;

    iget-wide v2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D
    :try_end_127
    .catch Ljava/lang/Exception; {:try_start_121 .. :try_end_127} :catch_146

    check-cast p1, Le/d/b/b/d/a$b$a;

    :goto_129
    :try_start_129
    invoke-virtual {p1, p2, v2, v3}, Le/d/b/b/d/a$b$a;->a(Le/d/b/b/e/k/e;D)V
    :try_end_12c
    .catch Ljava/lang/Exception; {:try_start_129 .. :try_end_12c} :catch_146

    goto/16 :goto_208

    :pswitch_12e
    iget-wide p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D

    add-double/2addr p1, v5

    iput-wide p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D

    iget-wide p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double p3, p1, v2

    if-lez p3, :cond_13d

    iput-wide v2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D

    :cond_13d
    :try_start_13d
    sget-object p1, Le/d/b/b/d/a;->c:Le/d/b/b/d/a$b;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->c:Le/d/b/b/e/k/e;

    iget-wide v2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->g:D
    :try_end_143
    .catch Ljava/lang/Exception; {:try_start_13d .. :try_end_143} :catch_146

    check-cast p1, Le/d/b/b/d/a$b$a;

    goto :goto_129

    :catch_146
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_208

    :pswitch_14c
    invoke-static {p2}, Le/e/a/v0;->a(Z)Z

    invoke-virtual {p0, p2}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a(Z)Z

    goto/16 :goto_208

    :pswitch_154
    invoke-static {v2}, Le/e/a/v0;->a(Z)Z

    invoke-virtual {p0, v2}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a(Z)Z

    goto/16 :goto_208

    :pswitch_15c
    const/4 p1, 0x4

    :try_start_15d
    invoke-virtual {p3, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_174

    :pswitch_161
    const/4 v2, 0x3

    invoke-virtual {p3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {p3, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_174

    :pswitch_16d
    invoke-virtual {p3, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_174

    :pswitch_171
    invoke-virtual {p3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_174
    .catch Ljava/lang/Exception; {:try_start_15d .. :try_end_174} :catch_174

    :catch_174
    :goto_174
    sget-object p1, Le/d/b/b/d/a;->c:Le/d/b/b/d/a$b;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->c:Le/d/b/b/e/k/e;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->f:Ljava/lang/String;

    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    check-cast p1, Le/d/b/b/d/a$b$a;

    invoke-virtual {p1, p2, v0, p3}, Le/d/b/b/d/a$b$a;->a(Le/d/b/b/e/k/e;Ljava/lang/String;Ljava/lang/String;)Le/d/b/b/e/k/g;

    goto/16 :goto_208

    :cond_185
    const-string p2, "castdevice"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p3

    if-nez p3, :cond_191

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return v1

    :cond_191
    const-string p3, "castdevicename"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->l:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/cast/CastDevice;->b(Landroid/os/Bundle;)Lcom/google/android/gms/cast/CastDevice;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->d:Lcom/google/android/gms/cast/CastDevice;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->d:Lcom/google/android/gms/cast/CastDevice;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->A:Le/d/b/b/d/a$d;

    .line 5
    new-instance p3, Le/d/b/b/d/a$c$a;

    invoke-direct {p3, p1, p2}, Le/d/b/b/d/a$c$a;-><init>(Lcom/google/android/gms/cast/CastDevice;Le/d/b/b/d/a$d;)V

    .line 6
    iget p1, p3, Le/d/b/b/d/a$c$a;->c:I

    or-int/2addr p1, v2

    iput p1, p3, Le/d/b/b/d/a$c$a;->c:I

    .line 7
    new-instance p1, Le/d/b/b/e/k/e$a;

    invoke-virtual {p0}, Landroid/app/Service;->getBaseContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Le/d/b/b/e/k/e$a;-><init>(Landroid/content/Context;)V

    sget-object p2, Le/d/b/b/d/a;->b:Le/d/b/b/e/k/a;

    .line 8
    new-instance v0, Le/d/b/b/d/a$c;

    invoke-direct {v0, p3, v3}, Le/d/b/b/d/a$c;-><init>(Le/d/b/b/d/a$c$a;Le/d/b/b/d/c0;)V

    const-string p3, "Api must not be null"

    .line 9
    invoke-static {p2, p3}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "Null options are not permitted for this Api"

    invoke-static {v0, p3}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p3, p1, Le/d/b/b/e/k/e$a;->j:Ljava/util/Map;

    invoke-interface {p3, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    iget-object p2, p2, Le/d/b/b/e/k/a;->a:Le/d/b/b/e/k/a$a;

    .line 11
    invoke-virtual {p2}, Le/d/b/b/e/k/a$e;->a()Ljava/util/List;

    move-result-object p2

    iget-object p3, p1, Le/d/b/b/e/k/e$a;->c:Ljava/util/Set;

    invoke-interface {p3, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object p3, p1, Le/d/b/b/e/k/e$a;->b:Ljava/util/Set;

    invoke-interface {p3, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 12
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->B:Le/d/b/b/e/k/e$b;

    const-string p3, "Listener must not be null"

    .line 13
    invoke-static {p2, p3}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Le/d/b/b/e/k/e$a;->o:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->C:Le/d/b/b/e/k/e$c;

    .line 15
    invoke-static {p2, p3}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p3, p1, Le/d/b/b/e/k/e$a;->p:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    invoke-virtual {p1}, Le/d/b/b/e/k/e$a;->a()Le/d/b/b/e/k/e;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->c:Le/d/b/b/e/k/e;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->c:Le/d/b/b/e/k/e;

    invoke-virtual {p1}, Le/d/b/b/e/k/e;->a()V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->l:Ljava/lang/String;

    const-string p2, "\u63a5\u7d9a\u4e2d"

    .line 17
    invoke-virtual {p0, p1, p2, v3, v3}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    :cond_208
    :goto_208
    return v1

    nop

    :pswitch_data_20a
    .packed-switch 0x1
        :pswitch_171
        :pswitch_16d
        :pswitch_161
        :pswitch_15c
        :pswitch_154
        :pswitch_14c
        :pswitch_12e
        :pswitch_112
    .end packed-switch
.end method

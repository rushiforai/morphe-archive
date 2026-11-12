.class public final Lqu8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk7j;
.implements Lq8j;


# instance fields
.field public final synthetic a:B

.field public final b:Lisd;

.field public c:Z

.field public final synthetic d:Lt7j;


# direct methods
.method public constructor <init>(Lore;Lisd;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lqu8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqu8;->d:Lt7j;

    iput-object p2, p0, Lqu8;->b:Lisd;

    iget-object p1, p1, Lore;->j:Lc15;

    invoke-virtual {p1, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method

.method public constructor <init>(Lru8;Lisd;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lqu8;->a:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqu8;->d:Lt7j;

    .line 17
    iput-object p2, p0, Lqu8;->b:Lisd;

    .line 18
    iget-object p1, p1, Lru8;->l:Lstm;

    invoke-virtual {p1, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-byte v0, p0, Lqu8;->a:B

    iget-object p0, p0, Lqu8;->d:Lt7j;

    packed-switch v0, :pswitch_data_5a

    check-cast p0, Lore;

    invoke-virtual {p0}, Lt7j;->c()V

    return-void

    :pswitch_d
    check-cast p0, Lru8;

    iget-object v0, p0, Lru8;->j:Lta7;

    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "duration_threshold"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "percent_threshold"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "enable_local_push"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "enable_native_push"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "enable_video_theater"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, v0, Lta7;->e:Ljava/lang/Object;

    check-cast v0, Ls6h;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lux8;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2}, Lux8;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    iget-object v2, v0, Ls6h;->a:Ljava/lang/Object;

    check-cast v2, Li32;

    new-instance v3, Lcn7;

    const/16 v4, 0x15

    invoke-direct {v3, v0, v1, v4}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lldk;->f(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lt7j;->c()V

    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final b()V
    .registers 2

    iget-byte v0, p0, Lqu8;->a:B

    packed-switch v0, :pswitch_data_e

    const/4 v0, 0x1

    iput-boolean v0, p0, Lqu8;->c:Z

    return-void

    :pswitch_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lqu8;->c:Z

    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lqu8;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_78

    check-cast p1, Lz05;

    iget-boolean v0, p0, Lqu8;->c:Z

    if-nez v0, :cond_1f

    if-eqz p1, :cond_14

    new-instance v1, Lnre;

    invoke-direct {v1, p1}, Lnre;-><init>(Lz05;)V

    :cond_14
    iget-object p0, p0, Lqu8;->b:Lisd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v1, :cond_1c

    const/4 v2, 0x0

    :cond_1c
    invoke-virtual {p0, v1, v2}, Lisd;->E(Ljava/lang/Object;Z)V

    :cond_1f
    return-void

    :pswitch_20
    check-cast p1, Lqtm;

    iget-object v0, p0, Lqu8;->d:Lt7j;

    check-cast v0, Lru8;

    if-nez p1, :cond_2c

    invoke-virtual {p0, v1}, Lqu8;->d(Lpu8;)V

    goto :goto_77

    :cond_2c
    iput-object p1, v0, Lru8;->m:Lqtm;

    iget-boolean p1, v0, Lru8;->n:Z

    if-nez p1, :cond_3e

    iget-object p1, v0, Lru8;->j:Lta7;

    invoke-virtual {p1}, Lta7;->p()Lpu8;

    move-result-object p1

    if-eqz p1, :cond_3e

    invoke-virtual {p0, p1}, Lqu8;->d(Lpu8;)V

    goto :goto_77

    :cond_3e
    iget-object p1, v0, Lru8;->m:Lqtm;

    if-eqz p1, :cond_74

    iget-object v0, v0, Lru8;->k:Ls9i;

    new-instance v1, Lmp4;

    iget-object v3, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    iget-object v0, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lga6;

    invoke-direct {v1, v3, v0, p1}, Lmp4;-><init>(Landroid/content/Context;Lywh;Lqtm;)V

    invoke-virtual {v1}, Lr22;->c()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "v1/config/feed"

    invoke-virtual {p1, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lz7;

    invoke-direct {v0, p1}, Lz7;-><init>(Ljava/lang/String;)V

    iput-boolean v2, v0, Lz7;->f:Z

    new-instance p1, Lkp4;

    invoke-direct {p1, v1, p0, v2}, Lkp4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v1, Lmp4;->e:Lywh;

    invoke-interface {p0, v0, p1}, Lywh;->a(Lz7;Lz4o;)V

    goto :goto_77

    :cond_74
    invoke-virtual {p0, v1}, Lqu8;->d(Lpu8;)V

    :goto_77
    return-void

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method

.method public final d(Lpu8;)V
    .registers 4

    iget-boolean v0, p0, Lqu8;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lqu8;->d:Lt7j;

    check-cast v0, Lru8;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lru8;->n:Z

    iget-object p0, p0, Lqu8;->b:Lisd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_14

    const/4 v1, 0x1

    :cond_14
    invoke-virtual {p0, p1, v1}, Lisd;->E(Ljava/lang/Object;Z)V

    return-void
.end method

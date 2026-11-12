.class public final Lb59;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lc59;Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lb59;->e:B

    .line 23
    iput-object p2, p0, Lb59;->f:Ljava/lang/Object;

    iput-object p1, p0, Lb59;->g:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method

.method public constructor <init>(Ld7l;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lb59;->e:B

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lb59;->f:Ljava/lang/Object;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->t()Lesk;

    move-result-object p1

    iput-object p1, p0, Lb59;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 24
    iput-byte p3, p0, Lb59;->e:B

    iput-object p1, p0, Lb59;->f:Ljava/lang/Object;

    iput-object p2, p0, Lb59;->g:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lb59;->e:B

    packed-switch v0, :pswitch_data_b2

    iget-object v0, p0, Lb59;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-static {v0}, Lz5i;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_28

    :cond_15
    const-string v1, "title"

    invoke-static {v0, v1}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_28

    iget-object p0, p0, Lb59;->g:Ljava/lang/Object;

    check-cast p0, Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    :cond_28
    return-object v1

    :pswitch_29
    iget-object v0, p0, Lb59;->f:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object p0, p0, Lb59;->g:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0

    :pswitch_37
    new-instance v0, Lit1;

    iget-object v1, p0, Lb59;->f:Ljava/lang/Object;

    check-cast v1, Lx7j;

    iget-object v1, v1, Lx7j;->b:Ljava/lang/Object;

    check-cast v1, Landroid/app/Activity;

    iget-object p0, p0, Lb59;->g:Ljava/lang/Object;

    check-cast p0, Lumi;

    invoke-direct {v0, v1, p0}, Lit1;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_49
    iget-object v0, p0, Lb59;->f:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    sget-object v1, Lr49;->j:Ljava/lang/Object;

    monitor-enter v1

    :try_start_50
    sget-object v2, Lr49;->k:Landroidx/collection/ArrayMap;

    const-string v3, "[DEFAULT]"

    invoke-virtual {v2, v3}, Lhkj;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_60

    invoke-static {}, Lr49;->e()Lr49;

    move-result-object v0

    monitor-exit v1

    goto :goto_70

    :cond_60
    invoke-static {v0}, Lj59;->a(Landroid/content/Context;)Lj59;

    move-result-object v2

    if-nez v2, :cond_69

    monitor-exit v1

    const/4 v0, 0x0

    goto :goto_70

    :cond_69
    const-string v3, "[DEFAULT]"

    invoke-static {v2, v0, v3}, Lr49;->i(Lj59;Landroid/content/Context;Ljava/lang/String;)Lr49;

    move-result-object v0

    monitor-exit v1
    :try_end_70
    .catchall {:try_start_50 .. :try_end_70} :catchall_af

    :goto_70
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lr49;->a()V

    iget-object v1, v0, Lr49;->c:Lj59;

    iget-object v2, p0, Lb59;->g:Ljava/lang/Object;

    check-cast v2, Lc59;

    iget-object v2, v2, Lc59;->c:Lj59;

    invoke-virtual {v1, v2}, Lj59;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8a

    invoke-virtual {v0}, Lr49;->a()V

    iget-object p0, v0, Lr49;->b:Ljava/lang/String;

    goto :goto_ac

    :cond_8a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ofa-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lb59;->g:Ljava/lang/Object;

    check-cast v1, Lc59;

    iget-object v1, v1, Lc59;->c:Lj59;

    iget-object v1, v1, Lj59;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lb59;->g:Ljava/lang/Object;

    check-cast p0, Lc59;

    iget-object v1, p0, Lc59;->a:Landroid/content/Context;

    iget-object p0, p0, Lc59;->c:Lj59;

    invoke-static {p0, v1, v0}, Lr49;->i(Lj59;Landroid/content/Context;Ljava/lang/String;)Lr49;

    move-object p0, v0

    :goto_ac
    return-object p0

    :goto_ad
    :try_start_ad
    monitor-exit v1
    :try_end_ae
    .catchall {:try_start_ad .. :try_end_ae} :catchall_af

    throw p0

    :catchall_af
    move-exception p0

    goto :goto_ad

    nop

    :pswitch_data_b2
    .packed-switch 0x0
        :pswitch_49
        :pswitch_37
        :pswitch_29
    .end packed-switch
.end method

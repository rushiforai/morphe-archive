.class public final Ldfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# static fields
.field public static final g:Ljava/util/List;


# instance fields
.field public final a:Lru9;

.field public final b:Lz77;

.field public final c:Lx5f;

.field public final d:Lkze;

.field public final e:Lqt3;

.field public final f:Lx53;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x18

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    new-instance v2, Lpn7;

    invoke-direct {v2, v0, v1}, Lpn7;-><init>(J)V

    sget-object v0, Lun7;->h:Lun7;

    const/4 v1, 0x3

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    new-instance v1, Lpn7;

    invoke-direct {v1, v3, v4}, Lpn7;-><init>(J)V

    const/4 v3, 0x7

    invoke-static {v3, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    new-instance v0, Lpn7;

    invoke-direct {v0, v3, v4}, Lpn7;-><init>(J)V

    filled-new-array {v2, v1, v0}, [Lpn7;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Ldfn;->g:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lndc;Lru9;Lz77;Lx5f;Lkze;Lqt3;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ldfn;->a:Lru9;

    iput-object p3, p0, Ldfn;->b:Lz77;

    iput-object p4, p0, Ldfn;->c:Lx5f;

    iput-object p5, p0, Ldfn;->d:Lkze;

    iput-object p6, p0, Ldfn;->e:Lqt3;

    new-instance p3, Lx53;

    invoke-direct {p3, p0}, Lx53;-><init>(Ldfn;)V

    iput-object p3, p0, Ldfn;->f:Lx53;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p2, p3}, Lru9;->a(Ln1;)V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 4

    iget-object v0, p0, Ldfn;->a:Lru9;

    iget-object v1, p0, Ldfn;->f:Lx53;

    invoke-virtual {v0, v1}, Lru9;->d(Ln1;)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method

.method public final onStart(Lndc;)V
    .registers 13

    iget-object v0, p0, Ldfn;->d:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwvg;

    iget v0, v0, Lwvg;->e:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_9b

    const/4 v1, 0x5

    if-eq v0, v1, :cond_9b

    const/4 v1, 0x6

    if-eq v0, v1, :cond_9b

    iget-object v0, p0, Ldfn;->a:Lru9;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn_pro.kill_switch.on"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_9b

    const-string v1, "vpn_pro.kill_switch.activated_timestamp"

    const-wide/16 v4, -0x1

    invoke-interface {v0, v1, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    cmp-long v1, v6, v4

    if-eqz v1, :cond_9b

    const-string v1, "vpn_pro.reminder.show_count"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    sget-object v1, Ldfn;->g:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_9b

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v6

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpn7;

    iget-wide v0, v0, Lpn7;->a:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    cmp-long v0, v3, v0

    if-ltz v0, :cond_9b

    new-instance v0, Lcfn;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v1, 0x0

    const-class v3, Ldfn;

    const-string v4, "onClosed"

    const-string v5, "onClosed()V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v8, v0

    new-instance v0, Lcfn;

    const/4 v7, 0x1

    const-string v4, "onDismissed"

    const-string v5, "onDismissed()V"

    invoke-direct/range {v0 .. v7}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v9, v0

    new-instance v0, Lcfn;

    const/4 v7, 0x2

    const-string v4, "onConfirm"

    const-string v5, "onConfirm()V"

    invoke-direct/range {v0 .. v7}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v10, v0

    new-instance v0, Lcfn;

    const/4 v7, 0x3

    const-string v4, "onShown"

    const-string v5, "onShown()V"

    invoke-direct/range {v0 .. v7}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v3, v8

    move-object v8, v0

    new-instance v1, Lpf5;

    const v6, 0x7f1411d9

    const v7, 0x7f140b4b

    const v5, 0x7f1411da

    move-object v4, v9

    move-object v2, v10

    invoke-direct/range {v1 .. v8}, Lpf5;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;IIILkotlin/jvm/functions/Function0;)V

    iget-object v0, p0, Ldfn;->b:Lz77;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_9b
    return-void
.end method

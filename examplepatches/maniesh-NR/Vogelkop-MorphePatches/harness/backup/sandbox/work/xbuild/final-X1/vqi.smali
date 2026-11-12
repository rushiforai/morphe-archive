.class public final Lvqi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:J

.field public static final synthetic h:I


# instance fields
.field public final a:Lshf;

.field public final b:Lsqi;

.field public final c:Lpqi;

.field public final d:Lghf;

.field public final e:Luqi;

.field public final f:Lode;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x18

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lvqi;->g:J

    return-void
.end method

.method public constructor <init>(Lshf;Lsqi;Lpqi;Lghf;Luqi;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvqi;->a:Lshf;

    iput-object p2, p0, Lvqi;->b:Lsqi;

    iput-object p3, p0, Lvqi;->c:Lpqi;

    iput-object p4, p0, Lvqi;->d:Lghf;

    iput-object p5, p0, Lvqi;->e:Luqi;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lvqi;->f:Lode;

    new-instance p1, Ltu;

    const/16 p2, 0x8

    invoke-direct {p1, p0, p2}, Ltu;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lrii;

    invoke-direct {p2, p1, p0}, Lrii;-><init>(Ltu;Lvqi;)V

    iget-object p0, p4, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance p1, Lhqi;

    const/4 p3, 0x0

    invoke-direct {p1, p4, p3}, Lhqi;-><init>(Lghf;B)V

    invoke-virtual {p0, p1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p1, Lr9g;

    const/16 p3, 0x1c

    invoke-direct {p1, p2, p3}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    iget-object p1, p4, Lghf;->d:Ljava/lang/Object;

    check-cast p1, Lqie;

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method


# virtual methods
.method public final a(Ljqi;Liqi;Ljava/lang/String;Leof;Lmni;Lq2g;)V
    .registers 15

    new-instance v0, Lxbf;

    const/16 v7, 0xa

    move-object v2, p0

    move-object v3, p1

    move-object v5, p3

    move-object v1, p4

    move-object v4, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lxbf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v4, v5

    iget-object v1, v2, Lvqi;->a:Lshf;

    iget-object p0, v1, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lnx5;

    move-object v5, v0

    new-instance v0, Lr71;

    const/4 v6, 0x0

    move-object v2, v3

    move-object v3, p2

    invoke-direct/range {v0 .. v7}, Lr71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p1, 0x3

    const/4 p2, 0x0

    invoke-static {p0, p2, p2, v0, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final b(Ljqi;Le74;Ljava/lang/String;)V
    .registers 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1}, Ljqi;->a()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lvqi;->e:Luqi;

    iget-object v2, p0, Luqi;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "cashed_request_hash"

    invoke-static {v2, v3, p1}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Luqi;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v2, "etag"

    invoke-static {p1, v2, p3}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean p1, p2, Le74;->b:Z

    const-string p3, "cache_control_time"

    const-string v2, "cache_control"

    if-eqz p1, :cond_43

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :cond_43
    invoke-static {p2}, Lokhttp3/internal/_CacheControlCommonKt;->commonToString(Le74;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.class public final Loqi;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final j:Lb59;

.field public k:Z

.field public l:Z

.field public final synthetic m:Lpqi;


# direct methods
.method public constructor <init>(Lpqi;Landroid/content/Context;Lumi;)V
    .registers 5

    iput-object p1, p0, Loqi;->m:Lpqi;

    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    const/4 p1, 0x0

    new-array p1, p1, [Lbg1;

    const-string v0, "sdx_override"

    invoke-static {p2, p3, v0, p1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Loqi;->j:Lb59;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 5

    iget-object p0, p0, Loqi;->j:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    new-instance v1, Lnqi;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lnqi;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lby1;

    const/4 v3, 0x3

    invoke-direct {v2, v1, v3}, Lby1;-><init>(Lkotlin/jvm/functions/Function2;B)V

    invoke-interface {p0, v2}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    return-object v0
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ljava/util/Map;

    iget-object p0, p0, Loqi;->j:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    if-eqz p1, :cond_22

    new-instance v0, Lnqi;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lnqi;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lby1;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lby1;-><init>(Lkotlin/jvm/functions/Function2;B)V

    invoke-interface {p1, v1}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    :cond_22
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public final c()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Ljava/util/Map;

    const/4 v0, 0x1

    iput-boolean v0, p0, Loqi;->k:Z

    if-eqz p1, :cond_f

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_f

    const/4 v1, 0x0

    goto :goto_10

    :cond_f
    move v1, v0

    :goto_10
    xor-int/2addr v1, v0

    iput-boolean v1, p0, Loqi;->l:Z

    iget-object p0, p0, Loqi;->m:Lpqi;

    iget-object v0, p0, Lpqi;->b:Ljava/util/Map;

    if-nez v0, :cond_1f

    if-nez p1, :cond_1d

    sget-object p1, Ln08;->a:Ln08;

    :cond_1d
    iput-object p1, p0, Lpqi;->b:Ljava/util/Map;

    :cond_1f
    return-void
.end method

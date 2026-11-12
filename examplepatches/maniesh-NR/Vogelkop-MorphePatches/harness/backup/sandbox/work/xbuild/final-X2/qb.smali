.class public final Lqb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lji;

.field public final b:Lyv3;

.field public final c:Lob;

.field public final d:Lkze;

.field public e:Lipf;

.field public f:Ls62;

.field public g:Lesk;

.field public h:Lrn9;


# direct methods
.method public constructor <init>(Lji;Lxb;Lndc;Lyv3;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqb;->a:Lji;

    iput-object p4, p0, Lqb;->b:Lyv3;

    new-instance p1, Lob;

    const/4 p4, 0x0

    invoke-direct {p1, p0, p4}, Lob;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lqb;->c:Lob;

    iget-object p1, p2, Lxb;->d:Lkze;

    iput-object p1, p0, Lqb;->d:Lkze;

    sget-object p2, Lepf;->a:Lepf;

    iput-object p2, p0, Lqb;->e:Lipf;

    new-instance p2, Lz3;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lz3;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lpb;

    invoke-direct {p0, p2, p4}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p3, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object p0, p0, Lqb;->a:Lji;

    iget-object p0, p0, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "aria.sandbox.merge"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 6

    iget-object v0, p0, Lqb;->b:Lyv3;

    invoke-virtual {v0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lehf;

    if-eqz v0, :cond_62

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "userId"

    :try_start_11
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_18} :catch_5e

    iget-object p1, p0, Lqb;->a:Lji;

    iget-object p1, p1, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v3, "aria.sandbox.merge"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    iget-object p1, p0, Lqb;->h:Lrn9;

    if-nez p1, :cond_62

    iget-object p1, p0, Lqb;->f:Ls62;

    if-eqz p1, :cond_62

    iget-object p1, p1, Ls62;->t:Lkze;

    if-eqz p1, :cond_62

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_62

    new-instance p1, Lrn9;

    new-instance v1, Llb;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Llb;-><init>(B)V

    invoke-direct {p1, p0, v1}, Lrn9;-><init>(Lqb;Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lqb;->h:Lrn9;

    invoke-virtual {p1, v0}, Lrn9;->O(Lehf;)V

    return-void

    :catch_5e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    :cond_62
    return-void
.end method

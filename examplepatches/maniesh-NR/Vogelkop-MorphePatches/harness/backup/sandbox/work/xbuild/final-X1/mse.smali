.class public Lmse;
.super Lnse;
.source "SourceFile"


# instance fields
.field public final d:Landroid/content/SharedPreferences;

.field public e:J

.field public f:J

.field public final g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;ILlse;)V
    .registers 5

    invoke-direct {p0, p3, p4}, Lnse;-><init>(ILlse;)V

    iput-object p1, p0, Lmse;->d:Landroid/content/SharedPreferences;

    iput-object p2, p0, Lmse;->g:Ljava/lang/String;

    const/4 p3, 0x0

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_28

    :try_start_12
    invoke-virtual {p0, p1}, Lnse;->b(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object p2, p0, Lnse;->b:Ljava/io/Serializable;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lnse;->a()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Lmse;->e:J

    iput-wide p1, p0, Lmse;->f:J
    :try_end_28
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_28} :catch_28

    :catch_28
    :cond_28
    return-void
.end method


# virtual methods
.method public final e(Ljava/lang/Object;)V
    .registers 4

    iget-object v0, p0, Lnse;->b:Ljava/io/Serializable;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lnse;->a()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lmse;->e:J

    return-void
.end method

.method public final f(JLjava/lang/String;)V
    .registers 9

    iget-object v0, p0, Lnse;->b:Ljava/io/Serializable;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_28

    iget-wide v1, p0, Lmse;->e:J

    cmp-long v3, p1, v1

    if-lez v3, :cond_1f

    iget-wide v3, p0, Lmse;->f:J

    cmp-long p1, p1, v3

    if-lez p1, :cond_1f

    cmp-long p1, v3, v1

    if-ltz p1, :cond_1f

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 p1, 0x1

    goto :goto_29

    :cond_1f
    :try_start_1f
    invoke-virtual {p0, p3}, Lnse;->b(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnse;->c(Ljava/util/List;)Z

    move-result p1
    :try_end_27
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_27} :catch_28

    goto :goto_29

    :catch_28
    :cond_28
    const/4 p1, 0x0

    :goto_29
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_33

    const-wide/16 p2, 0x0

    iput-wide p2, p0, Lmse;->e:J

    :cond_33
    if-eqz p1, :cond_38

    invoke-virtual {p0}, Lmse;->g()V

    :cond_38
    return-void
.end method

.method public final g()V
    .registers 4

    iget-object v0, p0, Lnse;->b:Ljava/io/Serializable;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_13

    :try_start_a
    invoke-virtual {p0}, Lnse;->d()Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_12
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_12} :catch_13

    goto :goto_14

    :catch_13
    :cond_13
    const/4 v0, 0x0

    :goto_14
    iget-object v1, p0, Lmse;->d:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget-object v2, p0, Lmse;->g:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lmse;->f:J

    return-void
.end method

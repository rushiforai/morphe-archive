.class public final Lb1a;
.super Ly08;
.source "SourceFile"

# interfaces
.implements Lwim;
.implements Liq9;


# instance fields
.field public final a:Lks3;

.field public final b:Lea6;

.field public final c:Lx5f;

.field public final d:Lz0a;

.field public final e:Landroid/util/SparseBooleanArray;

.field public final f:Lv1a;

.field public g:Z

.field public final h:Lii;

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Ltcc;Lks3;Lea6;Lx5f;Lz0a;Lii;Lv1a;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lb1a;->e:Landroid/util/SparseBooleanArray;

    iput-object p2, p0, Lb1a;->a:Lks3;

    iput-object p3, p0, Lb1a;->b:Lea6;

    iput-object p4, p0, Lb1a;->c:Lx5f;

    iput-object p5, p0, Lb1a;->d:Lz0a;

    iput-object p7, p0, Lb1a;->f:Lv1a;

    iput-object p6, p0, Lb1a;->h:Lii;

    new-instance p2, La1a;

    invoke-direct {p2, p0}, La1a;-><init>(Lb1a;)V

    new-instance p0, Lfza;

    const/16 p3, 0xf

    invoke-direct {p0, p3}, Lfza;-><init>(B)V

    invoke-static {p6, p1, p2, p0}, Lz5i;->e0(Lcom/opera/android/Lazy;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 8

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz v0, :cond_67

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v0, :cond_67

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    if-nez v0, :cond_67

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-nez v0, :cond_67

    iget p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {p2}, Lcom/opera/android/browser/BrowserUtils;->d(I)Z

    move-result v0

    if-eqz v0, :cond_67

    and-int/lit16 v0, p2, 0xff

    const/16 v1, 0x8

    if-eq v0, v1, :cond_67

    const/high16 v0, 0x1000000

    and-int/2addr p2, v0

    if-nez p2, :cond_67

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object p2, Laik;->a:[Ljava/lang/String;

    invoke-static {p1, p2}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ldti;->a(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_67

    iget-object p1, p0, Lb1a;->b:Lea6;

    iget-object p2, p1, Lea6;->c:Ljava/lang/Object;

    check-cast p2, Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    iget-object p1, p1, Lea6;->c:Ljava/lang/Object;

    check-cast p1, Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-wide/16 v0, 0x0

    const-string v2, "visits"

    invoke-interface {p1, v2, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    const-wide/16 v3, 0x1

    add-long/2addr v0, v3

    invoke-interface {p2, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_67
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lb1a;->X(Z)V

    return-void
.end method

.method public final F(ZZ)V
    .registers 3

    iput-boolean p1, p0, Lb1a;->j:Z

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lb1a;->X(Z)V

    return-void
.end method

.method public final G(Lb2l;)V
    .registers 3

    iget-object p1, p0, Lb1a;->a:Lks3;

    iget-object p1, p1, Lks3;->f:Ljava/lang/Object;

    check-cast p1, Lx0a;

    if-eqz p1, :cond_f

    sget v0, Lhi7;->u:I

    sget-object v0, Lei7;->a:Lei7;

    invoke-virtual {p1, v0}, Lhi7;->a(Lei7;)V

    :cond_f
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lb1a;->X(Z)V

    return-void
.end method

.method public final P(Z)V
    .registers 2

    iput-boolean p1, p0, Lb1a;->i:Z

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lb1a;->X(Z)V

    return-void
.end method

.method public final W()Lci0;
    .registers 2

    iget-object p0, p0, Lb1a;->b:Lea6;

    iget-object v0, p0, Lea6;->d:Ljava/lang/Object;

    check-cast v0, Ll1a;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk1a;

    iget v0, v0, Lk1a;->a:I

    if-nez v0, :cond_12

    iget-byte v0, p0, Lea6;->b:B

    :cond_12
    const/4 p0, 0x1

    if-eq v0, p0, :cond_21

    const/4 p0, 0x2

    if-eq v0, p0, :cond_1e

    const/4 p0, 0x4

    if-ne v0, p0, :cond_21

    sget-object p0, Lci0;->d:Lci0;

    return-object p0

    :cond_1e
    sget-object p0, Lci0;->c:Lci0;

    return-object p0

    :cond_21
    sget-object p0, Lci0;->b:Lci0;

    return-object p0
.end method

.method public final X(Z)V
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Lb1a;->d:Lz0a;

    iget-object v1, v1, Lz0a;->b:Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    if-eqz v1, :cond_104

    check-cast v1, Ld7l;

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getId()I

    move-result v2

    iget-object v3, v1, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Laik;->a:[Ljava/lang/String;

    invoke-static {v3, v4}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ldti;->a(Ljava/lang/String;)Z

    move-result v3

    iget-boolean v4, v0, Lb1a;->g:Z

    if-nez v4, :cond_5f

    iget-boolean v4, v0, Lb1a;->j:Z

    if-nez v4, :cond_5f

    iget-boolean v4, v0, Lb1a;->i:Z

    if-nez v4, :cond_5f

    if-eqz v3, :cond_5f

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    move-result v1

    if-nez v1, :cond_5f

    iget-object v1, v0, Lb1a;->h:Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzh7;

    if-eqz v1, :cond_5d

    iget-object v1, v1, Lzh7;->a:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lyh7;

    sget-object v7, Lyh7;->b:Lyh7;

    if-eq v4, v7, :cond_4c

    goto :goto_5f

    :cond_5d
    const/4 v1, 0x0

    goto :goto_60

    :cond_5f
    :goto_5f
    const/4 v1, 0x1

    :goto_60
    iget-object v4, v0, Lb1a;->e:Landroid/util/SparseBooleanArray;

    if-nez v3, :cond_67

    invoke-virtual {v4, v2}, Landroid/util/SparseBooleanArray;->delete(I)V

    :cond_67
    iget-object v3, v0, Lb1a;->a:Lks3;

    if-eqz v1, :cond_79

    iget-object v0, v3, Lks3;->f:Ljava/lang/Object;

    check-cast v0, Lx0a;

    if-eqz v0, :cond_104

    sget v1, Lhi7;->u:I

    sget-object v1, Lei7;->a:Lei7;

    invoke-virtual {v0, v1}, Lhi7;->a(Lei7;)V

    return-void

    :cond_79
    invoke-virtual {v4, v2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v1

    if-eqz v1, :cond_84

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Lks3;->L(Lpxh;)V

    return-void

    :cond_84
    iget-object v1, v0, Lb1a;->b:Lea6;

    iget-object v7, v1, Lea6;->c:Ljava/lang/Object;

    check-cast v7, Lb59;

    iget-object v8, v1, Lea6;->d:Ljava/lang/Object;

    check-cast v8, Ll1a;

    iget-object v9, v1, Lea6;->c:Ljava/lang/Object;

    check-cast v9, Lb59;

    invoke-virtual {v8}, Lno7;->i()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lk1a;

    iget-object v11, v10, Lk1a;->e:Ljava/lang/String;

    iget v12, v10, Lk1a;->d:I

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_104

    const-string v11, "show_count"

    const-wide/16 v13, 0x0

    if-lez v12, :cond_b7

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/content/SharedPreferences;

    invoke-interface {v15, v11, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v15

    int-to-long v5, v12

    cmp-long v5, v15, v5

    if-gtz v5, :cond_104

    :cond_b7
    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    const-string v6, "previous_show_time"

    invoke-interface {v5, v6, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v15

    iget v5, v10, Lk1a;->c:I

    int-to-long v13, v5

    sget-object v5, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v5, v13, v14}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    add-long/2addr v12, v15

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    cmp-long v5, v12, v14

    if-gtz v5, :cond_104

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    const-string v12, "visits"

    const-wide/16 v13, 0x0

    invoke-interface {v5, v12, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v15

    iget v5, v10, Lk1a;->b:I

    int-to-long v13, v5

    cmp-long v5, v15, v13

    if-ltz v5, :cond_104

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    const-string v7, "other_close_time"

    const-wide/16 v13, 0x0

    invoke-interface {v5, v7, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v15

    const-wide/32 v13, 0xea60

    add-long/2addr v15, v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    cmp-long v5, v15, v13

    if-lez v5, :cond_105

    :cond_104
    return-void

    :cond_105
    if-nez p1, :cond_12c

    new-instance v1, Ly0a;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Lb1a;->f:Lv1a;

    iget-object v2, v0, Lv1a;->c:Lnrl;

    iget-boolean v2, v2, Lnrl;->a:Z

    if-eqz v2, :cond_119

    invoke-virtual {v0, v1}, Lv1a;->a(Lcom/opera/api/Callback;)V

    goto :goto_12b

    :cond_119
    iget-object v0, v0, Lv1a;->a:Lru9;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "browser.google_sign_in"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_12b
    return-void

    :cond_12c
    sget-object v5, Lwe0;->b:Lwe0;

    invoke-virtual {v0}, Lb1a;->W()Lci0;

    move-result-object v7

    iget-object v0, v0, Lb1a;->c:Lx5f;

    invoke-virtual {v0, v5, v7}, Lx5f;->V(Lwe0;Lci0;)V

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v12}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    const-wide/16 v13, 0x0

    invoke-interface {v5, v11, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    const-wide/16 v12, 0x1

    add-long/2addr v9, v12

    invoke-interface {v0, v11, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-interface {v0, v6, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 v0, 0x1

    invoke-virtual {v4, v2, v0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    invoke-virtual {v8}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lk1a;

    iget v2, v2, Lk1a;->a:I

    if-nez v2, :cond_173

    iget-byte v2, v1, Lea6;->b:B

    :cond_173
    const v1, 0x7f140072

    const-string v4, "Google"

    if-eq v2, v0, :cond_1a0

    const/4 v0, 0x2

    if-eq v2, v0, :cond_197

    const/4 v0, 0x4

    if-eq v2, v0, :cond_18a

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v2, Lsxh;

    invoke-direct {v2, v1, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    goto :goto_1a9

    :cond_18a
    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v2, Lsxh;

    const v1, 0x7f140074

    invoke-direct {v2, v1, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    goto :goto_1a9

    :cond_197
    new-instance v2, Lrxh;

    const v0, 0x7f140073

    invoke-direct {v2, v0}, Lrxh;-><init>(I)V

    goto :goto_1a9

    :cond_1a0
    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v2, Lsxh;

    invoke-direct {v2, v1, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    :goto_1a9
    invoke-virtual {v3, v2}, Lks3;->L(Lpxh;)V

    return-void
.end method

.method public final c(Z)V
    .registers 2

    iput-boolean p1, p0, Lb1a;->g:Z

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lb1a;->X(Z)V

    return-void
.end method

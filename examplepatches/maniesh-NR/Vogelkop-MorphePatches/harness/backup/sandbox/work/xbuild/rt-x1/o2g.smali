.class public final Lo2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lndc;Li3j;Leq6;Lni6;Lkze;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lo2g;->a:B

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p2, p0, Lo2g;->b:Ljava/lang/Object;

    .line 20
    iput-object p3, p0, Lo2g;->c:Ljava/lang/Object;

    .line 21
    iput-object p4, p0, Lo2g;->d:Ljava/lang/Object;

    .line 22
    invoke-virtual {p5, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lndc;Lrii;Lode;)V
    .registers 5

    const/4 v0, 0x4

    iput-byte v0, p0, Lo2g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lo2g;->b:Ljava/lang/Object;

    sget-object p2, Lxbn;->d:Lxbn;

    iput-object p2, p0, Lo2g;->c:Ljava/lang/Object;

    iput-object p3, p0, Lo2g;->d:Ljava/lang/Object;

    invoke-virtual {p3, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lndc;Lumk;Lw7j;Ljtg;Lkze;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lo2g;->a:B

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p2, p0, Lo2g;->b:Ljava/lang/Object;

    .line 25
    iput-object p3, p0, Lo2g;->c:Ljava/lang/Object;

    .line 26
    iput-object p4, p0, Lo2g;->d:Ljava/lang/Object;

    .line 27
    invoke-virtual {p5, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lwnm;Lekc;Lf7f;)V
    .registers 5

    const/4 v0, 0x3

    iput-byte v0, p0, Lo2g;->a:B

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo2g;->d:Ljava/lang/Object;

    .line 29
    iput-object p2, p0, Lo2g;->b:Ljava/lang/Object;

    .line 30
    iput-object p3, p0, Lo2g;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxbf;Lwx;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lo2g;->a:B

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lo2g;->b:Ljava/lang/Object;

    iput-object p3, p0, Lo2g;->c:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lo2g;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ls75;Ljava/lang/Runnable;)V
    .registers 5

    iget-object v0, p0, Lo2g;->c:Ljava/lang/Object;

    check-cast v0, Ls75;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    iput-object p1, p0, Lo2g;->c:Ljava/lang/Object;

    iget-object v0, p0, Lo2g;->b:Ljava/lang/Object;

    check-cast v0, Lrii;

    iget-object v0, v0, Lrii;->b:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v1, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lo2g;

    if-eq p0, v1, :cond_20

    if-eqz p2, :cond_1f

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    :cond_1f
    return-void

    :cond_20
    invoke-virtual {v0, p1, p2}, Lxbf;->E(Ls75;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Lo2g;->a:B

    const/4 v1, 0x6

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, p0, Lo2g;->b:Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lo2g;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1c2

    check-cast p1, Lhbn;

    sget-object v0, Ldbn;->a:Ldbn;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    sget-object v1, Lxbn;->d:Lxbn;

    if-eqz v0, :cond_1e

    invoke-virtual {p0, v1, v5}, Lo2g;->a(Ls75;Ljava/lang/Runnable;)V

    goto/16 :goto_97

    :cond_1e
    instance-of v0, p1, Lgbn;

    sget-object v4, Lacn;->d:Lacn;

    if-eqz v0, :cond_29

    invoke-virtual {p0, v4, v5}, Lo2g;->a(Ls75;Ljava/lang/Runnable;)V

    goto/16 :goto_97

    :cond_29
    instance-of v0, p1, Lbbn;

    sget-object v5, Lbcn;->d:Lbcn;

    if-eqz v0, :cond_53

    new-instance v0, Lccn;

    invoke-direct {v0, p0, v3}, Lccn;-><init>(Lo2g;B)V

    invoke-virtual {p0, v5, v0}, Lo2g;->a(Ls75;Ljava/lang/Runnable;)V

    check-cast p1, Lbbn;

    iget-object p1, p1, Lbbn;->a:Lkze;

    check-cast v6, Lode;

    new-instance v0, Lihb;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lihb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0}, Lekc;->k(Lf7f;)V

    new-instance v1, Ledb;

    invoke-direct {v1, p0, p1, v0, v6}, Ledb;-><init>(Ljava/lang/Object;Lekc;Lf7f;Lode;)V

    invoke-virtual {v6, v1}, Lekc;->k(Lf7f;)V

    goto :goto_97

    :cond_53
    if-eqz p1, :cond_65

    instance-of v0, p1, Lebn;

    if-nez v0, :cond_65

    instance-of v0, p1, Lfbn;

    if-nez v0, :cond_65

    instance-of p1, p1, Lcbn;

    if-nez p1, :cond_65

    invoke-static {}, Lh9o;->p()V

    goto :goto_97

    :cond_65
    iget-object p1, p0, Lo2g;->c:Ljava/lang/Object;

    check-cast p1, Ls75;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_97

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    sget-object v1, Lzbn;->d:Lzbn;

    if-nez v0, :cond_85

    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_85

    sget-object v0, Lybn;->d:Lybn;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8e

    :cond_85
    new-instance p1, Lccn;

    invoke-direct {p1, p0, v2}, Lccn;-><init>(Lo2g;B)V

    invoke-virtual {p0, v1, p1}, Lo2g;->a(Ls75;Ljava/lang/Runnable;)V

    goto :goto_97

    :cond_8e
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_97

    invoke-static {}, Lh9o;->p()V

    :cond_97
    :goto_97
    return-void

    :pswitch_98
    check-cast v6, Lwnm;

    iget-object v0, v6, Lwnm;->o:Ljava/util/LinkedHashSet;

    iget-object p0, p0, Lo2g;->c:Ljava/lang/Object;

    check-cast p0, Lf7f;

    if-eqz p0, :cond_a5

    invoke-interface {p0, p1}, Lf7f;->d0(Ljava/lang/Object;)V

    :cond_a5
    check-cast v4, Lekc;

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_b3

    invoke-virtual {v6}, Lwnm;->u()V

    :cond_b3
    return-void

    :pswitch_b4
    check-cast p1, Lwvg;

    check-cast v4, Lumk;

    iget-object v0, v4, Lumk;->a:Lb59;

    iget v4, p1, Lwvg;->e:I

    iget-object v7, p1, Lwvg;->a:Ljava/lang/String;

    const-string v8, "GIVEAWAY_EXPIRED"

    if-ne v4, v1, :cond_e2

    invoke-virtual {p1}, Lwvg;->b()Z

    move-result p1

    if-eqz p1, :cond_e2

    check-cast v6, Ljtg;

    invoke-virtual {v6}, Ljtg;->d()Z

    move-result p1

    if-eqz p1, :cond_e2

    sget-object p1, Lykk;->a:Lykk;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_e3

    :cond_e2
    move-object p1, v5

    :cond_e3
    if-eqz p1, :cond_145

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-nez v1, :cond_13f

    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, p0, Lo2g;->c:Ljava/lang/Object;

    check-cast p0, Lw7j;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-nez p1, :cond_139

    new-instance p1, Lfug;

    iget-object v0, p0, Lw7j;->b:Ljava/lang/Object;

    check-cast v0, Ldu3;

    iget-object v0, v0, Ldu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsvg;

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Lsvg;->a(I)Z

    move-result v0

    new-instance v1, Lrii;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lrii;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0, v1}, Lfug;-><init>(ZLrii;)V

    iget-object p0, p0, Lw7j;->a:Ljava/lang/Object;

    check-cast p0, Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_145

    :cond_139
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, v5, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_13f
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, v5, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_145
    :goto_145
    return-void

    :pswitch_146
    check-cast p1, Lwvg;

    if-eqz p1, :cond_1a6

    iget-object v0, p1, Lwvg;->j:Ljava/lang/String;

    iget v2, p1, Lwvg;->e:I

    const/4 v3, 0x3

    if-eq v2, v3, :cond_159

    const/4 v3, 0x4

    if-eq v2, v3, :cond_159

    const/4 v3, 0x5

    if-eq v2, v3, :cond_159

    if-ne v2, v1, :cond_1a6

    :cond_159
    check-cast v6, Lni6;

    iget-object v1, p1, Lwvg;->a:Ljava/lang/String;

    iget-object v2, v6, Lni6;->a:Lb59;

    if-eqz v0, :cond_19d

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a6

    iget-object v0, p0, Lo2g;->c:Ljava/lang/Object;

    check-cast v0, Leq6;

    new-instance v1, Leof;

    const/16 v2, 0x9

    invoke-direct {v1, p0, p1, v2}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p1, Lwvg;->h:Ljmk;

    if-eqz p0, :cond_197

    iget-object p0, p0, Ljmk;->c:Lhmk;

    if-eqz p0, :cond_197

    iget-object p1, v0, Leq6;->a:Ljava/lang/Object;

    check-cast p1, Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Laf3;

    new-instance v2, Lhu5;

    invoke-direct {v2, v0, v1, p0}, Lhu5;-><init>(Leq6;Leof;Lhmk;)V

    invoke-virtual {p1, v2}, Laf3;->d(Lcom/opera/api/Callback;)V

    goto :goto_1a6

    :cond_197
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0}, Leof;->run(Ljava/lang/Object;)V

    goto :goto_1a6

    :cond_19d
    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, v1}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :cond_1a6
    :goto_1a6
    return-void

    :pswitch_1a7
    check-cast p1, Ljava/util/Map;

    check-cast v6, Lxbf;

    iget-object v0, v6, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Lh42;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    check-cast v4, Lwx;

    iget-object p0, p0, Lo2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll2g;

    invoke-virtual {v4, p0}, Lwx;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_1c2
    .packed-switch 0x0
        :pswitch_1a7
        :pswitch_146
        :pswitch_b4
        :pswitch_98
    .end packed-switch
.end method

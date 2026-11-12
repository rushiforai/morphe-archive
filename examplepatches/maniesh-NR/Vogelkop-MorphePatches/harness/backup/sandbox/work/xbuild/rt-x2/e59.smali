.class public final Le59;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le59;->a:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final a(Ld59;Lc59;)V
    .registers 3

    iget-object p0, p0, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b(Ld59;)Ljava/lang/String;
    .registers 5

    iget-object p0, p0, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc59;

    sget-object p1, Lc59;->l:Ljava/util/concurrent/ExecutorService;

    iget-object p1, p0, Lc59;->b:Lm59;

    if-nez p1, :cond_1f

    new-instance p1, Lm59;

    invoke-virtual {p0}, Lc59;->b()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Lc59;->c:Lj59;

    iget-object v1, v1, Lj59;->e:Ljava/lang/String;

    iget-object v2, p0, Lc59;->h:Lb59;

    invoke-direct {p1, v0, v1, v2, p0}, Lm59;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Lb59;Lc59;)V

    iput-object p1, p0, Lc59;->b:Lm59;

    :cond_1f
    iget-object p0, p1, Lm59;->f:Ljava/lang/Object;

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "last_fcm_token"

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final c(Ld59;Z)V
    .registers 3

    iget-object p0, p0, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc59;

    iget-boolean p1, p0, Lc59;->d:Z

    if-ne p1, p2, :cond_10

    iget-boolean p1, p0, Lc59;->e:Z

    if-eqz p1, :cond_1c

    :cond_10
    const/4 p1, 0x0

    iput-boolean p1, p0, Lc59;->e:Z

    iput-boolean p2, p0, Lc59;->d:Z

    iget-object p1, p0, Lc59;->b:Lm59;

    if-eqz p1, :cond_1c

    invoke-virtual {p0, p1}, Lc59;->a(Lm59;)V

    :cond_1c
    return-void
.end method

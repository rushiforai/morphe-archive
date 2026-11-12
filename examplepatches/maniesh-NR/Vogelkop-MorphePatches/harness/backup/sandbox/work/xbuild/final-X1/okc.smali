.class public final Lokc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lqkc;


# direct methods
.method public constructor <init>(Lqkc;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lokc;->a:Lqkc;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lzmc;)V
    .registers 7

    iget-object p0, p0, Lokc;->a:Lqkc;

    iget-object v0, p0, Lqkc;->f:Lwub;

    new-instance v1, Lioc;

    new-instance v2, Lgv8;

    const/16 v3, 0x14

    invoke-direct {v2, p0, p2, v3}, Lgv8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, p1, v2}, Lioc;-><init>(Landroid/view/View;Lgv8;)V

    iget-object p0, v0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ltkc;

    iget-object p0, p0, Ltkc;->g:Llu3;

    invoke-virtual {p0}, Llu3;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loz3;

    sget-object p1, Lijm;->a:Lijm;

    invoke-virtual {p0, v1, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final b(Lzmc;)V
    .registers 12

    iget-object p0, p0, Lokc;->a:Lqkc;

    iget-object v1, p0, Lqkc;->b:Ljs6;

    iget-boolean v3, p0, Lqkc;->l:Z

    iget-object v2, p0, Lqkc;->h:Lyzb;

    const/4 p0, 0x1

    iput-boolean p0, v1, Ljs6;->b:Z

    iget-object v0, v1, Ljs6;->h:Ljava/lang/Object;

    check-cast v0, Lrs6;

    iget-object v0, v0, Lrs6;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v4, "notification_interacted"

    invoke-interface {v0, v4, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v0, Lis6;

    const/4 v5, 0x0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lis6;-><init>(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;B)V

    iget-object p0, v1, Ljs6;->f:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvs6;

    new-instance v6, Ljoc;

    invoke-interface {v4}, Lzmc;->a()Llmc;

    move-result-object p1

    iget-wide v1, p1, Llmc;->a:J

    invoke-interface {v4}, Lzmc;->a()Llmc;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lapc;->c:Lapc;

    invoke-direct {v6, v1, v2, p1}, Ljoc;-><init>(JLapc;)V

    iget-object v5, p0, Lvs6;->f:Le2f;

    iget-object p0, v5, Le2f;->a:Lnx5;

    new-instance v4, Ljj4;

    const/16 v9, 0xc

    const/4 v8, 0x0

    move-object v7, v0

    invoke-direct/range {v4 .. v9}, Ljj4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p1, 0x3

    invoke-static {p0, v8, v8, v4, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

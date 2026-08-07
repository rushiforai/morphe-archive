.class Lcn/shuzilm/core/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:I

.field final synthetic e:Lcn/shuzilm/core/Listener;

.field final synthetic f:Lcn/shuzilm/core/DUHelper;


# direct methods
.method public constructor <init>(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILcn/shuzilm/core/Listener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/a;->f:Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcn/shuzilm/core/a;->a:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lcn/shuzilm/core/a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcn/shuzilm/core/a;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput p5, p0, Lcn/shuzilm/core/a;->d:I

    .line 10
    .line 11
    iput-object p6, p0, Lcn/shuzilm/core/a;->e:Lcn/shuzilm/core/Listener;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    :try_start_0
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->a()Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->g()I

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->a()Lcn/shuzilm/core/DUHelper;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcn/shuzilm/core/a;->a:Landroid/content/Context;

    .line 12
    .line 13
    iget-object v2, p0, Lcn/shuzilm/core/a;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p0, Lcn/shuzilm/core/a;->c:Ljava/lang/String;

    .line 16
    .line 17
    iget v4, p0, Lcn/shuzilm/core/a;->d:I

    .line 18
    .line 19
    invoke-static {v0, v1, v2, v3, v4}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcn/shuzilm/core/a;->e:Lcn/shuzilm/core/Listener;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcn/shuzilm/core/a;->f:Lcn/shuzilm/core/DUHelper;

    .line 30
    .line 31
    iget-object v1, p0, Lcn/shuzilm/core/a;->a:Landroid/content/Context;

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :cond_0
    iget-object p0, p0, Lcn/shuzilm/core/a;->e:Lcn/shuzilm/core/Listener;

    .line 38
    .line 39
    invoke-interface {p0, v0}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void

    .line 43
    :catch_0
    move-exception p0

    .line 44
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.class Lcn/shuzilm/core/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Lcn/shuzilm/core/Listener;

.field final synthetic f:Lcn/shuzilm/core/DUHelper;


# direct methods
.method public constructor <init>(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/q;->f:Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcn/shuzilm/core/q;->a:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lcn/shuzilm/core/q;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcn/shuzilm/core/q;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcn/shuzilm/core/q;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p6, p0, Lcn/shuzilm/core/q;->e:Lcn/shuzilm/core/Listener;

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
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcn/shuzilm/core/q;->a:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v2, p0, Lcn/shuzilm/core/q;->b:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p0, Lcn/shuzilm/core/q;->c:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v4, p0, Lcn/shuzilm/core/q;->d:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1, v2, v3, v4}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcn/shuzilm/core/q;->e:Lcn/shuzilm/core/Listener;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, v0}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

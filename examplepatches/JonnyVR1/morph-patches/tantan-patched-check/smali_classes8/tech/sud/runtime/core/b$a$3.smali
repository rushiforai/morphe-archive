.class Ltech/sud/runtime/core/b$a$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/core/b$a;->onActivityDestroyed(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/app/Application;

.field final synthetic b:Ltech/sud/runtime/core/b$a;

.field final synthetic c:Ltech/sud/runtime/core/b$a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/b$a;Landroid/app/Application;Ltech/sud/runtime/core/b$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/b$a$3;->c:Ltech/sud/runtime/core/b$a;

    .line 2
    .line 3
    iput-object p2, p0, Ltech/sud/runtime/core/b$a$3;->a:Landroid/app/Application;

    .line 4
    .line 5
    iput-object p3, p0, Ltech/sud/runtime/core/b$a$3;->b:Ltech/sud/runtime/core/b$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/b$a$3;->c:Ltech/sud/runtime/core/b$a;

    .line 2
    .line 3
    iget-object v0, v0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v1, v0, Ltech/sud/runtime/core/b;->b:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ltech/sud/runtime/core/b;->a()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltech/sud/runtime/core/b$a$3;->c:Ltech/sud/runtime/core/b$a;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, v0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 18
    .line 19
    :cond_0
    :try_start_0
    iget-object v0, p0, Ltech/sud/runtime/core/b$a$3;->a:Landroid/app/Application;

    .line 20
    .line 21
    iget-object p0, p0, Ltech/sud/runtime/core/b$a$3;->b:Ltech/sud/runtime/core/b$a;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    :catch_0
    return-void
.end method

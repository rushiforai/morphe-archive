.class Ltech/sud/runtime/core/b$a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/core/b$a;->onActivityPaused(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/core/b$a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/b$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/b$a$2;->a:Ltech/sud/runtime/core/b$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    const-string v0, "SudNative"

    .line 2
    .line 3
    const-string v1, "J: onActivityPaused"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltech/sud/runtime/core/b$a$2;->a:Ltech/sud/runtime/core/b$a;

    .line 9
    .line 10
    iget-object v1, v0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-boolean v0, v0, Ltech/sud/runtime/core/b$a;->b:Z

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Ltech/sud/runtime/core/b;->g()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ltech/sud/runtime/core/b$a$2;->a:Ltech/sud/runtime/core/b$a;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ltech/sud/runtime/core/b$a;->b:Z

    .line 25
    .line 26
    return-void
.end method

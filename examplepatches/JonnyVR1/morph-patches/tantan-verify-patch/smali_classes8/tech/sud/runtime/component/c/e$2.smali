.class Ltech/sud/runtime/component/c/e$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/component/c/e;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/c/e;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/c/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/c/e$2;->a:Ltech/sud/runtime/component/c/e;

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
    iget-object v0, p0, Ltech/sud/runtime/component/c/e$2;->a:Ltech/sud/runtime/component/c/e;

    .line 2
    .line 3
    invoke-static {v0}, Ltech/sud/runtime/component/c/e;->b(Ltech/sud/runtime/component/c/e;)Landroid/app/ActivityManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ltech/sud/runtime/component/c/e$2;->a:Ltech/sud/runtime/component/c/e;

    .line 8
    .line 9
    invoke-static {v1}, Ltech/sud/runtime/component/c/e;->a(Ltech/sud/runtime/component/c/e;)[I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getProcessMemoryInfo([I)[Landroid/os/Debug$MemoryInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Ltech/sud/runtime/component/c/e$2;->a:Ltech/sud/runtime/component/c/e;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    aget-object v0, v0, v1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/os/Debug$MemoryInfo;->getTotalPss()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-long v0, v0

    .line 27
    invoke-static {p0, v0, v1}, Ltech/sud/runtime/component/c/e;->a(Ltech/sud/runtime/component/c/e;J)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.class Ltech/sud/runtime/core/b$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/core/b$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/core/b$2;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/b$2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/b$2$1;->a:Ltech/sud/runtime/core/b$2;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/b$2$1;->a:Ltech/sud/runtime/core/b$2;

    .line 2
    .line 3
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 4
    .line 5
    iget-object p0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Ltech/sud/runtime/core/a;->c()Ltech/sud/runtime/core/i;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ltech/sud/runtime/core/i;->b()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

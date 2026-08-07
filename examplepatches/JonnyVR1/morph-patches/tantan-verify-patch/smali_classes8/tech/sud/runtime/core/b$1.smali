.class Ltech/sud/runtime/core/b$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/a/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/core/b;-><init>(Landroid/app/Activity;Ltech/sud/runtime/core/g;Ljava/util/HashMap;Ltech/sud/runtime/component/d/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/core/b;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/b$1;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/b$1;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    const-string v1, "true"

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ltech/sud/runtime/core/b$1;->a:Ltech/sud/runtime/core/b;

    .line 12
    .line 13
    iget-object p0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    :goto_0
    invoke-virtual {v0, p0}, Ltech/sud/runtime/core/b;->a(Landroid/widget/FrameLayout;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.class Ltech/sud/runtime/core/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/core/i$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/core/a;-><init>(Landroid/content/Context;ILtech/sud/runtime/core/g;ZILjava/lang/String;Ltech/sud/runtime/component/d/a;Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/core/a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/a$1;->a:Ltech/sud/runtime/core/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/a$1;->a:Ltech/sud/runtime/core/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Ltech/sud/runtime/core/a;->a(Ltech/sud/runtime/core/a;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

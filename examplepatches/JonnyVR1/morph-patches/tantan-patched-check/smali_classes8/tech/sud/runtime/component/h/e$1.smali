.class final Ltech/sud/runtime/component/h/e$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/component/h/e;->a(Landroid/content/Context;Landroid/view/Window;Ltech/sud/runtime/component/h/e$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Landroid/view/Window;

.field final synthetic c:[I

.field final synthetic d:Ltech/sud/runtime/component/h/e$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/Window;[ILtech/sud/runtime/component/h/e$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/h/e$1;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Ltech/sud/runtime/component/h/e$1;->b:Landroid/view/Window;

    .line 4
    .line 5
    iput-object p3, p0, Ltech/sud/runtime/component/h/e$1;->c:[I

    .line 6
    .line 7
    iput-object p4, p0, Ltech/sud/runtime/component/h/e$1;->d:Ltech/sud/runtime/component/h/e$a;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/h/e$1;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Ltech/sud/runtime/component/h/e$1;->b:Landroid/view/Window;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/e;->a(Landroid/content/Context;Landroid/view/Window;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ltech/sud/runtime/component/h/e$1;->c:[I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    aget v1, v1, v2

    .line 13
    .line 14
    if-eq v1, v0, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ltech/sud/runtime/component/h/e$1;->d:Ltech/sud/runtime/component/h/e$a;

    .line 17
    .line 18
    invoke-interface {v1, v0}, Ltech/sud/runtime/component/h/e$a;->a(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ltech/sud/runtime/component/h/e$1;->c:[I

    .line 22
    .line 23
    aput v0, p0, v2

    .line 24
    .line 25
    :cond_0
    return-void
.end method

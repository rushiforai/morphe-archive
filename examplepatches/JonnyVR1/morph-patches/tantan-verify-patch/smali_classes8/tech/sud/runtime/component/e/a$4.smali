.class Ltech/sud/runtime/component/e/a$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/e/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/e/a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/e/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/e/a$4;->a:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/component/e/a$4;->a:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    invoke-static {p1}, Ltech/sud/runtime/component/e/a;->c(Ltech/sud/runtime/component/e/a;)Ltech/sud/runtime/component/e/a$a;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$4;->a:Ltech/sud/runtime/component/e/a;

    .line 8
    .line 9
    invoke-static {v0}, Ltech/sud/runtime/component/e/a;->d(Ltech/sud/runtime/component/e/a;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p1, v0}, Ltech/sud/runtime/component/e/a$a;->b(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ltech/sud/runtime/component/e/a$4;->a:Ltech/sud/runtime/component/e/a;

    .line 17
    .line 18
    invoke-static {p1}, Ltech/sud/runtime/component/e/a;->e(Ltech/sud/runtime/component/e/a;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Ltech/sud/runtime/component/e/a$4;->a:Ltech/sud/runtime/component/e/a;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ltech/sud/runtime/component/e/a$4;->a:Ltech/sud/runtime/component/e/a;

    .line 31
    .line 32
    invoke-static {p0}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;)Landroid/widget/EditText;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p1, p0}, Ltech/sud/runtime/component/h/e;->b(Landroid/content/Context;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

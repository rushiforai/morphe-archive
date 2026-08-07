.class Ltech/sud/runtime/component/e/a$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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
    iput-object p1, p0, Ltech/sud/runtime/component/e/a$5;->a:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/component/e/a$5;->a:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    invoke-static {p1}, Ltech/sud/runtime/component/e/a;->c(Ltech/sud/runtime/component/e/a;)Ltech/sud/runtime/component/e/a$a;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p0, Ltech/sud/runtime/component/e/a$5;->a:Ltech/sud/runtime/component/e/a;

    .line 8
    .line 9
    invoke-static {p2}, Ltech/sud/runtime/component/e/a;->d(Ltech/sud/runtime/component/e/a;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p1, p2}, Ltech/sud/runtime/component/e/a$a;->b(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ltech/sud/runtime/component/e/a$5;->a:Ltech/sud/runtime/component/e/a;

    .line 17
    .line 18
    invoke-static {p0}, Ltech/sud/runtime/component/e/a;->e(Ltech/sud/runtime/component/e/a;)Z

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0
.end method

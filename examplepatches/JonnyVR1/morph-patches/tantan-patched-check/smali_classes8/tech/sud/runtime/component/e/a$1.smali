.class Ltech/sud/runtime/component/e/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/component/e/a;->a(Ljava/lang/String;IZZI)V
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
    iput-object p1, p0, Ltech/sud/runtime/component/e/a$1;->a:Ltech/sud/runtime/component/e/a;

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
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$1;->a:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    invoke-static {v0}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;)Landroid/widget/EditText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$1;->a:Ltech/sud/runtime/component/e/a;

    .line 11
    .line 12
    invoke-static {v0}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;)Landroid/widget/EditText;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ltech/sud/runtime/component/e/a$1;->a:Ltech/sud/runtime/component/e/a;

    .line 17
    .line 18
    invoke-static {v1}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;)Landroid/widget/EditText;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$1;->a:Ltech/sud/runtime/component/e/a;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-static {v0, v1}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$1;->a:Ltech/sud/runtime/component/e/a;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Ltech/sud/runtime/component/e/a$1;->a:Ltech/sud/runtime/component/e/a;

    .line 46
    .line 47
    invoke-static {p0}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;)Landroid/widget/EditText;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v0, p0}, Ltech/sud/runtime/component/h/e;->a(Landroid/content/Context;Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

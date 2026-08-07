.class Ltech/sud/runtime/component/e/a$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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
    iput-object p1, p0, Ltech/sud/runtime/component/e/a$6;->a:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ltech/sud/runtime/component/e/a$6;->a:Ltech/sud/runtime/component/e/a;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ltech/sud/runtime/component/e/a$6;->a:Ltech/sud/runtime/component/e/a;

    .line 10
    .line 11
    invoke-static {p0}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;)Landroid/widget/EditText;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, p0}, Ltech/sud/runtime/component/h/e;->b(Landroid/content/Context;Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

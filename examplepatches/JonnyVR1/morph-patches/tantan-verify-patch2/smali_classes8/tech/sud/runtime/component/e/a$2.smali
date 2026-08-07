.class Ltech/sud/runtime/component/e/a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/component/e/a;->d()V
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
    iput-object p1, p0, Ltech/sud/runtime/component/e/a$2;->a:Ltech/sud/runtime/component/e/a;

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
    .locals 0

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/component/e/a$2;->a:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ltech/sud/runtime/component/e/a;->c()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ltech/sud/runtime/component/e/a$2;->a:Ltech/sud/runtime/component/e/a;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Ltech/sud/runtime/component/e/a$2;->a:Ltech/sud/runtime/component/e/a;

    .line 13
    .line 14
    invoke-static {p0}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;)Landroid/widget/EditText;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p1, p0}, Ltech/sud/runtime/component/h/e;->b(Landroid/content/Context;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

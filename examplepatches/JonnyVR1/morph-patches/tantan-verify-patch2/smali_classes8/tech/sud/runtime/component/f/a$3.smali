.class Ltech/sud/runtime/component/f/a$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/component/f/a;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/f/a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/f/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/f/a$3;->a:Ltech/sud/runtime/component/f/a;

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
    iget-object p1, p0, Ltech/sud/runtime/component/f/a$3;->a:Ltech/sud/runtime/component/f/a;

    .line 2
    .line 3
    invoke-static {p1}, Ltech/sud/runtime/component/f/a;->c(Ltech/sud/runtime/component/f/a;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p0, p0, Ltech/sud/runtime/component/f/a$3;->a:Ltech/sud/runtime/component/f/a;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ltech/sud/runtime/component/f/a;->b()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ltech/sud/runtime/component/f/a;->a()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

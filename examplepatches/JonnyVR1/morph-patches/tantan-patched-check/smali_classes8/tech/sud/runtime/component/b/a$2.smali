.class Ltech/sud/runtime/component/b/a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/component/b/a;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/b/a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/b/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/b/a$2;->a:Ltech/sud/runtime/component/b/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/component/b/a$2;->a:Ltech/sud/runtime/component/b/a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ltech/sud/runtime/component/b/a;->a(Ltech/sud/runtime/component/b/a;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ltech/sud/runtime/component/b/a$2;->a:Ltech/sud/runtime/component/b/a;

    .line 8
    .line 9
    invoke-static {p0}, Ltech/sud/runtime/component/b/a;->a(Ltech/sud/runtime/component/b/a;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

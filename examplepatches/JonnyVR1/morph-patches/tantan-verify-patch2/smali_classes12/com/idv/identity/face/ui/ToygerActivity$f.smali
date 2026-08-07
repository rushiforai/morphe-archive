.class Lcom/idv/identity/face/ui/ToygerActivity$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->R()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/face/ui/ToygerActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$f;->a:Lcom/idv/identity/face/ui/ToygerActivity;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$f;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->j1(Lcom/idv/identity/face/ui/ToygerActivity;)Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 8
    .line 9
    sget v2, Ll/x9c0;->c:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$f;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->k1(Lcom/idv/identity/face/ui/ToygerActivity;)Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 25
    .line 26
    sget v2, Ll/x9c0;->c:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$f;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->l1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/LinearLayout;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 42
    .line 43
    sget v1, Ll/x9c0;->c:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

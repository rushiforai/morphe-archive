.class Lcom/idv/identity/face/ui/ToygerActivity$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->w2()V
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
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$l;->a:Lcom/idv/identity/face/ui/ToygerActivity;

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
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$l;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->l1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/LinearLayout;

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
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$l;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->k1(Lcom/idv/identity/face/ui/ToygerActivity;)Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$l;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->k1(Lcom/idv/identity/face/ui/ToygerActivity;)Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 33
    .line 34
    sget v2, Ll/x9c0;->c:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$l;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->j1(Lcom/idv/identity/face/ui/ToygerActivity;)Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 50
    .line 51
    sget v1, Ll/x9c0;->c:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-virtual {p0, v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o(I)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

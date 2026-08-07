.class Lcom/idv/identity/face/ui/ToygerActivity$o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->d2(Landroid/animation/Animator$AnimatorListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/animation/Animator$AnimatorListener;

.field final synthetic b:Lcom/idv/identity/face/ui/ToygerActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/ToygerActivity;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$o;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/face/ui/ToygerActivity$o;->a:Landroid/animation/Animator$AnimatorListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$o;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->j1(Lcom/idv/identity/face/ui/ToygerActivity;)Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$o;->a:Landroid/animation/Animator$AnimatorListener;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->j(Landroid/animation/Animator$AnimatorListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

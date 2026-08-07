.class Lcom/idv/identity/face/ui/ToygerActivity$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/face/ui/ToygerActivity;
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
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$b;->a:Lcom/idv/identity/face/ui/ToygerActivity;

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
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$b;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->d1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$b;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/t7c0;->a:I

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity$b;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/idv/identity/face/ui/ToygerActivity;->d1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/TextView;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$b;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-static {p0, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->f1(Lcom/idv/identity/face/ui/ToygerActivity;Z)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.class Lcom/idv/identity/face/ui/ToygerActivity$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->g2()V
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
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$h;->a:Lcom/idv/identity/face/ui/ToygerActivity;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$h;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->f()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$h;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->setProgress(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

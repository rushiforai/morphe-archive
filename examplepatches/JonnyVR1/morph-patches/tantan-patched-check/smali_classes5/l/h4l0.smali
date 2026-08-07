.class public Ll/h4l0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/k4l0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/h4l0;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/h4l0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h4l0;->f0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic f0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/k4l0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k4l0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/h4l0;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/h4l0;->a:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string v1, "from"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/h4l0;->b:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/g4l0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/g4l0;-><init>(Ll/h4l0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

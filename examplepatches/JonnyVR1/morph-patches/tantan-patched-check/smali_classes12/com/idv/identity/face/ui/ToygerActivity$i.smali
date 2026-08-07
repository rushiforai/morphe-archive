.class Lcom/idv/identity/face/ui/ToygerActivity$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/IdentityAlertOverlay$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->q2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/platform/FinalVerifyActivity$f;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/FinalVerifyActivity$f;

.field final synthetic b:Lcom/idv/identity/face/ui/ToygerActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/ToygerActivity;Lcom/idv/identity/platform/FinalVerifyActivity$f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$i;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/face/ui/ToygerActivity$i;->a:Lcom/idv/identity/platform/FinalVerifyActivity$f;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$i;->a:Lcom/idv/identity/platform/FinalVerifyActivity$f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/idv/identity/platform/FinalVerifyActivity$f;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$i;->a:Lcom/idv/identity/platform/FinalVerifyActivity$f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/idv/identity/platform/FinalVerifyActivity$f;->onCancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.class Lcom/idv/identity/face/ui/ToygerActivity$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/IdentityAlertOverlay$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/wdj0;

.field final synthetic c:Lcom/idv/identity/face/ui/ToygerActivity$x;

.field final synthetic d:Lcom/idv/identity/face/ui/ToygerActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;Ll/wdj0;Lcom/idv/identity/face/ui/ToygerActivity$x;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->b:Ll/wdj0;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->c:Lcom/idv/identity/face/ui/ToygerActivity$x;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/platform/log/RecordService;->recordAlertBtn(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Lcom/idv/identity/face/ui/ToygerActivity;->n1(Lcom/idv/identity/face/ui/ToygerActivity;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->o1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/Button;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->o1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/Button;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->b:Ll/wdj0;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v2, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 35
    .line 36
    iput-boolean v1, v2, Lcom/idv/identity/face/ui/ToygerActivity;->g:Z

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/wdj0;->w0(Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/idv/identity/platform/log/RecordService;->recordAlertClose(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->c:Lcom/idv/identity/face/ui/ToygerActivity$x;

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    invoke-interface {p0}, Lcom/idv/identity/face/ui/ToygerActivity$x;->a()V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public onCancel()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/platform/log/RecordService;->recordAlertCancel(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Lcom/idv/identity/face/ui/ToygerActivity;->n1(Lcom/idv/identity/face/ui/ToygerActivity;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->o1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/Button;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->o1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/Button;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->b:Ll/wdj0;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v2, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->d:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 35
    .line 36
    iput-boolean v1, v2, Lcom/idv/identity/face/ui/ToygerActivity;->g:Z

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/wdj0;->w0(Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/idv/identity/platform/log/RecordService;->recordAlertClose(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$j;->c:Lcom/idv/identity/face/ui/ToygerActivity$x;

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    invoke-interface {p0}, Lcom/idv/identity/face/ui/ToygerActivity$x;->onCancel()V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

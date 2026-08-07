.class Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

.field final synthetic val$closeButton:Landroid/widget/ImageButton;


# direct methods
.method public constructor <init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/widget/ImageButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->val$closeButton:Landroid/widget/ImageButton;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 5
    .line 6
    const/16 v0, 0x64

    .line 7
    .line 8
    if-ne p2, v0, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->f4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/widget/ProgressBar;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/16 p2, 0x8

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->val$closeButton:Landroid/widget/ImageButton;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->f4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/widget/ProgressBar;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->f4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/widget/ProgressBar;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getProgress()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    filled-new-array {v1, p2}, [I

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const-string v1, "progress"

    .line 45
    .line 46
    invoke-static {v0, v1, p2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-static {p1, p2}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->h4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/animation/ObjectAnimator;)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->g4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-wide/16 v0, 0x12c

    .line 60
    .line 61
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->g4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/animation/ObjectAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->b4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/webkit/ValueCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->b4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/webkit/ValueCallback;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 20
    .line 21
    invoke-static {p1, p2}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->c4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->d4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 p2, 0x1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    return p2

    .line 34
    :cond_1
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    :try_start_0
    iget-object p3, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 39
    .line 40
    const/16 v1, 0x4a0

    .line 41
    .line 42
    invoke-virtual {p3, p1, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    return p2

    .line 46
    :catch_0
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;->this$0:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 47
    .line 48
    invoke-static {p0, v0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->c4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    return p0
.end method

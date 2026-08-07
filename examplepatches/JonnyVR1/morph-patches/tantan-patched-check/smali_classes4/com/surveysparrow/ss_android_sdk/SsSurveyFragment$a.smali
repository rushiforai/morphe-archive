.class Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/surveysparrow/ss_android_sdk/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/concurrent/CompletableFuture;

.field final synthetic b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;


# direct methods
.method public constructor <init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Ljava/util/concurrent/CompletableFuture;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$a;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$a;->a:Ljava/util/concurrent/CompletableFuture;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onResponse(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$a;->a:Ljava/util/concurrent/CompletableFuture;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.class Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->m(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;


# direct methods
.method public constructor <init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity$a;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity$a;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

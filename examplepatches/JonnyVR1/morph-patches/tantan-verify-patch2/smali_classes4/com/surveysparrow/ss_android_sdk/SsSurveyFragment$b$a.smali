.class Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/surveysparrow/ss_android_sdk/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;


# direct methods
.method public constructor <init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b$a;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onResponse(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b$a;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 4
    .line 5
    new-instance v0, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->E:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

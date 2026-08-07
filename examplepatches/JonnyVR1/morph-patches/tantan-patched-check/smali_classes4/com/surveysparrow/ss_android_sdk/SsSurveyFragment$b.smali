.class Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/widget/FrameLayout;

.field final synthetic b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;


# direct methods
.method public constructor <init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/widget/FrameLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->a:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 1
    const-string p1, "SS_VALIDATION"

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "https://"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->X3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getDomain()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "/nps/widget/contact/"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->Z3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    new-instance v2, Lcom/surveysparrow/ss_android_sdk/b;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->X3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getSurveyToken()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->Z3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 60
    .line 61
    iget-object v6, v0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->G:Ljava/lang/Boolean;

    .line 62
    .line 63
    new-instance v7, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b$a;

    .line 64
    .line 65
    invoke-direct {v7, p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b$a;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;)V

    .line 66
    .line 67
    .line 68
    invoke-direct/range {v2 .. v7}, Lcom/surveysparrow/ss_android_sdk/b;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Boolean;Lcom/surveysparrow/ss_android_sdk/b$a;)V

    .line 69
    .line 70
    .line 71
    filled-new-array {v3}, [Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v2, v0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 76
    .line 77
    .line 78
    :try_start_0
    invoke-virtual {v2}, Lcom/surveysparrow/ss_android_sdk/b;->a()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :catch_0
    move-exception v0

    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "Error in closeSurvey"

    .line 86
    .line 87
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->E:Lorg/json/JSONObject;

    .line 103
    .line 104
    const-string v1, "surveyClosed"

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_1

    .line 111
    .line 112
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 113
    .line 114
    invoke-static {v0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->a4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/rn50;

    .line 115
    .line 116
    .line 117
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 118
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;->b:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 119
    .line 120
    if-eqz v0, :cond_0

    .line 121
    .line 122
    :try_start_2
    invoke-static {v1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->a4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/rn50;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-interface {p0}, Ll/rn50;->M()V

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :catch_1
    move-exception v0

    .line 131
    move-object p0, v0

    .line 132
    goto :goto_1

    .line 133
    :cond_0
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b$b;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b$b;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 143
    .line 144
    .line 145
    goto :goto_2

    .line 146
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v1, "Error in  processing  close survey json"

    .line 149
    .line 150
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    :cond_1
    :goto_2
    return-void
.end method

.class public final Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"

# interfaces
.implements Ll/sn50;
.implements Ll/rn50;


# instance fields
.field private c:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

.field private d:I

.field private e:Ljava/lang/CharSequence;

.field private f:Z

.field private g:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public M()V
    .locals 4

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity$b;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity$b;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m(Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    const/4 p1, -0x1

    .line 18
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->c:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getSurveyToken()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0, p1}, Lcom/surveysparrow/ss_android_sdk/c;->c(Landroid/content/Context;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Landroid/os/Handler;

    .line 31
    .line 32
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity$a;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity$a;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;)V

    .line 38
    .line 39
    .line 40
    iget-wide v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->g:J

    .line 41
    .line 42
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "SS_ACTIVITY_THEME"

    .line 9
    .line 10
    sget v2, Ll/kgc0;->a:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->d:I

    .line 17
    .line 18
    const-string v1, "SS_APPBAR_TITLE"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->e:Ljava/lang/CharSequence;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "widgetContactId"

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const-string v2, "SS_BACK_BUTTON"

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    iput-boolean v2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->f:Z

    .line 45
    .line 46
    const-string v2, "SS_WAIT_TIME"

    .line 47
    .line 48
    const-wide/16 v3, 0xbb8

    .line 49
    .line 50
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    iput-wide v2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->g:J

    .line 55
    .line 56
    const-string v2, "SS_SURVEY"

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 63
    .line 64
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->c:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 65
    .line 66
    iget v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->d:I

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 69
    .line 70
    .line 71
    sget v0, Ll/zec0;->a:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    if-eqz v0, :cond_0

    .line 81
    .line 82
    iget-object v2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->e:Ljava/lang/CharSequence;

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Ll/c30;->E(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    iget-boolean v2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->f:Z

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Ll/c30;->w(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .line 91
    .line 92
    :cond_0
    const-string v0, "SURVEY_FRAGMENT_TAG"

    .line 93
    .line 94
    if-nez p1, :cond_1

    .line 95
    .line 96
    :try_start_1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance v2, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 105
    .line 106
    invoke-direct {v2}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->l4(Ll/rn50;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2, v1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->m4(I)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->c:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 116
    .line 117
    invoke-virtual {v2, p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->n4(Lcom/surveysparrow/ss_android_sdk/SsSurvey;)Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 118
    .line 119
    .line 120
    sget p0, Ll/ndc0;->a:I

    .line 121
    .line 122
    invoke-virtual {p1, p0, v2, v0}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {v2, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    check-cast v2, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 146
    .line 147
    iget-object v3, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;->c:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 148
    .line 149
    invoke-virtual {v2, v3}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->n4(Lcom/surveysparrow/ss_android_sdk/SsSurvey;)Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2, p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->l4(Ll/rn50;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2, v1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->m4(I)V

    .line 156
    .line 157
    .line 158
    sget p0, Ll/ndc0;->a:I

    .line 159
    .line 160
    invoke-virtual {p1, p0, v2, v0}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :catch_0
    move-exception p0

    .line 168
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    const-string p1, "SS_RT_EXCEPTION_LOG"

    .line 177
    .line 178
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1    # Landroid/view/MenuItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x102002c

    .line 6
    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

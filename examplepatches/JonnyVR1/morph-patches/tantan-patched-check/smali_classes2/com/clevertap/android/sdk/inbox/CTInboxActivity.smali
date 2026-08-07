.class public Lcom/clevertap/android/sdk/inbox/CTInboxActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "SourceFile"

# interfaces
.implements Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment$b;
.implements Ll/n2e;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;
    }
.end annotation


# static fields
.field public static k:I


# instance fields
.field c:Ll/kw3;

.field d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

.field e:Lcom/google/android/material/tabs/TabLayout;

.field f:Landroidx/viewpager/widget/ViewPager;

.field private g:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private h:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;",
            ">;"
        }
    .end annotation
.end field

.field private i:Lcom/clevertap/android/sdk/CleverTapAPI;

.field private j:Lcom/clevertap/android/sdk/i;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private J0()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->g:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, ":CT_INBOX_LIST_VIEW_FRAGMENT"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method


# virtual methods
.method public A(Landroid/content/Context;ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Landroid/os/Bundle;Ljava/util/HashMap;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/clevertap/android/sdk/inbox/CTInboxMessage;",
            "Landroid/os/Bundle;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 1
    move-object p1, p4

    .line 2
    move-object p4, p5

    .line 3
    move p5, p6

    .line 4
    invoke-virtual/range {p0 .. p5}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->H0(Landroid/os/Bundle;ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/util/HashMap;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public H0(Landroid/os/Bundle;ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/util/HashMap;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "I",
            "Lcom/clevertap/android/sdk/inbox/CTInboxMessage;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->K0()Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v1, p0

    .line 8
    move-object v4, p1

    .line 9
    move v2, p2

    .line 10
    move-object v3, p3

    .line 11
    move-object v5, p4

    .line 12
    move v6, p5

    .line 13
    invoke-interface/range {v0 .. v6}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;->a(Lcom/clevertap/android/sdk/inbox/CTInboxActivity;ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Landroid/os/Bundle;Ljava/util/HashMap;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->j:Lcom/clevertap/android/sdk/i;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/clevertap/android/sdk/i;->e(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public I0(Landroid/os/Bundle;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "CTInboxActivity:didShow() called with: data = ["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "], inboxMessage = ["

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->e()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "]"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->K0()Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-interface {v0, p0, p2, p1}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;->b(Lcom/clevertap/android/sdk/inbox/CTInboxActivity;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Landroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public K0()Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->h:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->g:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->g:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v2, "InboxActivityListener is null for notification inbox "

    .line 26
    .line 27
    invoke-virtual {v1, p0, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-object v0
.end method

.method public L0(Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->h:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public Q(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->j:Lcom/clevertap/android/sdk/i;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/i;->i(Landroid/app/Activity;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    const-string v0, "styleConfig"

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_9

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 23
    .line 24
    const-string v1, "configBundle"

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    const-string v1, "config"

    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    :try_start_1
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->g:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->g:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 47
    .line 48
    invoke-static {p1, v2}, Lcom/clevertap/android/sdk/CleverTapAPI;->U(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->i:Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 53
    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->L0(Lcom/clevertap/android/sdk/inbox/CTInboxActivity$b;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Lcom/clevertap/android/sdk/i;

    .line 60
    .line 61
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->g:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 62
    .line 63
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->i:Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 64
    .line 65
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapAPI;->H()Lcom/clevertap/android/sdk/g;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/g;->e()Ll/ch2;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v3}, Ll/ch2;->q()Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-direct {p1, v2, v3}, Lcom/clevertap/android/sdk/i;-><init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/util/List;)V

    .line 78
    .line 79
    .line 80
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->j:Lcom/clevertap/android/sdk/i;

    .line 81
    .line 82
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    .line 91
    .line 92
    sput p1, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->k:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    .line 94
    sget p1, Ll/efc0;->n:I

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->i:Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapAPI;->H()Lcom/clevertap/android/sdk/g;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/g;->h()Ll/bu9;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1, p0}, Ll/bu9;->M(Landroid/app/Activity;)V

    .line 110
    .line 111
    .line 112
    sget p1, Ll/icc0;->Q0:I

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 119
    .line 120
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 121
    .line 122
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->e()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 130
    .line 131
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->f()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/Toolbar;->setTitleTextColor(I)V

    .line 140
    .line 141
    .line 142
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 143
    .line 144
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->d()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    sget v3, Ll/wbc0;->b:I

    .line 160
    .line 161
    const/4 v4, 0x0

    .line 162
    invoke-static {v2, v3, v4}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    if-eqz v2, :cond_2

    .line 167
    .line 168
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 169
    .line 170
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->a()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 179
    .line 180
    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 181
    .line 182
    .line 183
    :cond_2
    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 184
    .line 185
    .line 186
    sget v2, Lcom/clevertap/android/sdk/R$string;->d:I

    .line 187
    .line 188
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    new-instance v2, Lcom/clevertap/android/sdk/inbox/CTInboxActivity$a;

    .line 196
    .line 197
    invoke-direct {v2, p0}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity$a;-><init>(Lcom/clevertap/android/sdk/inbox/CTInboxActivity;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    .line 202
    .line 203
    sget p1, Ll/icc0;->p0:I

    .line 204
    .line 205
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    check-cast p1, Landroid/widget/LinearLayout;

    .line 210
    .line 211
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 212
    .line 213
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->c()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 222
    .line 223
    .line 224
    sget v2, Ll/icc0;->O0:I

    .line 225
    .line 226
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    check-cast v2, Lcom/google/android/material/tabs/TabLayout;

    .line 231
    .line 232
    iput-object v2, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 233
    .line 234
    sget v2, Ll/icc0;->S0:I

    .line 235
    .line 236
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    .line 241
    .line 242
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->f:Landroidx/viewpager/widget/ViewPager;

    .line 243
    .line 244
    sget p1, Ll/icc0;->G0:I

    .line 245
    .line 246
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    check-cast p1, Landroid/widget/TextView;

    .line 251
    .line 252
    new-instance v2, Landroid/os/Bundle;

    .line 253
    .line 254
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 255
    .line 256
    .line 257
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->g:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 258
    .line 259
    invoke-virtual {v2, v1, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 260
    .line 261
    .line 262
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 263
    .line 264
    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 268
    .line 269
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->o()Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->f:Landroidx/viewpager/widget/ViewPager;

    .line 274
    .line 275
    const/4 v3, 0x1

    .line 276
    const/4 v4, 0x0

    .line 277
    if-nez v0, :cond_7

    .line 278
    .line 279
    const/16 v0, 0x8

    .line 280
    .line 281
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 282
    .line 283
    .line 284
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 285
    .line 286
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 287
    .line 288
    .line 289
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->i:Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 290
    .line 291
    if-eqz v1, :cond_3

    .line 292
    .line 293
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapAPI;->N()I

    .line 294
    .line 295
    .line 296
    move-result v1

    .line 297
    if-nez v1, :cond_3

    .line 298
    .line 299
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 300
    .line 301
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->c()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 316
    .line 317
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->g()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    .line 323
    .line 324
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 325
    .line 326
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->h()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 331
    .line 332
    .line 333
    move-result p0

    .line 334
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 335
    .line 336
    .line 337
    return-void

    .line 338
    :cond_3
    sget v1, Ll/icc0;->y0:I

    .line 339
    .line 340
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    check-cast v1, Landroid/widget/FrameLayout;

    .line 345
    .line 346
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 357
    .line 358
    .line 359
    move-result-object p1

    .line 360
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 361
    .line 362
    .line 363
    move-result-object p1

    .line 364
    :cond_4
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    if-eqz v0, :cond_5

    .line 369
    .line 370
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 375
    .line 376
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    if-eqz v1, :cond_4

    .line 381
    .line 382
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->J0()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v1

    .line 390
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 391
    .line 392
    .line 393
    move-result v0

    .line 394
    if-nez v0, :cond_4

    .line 395
    .line 396
    move v4, v3

    .line 397
    goto :goto_0

    .line 398
    :cond_5
    if-nez v4, :cond_6

    .line 399
    .line 400
    new-instance p1, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 401
    .line 402
    invoke-direct {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;-><init>()V

    .line 403
    .line 404
    .line 405
    invoke-virtual {p1, v2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    sget v1, Ll/icc0;->y0:I

    .line 417
    .line 418
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->J0()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object p0

    .line 422
    invoke-virtual {v0, v1, p1, p0}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 423
    .line 424
    .line 425
    move-result-object p0

    .line 426
    invoke-virtual {p0}, Landroidx/fragment/app/k;->i()I

    .line 427
    .line 428
    .line 429
    :cond_6
    return-void

    .line 430
    :cond_7
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 431
    .line 432
    .line 433
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 434
    .line 435
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->m()Ljava/util/ArrayList;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    new-instance v0, Ll/kw3;

    .line 440
    .line 441
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 446
    .line 447
    .line 448
    move-result v5

    .line 449
    add-int/2addr v5, v3

    .line 450
    invoke-direct {v0, v1, v5}, Ll/kw3;-><init>(Landroidx/fragment/app/FragmentManager;I)V

    .line 451
    .line 452
    .line 453
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->c:Ll/kw3;

    .line 454
    .line 455
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 456
    .line 457
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 458
    .line 459
    .line 460
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 461
    .line 462
    invoke-virtual {v0, v4}, Lcom/google/android/material/tabs/TabLayout;->setTabGravity(I)V

    .line 463
    .line 464
    .line 465
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 466
    .line 467
    invoke-virtual {v0, v3}, Lcom/google/android/material/tabs/TabLayout;->setTabMode(I)V

    .line 468
    .line 469
    .line 470
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 471
    .line 472
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 473
    .line 474
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->k()Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v1

    .line 478
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 479
    .line 480
    .line 481
    move-result v1

    .line 482
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 483
    .line 484
    .line 485
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 486
    .line 487
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 488
    .line 489
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->n()Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object v1

    .line 493
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 494
    .line 495
    .line 496
    move-result v1

    .line 497
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 498
    .line 499
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->i()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v3

    .line 503
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 504
    .line 505
    .line 506
    move-result v3

    .line 507
    invoke-virtual {v0, v1, v3}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    .line 508
    .line 509
    .line 510
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 511
    .line 512
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 513
    .line 514
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->l()Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 519
    .line 520
    .line 521
    move-result v1

    .line 522
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 523
    .line 524
    .line 525
    invoke-virtual {v2}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    .line 526
    .line 527
    .line 528
    move-result-object v0

    .line 529
    check-cast v0, Landroid/os/Bundle;

    .line 530
    .line 531
    const-string v1, "position"

    .line 532
    .line 533
    invoke-virtual {v0, v1, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 534
    .line 535
    .line 536
    new-instance v3, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 537
    .line 538
    invoke-direct {v3}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;-><init>()V

    .line 539
    .line 540
    .line 541
    invoke-virtual {v3, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 542
    .line 543
    .line 544
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->c:Ll/kw3;

    .line 545
    .line 546
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 547
    .line 548
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->b()Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object v5

    .line 552
    invoke-virtual {v0, v3, v5, v4}, Ll/kw3;->j(Landroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    .line 553
    .line 554
    .line 555
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 556
    .line 557
    .line 558
    move-result v0

    .line 559
    if-ge v4, v0, :cond_8

    .line 560
    .line 561
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 562
    .line 563
    .line 564
    move-result-object v0

    .line 565
    check-cast v0, Ljava/lang/String;

    .line 566
    .line 567
    add-int/lit8 v4, v4, 0x1

    .line 568
    .line 569
    invoke-virtual {v2}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    .line 570
    .line 571
    .line 572
    move-result-object v3

    .line 573
    check-cast v3, Landroid/os/Bundle;

    .line 574
    .line 575
    invoke-virtual {v3, v1, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 576
    .line 577
    .line 578
    const-string v5, "filter"

    .line 579
    .line 580
    invoke-virtual {v3, v5, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    new-instance v5, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 584
    .line 585
    invoke-direct {v5}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;-><init>()V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v5, v3}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 589
    .line 590
    .line 591
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->c:Ll/kw3;

    .line 592
    .line 593
    invoke-virtual {v3, v5, v0, v4}, Ll/kw3;->j(Landroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    .line 594
    .line 595
    .line 596
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->f:Landroidx/viewpager/widget/ViewPager;

    .line 597
    .line 598
    invoke-virtual {v0, v4}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 599
    .line 600
    .line 601
    goto :goto_1

    .line 602
    :cond_8
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->f:Landroidx/viewpager/widget/ViewPager;

    .line 603
    .line 604
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->c:Ll/kw3;

    .line 605
    .line 606
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 607
    .line 608
    .line 609
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->c:Ll/kw3;

    .line 610
    .line 611
    invoke-virtual {p1}, Ll/cf60;->notifyDataSetChanged()V

    .line 612
    .line 613
    .line 614
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->f:Landroidx/viewpager/widget/ViewPager;

    .line 615
    .line 616
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;

    .line 617
    .line 618
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 619
    .line 620
    invoke-direct {v0, v1}, Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    .line 621
    .line 622
    .line 623
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 624
    .line 625
    .line 626
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 627
    .line 628
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->f:Landroidx/viewpager/widget/ViewPager;

    .line 629
    .line 630
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 631
    .line 632
    .line 633
    return-void

    .line 634
    :cond_9
    :try_start_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 635
    .line 636
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 637
    .line 638
    .line 639
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 640
    :catchall_0
    move-exception p0

    .line 641
    const-string p1, "Cannot find a valid notification inbox bundle to show!"

    .line 642
    .line 643
    invoke-static {p1, p0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 644
    .line 645
    .line 646
    return-void
.end method

.method public onDestroy()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->i:Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapAPI;->H()Lcom/clevertap/android/sdk/g;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/g;->h()Ll/bu9;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ll/bu9;->M(Landroid/app/Activity;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->d:Lcom/clevertap/android/sdk/CTInboxStyleConfig;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CTInboxStyleConfig;->o()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 46
    .line 47
    instance-of v2, v1, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 48
    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v3, "Removing fragment - "

    .line 54
    .line 55
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v2}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->j:Lcom/clevertap/android/sdk/i;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2, p0, p1, p3}, Lcom/clevertap/android/sdk/i;->h(Landroid/app/Activity;I[I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->j:Lcom/clevertap/android/sdk/i;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/clevertap/android/sdk/i;->g(Landroid/app/Activity;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public p(Landroid/content/Context;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "CTInboxActivity:messageDidShow() called with: data = ["

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, "], inboxMessage = ["

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->e()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, "]"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p3, p2}, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->I0(Landroid/os/Bundle;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

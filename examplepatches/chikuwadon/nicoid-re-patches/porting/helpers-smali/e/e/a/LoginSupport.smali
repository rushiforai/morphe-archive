.class public final Le/e/a/LoginSupport;
.super Ljava/lang/Object;
.source "LoginSupport.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static builder(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/AlertDialog$Builder;
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "title"    # Ljava/lang/String;

    .line 163
    invoke-static {p0, p1}, Le/e/a/LoginSupport;->label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    .local v0, "heading":Landroid/widget/TextView;
    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 164
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setCustomTitle(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    return-object v1
.end method

.method private static color(Landroid/content/Context;I)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attr"    # I

    .line 178
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .local v0, "value":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 179
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    if-nez v1, :cond_14

    iget v1, v0, Landroid/util/TypedValue;->data:I

    goto :goto_22

    :cond_14
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    :goto_22
    return v1
.end method

.method private static column(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .line 167
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v0, "view":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 168
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41800000    # 16.0f

    mul-float v1, v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 169
    .local v1, "pad":I
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    return-object v0
.end method

.method private static input(Landroid/app/Activity;)V
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;

    .line 112
    invoke-static {p0}, Le/e/a/LoginSupport;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 113
    .local v0, "content":Landroid/widget/LinearLayout;
    const-string v1, "\u5225\u306e\u7aef\u672b\u30fbPC\u3067\u30cb\u30b3\u30cb\u30b3\u306b\u30ed\u30b0\u30a4\u30f3\u3057\u3001\u30d6\u30e9\u30a6\u30b6\u306eCookie\u304b\u3089user_session\u306e\u5024\u3092\u8cbc\u308a\u4ed8\u3051\u3066\u304f\u3060\u3055\u3044\u3002user_session=\u2026 \u306e\u5f62\u5f0f\u3067\u3082\u5165\u529b\u3067\u304d\u307e\u3059\u3002Cookie\u306f\u4ed6\u306e\u4eba\u306b\u6e21\u3055\u306a\u3044\u3067\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p0, v1}, Le/e/a/LoginSupport;->label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 114
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 115
    .local v1, "input":Landroid/widget/EditText;
    const-string v2, "user_session"

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 116
    const v2, 0x80081

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 117
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 118
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setSaveEnabled(Z)V

    .line 119
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v4, v5, :cond_2f

    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setImportantForAutofill(I)V

    .line 120
    :cond_2f
    new-array v2, v2, [Landroid/text/InputFilter;

    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    const/16 v5, 0x4000

    invoke-direct {v4, v5}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 121
    const v2, 0x1010036

    invoke-static {p0, v2}, Le/e/a/LoginSupport;->color(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 122
    const v2, 0x101009a

    invoke-static {p0, v2}, Le/e/a/LoginSupport;->color(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 123
    invoke-virtual {v1}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f03005e

    invoke-static {v2, v3}, Le/e/a/LoginSupport;->color(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 124
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 125
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .local v2, "scroll":Landroid/widget/ScrollView;
    invoke-virtual {v2, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 126
    const-string v3, "Cookie\u624b\u52d5\u5165\u529b"

    invoke-static {p0, v3}, Le/e/a/LoginSupport;->builder(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 127
    const-string v4, "\u4fdd\u5b58"

    invoke-static {v4}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v4, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v4}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 128
    .local v3, "dialog":Landroid/app/AlertDialog;
    new-instance v4, Le/e/a/LoginSupport$5;

    invoke-direct {v4, v1}, Le/e/a/LoginSupport$5;-><init>(Landroid/widget/EditText;)V

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 129
    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x2000

    invoke-virtual {v4, v5}, Landroid/view/Window;->addFlags(I)V

    .line 130
    invoke-static {v3, p0}, Le/e/a/LoginSupport;->show(Landroid/app/AlertDialog;Landroid/app/Activity;)V

    .line 131
    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v4

    new-instance v5, Le/e/a/LoginSupport$6;

    invoke-direct {v5, v1, p0, v3}, Le/e/a/LoginSupport$6;-><init>(Landroid/widget/EditText;Landroid/app/Activity;Landroid/app/AlertDialog;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    return-void
.end method

.method private static label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/String;

    .line 172
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v0, "view":Landroid/widget/TextView;
    invoke-static {p1}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 173
    const v2, 0x1010036

    invoke-static {p0, v2}, Le/e/a/LoginSupport;->color(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 174
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float v2, v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 175
    .local v1, "pad":I
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method static synthetic lambda$input$5(Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .registers 3
    .param p0, "input"    # Landroid/widget/EditText;
    .param p1, "d"    # Landroid/content/DialogInterface;

    .line 128
    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$input$6(Landroid/widget/EditText;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 8
    .param p0, "input"    # Landroid/widget/EditText;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "dialog"    # Landroid/app/AlertDialog;
    .param p3, "v"    # Landroid/view/View;

    .line 133
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ManualCookie;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_c} :catch_34

    .line 136
    .local v0, "cookie":Ljava/lang/String;
    nop

    .line 138
    const/4 v1, 0x1

    :try_start_e
    invoke-static {p1, v0}, Le/e/a/LoginSupport;->save(Landroid/content/Context;Ljava/lang/String;)V

    .line 139
    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    .line 140
    const-string v2, "Cookie\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f\u3002\u8a8d\u8a3c\u304c\u901a\u3089\u306a\u3044\u5834\u5408\u306f\u3001\u30ed\u30b0\u30a4\u30f3\u3057\u76f4\u3057\u3066Cookie\u3092\u518d\u53d6\u5f97\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v2}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 141
    invoke-virtual {p1}, Landroid/app/Activity;->recreate()V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_24} :catch_25

    .line 145
    goto :goto_33

    .line 142
    :catch_25
    move-exception v2

    .line 144
    .local v2, "failure":Ljava/lang/Exception;
    const-string v3, "Cookie\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v3}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 146
    .end local v2    # "failure":Ljava/lang/Exception;
    :goto_33
    return-void

    .line 134
    .end local v0    # "cookie":Ljava/lang/String;
    :catch_34
    move-exception v0

    .line 135
    .local v0, "invalid":Ljava/lang/IllegalArgumentException;
    const-string v1, "user_session\u306e\u5024\u3001\u307e\u305f\u306fuser_session=\u2026 \u306e\u5f62\u5f0f\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v1}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$loadLogin$2(Landroid/webkit/CookieManager;Landroid/content/SharedPreferences;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 7
    .param p0, "cookies"    # Landroid/webkit/CookieManager;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "web"    # Landroid/webkit/WebView;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "removed"    # Ljava/lang/Boolean;

    .line 86
    invoke-virtual {p0}, Landroid/webkit/CookieManager;->flush()V

    .line 87
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "nicoid_clear_web_login"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 88
    invoke-virtual {p2, p3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method static synthetic lambda$open$3(Landroid/app/AlertDialog;Landroid/app/Activity;Landroid/view/View;)V
    .registers 5
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "v"    # Landroid/view/View;

    .line 103
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    .line 104
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.ModernLoginActivity"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 105
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 106
    return-void
.end method

.method static synthetic lambda$open$4(Landroid/app/AlertDialog;Landroid/app/Activity;Landroid/view/View;)V
    .registers 3
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "v"    # Landroid/view/View;

    .line 107
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    invoke-static {p1}, Le/e/a/LoginSupport;->input(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$settings$0(Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;I)V
    .registers 3
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 42
    invoke-static {p0}, Le/e/a/LoginSupport;->logout(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$settings$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 5
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;
    .param p1, "p"    # Landroid/preference/Preference;

    .line 40
    const-string v0, "\u30ed\u30b0\u30a2\u30a6\u30c8"

    invoke-static {p0, v0}, Le/e/a/LoginSupport;->builder(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 41
    const-string v2, "\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u3092\u524a\u9664\u3057\u3066\u30ed\u30b0\u30a2\u30a6\u30c8\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v2}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 42
    invoke-static {v0}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Le/e/a/LoginSupport$4;

    invoke-direct {v2, p0}, Le/e/a/LoginSupport$4;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 43
    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v1}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 44
    .local v0, "dialog":Landroid/app/AlertDialog;
    invoke-static {v0, p0}, Le/e/a/LoginSupport;->show(Landroid/app/AlertDialog;Landroid/app/Activity;)V

    const/4 v1, 0x1

    return v1
.end method

.method public static loadLogin(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 5
    .param p0, "web"    # Landroid/webkit/WebView;
    .param p1, "url"    # Ljava/lang/String;

    .line 82
    invoke-virtual {p0}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 83
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "nicoid_clear_web_login"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_15

    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void

    .line 84
    :cond_15
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    .line 85
    .local v1, "cookies":Landroid/webkit/CookieManager;
    new-instance v2, Le/e/a/LoginSupport$3;

    invoke-direct {v2, v1, v0, p0, p1}, Le/e/a/LoginSupport$3;-><init>(Landroid/webkit/CookieManager;Landroid/content/SharedPreferences;Landroid/webkit/WebView;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V

    .line 90
    return-void
.end method

.method private static logout(Landroid/app/Activity;)V
    .registers 12
    .param p0, "activity"    # Landroid/app/Activity;

    .line 63
    const-string v0, "b"

    const/4 v1, 0x1

    :try_start_3
    const-string v2, "e.e.a.v0"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 64
    .local v2, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v3, v1, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v2, v0, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v1, [Ljava/lang/Object;

    const-string v6, ""

    aput-object v6, v4, v5

    const/4 v6, 0x0

    invoke-virtual {v3, v6, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 65
    .local v3, "empty":Ljava/lang/Object;
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 66
    .local v4, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "save_cookie"

    invoke-interface {v7, v8}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "login_mail"

    invoke-interface {v7, v8}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "login_pass"

    invoke-interface {v7, v8}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "nologin"

    .line 67
    invoke-interface {v7, v8, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "nicoid_clear_web_login"

    invoke-interface {v7, v8, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v7

    if-eqz v7, :cond_80

    .line 69
    invoke-virtual {v2, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 70
    .local v7, "previous":Ljava/lang/Object;
    if-eqz v7, :cond_68

    const-string v8, "org.apache.http.client.CookieStore"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const-string v9, "clear"

    new-array v10, v5, [Ljava/lang/Class;

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    new-array v9, v5, [Ljava/lang/Object;

    invoke-virtual {v8, v7, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    :cond_68
    invoke-virtual {v2, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v6, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    const-string v0, "\u30ed\u30b0\u30a2\u30a6\u30c8\u3057\u307e\u3057\u305f"

    invoke-static {v0}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 74
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    .line 77
    .end local v2    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "empty":Ljava/lang/Object;
    .end local v4    # "prefs":Landroid/content/SharedPreferences;
    .end local v7    # "previous":Ljava/lang/Object;
    goto :goto_94

    .line 68
    .restart local v2    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "empty":Ljava/lang/Object;
    .restart local v4    # "prefs":Landroid/content/SharedPreferences;
    :cond_80
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    .end local p0    # "activity":Landroid/app/Activity;
    throw v0
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_86} :catch_86

    .line 75
    .end local v2    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "empty":Ljava/lang/Object;
    .end local v4    # "prefs":Landroid/content/SharedPreferences;
    .restart local p0    # "activity":Landroid/app/Activity;
    :catch_86
    move-exception v0

    .line 76
    .local v0, "failure":Ljava/lang/Exception;
    const-string v2, "\u30ed\u30b0\u30a2\u30a6\u30c8\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v2}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 78
    .end local v0    # "failure":Ljava/lang/Exception;
    :goto_94
    return-void
.end method

.method public static open(Landroid/app/Activity;)V
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;

    .line 93
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 94
    :cond_7
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 95
    invoke-static {p0}, Le/e/a/LoginSupport;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 96
    .local v0, "choices":Landroid/widget/LinearLayout;
    const-string v1, "\u901a\u5e38\u30ed\u30b0\u30a4\u30f3"

    invoke-static {p0, v1}, Le/e/a/LoginSupport;->label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    .line 97
    .local v1, "web":Landroid/widget/TextView;
    const-string v2, "Cookie\u624b\u52d5\u5165\u529b"

    invoke-static {p0, v2}, Le/e/a/LoginSupport;->label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    .line 98
    .local v2, "manual":Landroid/widget/TextView;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setFocusable(Z)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 99
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 100
    const-string v3, "\u30ed\u30b0\u30a4\u30f3\u65b9\u6cd5"

    invoke-static {p0, v3}, Le/e/a/LoginSupport;->builder(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 101
    const-string v4, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v4}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 102
    .local v3, "dialog":Landroid/app/AlertDialog;
    new-instance v4, Le/e/a/LoginSupport$0;

    invoke-direct {v4, v3, p0}, Le/e/a/LoginSupport$0;-><init>(Landroid/app/AlertDialog;Landroid/app/Activity;)V

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    new-instance v4, Le/e/a/LoginSupport$1;

    invoke-direct {v4, v3, p0}, Le/e/a/LoginSupport$1;-><init>(Landroid/app/AlertDialog;Landroid/app/Activity;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    invoke-static {v3, p0}, Le/e/a/LoginSupport;->show(Landroid/app/AlertDialog;Landroid/app/Activity;)V

    .line 109
    return-void
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5
    .param p0, "group"    # Landroid/preference/PreferenceGroup;
    .param p1, "target"    # Landroid/preference/Preference;

    .line 50
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-ge v0, v1, :cond_1f

    .line 51
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .line 52
    .local v1, "child":Landroid/preference/Preference;
    if-ne v1, p1, :cond_e

    return-object p0

    .line 53
    :cond_e
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1c

    .line 54
    move-object v2, v1

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/LoginSupport;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .line 55
    .local v2, "result":Landroid/preference/PreferenceGroup;
    if-eqz v2, :cond_1c

    return-object v2

    .line 50
    .end local v1    # "child":Landroid/preference/Preference;
    .end local v2    # "result":Landroid/preference/PreferenceGroup;
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 58
    .end local v0    # "n":I
    :cond_1f
    const/4 v0, 0x0

    return-object v0
.end method

.method private static save(Landroid/content/Context;Ljava/lang/String;)V
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cookie"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 150
    const-string v0, "e.e.a.v0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 151
    .local v0, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "org.apache.http.client.CookieStore"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 152
    .local v1, "storeType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "b"

    invoke-virtual {v0, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v6, v2, [Ljava/lang/Object;

    aput-object p1, v6, v5

    const/4 v7, 0x0

    invoke-virtual {v3, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 153
    .local v3, "store":Ljava/lang/Object;
    new-array v6, v2, [Ljava/lang/Class;

    aput-object v1, v6, v5

    const-string v8, "a"

    invoke-virtual {v0, v8, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v3, v2, v5

    invoke-virtual {v6, v7, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 154
    .local v2, "serialized":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_65

    .line 155
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 157
    .local v6, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "save_cookie"

    invoke-interface {v8, v9, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "nologin"

    invoke-interface {v8, v9, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v5

    if-eqz v5, :cond_5f

    .line 159
    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v7, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 160
    return-void

    .line 158
    :cond_5f
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 154
    .end local v6    # "prefs":Landroid/content/SharedPreferences;
    :cond_65
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 5
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 32
    const-string v0, "login"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 33
    .local v0, "login":Landroid/preference/Preference;
    if-eqz v0, :cond_42

    const-string v1, "nicoid_logout"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_11

    goto :goto_42

    .line 34
    :cond_11
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/LoginSupport;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .line 35
    .local v2, "group":Landroid/preference/PreferenceGroup;
    if-nez v2, :cond_1c

    return-void

    .line 36
    :cond_1c
    new-instance v3, Landroid/preference/Preference;

    invoke-direct {v3, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 37
    .local v3, "logout":Landroid/preference/Preference;
    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v1, "\u30ed\u30b0\u30a2\u30a6\u30c8"

    invoke-static {v1}, Le/e/a/LoginSupport;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 38
    invoke-virtual {v0}, Landroid/preference/Preference;->getOrder()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setOrder(I)V

    .line 39
    new-instance v1, Le/e/a/LoginSupport$2;

    invoke-direct {v1, p0}, Le/e/a/LoginSupport$2;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 46
    invoke-virtual {v2, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 47
    return-void

    .line 33
    .end local v2    # "group":Landroid/preference/PreferenceGroup;
    .end local v3    # "logout":Landroid/preference/Preference;
    :cond_42
    :goto_42
    return-void
.end method

.method private static show(Landroid/app/AlertDialog;Landroid/app/Activity;)V
    .registers 2
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "activity"    # Landroid/app/Activity;

    .line 182
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    .line 183
    invoke-static {p0}, Le/e/a/PlaybackSession;->formDialog(Landroid/app/AlertDialog;)V

    .line 185
    return-void
.end method

.method private static t(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "source"    # Ljava/lang/String;

    .line 29
    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.class public Lcom/sauzask/nicoid/NicoidSetting;
.super Landroid/preference/PreferenceActivity;
.source ""


# instance fields
.field public a:Landroid/content/SharedPreferences;

.field public b:Landroid/content/SharedPreferences$Editor;

.field public c:Landroid/os/Handler;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Landroid/app/AlertDialog;

.field public k:Ljava/lang/String;


# virtual methods
.method public a(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/Button;)I
    .registers 20

    move-object/from16 v7, p0

    const/4 v0, 0x1

    iput-boolean v0, v7, Lcom/sauzask/nicoid/NicoidSetting;->e:Z

    invoke-virtual/range {p1 .. p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p2 .. p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/widget/EditText;->length()I

    move-result v1

    if-eqz v1, :cond_8

    invoke-virtual/range {p2 .. p2}, Landroid/widget/EditText;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_6

    :cond_0
    const/4 v11, 0x0

    sput-object v11, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    iget-object v1, v7, Lcom/sauzask/nicoid/NicoidSetting;->b:Landroid/content/SharedPreferences$Editor;

    const-string v2, "save_cookie"

    invoke-interface {v1, v2, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    iget-object v1, v7, Lcom/sauzask/nicoid/NicoidSetting;->b:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    new-instance v12, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v13, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v13}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    sget-object v1, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    const-string v2, "http.cookie-store"

    invoke-interface {v13, v2, v1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieSpecs()Lorg/apache/http/cookie/CookieSpecRegistry;

    move-result-object v1

    new-instance v2, Lcom/sauzask/nicoid/NicoidSetting$k;

    invoke-direct {v2, v7}, Lcom/sauzask/nicoid/NicoidSetting$k;-><init>(Lcom/sauzask/nicoid/NicoidSetting;)V

    const-string v3, "lenient"

    invoke-virtual {v1, v3, v2}, Lorg/apache/http/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V

    invoke-virtual {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const-string v2, "http.protocol.cookie-policy"

    const-string v3, "lenient"

    invoke-interface {v1, v2, v3}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    const-string v2, "https://account.nicovideo.jp/api/v1/login?site=niconico"

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    const-string v3, "http.useragent"

    const-string v4, "Windows"

    invoke-interface {v2, v3, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    const-string v2, "Accept-Language"

    const-string v3, "ja-jp"

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v4, Lorg/apache/http/message/BasicNameValuePair;

    const-string v5, "mail_tel"

    invoke-direct {v4, v5, v8}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v4, Lorg/apache/http/message/BasicNameValuePair;

    const-string v5, "password"

    invoke-direct {v4, v5, v9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :try_start_0
    new-instance v4, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v5, "UTF-8"

    invoke-direct {v4, v2, v5}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    invoke-static {v12, v1, v13}, Lnicoid/network238/LegacyGet258;->executeLogin(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    invoke-virtual {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v2

    new-instance v4, Ljava/lang/String;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v1

    const-string v5, "UTF-8"

    invoke-direct {v4, v1, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "loaddata"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-string v1, "<form action=\"/mfa([^\"]+)\""

    const/16 v5, 0x20

    invoke-static {v1, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://account.nicovideo.jp/mfa"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v7, Lcom/sauzask/nicoid/NicoidSetting;->k:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ninUrl:"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v7, Lcom/sauzask/nicoid/NicoidSetting;->k:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v14, 0x2

    goto :goto_0

    :cond_1
    const/4 v14, 0x0

    :goto_0
    if-ne v14, v3, :cond_3

    :try_start_1
    new-instance v15, Ljava/lang/Object;

    invoke-direct {v15}, Ljava/lang/Object;-><init>()V

    iget-object v6, v7, Lcom/sauzask/nicoid/NicoidSetting;->c:Landroid/os/Handler;

    new-instance v5, Lcom/sauzask/nicoid/NicoidSetting$l;

    move-object v1, v5

    move-object/from16 v2, p0

    move-object v3, v15

    move-object/from16 v4, p1

    move-object v10, v5

    move-object/from16 v5, p2

    move-object v11, v6

    move-object/from16 v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidSetting$l;-><init>(Lcom/sauzask/nicoid/NicoidSetting;Ljava/lang/Object;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/Button;)V

    invoke-virtual {v11, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    monitor-enter v15
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    invoke-virtual {v15}, Ljava/lang/Object;->notify()V

    iput-boolean v0, v7, Lcom/sauzask/nicoid/NicoidSetting;->f:Z

    :goto_1
    iget-boolean v1, v7, Lcom/sauzask/nicoid/NicoidSetting;->f:Z

    if-eqz v1, :cond_2

    invoke-virtual {v15}, Ljava/lang/Object;->wait()V

    goto :goto_1

    :cond_2
    monitor-exit v15
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "otp"

    iget-object v4, v7, Lcom/sauzask/nicoid/NicoidSetting;->g:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "is_mfa_trusted_device"

    const-string v4, "true"

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "device_name"

    iget-object v4, v7, Lcom/sauzask/nicoid/NicoidSetting;->i:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    iget-object v3, v7, Lcom/sauzask/nicoid/NicoidSetting;->k:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    new-instance v3, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v4, "UTF-8"

    invoke-direct {v3, v1, v4}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    invoke-static {v12, v2, v13}, Lnicoid/network238/LegacyGet258;->executeLogin(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    invoke-virtual {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v2

    const/4 v1, 0x0

    iput-object v1, v7, Lcom/sauzask/nicoid/NicoidSetting;->k:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v15
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v0

    :cond_3
    :goto_2
    new-instance v1, Lnicoid/network238/SessionStore258;

    invoke-direct {v1}, Lnicoid/network238/SessionStore258;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_6

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u30ed\u30b0\u30a4\u30f3\u51e6\u7406:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v6}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v5}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "user_session"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v1, v4}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    const/4 v4, 0x1

    const/4 v14, 0x1

    :cond_4
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v5}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "mfa_trusted_device_token"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v1, v4}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    const/4 v4, 0x1

    const/4 v14, 0x1

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    if-eqz v4, :cond_7

    sput-object v1, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    iget-object v0, v7, Lcom/sauzask/nicoid/NicoidSetting;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u30af\u30c3\u30ad\u30fc\u3092\u53d6\u5f97\u3057\u307e\u3057\u305f"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v7, Lcom/sauzask/nicoid/NicoidSetting;->a:Landroid/content/SharedPreferences;

    const-string v3, "save_cookie"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object v1, v7, Lcom/sauzask/nicoid/NicoidSetting;->c:Landroid/os/Handler;

    new-instance v2, Lcom/sauzask/nicoid/NicoidSetting$a;

    invoke-direct {v2, v7, v0, v8, v9}, Lcom/sauzask/nicoid/NicoidSetting$a;-><init>(Lcom/sauzask/nicoid/NicoidSetting;Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-static {}, Le/e/a/v0;->b()Z

    :cond_7
    const/4 v1, 0x0

    iput-boolean v1, v7, Lcom/sauzask/nicoid/NicoidSetting;->e:Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    const/4 v14, 0x0

    :goto_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_5
    invoke-virtual {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    return v14

    :cond_8
    :goto_6
    const/4 v1, 0x0

    return v1
.end method

.method public final a(Ljava/lang/String;)Landroid/widget/Button;
    .registers 5

    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v1, 0x7f07005f

    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setGravity(I)V

    const/4 p1, 0x2

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1, v1}, Landroid/widget/Button;->setTextSize(IF)V

    const/high16 p1, -0x1000000

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public final a()V
    .registers 1

    invoke-static {p0}, Le/e/a/LoginSupport;->open(Landroid/app/Activity;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 10

    const-string v0, "info"

    invoke-static {}, Le/e/a/v0;->a()I

    const v1, 0x7f1000a2

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f120001

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->addPreferencesFromResource(I)V

    invoke-static {p0}, Le/e/a/ModernEnhancements;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/ModernShorts;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/FeedbackFixes;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/CommentGraph215;->settings(Landroid/preference/PreferenceActivity;)V

    const p1, 0x7f0f0120

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidSetting;->a:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidSetting;->a:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidSetting;->b:Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidSetting;->a:Landroid/content/SharedPreferences;

    const-string v1, "main_rotation"

    const-string v2, "1"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->setRequestedOrientation(I)V

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f040003

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    const/4 v1, 0x1

    const-string v2, "display_mode"

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/ListPreference;

    invoke-virtual {p1, v1}, Landroid/preference/ListPreference;->setEnabled(Z)V

    goto :goto_0

    :cond_0
    const-string p1, "setting_whole"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceGroup;

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :goto_0
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidSetting;->a:Landroid/content/SharedPreferences;

    const v2, 0x7f0f0161

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "app_lang"

    invoke-interface {p1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "0"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const-string v2, "about"

    if-eqz p1, :cond_1

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceGroup;

    const-string v4, "app_translation"

    invoke-virtual {p0, v4}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_1
    const-string p1, "com.google.android.gms"

    const/16 v4, 0x80

    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v6, p1, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    iput-boolean v5, p0, Lcom/sauzask/nicoid/NicoidSetting;->d:Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    nop

    :goto_1
    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidSetting;->d:Z

    const-string v6, "remove_ad_option"

    if-eqz p1, :cond_3

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceGroup;

    invoke-virtual {p0, v6}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_2
    const-string p1, "comment"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceGroup;

    const-string v2, "comment_cast_min"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_3
    invoke-static {}, Le/e/a/v0;->f()I

    move-result p1

    const/16 v2, 0xe

    if-ge p1, v2, :cond_4

    goto :goto_2

    :cond_4
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result p1

    const/4 v2, 0x4

    invoke-static {v2}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v2

    const/4 v7, 0x3

    invoke-static {v7}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v7

    if-eqz p1, :cond_5

    if-eqz v2, :cond_5

    if-nez v7, :cond_6

    :cond_5
    const/4 v5, 0x1

    :cond_6
    :goto_2
    if-nez v5, :cond_7

    const-string p1, "player"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceGroup;

    const-string v1, "player_statusbar_hide"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_7
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v1, "intent_type"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    new-instance v2, Lcom/sauzask/nicoid/NicoidSetting$d;

    invoke-direct {v2, p0, p1}, Lcom/sauzask/nicoid/NicoidSetting$d;-><init>(Lcom/sauzask/nicoid/NicoidSetting;Landroid/content/pm/PackageManager;)V

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    check-cast p1, Landroid/preference/ListPreference;

    new-instance v1, Lcom/sauzask/nicoid/NicoidSetting$e;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidSetting$e;-><init>(Lcom/sauzask/nicoid/NicoidSetting;)V

    invoke-virtual {p1, v1}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    :try_start_1
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Version."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    :goto_3
    const-string p1, "cache_all_delete"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    new-instance v1, Lcom/sauzask/nicoid/NicoidSetting$f;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidSetting$f;-><init>(Lcom/sauzask/nicoid/NicoidSetting;)V

    invoke-virtual {p1, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    const-string p1, "license"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    new-instance v1, Lcom/sauzask/nicoid/NicoidSetting$g;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidSetting$g;-><init>(Lcom/sauzask/nicoid/NicoidSetting;)V

    invoke-virtual {p1, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    const-string p1, "login"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    new-instance v1, Lcom/sauzask/nicoid/NicoidSetting$h;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidSetting$h;-><init>(Lcom/sauzask/nicoid/NicoidSetting;)V

    invoke-virtual {p1, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    new-instance v0, Lcom/sauzask/nicoid/NicoidSetting$j;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidSetting$j;-><init>(Lcom/sauzask/nicoid/NicoidSetting;)V

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-static {p0}, Le/e/a/PreferenceDialogs;->attach(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/NoMini;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/GestureControls110;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/CacheControl110;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/SettingsPlacement233;->finish(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method protected onResume()V
    .registers 5

    invoke-static {p0}, Le/e/a/DownloadUi115;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    const-string v0, "cache_dir"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u4fdd\u5b58\u5148: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_0
    const-string v0, "login"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {v1}, Le/e/a/v0;->a(Landroid/content/SharedPreferences;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u3092\u4fdd\u5b58\u6e08\u307f\uff08\u30b5\u30a4\u30c8\u5074\u306e\u8a8d\u8a3c\u306f\u672a\u78ba\u8a8d\uff09"

    goto :goto_0

    :cond_1
    const-string v1, "\u672a\u30ed\u30b0\u30a4\u30f3\u30fb\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u306a\u3057"

    :goto_0
    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_2
    invoke-static {p0}, Le/e/a/CacheFolders;->summary(Landroid/preference/PreferenceActivity;)V

    invoke-static/range {p0 .. p0}, Le/e/a/TemporaryCache221;->refreshLabels(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method public onStart()V
    .registers 4

    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onStart()V

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "login"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "login"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidSetting;->a()V

    :cond_0
    return-void
.end method

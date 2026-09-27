.class final Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;
.super Ljava/lang/Object;
.source "ProviderEndpoint.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static ark(Ljava/lang/String;)Z
    .registers 2

    .line 8
    const-string v0, "ark\\.[a-z0-9-]+\\.volces\\.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static authenticate(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 44
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "openai.azure.com"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->domain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_17

    const-string v0, "services.ai.azure.com"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->domain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_15

    goto :goto_17

    :cond_15
    const/4 p1, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 p1, 0x1

    :goto_18
    if-eqz p1, :cond_1d

    .line 45
    const-string v0, "api-key"

    goto :goto_1f

    :cond_1d
    const-string v0, "Authorization"

    :goto_1f
    if-eqz p1, :cond_22

    goto :goto_30

    :cond_22
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Bearer "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_30
    invoke-virtual {p0, v0, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static bailian(Ljava/lang/String;)Z
    .registers 2

    .line 10
    const-string v0, "dashscope.aliyuncs.com"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->domain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_23

    const-string v0, "dashscope-intl.aliyuncs.com"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->domain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_23

    const-string v0, "dashscope-us.aliyuncs.com"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->domain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_23

    const-string v0, "maas.aliyuncs.com"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->domain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_21

    goto :goto_23

    :cond_21
    const/4 p0, 0x0

    return p0

    :cond_23
    :goto_23
    const/4 p0, 0x1

    return p0
.end method

.method static chat(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    .line 21
    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->resolve(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static domain(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1b

    goto :goto_1d

    :cond_1b
    const/4 p0, 0x0

    return p0

    :cond_1d
    :goto_1d
    const/4 p0, 0x1

    return p0
.end method

.method static host(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 9
    :try_start_0
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    return-object p0

    :catch_f
    const-string p0, ""

    return-object p0
.end method

.method static models(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    const/4 v0, 0x1

    .line 22
    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->resolve(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static resolve(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 10

    .line 24
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->validate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v1

    .line 25
    :goto_10
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_24

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    .line 26
    :cond_24
    const-string v2, "/chat/completions"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "/models"

    if-eqz v4, :cond_39

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x11

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_5c

    .line 27
    :cond_39
    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4a

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x7

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_5c

    .line 28
    :cond_4a
    const-string v4, "/completions"

    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5c

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0xc

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 29
    :cond_5c
    :goto_5c
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_150

    .line 30
    const-string v3, "coding.dashscope.aliyuncs.com"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v4, "/v1"

    if-eqz v3, :cond_6f

    :cond_6c
    move-object v1, v4

    goto/16 :goto_150

    .line 31
    :cond_6f
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->bailian(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_79

    const-string v1, "/compatible-mode/v1"

    goto/16 :goto_150

    .line 32
    :cond_79
    const-string v3, "openrouter.ai"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_85

    const-string v1, "/api/v1"

    goto/16 :goto_150

    .line 33
    :cond_85
    const-string v3, "api.groq.com"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-string v7, "/openai/v1"

    if-nez v6, :cond_149

    const-string v6, "api.cerebras.ai"

    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_99

    goto/16 :goto_149

    .line 34
    :cond_99
    const-string v3, "generativelanguage.googleapis.com"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a5

    const-string v1, "/v1beta/openai"

    goto/16 :goto_150

    .line 35
    :cond_a5
    const-string v3, "open.bigmodel.cn"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b1

    const-string v1, "/api/paas/v4"

    goto/16 :goto_150

    .line 36
    :cond_b1
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->ark(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_bb

    const-string v1, "/api/v3"

    goto/16 :goto_150

    .line 37
    :cond_bb
    const-string v3, "openai.azure.com"

    invoke-static {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->domain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_147

    const-string v3, "services.ai.azure.com"

    invoke-static {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->domain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_cd

    goto/16 :goto_147

    .line 38
    :cond_cd
    const-string v3, "api.anthropic.com"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v6, "api.fireworks.ai"

    if-nez v3, :cond_13d

    const-string v3, "api.minimax.io"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.minimaxi.com"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.openai.com"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.deepseek.com"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.siliconflow.cn"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.siliconflow.com"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.moonshot.cn"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.moonshot.ai"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.mistral.ai"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.x.ai"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.together.ai"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    const-string v3, "api.together.xyz"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_150

    :cond_13d
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6c

    const-string p0, "/inference/v1"

    move-object v1, p0

    goto :goto_150

    :cond_147
    :goto_147
    move-object v1, v7

    goto :goto_150

    .line 33
    :cond_149
    :goto_149
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6c

    goto :goto_147

    :cond_150
    :goto_150
    if-eqz p1, :cond_163

    .line 40
    const-string p0, "/deployments/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_15b

    goto :goto_163

    :cond_15b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Azure deployment URLs require a manually entered deployment name"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 41
    :cond_163
    :goto_163
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "://"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URI;->getRawAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_181

    move-object v2, v5

    :cond_181
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_18d

    const-string p1, ""

    goto :goto_19f

    :cond_18d
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "?"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_19f
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static validate(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    if-nez p0, :cond_5

    .line 13
    :try_start_2
    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_9
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_8c

    .line 14
    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2b

    const-string v0, "http"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8c

    :cond_2b
    invoke-virtual {p0}, Ljava/net/URI;->getRawUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8c

    invoke-virtual {p0}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8c

    .line 15
    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    :goto_3b
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_3b

    .line 16
    :cond_4f
    const-string v1, "/messages"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_84

    const-string v1, "/responses"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_84

    const-string v1, ":generateContent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_84

    const-string v1, "/api/generate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_84

    const-string v1, "/api/chat"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_84

    const-string v1, "/apps/anthropic"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_84

    .line 18
    invoke-virtual {p0}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 17
    :cond_84
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Use an OpenAI-compatible Chat Completions endpoint, not a native Messages/Responses/Generate endpoint"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 14
    :cond_8c
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
    :try_end_92
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_92} :catch_92

    :catch_92
    move-exception p0

    .line 19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid API URL: use an HTTP(S) OpenAI-compatible base URL without credentials or fragments"

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.class public final Ll/eis0;
.super Ll/yvb0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/fis0;


# direct methods
.method public constructor <init>(Ll/fis0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/eis0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p1, p0, Ll/eis0;->b:Ll/fis0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/yvb0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "Failed to generate query info for Custom Tab error: "

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :try_start_0
    iget-object v0, p0, Ll/eis0;->b:Ll/fis0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/fis0;->a(Ll/fis0;)Ll/yzb;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object p0, p0, Ll/eis0;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0, p1}, Ll/fis0;->c(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {v1, p0, p1}, Ll/yzb;->g(Ljava/lang/String;Landroid/os/Bundle;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception p0

    .line 36
    const-string p1, "Error creating PACT Error Response JSON: "

    .line 37
    .line 38
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final b(Ll/xvb0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/xvb0;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :try_start_0
    iget-object v0, p0, Ll/eis0;->b:Ll/fis0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/fis0;->a(Ll/fis0;)Ll/yzb;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Ll/eis0;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Ll/fis0;->d(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {v1, p0, p1}, Ll/yzb;->g(Ljava/lang/String;Landroid/os/Bundle;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catch_0
    move-exception p0

    .line 27
    const-string p1, "Error creating PACT Signal Response JSON: "

    .line 28
    .line 29
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.class public Ll/ryh;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public static a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "tantanapp://webview?title="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, "&url="

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static b(Landroid/app/Activity;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()V
    .locals 2

    .line 1
    new-instance v0, Ll/q8h;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q8h;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "topic_webview"

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/nae0;->p(Ljava/lang/String;Ll/o5e0;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/o3h;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/o3h;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "visitors"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/nae0;->p(Ljava/lang/String;Ll/o5e0;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/m3h;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/m3h;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v1, "moment_activities"

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/nae0;->p(Ljava/lang/String;Ll/o5e0;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/n3h;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/n3h;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v1, "moment-inspire"

    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/nae0;->p(Ljava/lang/String;Ll/o5e0;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/lng;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/lng;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v1, "ai_story"

    .line 47
    .line 48
    invoke-static {v1, v0}, Ll/nae0;->p(Ljava/lang/String;Ll/o5e0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

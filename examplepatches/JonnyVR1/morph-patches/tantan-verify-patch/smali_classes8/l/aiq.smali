.class public Ll/aiq;
.super Ll/ajq;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ajq;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Ljava/net/URI;ZLjava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-super {p0, p1, p2, p3, p4}, Ll/ajq;->b(Ljava/net/URI;ZLjava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p2, Ll/aiq$a;

    .line 9
    .line 10
    invoke-direct {p2, p0, p3, p4, p1}, Ll/aiq$a;-><init>(Ll/aiq;Ljava/lang/String;Ljava/lang/String;Ljava/net/URI;)V

    .line 11
    .line 12
    .line 13
    return-object p2
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "<a href *= *\" *tantan://msgReport.*\">.*</a>"

    .line 2
    .line 3
    return-object p0
.end method

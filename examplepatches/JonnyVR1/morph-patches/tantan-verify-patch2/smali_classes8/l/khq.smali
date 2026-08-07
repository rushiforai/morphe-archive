.class public Ll/khq;
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
    new-instance p2, Ll/khq$a;

    .line 2
    .line 3
    invoke-direct {p2, p0, p1}, Ll/khq$a;-><init>(Ll/khq;Ljava/net/URI;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "<a href = \"tantan://create_ai_avatar\">.*</a>"

    .line 2
    .line 3
    return-object p0
.end method

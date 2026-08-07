.class public Ll/siq;
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
    new-instance p1, Ll/siq$a;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2, p4, p3}, Ll/siq$a;-><init>(Ll/siq;ZLjava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "<a href = \"tantan://verification/school/rejected\">.*</a>"

    .line 2
    .line 3
    return-object p0
.end method

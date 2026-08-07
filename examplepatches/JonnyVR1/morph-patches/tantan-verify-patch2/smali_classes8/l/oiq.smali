.class public Ll/oiq;
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
    .locals 6

    .line 1
    new-instance v0, Ll/oiq$a;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v5, p1

    .line 5
    move v2, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v3, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/oiq$a;-><init>(Ll/oiq;ZLjava/lang/String;Ljava/lang/String;Ljava/net/URI;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "<a href = \"tantan://switchaccount.*\">.*</a>"

    .line 2
    .line 3
    return-object p0
.end method

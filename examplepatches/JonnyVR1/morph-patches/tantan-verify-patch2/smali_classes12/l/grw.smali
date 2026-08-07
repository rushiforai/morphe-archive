.class public Ll/grw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iml;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v6, Ll/x4d0;

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-direct {v6, p1, p5, p0}, Ll/x4d0;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;)V

    .line 5
    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    const-string v5, "form"

    .line 9
    .line 10
    move-object v0, p1

    .line 11
    move-object v1, p2

    .line 12
    move-object v2, p3

    .line 13
    move-object v3, p4

    .line 14
    move-object v7, p5

    .line 15
    invoke-static/range {v0 .. v7}, Ll/pl3;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ll/x4d0;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

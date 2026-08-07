.class public final Ll/x1t0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/x1t0;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/x1t0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Lorg/json/JSONObject;)Ll/x1t0;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "enable_prewarming"

    .line 3
    .line 4
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-string v1, "prefetch_url"

    .line 9
    .line 10
    const-string v2, ""

    .line 11
    .line 12
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v1, Ll/x1t0;

    .line 17
    .line 18
    invoke-direct {v1, v0, p0}, Ll/x1t0;-><init>(ZLjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.class final Lcom/momo/xeengine/xnative/JNIHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


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

.method public static analytics(ILjava/lang/String;JLjava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->getAnalyticsCallback()Lcom/momo/xeengine/AnalyticsCallback;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Lcom/momo/xeengine/AnalyticsCallback$Params;

    .line 8
    .line 9
    move v2, p0

    .line 10
    move-object v3, p1

    .line 11
    move-wide v4, p2

    .line 12
    move-object v6, p4

    .line 13
    invoke-direct/range {v1 .. v6}, Lcom/momo/xeengine/AnalyticsCallback$Params;-><init>(ILjava/lang/String;JLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Lcom/momo/xeengine/AnalyticsCallback;->upload(Lcom/momo/xeengine/AnalyticsCallback$Params;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

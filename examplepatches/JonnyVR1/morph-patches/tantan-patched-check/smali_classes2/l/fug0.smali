.class public abstract Ll/fug0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = ""

.field public static b:Ltech/sud/gip/core/ISudListenerReportStatsEvent;

.field public static final c:LE/Sudif;

.field public static final d:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LE/Sudif;

    .line 2
    .line 3
    invoke-direct {v0}, LE/Sudif;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fug0;->c:LE/Sudif;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/fug0;->d:Ljava/util/HashMap;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/fug0;->c:LE/Sudif;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    :goto_0
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    return-object p0

    .line 27
    :cond_2
    :goto_1
    const-string p0, "UNSPECIFIED"

    .line 28
    .line 29
    return-object p0
.end method

.method public static b(Ll/ukg0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget v1, p0, Ll/ukg0;->e:I

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v2, Ll/nog0;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v2, p0, v3, v0, v1}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    invoke-static {v2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

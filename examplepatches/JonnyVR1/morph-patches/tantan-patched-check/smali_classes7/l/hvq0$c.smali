.class Ll/hvq0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hvq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field public b:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "dc_job_result_time_26"

    .line 5
    .line 6
    iput-object v0, p0, Ll/hvq0$c;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "mipush_extra"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/hvq0$c;->b:Landroid/content/SharedPreferences;

    .line 16
    .line 17
    const-wide/16 v1, 0x0

    .line 18
    .line 19
    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    cmp-long p1, v3, v1

    .line 24
    .line 25
    if-lez p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    sub-long/2addr v3, v1

    .line 32
    const-wide/32 v1, 0xf731400

    .line 33
    .line 34
    .line 35
    cmp-long p1, v3, v1

    .line 36
    .line 37
    if-lez p1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void

    .line 41
    :cond_1
    :goto_0
    invoke-direct {p0}, Ll/hvq0$c;->a()J

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    iget-object p0, p0, Ll/hvq0$c;->b:Landroid/content/SharedPreferences;

    .line 46
    .line 47
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private a()J
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance p0, Ljava/util/Random;

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Ljava/util/Random;-><init>(J)V

    .line 8
    .line 9
    .line 10
    const-wide/32 v2, 0x5265c00

    .line 11
    .line 12
    .line 13
    div-long/2addr v0, v2

    .line 14
    const-wide/16 v4, 0x1

    .line 15
    .line 16
    add-long/2addr v0, v4

    .line 17
    mul-long/2addr v0, v2

    .line 18
    const/4 v2, 0x3

    .line 19
    invoke-virtual {p0, v2}, Ljava/util/Random;->nextInt(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const v3, 0x5265c00

    .line 24
    .line 25
    .line 26
    mul-int/2addr v2, v3

    .line 27
    int-to-long v2, v2

    .line 28
    add-long/2addr v0, v2

    .line 29
    const v2, 0x2ca1c80

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v2}, Ljava/util/Random;->nextInt(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    int-to-long v2, p0

    .line 37
    add-long/2addr v0, v2

    .line 38
    return-wide v0
.end method


# virtual methods
.method public b()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/hvq0$c;->b:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    const-string v1, "dc_job_result_time_26"

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v4

    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v6

    .line 15
    sub-long/2addr v6, v4

    .line 16
    cmp-long v0, v6, v2

    .line 17
    .line 18
    if-ltz v0, :cond_0

    .line 19
    .line 20
    const-wide/32 v2, 0xf731400

    .line 21
    .line 22
    .line 23
    div-long/2addr v6, v2

    .line 24
    const-wide/16 v8, 0x1

    .line 25
    .line 26
    add-long/2addr v6, v8

    .line 27
    mul-long/2addr v6, v2

    .line 28
    add-long/2addr v4, v6

    .line 29
    iget-object p0, p0, Ll/hvq0$c;->b:Landroid/content/SharedPreferences;

    .line 30
    .line 31
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0, v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public c()Z
    .locals 7

    .line 1
    iget-object p0, p0, Ll/hvq0$c;->b:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    const-string v0, "dc_job_result_time_26"

    .line 4
    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v5

    .line 15
    sub-long/2addr v5, v3

    .line 16
    cmp-long p0, v5, v1

    .line 17
    .line 18
    if-lez p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

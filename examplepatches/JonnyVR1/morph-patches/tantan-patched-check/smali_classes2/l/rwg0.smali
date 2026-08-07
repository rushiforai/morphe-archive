.class public final Ll/rwg0;
.super Ll/srg0;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Ll/ukg0;

.field public final c:Ljava/lang/String;

.field public d:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/srg0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ukg0;

    .line 5
    .line 6
    const-string v1, "matchASRInfo"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/rwg0;->b:Ll/ukg0;

    .line 12
    .line 13
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    iput-object v0, p0, Ll/rwg0;->d:Ljava/lang/Boolean;

    .line 16
    .line 17
    new-instance v0, Ljava/util/Date;

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 27
    .line 28
    const-string v2, "yyyy-MM-dd"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/rwg0;->c:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "TechSudMGPGlobal.sp"

    .line 40
    .line 41
    invoke-static {v1}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v1, v1, Ll/kjg0;->a:Landroid/content/SharedPreferences;

    .line 46
    .line 47
    const-string v2, "key_sud_mgp_match_asr_last_date"

    .line 48
    .line 49
    const-string v3, ""

    .line 50
    .line 51
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_0

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 68
    .line 69
    iput-object v0, p0, Ll/rwg0;->d:Ljava/lang/Boolean;

    .line 70
    .line 71
    :cond_0
    return-void
.end method

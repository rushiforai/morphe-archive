.class public Ll/l3h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "post_button"

.field public static b:Ljava/lang/String; = "vote_button"

.field public static c:Ljava/lang/String; = "comment_button"

.field public static d:Ll/l4g0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_binding_phone_number_popup_view"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/l3h;->d:Ll/l4g0;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 1

    .line 1
    sget-object v0, Ll/l3h;->d:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/l3h;->d:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "skipable"

    .line 10
    .line 11
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string p0, "number_type"

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string p0, "tooltips_trigger_mode"

    .line 22
    .line 23
    const-string p1, "passive"

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-string p0, "tooltips_type"

    .line 30
    .line 31
    const-string p1, "alert"

    .line 32
    .line 33
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    const-string p0, "tooltips_type_ui"

    .line 38
    .line 39
    const-string p1, "alert_special"

    .line 40
    .line 41
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string p0, "tooltips_trigger_module"

    .line 46
    .line 47
    const-string p1, "privacy_settings"

    .line 48
    .line 49
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-string p0, "tooltips_trigger_page"

    .line 54
    .line 55
    const-string p1, "swipe_page"

    .line 56
    .line 57
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    const-string p0, "tooltips_trigger_reason"

    .line 62
    .line 63
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v9

    .line 67
    filled-new-array/range {v2 .. v9}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ll/l3h;->c([Ll/pf60;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "p_binding_phone_number_popup_view"

    .line 76
    .line 77
    invoke-virtual {v0, p1, p0}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    sget-object p1, Ll/l3h;->d:Ll/l4g0;

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 84
    .line 85
    .line 86
    sget-object p0, Ll/l3h;->d:Ll/l4g0;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 89
    .line 90
    .line 91
    sget-object p0, Ll/l3h;->d:Ll/l4g0;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static varargs c([Ll/pf60;)Lorg/json/JSONObject;
    .locals 5

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    array-length v0, p0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 14
    .line 15
    .line 16
    :try_start_1
    array-length v1, p0

    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    if-ge v2, v1, :cond_0

    .line 19
    .line 20
    aget-object v3, p0, v2

    .line 21
    .line 22
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v4, Ljava/lang/String;

    .line 25
    .line 26
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 29
    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    move-object v1, v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    return-object v0

    .line 38
    :catch_1
    move-exception p0

    .line 39
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-object v1
.end method

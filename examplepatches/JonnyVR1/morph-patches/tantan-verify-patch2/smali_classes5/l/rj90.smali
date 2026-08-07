.class public Ll/rj90;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "privilege_type"

    .line 7
    .line 8
    invoke-static {p0}, Ll/rj90;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    const-string p0, "e_privileges_cards"

    .line 21
    .line 22
    const-string v1, "p_privileges_view"

    .line 23
    .line 24
    invoke-static {p0, v1, v0}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static b()V
    .locals 2

    .line 1
    const-string v0, "e_privilege_svip_filter_more"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/rj90$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "svip"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    const-string p0, "location"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "likelimit"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "superlike"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "undo"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "supremePartner"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "odiamond"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "vip"

    .line 34
    .line 35
    return-object p0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d()V
    .locals 2

    .line 1
    const-string v0, "e_privilege_help"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static e()V
    .locals 2

    .line 1
    const-string v0, "e_privilege_svip_privacy_more"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f()V
    .locals 2

    .line 1
    const-string v0, "e_privilege_svip_see_more"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static g()V
    .locals 2

    .line 1
    const-string v0, "e_privilege_svip_upgrade"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static h()V
    .locals 2

    .line 1
    const-string v0, "e_privilege_svip_upgrade"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static i()V
    .locals 2

    .line 1
    const-string v0, "e_privilege_vip_upgrade"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static j()V
    .locals 2

    .line 1
    const-string v0, "e_privilege_vip_upgrade"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

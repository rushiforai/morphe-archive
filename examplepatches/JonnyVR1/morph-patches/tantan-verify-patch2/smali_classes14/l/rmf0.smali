.class public Ll/rmf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/l4g0;

.field public b:Ll/l4g0;

.field public c:Ll/l4g0;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l4g0;

    .line 5
    .line 6
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const-string v3, "p_sys_album_auth_popup_view"

    .line 13
    .line 14
    invoke-direct {v0, v3, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/rmf0;->a:Ll/l4g0;

    .line 18
    .line 19
    new-instance v0, Ll/l4g0;

    .line 20
    .line 21
    const-string v2, "p_prompt_album_auth_popup_view"

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/rmf0;->b:Ll/l4g0;

    .line 31
    .line 32
    new-instance v0, Ll/l4g0;

    .line 33
    .line 34
    const-string v2, "p_second_prompt_album_auth_popup_view"

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/rmf0;->c:Ll/l4g0;

    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "userid"

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "on"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "off"

    .line 21
    .line 22
    :goto_0
    const-string v0, "user_auth"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "e_album_auth_success"

    .line 33
    .line 34
    const-string v0, ""

    .line 35
    .line 36
    invoke-static {p1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "e_prompt_album_auth_popup_open_button"

    .line 12
    .line 13
    const-string v1, "p_prompt_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/rmf0;->b:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/rmf0;->b:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "e_prompt_album_auth_popup_close_button"

    .line 12
    .line 13
    const-string v1, "p_prompt_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/rmf0;->b:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/rmf0;->b:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/rmf0;->b:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p1, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p1, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p1, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p1, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p1, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "media_page"

    .line 44
    .line 45
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p1, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_photo"

    .line 52
    .line 53
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/rmf0;->b:Ll/l4g0;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/rmf0;->b:Ll/l4g0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "e_second_prompt_album_auth_popup_open_button"

    .line 12
    .line 13
    const-string v1, "p_second_prompt_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/rmf0;->c:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/rmf0;->c:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "e_second_prompt_album_auth_popup_close_button"

    .line 12
    .line 13
    const-string v1, "p_second_prompt_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/rmf0;->c:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/rmf0;->c:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/rmf0;->c:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p1, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p1, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p1, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p1, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p1, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "media_page"

    .line 44
    .line 45
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p1, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_storage"

    .line 52
    .line 53
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/rmf0;->c:Ll/l4g0;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/rmf0;->c:Ll/l4g0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "e_sys_album_auth_popup_allowed_button"

    .line 12
    .line 13
    const-string v1, "p_sys_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/rmf0;->a:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/rmf0;->a:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Ll/rmf0;->a(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public i(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string p2, "on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p2, "off"

    .line 13
    .line 14
    :goto_0
    const-string v0, "no_longer_ask"

    .line 15
    .line 16
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p2, "e_sys_album_auth_popup_denied_button"

    .line 25
    .line 26
    const-string v0, "p_sys_album_auth_popup_view"

    .line 27
    .line 28
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/rmf0;->a:Ll/l4g0;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/rmf0;->a:Ll/l4g0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/rmf0;->a:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p1, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p1, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p1, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p1, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p1, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "media_page"

    .line 44
    .line 45
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p1, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_photo"

    .line 52
    .line 53
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/rmf0;->a:Ll/l4g0;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/rmf0;->a:Ll/l4g0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

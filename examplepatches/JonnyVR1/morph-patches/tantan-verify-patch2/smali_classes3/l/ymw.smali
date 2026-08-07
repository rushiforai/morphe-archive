.class public Ll/ymw;
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

.method public static a()V
    .locals 1

    .line 1
    const-string v0, "putongPref"

    .line 2
    .line 3
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/ixd0;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "sp_sticker_click_state"

    .line 10
    .line 11
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "IS_FIRST_GET_CATEGORY_STATE_SP_NAME"

    .line 15
    .line 16
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v0, "sp_first_camera_category_state"

    .line 20
    .line 21
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "click_camera_category_state_sp_name"

    .line 25
    .line 26
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v0, "MessageCountToday"

    .line 30
    .line 31
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v0, "tanker_plugin"

    .line 35
    .line 36
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v0, "filepersistentsp"

    .line 40
    .line 41
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "account_sp_sticker_max_create_time"

    .line 45
    .line 46
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v0, "account_sp_sticker_click_state"

    .line 50
    .line 51
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const-string v0, "account_is_first_get_category_state_sp_name"

    .line 55
    .line 56
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string v0, "account_sp_first_camera_category_state"

    .line 60
    .line 61
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string v0, "account_click_camera_category_state_sp_name"

    .line 65
    .line 66
    invoke-static {v0}, Ll/hxd0;->addSpName2MMKVSet(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static b(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/uc60;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance p0, Ll/ymw$a;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/ymw$a;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p0}, Lcom/tencent/mmkv/MMKV;->registerHandler(Lcom/tencent/mmkv/MMKVHandler;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "preferences"

    .line 25
    .line 26
    invoke-static {p0}, Lcom/tencent/mmkv/MMKV;->mmkvWithID(Ljava/lang/String;)Lcom/tencent/mmkv/MMKV;

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/ymw;->a()V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 36
    .line 37
    .line 38
    return-void
.end method

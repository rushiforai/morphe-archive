.class public final Ll/qlg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Ll/qlg0;


# instance fields
.field public final a:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "sudmgp_local_file_encrypt_key"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/qlg0;->a:Landroid/content/SharedPreferences;

    .line 16
    .line 17
    return-void
.end method

.method public static a()Ll/qlg0;
    .locals 2

    .line 1
    sget-object v0, Ll/qlg0;->b:Ll/qlg0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/qlg0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/qlg0;->b:Ll/qlg0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/qlg0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/qlg0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/qlg0;->b:Ll/qlg0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/qlg0;->b:Ll/qlg0;

    .line 27
    .line 28
    return-object v0
.end method

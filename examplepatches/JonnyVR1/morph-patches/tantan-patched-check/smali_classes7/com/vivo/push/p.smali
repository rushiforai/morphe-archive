.class public final Lcom/vivo/push/p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Landroid/net/Uri;

.field public static final b:Landroid/net/Uri;

.field public static final c:Landroid/net/Uri;

.field public static final d:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "content://com.vivo.push.sdk.service.SystemPushConfig/config"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/vivo/push/p;->a:Landroid/net/Uri;

    .line 8
    .line 9
    const-string v0, "content://com.vivo.push.sdk.service.SystemPushConfig/permission"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/vivo/push/p;->b:Landroid/net/Uri;

    .line 16
    .line 17
    const-string v0, "content://com.vivo.push.sdk.service.SystemPushConfig/clientState"

    .line 18
    .line 19
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/vivo/push/p;->c:Landroid/net/Uri;

    .line 24
    .line 25
    const-string v0, "content://com.vivo.push.sdk.service.SystemPushConfig/debugInfo"

    .line 26
    .line 27
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/vivo/push/p;->d:Landroid/net/Uri;

    .line 32
    .line 33
    return-void
.end method

.method public static a(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :pswitch_0
    const-string p0, "method_stop"

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_1
    const-string p0, "method_sdk_unbind"

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_2
    const-string p0, "method_sdk_bind"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_3
    const-string p0, "method_tag_unbind"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_4
    const-string p0, "method_tag_bind"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_5
    const-string p0, "method_alias_unbind"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_6
    const-string p0, "method_alias_bind"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_data_0
    .packed-switch 0x7d2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

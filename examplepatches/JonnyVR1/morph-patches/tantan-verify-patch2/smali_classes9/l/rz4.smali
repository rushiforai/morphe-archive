.class public Ll/rz4;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rz4$a;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rz4;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rz4;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/rz4;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    iget-object p0, p0, Ll/rz4;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    return-object p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object p0, p0, Ll/rz4;->a:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;->message:Ljava/lang/String;

    .line 34
    .line 35
    return-object v0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rz4;->b:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "json"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

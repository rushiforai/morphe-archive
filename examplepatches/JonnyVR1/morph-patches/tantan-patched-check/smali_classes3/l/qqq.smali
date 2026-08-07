.class public Ll/qqq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;

.field public c:Ljava/lang/String;

.field public final d:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qqq;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Ll/qqq;->d:Ll/z20;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qqq;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;

    .line 24
    .line 25
    iput-object p1, p0, Ll/qqq;->b:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;

    .line 26
    .line 27
    iput-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->callJs:Ll/z20;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    move-exception p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqq;->b:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqq;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qqq;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "dismiss"

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

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qqq;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "show"

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

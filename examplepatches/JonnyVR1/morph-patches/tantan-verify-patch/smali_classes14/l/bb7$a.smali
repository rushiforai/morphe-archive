.class public Ll/bb7$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cmb0$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bb7;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bb7;


# direct methods
.method public constructor <init>(Ll/bb7;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bb7$a;->a:Ll/bb7;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 0

    .line 1
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/bb7$a;->a:Ll/bb7;

    .line 12
    .line 13
    invoke-virtual {p0, p3}, Ll/bb7;->b(Lcom/p1/mobile/putong/data/PushMessage;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p3, p4, p1}, Ll/wr2;->e(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)Landroid/app/PendingIntent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

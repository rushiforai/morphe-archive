.class public Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VTexturePlayer$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->k(Ljava/lang/String;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$b;->b:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public O()V
    .locals 0

    .line 1
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(II)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$b;->a:Ljava/lang/String;

    .line 10
    .line 11
    sget v1, Ll/c7y;->a:I

    .line 12
    .line 13
    invoke-static {p1, p2, v0, p0, v1}, Ll/c7y;->e(IIZLjava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c(J)V
    .locals 0

    .line 1
    return-void
.end method

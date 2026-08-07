.class public final synthetic Ll/lmo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zmo0;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;


# direct methods
.method public synthetic constructor <init>(Ll/zmo0;ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lmo0;->a:Ll/zmo0;

    iput p2, p0, Ll/lmo0;->b:I

    iput-object p3, p0, Ll/lmo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lmo0;->a:Ll/zmo0;

    iget v1, p0, Ll/lmo0;->b:I

    iget-object p0, p0, Ll/lmo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    invoke-static {v0, v1, p0}, Ll/zmo0;->k(Ll/zmo0;ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    return-void
.end method

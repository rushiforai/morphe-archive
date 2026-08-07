.class public final synthetic Ll/zne0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/roe0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/uoe0;


# direct methods
.method public synthetic constructor <init>(Ll/roe0;Ljava/lang/String;Ll/uoe0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zne0;->a:Ll/roe0;

    iput-object p2, p0, Ll/zne0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/zne0;->c:Ll/uoe0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zne0;->a:Ll/roe0;

    iget-object v1, p0, Ll/zne0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/zne0;->c:Ll/uoe0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;

    invoke-static {v0, v1, p0, p1}, Ll/roe0;->M3(Ll/roe0;Ljava/lang/String;Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;)V

    return-void
.end method

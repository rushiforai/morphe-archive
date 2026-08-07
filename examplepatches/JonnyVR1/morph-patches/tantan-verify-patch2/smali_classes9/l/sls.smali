.class public final synthetic Ll/sls;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tls;


# direct methods
.method public synthetic constructor <init>(Ll/tls;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sls;->a:Ll/tls;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sls;->a:Ll/tls;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    invoke-static {p0, p1}, Ll/tls;->S3(Ll/tls;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;)V

    return-void
.end method

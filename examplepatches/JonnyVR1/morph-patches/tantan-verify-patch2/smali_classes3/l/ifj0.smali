.class public final synthetic Ll/ifj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/network/NetworkTrackInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/network/NetworkTrackInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ifj0;->a:Lcom/tantanapp/common/network/NetworkTrackInfo;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ifj0;->a:Lcom/tantanapp/common/network/NetworkTrackInfo;

    invoke-static {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->a(Lcom/tantanapp/common/network/NetworkTrackInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

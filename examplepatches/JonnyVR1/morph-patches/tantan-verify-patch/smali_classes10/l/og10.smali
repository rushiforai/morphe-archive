.class public final synthetic Ll/og10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pg10;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pg10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/og10;->a:Ll/pg10;

    iput-object p2, p0, Ll/og10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    iput-object p3, p0, Ll/og10;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/og10;->a:Ll/pg10;

    iget-object v1, p0, Ll/og10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    iget-object p0, p0, Ll/og10;->c:Ljava/lang/String;

    check-cast p1, Ll/ff10;

    invoke-static {v0, v1, p0, p1}, Ll/pg10;->S3(Ll/pg10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;Ljava/lang/String;Ll/ff10;)V

    return-void
.end method

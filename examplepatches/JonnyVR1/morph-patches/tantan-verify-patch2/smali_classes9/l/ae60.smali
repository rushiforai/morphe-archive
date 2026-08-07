.class public final synthetic Ll/ae60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ke60;


# direct methods
.method public synthetic constructor <init>(Ll/ke60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ae60;->a:Ll/ke60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae60;->a:Ll/ke60;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    invoke-static {p0, p1}, Ll/ke60;->R3(Ll/ke60;Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;)V

    return-void
.end method

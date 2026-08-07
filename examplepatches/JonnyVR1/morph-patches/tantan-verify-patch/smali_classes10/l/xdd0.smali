.class public final synthetic Ll/xdd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ydd0;


# direct methods
.method public synthetic constructor <init>(Ll/ydd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xdd0;->a:Ll/ydd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xdd0;->a:Ll/ydd0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    invoke-static {p0, p1}, Ll/ydd0;->S3(Ll/ydd0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V

    return-void
.end method

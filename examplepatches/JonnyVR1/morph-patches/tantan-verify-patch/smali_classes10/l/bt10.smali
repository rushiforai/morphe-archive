.class public final synthetic Ll/bt10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/st10;


# direct methods
.method public synthetic constructor <init>(Ll/st10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bt10;->a:Ll/st10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bt10;->a:Ll/st10;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;

    invoke-static {p0, p1}, Ll/st10;->S3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;)V

    return-void
.end method

.class public final synthetic Ll/tg10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ug10;


# direct methods
.method public synthetic constructor <init>(Ll/ug10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tg10;->a:Ll/ug10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tg10;->a:Ll/ug10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsAudienceInfoData;

    invoke-static {p0, p1}, Ll/ug10;->J3(Ll/ug10;Lcom/p1/mobile/putong/live/base/data/BLiveJsAudienceInfoData;)V

    return-void
.end method

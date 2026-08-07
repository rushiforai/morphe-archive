.class public final synthetic Ll/je4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ue4;


# direct methods
.method public synthetic constructor <init>(Ll/ue4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/je4;->a:Ll/ue4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/je4;->a:Ll/ue4;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    invoke-static {p0, p1}, Ll/ue4;->W3(Ll/ue4;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

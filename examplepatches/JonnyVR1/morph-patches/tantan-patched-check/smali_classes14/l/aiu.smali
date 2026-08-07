.class public final synthetic Ll/aiu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/liu;


# direct methods
.method public synthetic constructor <init>(Ll/liu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aiu;->a:Ll/liu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aiu;->a:Ll/liu;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    invoke-static {p0, p1}, Ll/liu;->b3(Ll/liu;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

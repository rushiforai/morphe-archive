.class public final synthetic Ll/biu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/liu;

.field public final synthetic b:J

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;


# direct methods
.method public synthetic constructor <init>(Ll/liu;JLcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/biu;->a:Ll/liu;

    iput-wide p2, p0, Ll/biu;->b:J

    iput-object p4, p0, Ll/biu;->c:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/biu;->a:Ll/liu;

    iget-wide v1, p0, Ll/biu;->b:J

    iget-object p0, p0, Ll/biu;->c:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p0, p1}, Ll/liu;->X2(Ll/liu;JLcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ljava/lang/Long;)V

    return-void
.end method

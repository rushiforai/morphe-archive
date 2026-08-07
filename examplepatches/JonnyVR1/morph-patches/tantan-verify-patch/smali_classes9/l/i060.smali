.class public final synthetic Ll/i060;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u060;

.field public final synthetic b:J

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/u060;JLcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i060;->a:Ll/u060;

    iput-wide p2, p0, Ll/i060;->b:J

    iput-object p4, p0, Ll/i060;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    iput-object p5, p0, Ll/i060;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/i060;->a:Ll/u060;

    iget-wide v1, p0, Ll/i060;->b:J

    iget-object v3, p0, Ll/i060;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    iget-object v4, p0, Ll/i060;->d:Ll/x20;

    move-object v5, p1

    check-cast v5, Ljava/lang/Long;

    invoke-static/range {v0 .. v5}, Ll/u060;->X3(Ll/u060;JLcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;Ljava/lang/Long;)V

    return-void
.end method

.class public final synthetic Ll/mcj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mcj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mcj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/ocj;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.class public final synthetic Ll/v880;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v880;->a:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v880;->a:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Ll/a980;->d(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;Lrx/Notification;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

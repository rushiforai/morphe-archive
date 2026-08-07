.class public Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->O(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$a;->b:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$a;->b:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->w(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

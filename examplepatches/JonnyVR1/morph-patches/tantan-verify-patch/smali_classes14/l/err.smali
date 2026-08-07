.class public final synthetic Ll/err;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

.field public final synthetic d:I

.field public final synthetic e:Ll/str;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/err;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    iput-object p2, p0, Ll/err;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    iput-object p3, p0, Ll/err;->c:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    iput p4, p0, Ll/err;->d:I

    iput-object p5, p0, Ll/err;->e:Ll/str;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/err;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    iget-object v1, p0, Ll/err;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    iget-object v2, p0, Ll/err;->c:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    iget v3, p0, Ll/err;->d:I

    iget-object v4, p0, Ll/err;->e:Ll/str;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->X1(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;Landroid/view/View;)V

    return-void
.end method

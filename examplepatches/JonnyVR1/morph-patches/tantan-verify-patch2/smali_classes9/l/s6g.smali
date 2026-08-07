.class public final synthetic Ll/s6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/s6g;->a:Z

    iput-object p2, p0, Ll/s6g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/s6g;->a:Z

    iget-object p0, p0, Ll/s6g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->i0(ZLcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Landroid/view/View;)V

    return-void
.end method

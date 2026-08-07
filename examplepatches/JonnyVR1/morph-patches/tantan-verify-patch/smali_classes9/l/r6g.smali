.class public final synthetic Ll/r6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/x6g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/x6g;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r6g;->a:Ll/x6g;

    iput-object p2, p0, Ll/r6g;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/r6g;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    iput p4, p0, Ll/r6g;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r6g;->a:Ll/x6g;

    iget-object v1, p0, Ll/r6g;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/r6g;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    iget p0, p0, Ll/r6g;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->h0(Ll/x6g;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;ILandroid/view/View;)V

    return-void
.end method

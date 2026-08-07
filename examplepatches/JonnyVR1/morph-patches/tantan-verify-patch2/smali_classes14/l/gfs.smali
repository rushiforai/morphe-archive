.class public final synthetic Ll/gfs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/page/setting/b$a;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

.field public final synthetic c:Lcom/p1/mobile/putong/live/external/page/setting/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/page/setting/b$a;Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;Lcom/p1/mobile/putong/live/external/page/setting/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gfs;->a:Lcom/p1/mobile/putong/live/external/page/setting/b$a;

    iput-object p2, p0, Ll/gfs;->b:Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    iput-object p3, p0, Ll/gfs;->c:Lcom/p1/mobile/putong/live/external/page/setting/a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gfs;->a:Lcom/p1/mobile/putong/live/external/page/setting/b$a;

    iget-object v1, p0, Ll/gfs;->b:Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    iget-object p0, p0, Ll/gfs;->c:Lcom/p1/mobile/putong/live/external/page/setting/a;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->p(Lcom/p1/mobile/putong/live/external/page/setting/b$a;Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;Lcom/p1/mobile/putong/live/external/page/setting/a;Landroid/view/View;)V

    return-void
.end method

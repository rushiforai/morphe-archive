.class public final synthetic Ll/zfg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/agg;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;


# direct methods
.method public synthetic constructor <init>(Ll/agg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zfg;->a:Ll/agg;

    iput-object p2, p0, Ll/zfg;->b:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zfg;->a:Ll/agg;

    iget-object p0, p0, Ll/zfg;->b:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;

    invoke-static {v0, p0, p1}, Ll/agg;->a(Ll/agg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;Landroid/view/View;)V

    return-void
.end method

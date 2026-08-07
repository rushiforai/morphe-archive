.class public final synthetic Ll/vgn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;

.field public final synthetic b:Ll/wgn;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;Ll/wgn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vgn;->a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;

    iput-object p2, p0, Ll/vgn;->b:Ll/wgn;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vgn;->a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;

    iget-object p0, p0, Ll/vgn;->b:Ll/wgn;

    invoke-static {v0, p0, p1}, Ll/wgn;->a(Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;Ll/wgn;Landroid/view/View;)V

    return-void
.end method

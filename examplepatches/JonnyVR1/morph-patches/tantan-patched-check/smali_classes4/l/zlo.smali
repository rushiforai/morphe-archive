.class public final synthetic Ll/zlo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zlo;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/zlo;->b:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;

    iput-boolean p3, p0, Ll/zlo;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zlo;->a:Lcom/p1/mobile/putong/data/User;

    iget-object v1, p0, Ll/zlo;->b:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;

    iget-boolean p0, p0, Ll/zlo;->c:Z

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;ZLandroid/view/View;)V

    return-void
.end method

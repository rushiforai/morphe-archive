.class public final synthetic Ll/zfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/data/User;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

    iput-object p2, p0, Ll/zfo;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/zfo;->c:Z

    iput-object p4, p0, Ll/zfo;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

    iget-object v1, p0, Ll/zfo;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean v2, p0, Ll/zfo;->c:Z

    iget-object p0, p0, Ll/zfo;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->s(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/data/User;ZLl/y20;Landroid/view/View;)V

    return-void
.end method

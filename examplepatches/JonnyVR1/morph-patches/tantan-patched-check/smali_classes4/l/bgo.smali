.class public final synthetic Ll/bgo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

.field public final synthetic b:Z

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bgo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

    iput-boolean p2, p0, Ll/bgo;->b:Z

    iput-object p3, p0, Ll/bgo;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bgo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

    iget-boolean v1, p0, Ll/bgo;->b:Z

    iget-object p0, p0, Ll/bgo;->c:Ll/y20;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->w(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;ZLl/y20;Landroid/view/View;)V

    return-void
.end method

.class public final synthetic Ll/dgo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hgo;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;


# direct methods
.method public synthetic constructor <init>(Ll/hgo;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dgo;->a:Ll/hgo;

    iput-object p2, p0, Ll/dgo;->b:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dgo;->a:Ll/hgo;

    iget-object p0, p0, Ll/dgo;->b:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;

    invoke-static {v0, p0, p1}, Ll/hgo;->G(Ll/hgo;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;Landroid/view/View;)V

    return-void
.end method

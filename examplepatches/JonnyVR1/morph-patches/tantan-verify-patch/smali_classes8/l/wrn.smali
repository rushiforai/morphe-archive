.class public final synthetic Ll/wrn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wrn;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;

    iput-object p2, p0, Ll/wrn;->b:Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wrn;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;

    iget-object p0, p0, Ll/wrn;->b:Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->b(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Landroid/view/View;)V

    return-void
.end method

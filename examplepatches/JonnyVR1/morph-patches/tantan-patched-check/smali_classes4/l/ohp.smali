.class public final synthetic Ll/ohp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ohp;->a:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    iput-boolean p2, p0, Ll/ohp;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ohp;->a:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    iget-boolean p0, p0, Ll/ohp;->b:Z

    check-cast p1, Landroid/os/Bundle;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->V4(Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;ZLandroid/os/Bundle;)V

    return-void
.end method

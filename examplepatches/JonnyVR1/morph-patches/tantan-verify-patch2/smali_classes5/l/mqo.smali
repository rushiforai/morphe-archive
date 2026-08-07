.class public final synthetic Ll/mqo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Settings;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mqo;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    iput-object p2, p0, Ll/mqo;->b:Lcom/p1/mobile/putong/data/Settings;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mqo;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    iget-object p0, p0, Ll/mqo;->b:Lcom/p1/mobile/putong/data/Settings;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->T(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V

    return-void
.end method

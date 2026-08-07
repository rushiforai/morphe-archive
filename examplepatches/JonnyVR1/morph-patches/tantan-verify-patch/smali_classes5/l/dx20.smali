.class public final synthetic Ll/dx20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Settings;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dx20;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    iput-object p2, p0, Ll/dx20;->b:Lcom/p1/mobile/putong/data/Settings;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dx20;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    iget-object p0, p0, Ll/dx20;->b:Lcom/p1/mobile/putong/data/Settings;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->a0(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method

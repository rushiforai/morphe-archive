.class public final synthetic Ll/gk40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Settings;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gk40;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    iput-object p2, p0, Ll/gk40;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/gk40;->c:Lcom/p1/mobile/putong/data/Settings;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gk40;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    iget-object v1, p0, Ll/gk40;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/gk40;->c:Lcom/p1/mobile/putong/data/Settings;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->e0(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method

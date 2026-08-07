.class public final synthetic Ll/ew20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mw20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/AdvancedSettings;


# direct methods
.method public synthetic constructor <init>(Ll/mw20;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ew20;->a:Ll/mw20;

    iput-object p2, p0, Ll/ew20;->b:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ew20;->a:Ll/mw20;

    iget-object p0, p0, Ll/ew20;->b:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/mw20;->A0(Ll/mw20;Lcom/p1/mobile/putong/core/data/AdvancedSettings;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

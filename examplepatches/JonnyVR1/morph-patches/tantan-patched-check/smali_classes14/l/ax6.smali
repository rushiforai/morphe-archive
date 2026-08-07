.class public final synthetic Ll/ax6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dx6;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/AdvancedSettings;


# direct methods
.method public synthetic constructor <init>(Ll/dx6;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ax6;->a:Ll/dx6;

    iput-object p2, p0, Ll/ax6;->b:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ax6;->a:Ll/dx6;

    iget-object p0, p0, Ll/ax6;->b:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    invoke-static {v0, p0}, Ll/dx6;->a3(Ll/dx6;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

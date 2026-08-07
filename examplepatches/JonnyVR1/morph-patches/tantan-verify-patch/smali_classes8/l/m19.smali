.class public final synthetic Ll/m19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m19;->a:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m19;->a:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    invoke-static {p0}, Ll/x19;->b(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V

    return-void
.end method

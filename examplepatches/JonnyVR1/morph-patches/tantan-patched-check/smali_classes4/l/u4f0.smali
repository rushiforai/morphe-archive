.class public final synthetic Ll/u4f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u4f0;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u4f0;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;->c(Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;)V

    return-void
.end method

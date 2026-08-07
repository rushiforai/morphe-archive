.class public final synthetic Ll/r8b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/u8b0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/purchase/d;


# direct methods
.method public synthetic constructor <init>(Ll/u8b0;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r8b0;->a:Ll/u8b0;

    iput-object p2, p0, Ll/r8b0;->b:Lcom/p1/mobile/putong/core/ui/purchase/d;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r8b0;->a:Ll/u8b0;

    iget-object p0, p0, Ll/r8b0;->b:Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {v0, p0}, Ll/u8b0;->e(Ll/u8b0;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

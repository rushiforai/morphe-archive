.class public final synthetic Ll/xu8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xu8;->a:Lcom/p1/mobile/putong/core/api/j;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xu8;->a:Lcom/p1/mobile/putong/core/api/j;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/j;->b5(Lcom/p1/mobile/putong/core/api/j;)V

    return-void
.end method

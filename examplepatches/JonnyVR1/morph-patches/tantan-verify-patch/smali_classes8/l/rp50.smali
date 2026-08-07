.class public final synthetic Ll/rp50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rp50;->a:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rp50;->a:Lcom/p1/mobile/putong/data/User;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/match/b;->e(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

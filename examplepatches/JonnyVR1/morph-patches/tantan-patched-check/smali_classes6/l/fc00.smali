.class public final synthetic Ll/fc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/vap/mix/c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/vap/mix/a;Lcom/p1/mobile/putong/live/base/vap/mix/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    iput-object p2, p0, Ll/fc00;->b:Lcom/p1/mobile/putong/live/base/vap/mix/c;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    iget-object p0, p0, Ll/fc00;->b:Lcom/p1/mobile/putong/live/base/vap/mix/c;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->i(Lcom/p1/mobile/putong/live/base/vap/mix/a;Lcom/p1/mobile/putong/live/base/vap/mix/c;)V

    return-void
.end method

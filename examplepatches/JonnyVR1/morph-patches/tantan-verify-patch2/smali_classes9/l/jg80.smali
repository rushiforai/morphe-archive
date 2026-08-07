.class public final synthetic Ll/jg80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qg80;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLive;


# direct methods
.method public synthetic constructor <init>(Ll/qg80;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jg80;->a:Ll/qg80;

    iput-object p2, p0, Ll/jg80;->b:Lcom/p1/mobile/putong/live/base/data/BLive;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jg80;->a:Ll/qg80;

    iget-object p0, p0, Ll/jg80;->b:Lcom/p1/mobile/putong/live/base/data/BLive;

    check-cast p1, Ll/ugd0;

    invoke-static {v0, p0, p1}, Ll/qg80;->K3(Ll/qg80;Lcom/p1/mobile/putong/live/base/data/BLive;Ll/ugd0;)V

    return-void
.end method

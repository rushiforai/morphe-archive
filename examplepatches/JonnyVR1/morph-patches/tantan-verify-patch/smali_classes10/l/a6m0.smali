.class public final synthetic Ll/a6m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b6m0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMedal;


# direct methods
.method public synthetic constructor <init>(Ll/b6m0;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a6m0;->a:Ll/b6m0;

    iput-object p2, p0, Ll/a6m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMedal;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a6m0;->a:Ll/b6m0;

    iget-object p0, p0, Ll/a6m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMedal;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/b6m0;->l4(Ll/b6m0;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Ljava/util/List;)V

    return-void
.end method

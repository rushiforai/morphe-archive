.class public final synthetic Ll/yvn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rwn0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/rwn0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yvn0;->a:Ll/rwn0;

    iput-boolean p2, p0, Ll/yvn0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yvn0;->a:Ll/rwn0;

    iget-boolean p0, p0, Ll/yvn0;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/rwn0;->v2(Ll/rwn0;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

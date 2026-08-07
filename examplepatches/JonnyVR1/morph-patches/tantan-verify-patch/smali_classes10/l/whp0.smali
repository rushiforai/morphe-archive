.class public final synthetic Ll/whp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kip0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/kip0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/whp0;->a:Ll/kip0;

    iput-boolean p2, p0, Ll/whp0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/whp0;->a:Ll/kip0;

    iget-boolean p0, p0, Ll/whp0;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {v0, p0, p1}, Ll/kip0;->T3(Ll/kip0;ZLcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method

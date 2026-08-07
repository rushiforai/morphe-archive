.class public final synthetic Ll/ksc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/osc0;


# direct methods
.method public synthetic constructor <init>(Ll/osc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ksc0;->a:Ll/osc0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksc0;->a:Ll/osc0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    invoke-static {p0, p1}, Ll/osc0;->P3(Ll/osc0;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    return-void
.end method

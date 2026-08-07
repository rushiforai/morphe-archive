.class public final synthetic Ll/ww70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gx70;


# direct methods
.method public synthetic constructor <init>(Ll/gx70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ww70;->a:Ll/gx70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww70;->a:Ll/gx70;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;

    invoke-static {p0, p1}, Ll/gx70;->K3(Ll/gx70;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V

    return-void
.end method

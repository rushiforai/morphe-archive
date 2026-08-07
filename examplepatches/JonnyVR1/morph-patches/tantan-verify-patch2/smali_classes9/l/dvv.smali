.class public final synthetic Ll/dvv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mvv;


# direct methods
.method public synthetic constructor <init>(Ll/mvv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dvv;->a:Ll/mvv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dvv;->a:Ll/mvv;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    invoke-static {p0, p1}, Ll/mvv;->P4(Ll/mvv;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;)V

    return-void
.end method

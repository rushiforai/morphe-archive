.class public Ll/xfw$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xfw;->r0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/data/FateRadar;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/xfw;


# direct methods
.method public constructor <init>(Ll/xfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xfw$p;->a:Ll/xfw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/FateRadar;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/xfw$p;->a:Ll/xfw;

    .line 4
    .line 5
    invoke-static {p0}, Ll/xfw;->m0(Ll/xfw;)Ll/iam;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/yfw;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->switchSetting:Lcom/p1/mobile/putong/core/data/FateRadarSwitchStatus;

    .line 12
    .line 13
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/FateRadarSwitchStatus;->status:Z

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/yfw;->k(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xfw$p;->a(Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

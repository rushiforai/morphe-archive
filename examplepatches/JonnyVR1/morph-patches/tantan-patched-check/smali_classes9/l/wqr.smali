.class public final synthetic Ll/wqr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wqr;->a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wqr;->a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    check-cast p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->X1(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

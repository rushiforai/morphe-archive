.class public final synthetic Ll/dg20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dg20;->a:Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    return-void
.end method


# virtual methods
.method public final a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dg20;->a:Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;->R4(Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.class public final synthetic Ll/vzx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wzx;


# direct methods
.method public synthetic constructor <init>(Ll/wzx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vzx;->a:Ll/wzx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vzx;->a:Ll/wzx;

    check-cast p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    invoke-static {p0, p1}, Ll/wzx;->b(Ll/wzx;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

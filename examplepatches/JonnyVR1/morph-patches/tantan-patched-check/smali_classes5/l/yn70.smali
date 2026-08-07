.class public final synthetic Ll/yn70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/picks/act/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/picks/act/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yn70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/act/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yn70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/act/a;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/act/a;->i0(Lcom/p1/mobile/putong/core/ui/vip/picks/act/a;Landroid/net/NetworkInfo;)V

    return-void
.end method

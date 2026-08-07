.class public final synthetic Ll/io;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/io;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/io;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->q(I)V

    return-void
.end method

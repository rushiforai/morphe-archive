.class public final synthetic Ll/emi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/emi;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emi;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;->q(I)V

    return-void
.end method

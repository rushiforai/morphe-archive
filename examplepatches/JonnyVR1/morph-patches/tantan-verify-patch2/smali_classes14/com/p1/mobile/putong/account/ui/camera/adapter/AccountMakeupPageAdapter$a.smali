.class public Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$a;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;

    .line 5
    .line 6
    return-void
.end method

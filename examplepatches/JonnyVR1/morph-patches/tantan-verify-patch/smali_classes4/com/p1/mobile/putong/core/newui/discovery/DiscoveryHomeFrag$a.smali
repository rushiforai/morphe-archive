.class public Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->Z4(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;)Lv/VImage;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

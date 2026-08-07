.class public Ll/sww$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ujh0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sww;->J(ILl/bf3;Ll/l3h0;Lcom/p1/mobile/android/app/c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sww;


# direct methods
.method public constructor <init>(Ll/sww;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sww$b;->a:Ll/sww;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public E0(ZFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public G0()V
    .locals 0

    .line 1
    return-void
.end method

.method public P()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sww$b;->a:Ll/sww;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/baidu/mapapi/map/MapView;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/sww$b;->a:Ll/sww;

    .line 12
    .line 13
    iget-object p0, p0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Lcom/baidu/mapapi/map/MapView;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    return-void
.end method

.class public Ll/ufw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ufw;->f(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ufw;


# direct methods
.method public constructor <init>(Ll/ufw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ufw$a;->a:Ll/ufw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/ufw$a;->a:Ll/ufw;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ufw;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v0, p0, Ll/ufw$a;->a:Ll/ufw;

    .line 10
    .line 11
    iget-object v1, v0, Ll/ufw;->k:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 12
    .line 13
    iget-object v0, v0, Ll/ufw;->g:Ll/ufw$d;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/ufw$d;->y()Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;->customItems:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 20
    .line 21
    iget-object v0, p0, Ll/ufw$a;->a:Ll/ufw;

    .line 22
    .line 23
    invoke-static {v0}, Ll/ufw;->b(Ll/ufw;)Ll/tfw;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/ufw$a;->a:Ll/ufw;

    .line 28
    .line 29
    iget-object v1, v1, Ll/ufw;->k:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 30
    .line 31
    new-instance v2, Ll/ufw$a$a;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1}, Ll/ufw$a$a;-><init>(Ll/ufw$a;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Ll/tfw;->i0(Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

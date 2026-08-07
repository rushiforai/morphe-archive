.class public Ll/xfw$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xfw;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xfw;


# direct methods
.method public constructor <init>(Ll/xfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xfw$j;->a:Ll/xfw;

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
    .locals 2

    .line 1
    iget-object p1, p0, Ll/xfw$j;->a:Ll/xfw;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xfw;->f0(Ll/xfw;)Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/xfw$j;->a:Ll/xfw;

    .line 10
    .line 11
    invoke-static {p1}, Ll/xfw;->f0(Ll/xfw;)Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->searchConditions:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/xfw$j;->a:Ll/xfw;

    .line 20
    .line 21
    invoke-static {p1}, Ll/xfw;->f0(Ll/xfw;)Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->searchConditions:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;->customItems:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p1, p0, Ll/xfw$j;->a:Ll/xfw;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object v0, p0, Ll/xfw$j;->a:Ll/xfw;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p0, p0, Ll/xfw$j;->a:Ll/xfw;

    .line 45
    .line 46
    invoke-static {p0}, Ll/xfw;->f0(Ll/xfw;)Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FateRadar;->searchConditions:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 51
    .line 52
    const-string v1, "select_selectedInterest"

    .line 53
    .line 54
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/LoveRadarFilterPairedUserAct;->a2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void
.end method

.class public Ll/n55$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n55;->P()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/n55;


# direct methods
.method public constructor <init>(Ll/n55;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n55$e;->a:Ll/n55;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/n55$e;->a:Ll/n55;

    .line 2
    .line 3
    invoke-static {v0}, Ll/n55;->C(Ll/n55;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/n55$e;->a:Ll/n55;

    .line 10
    .line 11
    invoke-static {v0}, Ll/n55;->C(Ll/n55;)Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v0, p0, Ll/n55$e;->a:Ll/n55;

    .line 16
    .line 17
    iget-object v0, v0, Ll/n55;->s:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 18
    .line 19
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    const/4 v6, 0x1

    .line 23
    const-string v3, "from_city_center_boost_cover"

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->A2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Ll/n55$e;->a:Ll/n55;

    .line 31
    .line 32
    invoke-static {p0}, Ll/n55;->C(Ll/n55;)Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

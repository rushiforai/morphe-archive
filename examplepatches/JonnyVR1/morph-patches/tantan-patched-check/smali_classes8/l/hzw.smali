.class public abstract Ll/hzw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/gzw<",
        "*>;>",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag<",
            "TP;*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hzw;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hzw;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hzw;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hzw;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public abstract c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/hzw;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, ""

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
.end method

.method public f()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hzw;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
.end method

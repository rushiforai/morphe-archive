.class public abstract Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/AbsLoginStrategy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bxl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/AbsLoginStrategy$LoginStrategyType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/bxl<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/AbsLoginStrategy$LoginStrategyType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/AbsLoginStrategy$LoginStrategyType;->UNKNOWN:Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/AbsLoginStrategy$LoginStrategyType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/AbsLoginStrategy;->b:Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/AbsLoginStrategy$LoginStrategyType;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/AbsLoginStrategy;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;IILandroid/content/Intent;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

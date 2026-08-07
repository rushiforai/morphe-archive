.class public Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;
.super Landroid/util/Pair;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/NotifyHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NotifyResult"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/NotifyHelper$NotifyResult$ResultType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Pair<",
        "Ljava/lang/Integer;",
        "Landroid/content/Intent;",
        ">;"
    }
.end annotation


# static fields
.field public static final ERROR_ARGUMENT_ILLEGAL:I = 0x5

.field public static final ERROR_INNER:I = 0x1

.field public static final ERROR_INNER_IGNORE:I = 0x2

.field public static final ERROR_NOTIFICATION_CLOSE:I = 0x4

.field public static final ERROR_USER_LOGOUT:I = 0x3

.field public static final NONE:I = -0x1

.field public static final SUCCESS_SHOW:I


# direct methods
.method private constructor <init>(Ljava/lang/Integer;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static create(ILandroid/content/Intent;)Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;-><init>(Ljava/lang/Integer;Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.class public Lcom/cosmos/photon/baseim/push/PushContextHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/cosmos/photon/baseim/push/PushContextHolder;->sContext:Landroid/content/Context;

    .line 2
    .line 3
    return-void
.end method

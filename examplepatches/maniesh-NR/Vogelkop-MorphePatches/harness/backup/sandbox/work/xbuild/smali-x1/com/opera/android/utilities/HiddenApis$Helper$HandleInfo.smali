.class public final Lcom/opera/android/utilities/HiddenApis$Helper$HandleInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private final handle:Lcom/opera/android/utilities/HiddenApis$Helper$MethodHandle;

.field private final member:Ljava/lang/reflect/Member;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/utilities/HiddenApis$Helper$HandleInfo;->member:Ljava/lang/reflect/Member;

    iput-object v0, p0, Lcom/opera/android/utilities/HiddenApis$Helper$HandleInfo;->handle:Lcom/opera/android/utilities/HiddenApis$Helper$MethodHandle;

    return-void
.end method

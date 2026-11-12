.class public Lcom/opera/android/utilities/HiddenApis$Helper$MethodHandle;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field protected final artFieldOrMethod:J

.field private cachedSpreadInvoker:Lcom/opera/android/utilities/HiddenApis$Helper$MethodHandle;

.field protected final handleKind:I

.field private nominalType:Ljava/lang/invoke/MethodType;

.field private final type:Ljava/lang/invoke/MethodType;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/utilities/HiddenApis$Helper$MethodHandle;->type:Ljava/lang/invoke/MethodType;

    const/4 v0, 0x0

    iput v0, p0, Lcom/opera/android/utilities/HiddenApis$Helper$MethodHandle;->handleKind:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/utilities/HiddenApis$Helper$MethodHandle;->artFieldOrMethod:J

    return-void
.end method

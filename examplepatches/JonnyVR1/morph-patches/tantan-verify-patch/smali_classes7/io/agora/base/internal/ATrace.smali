.class public Lio/agora/base/internal/ATrace;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ENABLE_TRACE:Z = false

.field private static final TAG:Ljava/lang/String; = "ATrace"

.field private static final TRACE_TAG_APP:J = 0x1000L

.field public static final VERBOSE_LOG:Z

.field private static traceCounterMethod:Ljava/lang/reflect/Method;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static traceCounterMethodFailed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static beginSection(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public static endSection()V
    .locals 0

    return-void
.end method

.method public static traceCounter(Ljava/lang/String;I)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    return-void
.end method

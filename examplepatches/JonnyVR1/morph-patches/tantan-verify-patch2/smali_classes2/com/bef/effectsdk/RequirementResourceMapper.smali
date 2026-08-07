.class public final Lcom/bef/effectsdk/RequirementResourceMapper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native nativePeekResourcesNeededByRequirements([Ljava/lang/String;)[Ljava/lang/String;
.end method

.method public static peekResourcesNeededByRequirements([Ljava/lang/String;)[Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/bef/effectsdk/RequirementResourceMapper;->nativePeekResourcesNeededByRequirements([Ljava/lang/String;)[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

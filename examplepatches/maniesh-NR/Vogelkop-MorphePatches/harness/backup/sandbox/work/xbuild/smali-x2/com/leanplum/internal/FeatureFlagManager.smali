.class public Lcom/leanplum/internal/FeatureFlagManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final FEATURE_FLAG_REQUEST_REFACTOR:Ljava/lang/String; = "request_refactor"

.field public static final INSTANCE:Lcom/leanplum/internal/FeatureFlagManager;


# instance fields
.field private enabledFeatureFlags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/internal/FeatureFlagManager;

    invoke-direct {v0}, Lcom/leanplum/internal/FeatureFlagManager;-><init>()V

    sput-object v0, Lcom/leanplum/internal/FeatureFlagManager;->INSTANCE:Lcom/leanplum/internal/FeatureFlagManager;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/FeatureFlagManager;->enabledFeatureFlags:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public isFeatureFlagEnabled(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 2

    iget-object p0, p0, Lcom/leanplum/internal/FeatureFlagManager;->enabledFeatureFlags:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public setEnabledFeatureFlags(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/leanplum/internal/FeatureFlagManager;->enabledFeatureFlags:Ljava/util/Set;

    return-void
.end method

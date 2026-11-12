.class public Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/DeferredActivitiesStrategy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/DeferredActivitiesStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BlacklistStrategy"
.end annotation


# instance fields
.field private mBlacklistedActivities:Ljava/util/Set;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>([Ljava/lang/Class;)V
    .registers 3
    .param p1    # [Ljava/lang/Class;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    array-length v0, p1

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;->mBlacklistedActivities:Ljava/util/Set;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public static varargs create([Ljava/lang/Class;)Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;
    .registers 2
    .param p0    # [Ljava/lang/Class;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;

    invoke-direct {v0, p0}, Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;-><init>([Ljava/lang/Class;)V

    return-object v0
.end method


# virtual methods
.method public isActivityClassIgnored(Ljava/lang/Class;)Z
    .registers 2
    .param p1    # Ljava/lang/Class;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;->mBlacklistedActivities:Ljava/util/Set;

    if-eqz p0, :cond_c

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

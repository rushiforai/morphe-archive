.class public interface abstract Lcom/leanplum/DeferredActivitiesStrategy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/DeferredActivitiesStrategy$WhitelistStrategy;,
        Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;
    }
.end annotation


# virtual methods
.method public abstract isActivityClassIgnored(Ljava/lang/Class;)Z
    .param p1    # Ljava/lang/Class;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.class public interface abstract annotation Lcom/google/firebase/remoteconfig/RemoteConfigConstants$ResponseFieldKey;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/remoteconfig/RemoteConfigConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "ResponseFieldKey"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final ENTRIES:Ljava/lang/String; = "entries"

.field public static final EXPERIMENT_DESCRIPTIONS:Ljava/lang/String; = "experimentDescriptions"

.field public static final PERSONALIZATION_METADATA:Ljava/lang/String; = "personalizationMetadata"

.field public static final ROLLOUT_METADATA:Ljava/lang/String; = "rolloutMetadata"

.field public static final STATE:Ljava/lang/String; = "state"

.field public static final TEMPLATE_VERSION_NUMBER:Ljava/lang/String; = "templateVersion"

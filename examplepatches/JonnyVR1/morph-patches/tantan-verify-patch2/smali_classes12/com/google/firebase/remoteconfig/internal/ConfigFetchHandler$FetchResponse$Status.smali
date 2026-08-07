.class public interface abstract annotation Lcom/google/firebase/remoteconfig/internal/ConfigFetchHandler$FetchResponse$Status;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/remoteconfig/internal/ConfigFetchHandler$FetchResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "Status"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final BACKEND_HAS_NO_UPDATES:I = 0x1

.field public static final BACKEND_UPDATES_FETCHED:I = 0x0

.field public static final LOCAL_STORAGE_USED:I = 0x2

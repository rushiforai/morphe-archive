.class public interface abstract annotation Lcom/cosmos/photon/baseim/im/ConnectionEvent;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final CONN_EVENT_AUTH_FAILED:I = 0x2

.field public static final CONN_EVENT_AUTH_SUCCESS:I = 0x1

.field public static final CONN_EVENT_AUTO_CONNECTING:I = 0x0

.field public static final CONN_EVENT_KICK:I = 0x3

.field public static final CONN_EVENT_NET_UNAVAILABLE:I = 0x4

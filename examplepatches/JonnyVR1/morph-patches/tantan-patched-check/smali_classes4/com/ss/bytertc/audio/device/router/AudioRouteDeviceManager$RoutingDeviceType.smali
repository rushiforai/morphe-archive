.class public interface abstract annotation Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$RoutingDeviceType;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "RoutingDeviceType"
.end annotation


# static fields
.field public static final BLUETOOTH_A2DP:I = 0x10

.field public static final BLUETOOTH_HEADSET:I = 0x8

.field public static final BLUETOOTH_SCO:I = 0x40

.field public static final BUILT_IN_EARPIECE:I = 0x1

.field public static final BUILT_IN_SPEAKER:I = 0x2

.field public static final UNKNOWN:I = -0x1

.field public static final USB_HEADSET:I = 0x20

.field public static final WIRED_HEADSET:I = 0x4

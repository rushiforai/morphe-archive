.class public Lorg/libsdl/app/SDLControllerManager;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SDLControllerManager"

.field protected static mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

.field protected static mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

.field protected static mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

.field private static mGxrSyntheticPadAdded:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static detectDevices()V
    .locals 1

    .line 100
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLJoystickHandler;->detectDevices()V

    return-void
.end method

.method static detectHapticDevices()V
    .locals 1

    .line 121
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-eqz v0, :cond_0

    .line 122
    invoke-virtual {v0}, Lorg/libsdl/app/SDLHapticHandler;->detectHapticDevices()V

    :cond_0
    return-void
.end method

.method public static handleJoystickMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 93
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lorg/libsdl/app/SDLJoystickHandler;->handleMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static hapticRumble(IFFI)V
    .locals 1

    .line 139
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-eqz v0, :cond_0

    .line 140
    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/libsdl/app/SDLHapticHandler;->rumble(IFFI)V

    :cond_0
    return-void
.end method

.method static hapticRun(IFI)V
    .locals 1

    .line 130
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {v0, p0, p1, p2}, Lorg/libsdl/app/SDLHapticHandler;->run(IFI)V

    :cond_0
    return-void
.end method

.method static hapticStop(I)V
    .locals 1

    .line 149
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {v0, p0}, Lorg/libsdl/app/SDLHapticHandler;->stop(I)V

    :cond_0
    return-void
.end method

.method static initialize()V
    .locals 2

    .line 59
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    if-nez v0, :cond_0

    .line 60
    new-instance v0, Lorg/libsdl/app/SDLJoystickHandler;

    invoke-direct {v0}, Lorg/libsdl/app/SDLJoystickHandler;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    .line 63
    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-nez v0, :cond_2

    const/16 v0, 0x1000

    invoke-static {v0}, Lorg/libsdl/app/SDL;->isSubsystemCompiled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 64
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_1

    .line 65
    new-instance v0, Lorg/libsdl/app/SDLHapticHandler_API31;

    invoke-direct {v0}, Lorg/libsdl/app/SDLHapticHandler_API31;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    return-void

    .line 67
    :cond_1
    new-instance v0, Lorg/libsdl/app/SDLHapticHandler_API26;

    invoke-direct {v0}, Lorg/libsdl/app/SDLHapticHandler_API26;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    :cond_2
    return-void
.end method

.method public static initializeDeviceListener()V
    .locals 3

    .line 75
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    if-nez v0, :cond_0

    .line 76
    new-instance v0, Lorg/libsdl/app/SDLDeviceListener;

    invoke-direct {v0}, Lorg/libsdl/app/SDLDeviceListener;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    .line 78
    invoke-static {}, Lorg/libsdl/app/SDL;->getContext()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "input"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/input/InputManager;

    .line 79
    sget-object v1, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/hardware/input/InputManager;->registerInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;Landroid/os/Handler;)V

    :cond_0
    return-void
.end method

.method public static isDeviceSDLJoystick(I)Z
    .locals 0

    .line 182
    invoke-static {p0}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object p0

    invoke-static {p0}, Lorg/libsdl/app/SDLControllerManager;->isDeviceSDLJoystick(Landroid/view/InputDevice;)Z

    move-result p0

    return p0
.end method

.method public static isDeviceSDLJoystick(Landroid/view/InputDevice;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    .line 157
    invoke-virtual {p0}, Landroid/view/InputDevice;->isVirtual()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 160
    :cond_0
    invoke-virtual {p0}, Landroid/view/InputDevice;->getSources()I

    move-result p0

    and-int/lit8 v1, p0, 0x10

    if-nez v1, :cond_2

    and-int/lit16 v1, p0, 0x201

    const/16 v2, 0x201

    if-eq v1, v2, :cond_2

    const/16 v1, 0x401

    and-int/2addr p0, v1

    if-ne p0, v1, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0

    :cond_3
    :goto_1
    return v0
.end method

.method static joystickSetLED(IIII)V
    .locals 1

    .line 107
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/libsdl/app/SDLJoystickHandler;->setLED(IIII)V

    return-void
.end method

.method static joystickSetSensorsEnabled(IZ)V
    .locals 1

    .line 114
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p0, p1}, Lorg/libsdl/app/SDLJoystickHandler;->setSensorsEnabled(IZ)V

    return-void
.end method

.method static native nativeAddHaptic(ILjava/lang/String;)V
.end method

.method static native nativeAddJoystick(ILjava/lang/String;Ljava/lang/String;IIIIIIZZZZ)V
.end method

.method static native nativeRemoveHaptic(I)V
.end method

.method static native nativeRemoveJoystick(I)V
.end method

.method static native nativeSetupJNI()V
.end method

.method static native onNativeHat(IIII)V
.end method

.method static native onNativeJoy(IIF)V
.end method

.method static native onNativeJoySensor(IIJFFF)V
.end method

.method public static native onNativePadDown(III)Z
.end method

.method public static native onNativePadUp(III)Z
.end method

.method public static sendGxrSyntheticPad(Z)Z
    .locals 13

    invoke-static {}, Lorg/libsdl/app/SDL;->isControllerManagerReady()Z

    move-result v0

    if-nez v0, :gxr_manager_ready

    const-string v0, "SteamLinkGXR"

    const-string v1, "Galaxy XR select ignored: SDL controller manager is not ready"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0

    :gxr_manager_ready
    sget-boolean v0, Lorg/libsdl/app/SDLControllerManager;->mGxrSyntheticPadAdded:Z

    if-nez v0, :gxr_pad_ready

    # Register a one-button Galaxy XR navigation device directly with SDL.
    # Android XR spatial select events do not have an Android gamepad InputDevice,
    # so dispatching KEYCODE_BUTTON_A never reaches SDL's joystick path.
    const v0, 0x475852

    const-string v1, "Galaxy XR Spatial Select"

    const-string v2, "Samsung Galaxy XR spatial navigation"

    const v3, 0x4e8

    const v4, 0x4758

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v0 .. v12}, Lorg/libsdl/app/SDLControllerManager;->nativeAddJoystick(ILjava/lang/String;Ljava/lang/String;IIIIIIZZZZ)V

    const/4 v0, 0x1

    sput-boolean v0, Lorg/libsdl/app/SDLControllerManager;->mGxrSyntheticPadAdded:Z

    const-string v0, "SteamLinkGXR"

    const-string v1, "Registered Galaxy XR spatial select on SDL gamepad path"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :gxr_pad_ready
    const v0, 0x475852

    const/16 v1, 0x60

    const/4 v2, 0x0

    if-eqz p0, :gxr_pad_up

    invoke-static {v0, v1, v2}, Lorg/libsdl/app/SDLControllerManager;->onNativePadDown(III)Z

    move-result v0

    const-string v1, "SteamLinkGXR"

    const-string v2, "Galaxy XR select -> SDL PAD_A down"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :gxr_pad_up
    invoke-static {v0, v1, v2}, Lorg/libsdl/app/SDLControllerManager;->onNativePadUp(III)Z

    move-result v0

    const-string v1, "SteamLinkGXR"

    const-string v2, "Galaxy XR select -> SDL PAD_A up"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public static shutdownDeviceListener()V
    .locals 2

    .line 84
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    if-eqz v0, :cond_0

    .line 85
    invoke-static {}, Lorg/libsdl/app/SDL;->getContext()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "input"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/input/InputManager;

    .line 86
    sget-object v1, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    invoke-virtual {v0, v1}, Landroid/hardware/input/InputManager;->unregisterInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;)V

    const/4 v0, 0x0

    .line 87
    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    :cond_0
    return-void
.end method

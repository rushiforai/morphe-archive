.class Lorg/libsdl/app/SDLGenericMotionListener_API14;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"

# interfaces
.implements Landroid/view/View$OnGenericMotionListener;


# static fields
.field protected static final SDL_PEN_DEVICE_TYPE_DIRECT:I = 0x1

.field protected static final SDL_PEN_DEVICE_TYPE_INDIRECT:I = 0x2

.field protected static final SDL_PEN_DEVICE_TYPE_UNKNOWN:I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 813
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private routeXrPointerAsMouse(Landroid/view/MotionEvent;)Z
    .locals 7

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v1

    if-eqz v1, :gxr_generic_tool_ok

    const/4 v2, 0x1

    if-ne v1, v2, :gxr_generic_not_pointer

    :gxr_generic_tool_ok
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x7

    if-eq v2, v3, :gxr_generic_hover

    const/16 v3, 0x9

    if-eq v2, v3, :gxr_generic_hover

    const/16 v3, 0xa

    if-eq v2, v3, :gxr_generic_hover

    const/16 v3, 0xb

    if-eq v2, v3, :gxr_generic_down_action

    const/16 v3, 0xc

    if-ne v2, v3, :gxr_generic_not_pointer

    const/4 v6, 0x1

    goto :gxr_generic_route

    :gxr_generic_down_action
    const/4 v6, 0x0

    goto :gxr_generic_route

    :gxr_generic_hover
    const/4 v6, -0x1

    :gxr_generic_route
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    const/4 v3, 0x7

    const/4 v2, 0x0

    invoke-static {v0, v3, v4, v5, v2}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    if-nez v6, :gxr_generic_maybe_up

    const/4 v1, 0x1

    invoke-static {v1}, Lorg/libsdl/app/SDLControllerManager;->sendGxrSyntheticPad(Z)Z

    move-result v1

    const/4 v1, 0x1

    const/4 v3, 0x0

    invoke-static {v1, v3, v4, v5, v2}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    const-string v1, "SteamLinkGXR"

    const-string v2, "XR panel select -> PRIMARY_MOUSE down (generic); preserving stock 5002244 route"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :gxr_generic_done

    :gxr_generic_maybe_up
    const/4 v1, 0x1

    if-ne v6, v1, :gxr_generic_done

    const/4 v1, 0x0

    invoke-static {v1}, Lorg/libsdl/app/SDLControllerManager;->sendGxrSyntheticPad(Z)Z

    move-result v1

    const/4 v1, 0x0

    const/4 v3, 0x1

    invoke-static {v1, v3, v4, v5, v2}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    const-string v1, "SteamLinkGXR"

    const-string v2, "XR panel select -> PRIMARY_MOUSE up (generic); preserving stock 5002244 route"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :gxr_generic_done
    const/4 v0, 0x1

    return v0

    :gxr_generic_not_pointer
    return v0
.end method


# virtual methods
.method checkRelativeEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 899
    invoke-virtual {p0}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->inRelativeMode()Z

    move-result p0

    return p0
.end method

.method getEventX(Landroid/view/MotionEvent;I)F
    .locals 0

    .line 903
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result p0

    return p0
.end method

.method getEventY(Landroid/view/MotionEvent;I)F
    .locals 0

    .line 907
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p0

    return p0
.end method

.method getPenDeviceType(Landroid/view/InputDevice;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method inRelativeMode()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onGenericMotion(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 12

    invoke-direct {p0, p2}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->routeXrPointerAsMouse(Landroid/view/MotionEvent;)Z

    move-result p1

    # Preserve the stock 5002244 generic-motion route after the mouse side effect.
    .line 821
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getSource()I

    move-result p1

    const v0, 0x1000010

    if-ne p1, v0, :cond_0

    .line 822
    invoke-static {p2}, Lorg/libsdl/app/SDLControllerManager;->handleJoystickMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    .line 825
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    .line 826
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    const/4 v7, 0x0

    move v0, v7

    move v8, v0

    :goto_0
    if-ge v8, p1, :cond_a

    .line 830
    invoke-virtual {p2, v8}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v1

    const/4 v2, 0x3

    const/16 v4, 0xa

    const/16 v5, 0x9

    const/4 v6, 0x7

    const/4 v9, 0x1

    if-ne v1, v2, :cond_3

    if-eq v3, v6, :cond_2

    const/16 v1, 0x8

    if-eq v3, v1, :cond_1

    goto/16 :goto_4

    .line 835
    :cond_1
    invoke-virtual {p2, v4, v8}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v0

    .line 836
    invoke-virtual {p2, v5, v8}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v1

    .line 837
    invoke-static {v7, v3, v0, v1, v7}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    goto :goto_1

    .line 842
    :cond_2
    invoke-virtual {p0, p2, v8}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getEventX(Landroid/view/MotionEvent;I)F

    move-result v0

    .line 843
    invoke-virtual {p0, p2, v8}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getEventY(Landroid/view/MotionEvent;I)F

    move-result v1

    .line 845
    invoke-virtual {p0, p2}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->checkRelativeEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    invoke-static {v7, v3, v0, v1, v2}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    :goto_1
    move v0, v9

    goto :goto_4

    :cond_3
    const/4 v2, 0x2

    const/4 v10, 0x4

    if-eq v1, v2, :cond_4

    if-ne v1, v10, :cond_9

    :cond_4
    if-eq v3, v6, :cond_5

    if-eq v3, v5, :cond_5

    if-eq v3, v4, :cond_5

    goto :goto_4

    .line 857
    :cond_5
    invoke-virtual {p2, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    .line 858
    invoke-virtual {p2, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    .line 859
    invoke-virtual {p2, v8}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v0

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v11, v0, v6

    if-lez v11, :cond_6

    goto :goto_2

    :cond_6
    move v6, v0

    .line 867
    :goto_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v0

    shr-int/2addr v0, v10

    if-ne v1, v2, :cond_7

    move v1, v7

    goto :goto_3

    :cond_7
    const/16 v1, 0x1e

    :goto_3
    shl-int v1, v9, v1

    or-int/2addr v0, v1

    .line 868
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v1

    and-int/2addr v1, v10

    if-eqz v1, :cond_8

    or-int/lit8 v0, v0, 0x8

    :cond_8
    move v2, v0

    .line 872
    invoke-virtual {p2, v8}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getPenDeviceType(Landroid/view/InputDevice;)I

    move-result v1

    invoke-static/range {v0 .. v6}, Lorg/libsdl/app/SDLActivity;->onNativePen(IIIIFFF)V

    goto :goto_1

    :cond_9
    :goto_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_a
    return v0
.end method

.method reclaimRelativeMouseModeIfNeeded()V
    .locals 0

    return-void
.end method

.method setRelativeMouseEnabled(Z)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method supportsRelativeMouse()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

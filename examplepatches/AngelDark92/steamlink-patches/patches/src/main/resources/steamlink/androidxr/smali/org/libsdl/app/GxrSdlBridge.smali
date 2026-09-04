.class public Lorg/libsdl/app/GxrSdlBridge;
.super Ljava/lang/Object;

##############################################################################
# Galaxy XR SDL Bridge                                                        #
# Package: org.libsdl.app (same as SDLControllerManager) for package-private  #
# access to SDL native methods.                                                #
##############################################################################

# State: whether we already registered the synthetic Galaxy XR pad with SDL.
.field private static sGxrPadAdded:Z

# Exact 2.0.20/5001712 must use coordinate-based mouse routing only. Sending
# PAD_A before the mouse event activates the currently focused Connect action
# before the pointed-at PC is selected, entering that build's dead cloud-pairing
# path. The build-aware Kotlin hook enters only through the wrappers below.
.field private static sGxrMouseOnly5001712:Z

# ─────────────────────────────────────────────────────────────────────────────
.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# Exact 2.0.20/5001712 mouse-only entry points. Other builds continue calling
# the original methods and retain their existing synthetic-pad plus mouse path.
.method public static routeXrPointerAsMouse5001712(Landroid/view/MotionEvent;)V
    .locals 1

    const/4 v0, 0x1
    sput-boolean v0, Lorg/libsdl/app/GxrSdlBridge;->sGxrMouseOnly5001712:Z
    invoke-static {p0}, Lorg/libsdl/app/GxrSdlBridge;->routeXrPointerAsMouse(Landroid/view/MotionEvent;)V
    return-void
.end method

.method public static routeXrPointerAsMouseGeneric5001712(Landroid/view/MotionEvent;)V
    .locals 1

    const/4 v0, 0x1
    sput-boolean v0, Lorg/libsdl/app/GxrSdlBridge;->sGxrMouseOnly5001712:Z
    invoke-static {p0}, Lorg/libsdl/app/GxrSdlBridge;->routeXrPointerAsMouseGeneric(Landroid/view/MotionEvent;)V
    return-void
.end method

# ─────────────────────────────────────────────────────────────────────────────
# routeXrPointerAsMouse(MotionEvent event)
#
# Called from the beginning of SDLSurface.onTouch().
# Translates Galaxy XR ray-cast pointer events (tool type unknown/finger/stylus/mouse)
# SDL mouse events so the SteamVR UI can track and click them.
# ─────────────────────────────────────────────────────────────────────────────
.method public static routeXrPointerAsMouse(Landroid/view/MotionEvent;)V
    .locals 7

    # v0 = action index, v1 = tool type, v2 = action masked,
    # v3 = button state / flags, v4 = x, v5 = y, v6 = relative (false)

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionIndex()I
    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getToolType(I)I
    move-result v1

    # Accept UNKNOWN/FINGER/STYLUS/MOUSE so Android XR vendor tool typing stays routable.
    if-eqz v1, :gxr_tool_ok
    const/4 v2, 0x1
    if-eq v1, v2, :gxr_tool_ok
    const/4 v2, 0x2
    if-eq v1, v2, :gxr_tool_ok
    const/4 v2, 0x3
    if-ne v1, v2, :gxr_done

    :gxr_tool_ok
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionMasked()I
    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F
    move-result v4

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F
    move-result v5

    # Send a no-button move so SDL tracks the cursor position.
    const/4 v3, 0x0
    const/4 v0, 0x7       # button = 7 (no SDL button pressed)
    const/4 v6, 0x0       # relative = false
    invoke-static {v3, v0, v4, v5, v6}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    # Classify action into: down (0, ACTION_POINTER_DOWN=5),
    # up (1, ACTION_POINTER_UP=6, MOVE=3 treated as cancel).
    if-eqz v2, :gxr_mouse_down
    const/4 v0, 0x5
    if-eq v2, v0, :gxr_mouse_down
    const/4 v0, 0x1
    if-eq v2, v0, :gxr_mouse_up
    const/4 v0, 0x6
    if-eq v2, v0, :gxr_mouse_up
    const/4 v0, 0x3
    if-ne v2, v0, :gxr_done

    :gxr_mouse_up
    # Lift the primary mouse button and release the synthetic gamepad button.
    const/4 v0, 0x0
    invoke-static {v0}, Lorg/libsdl/app/GxrSdlBridge;->sendGxrSyntheticPad(Z)Z
    move-result v0
    const/4 v3, 0x0
    const/4 v0, 0x1       # button = PRIMARY_MOUSE (1)
    invoke-static {v3, v0, v4, v5, v6}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V
    const-string v3, "SteamLinkGXR"
    const-string v0, "XR panel select -> PRIMARY_MOUSE up"
    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    goto :gxr_done

    :gxr_mouse_down
    # Press the primary mouse button and register/assert the synthetic gamepad button.
    const/4 v0, 0x1
    invoke-static {v0}, Lorg/libsdl/app/GxrSdlBridge;->sendGxrSyntheticPad(Z)Z
    move-result v0
    const/4 v3, 0x1       # button = PRIMARY_MOUSE (1)
    const/4 v0, 0x0
    invoke-static {v3, v0, v4, v5, v6}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V
    const-string v3, "SteamLinkGXR"
    const-string v0, "XR panel select -> PRIMARY_MOUSE down"
    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :gxr_done
    return-void
.end method

# ─────────────────────────────────────────────────────────────────────────────
# routeXrPointerAsMouseGeneric(MotionEvent event)
#
# Called from the beginning of SDLGenericMotionListener_API14.onGenericMotionEvent().
# Handles hover and button events from the XR ray-cast pointer.
# ─────────────────────────────────────────────────────────────────────────────
.method public static routeXrPointerAsMouseGeneric(Landroid/view/MotionEvent;)V
    .locals 7

    # v0 = pointer index 0, v1 = tool type
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getToolType(I)I
    move-result v1

    if-eqz v1, :gxr_generic_ok
    const/4 v2, 0x1
    if-eq v1, v2, :gxr_generic_ok
    const/4 v2, 0x2
    if-eq v1, v2, :gxr_generic_ok
    const/4 v2, 0x3
    if-ne v1, v2, :gxr_generic_done

    :gxr_generic_ok
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionMasked()I
    move-result v2

    # Hover: ACTION_HOVER_MOVE=7, HOVER_ENTER=9, HOVER_EXIT=10
    const/4 v3, 0x7
    if-eq v2, v3, :gxr_generic_hover
    const/16 v3, 0x9
    if-eq v2, v3, :gxr_generic_hover
    const/16 v3, 0xa
    if-eq v2, v3, :gxr_generic_hover

    # Button down: ACTION_BUTTON_PRESS=11
    const/16 v3, 0xb
    if-eq v2, v3, :gxr_generic_down

    # Button up: ACTION_BUTTON_RELEASE=12
    const/16 v3, 0xc
    if-ne v2, v3, :gxr_generic_done

    # v6 = 1 (button up marker)
    const/4 v6, 0x1
    goto :gxr_generic_route

    :gxr_generic_down
    const/4 v6, 0x0
    goto :gxr_generic_route

    :gxr_generic_hover
    const/4 v6, -0x1       # hover marker

    :gxr_generic_route
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getX()F
    move-result v4
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getY()F
    move-result v5

    # Always send a no-button position update.
    const/4 v3, 0x7
    const/4 v2, 0x0
    invoke-static {v0, v3, v4, v5, v2}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    # Hover only → done.
    const/4 v1, -0x1
    if-eq v6, v1, :gxr_generic_done

    # Button down (v6 == 0).
    if-nez v6, :gxr_generic_maybe_up

    const/4 v1, 0x1
    invoke-static {v1}, Lorg/libsdl/app/GxrSdlBridge;->sendGxrSyntheticPad(Z)Z
    move-result v1
    const/4 v1, 0x1
    const/4 v3, 0x0
    invoke-static {v1, v3, v4, v5, v2}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V
    const-string v1, "SteamLinkGXR"
    const-string v2, "XR panel select -> PRIMARY_MOUSE down (generic)"
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    goto :gxr_generic_done

    :gxr_generic_maybe_up
    const/4 v1, 0x1
    if-ne v6, v1, :gxr_generic_done

    const/4 v1, 0x0
    invoke-static {v1}, Lorg/libsdl/app/GxrSdlBridge;->sendGxrSyntheticPad(Z)Z
    move-result v1
    const/4 v1, 0x0
    const/4 v3, 0x1
    invoke-static {v1, v3, v4, v5, v2}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V
    const-string v1, "SteamLinkGXR"
    const-string v2, "XR panel select -> PRIMARY_MOUSE up (generic)"
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :gxr_generic_done
    return-void
.end method

# ─────────────────────────────────────────────────────────────────────────────
# sendGxrSyntheticPad(boolean down) → boolean
#
# Registers a synthetic Galaxy XR navigation gamepad with SDL on first call,
# then sends PAD_A down or up events.  Returns true on success, false if SDL
# controller manager is not ready yet.
# ─────────────────────────────────────────────────────────────────────────────
.method public static sendGxrSyntheticPad(Z)Z
    .locals 13

    # The exact 5001712 wrappers deliberately suppress the duplicate PAD_A
    # activation. Mouse position and PRIMARY_MOUSE events still follow below
    # in the shared route methods.
    sget-boolean v0, Lorg/libsdl/app/GxrSdlBridge;->sGxrMouseOnly5001712:Z
    if-eqz v0, :gxr_modern_sdl_api

    const/4 v0, 0x0
    return v0

    :gxr_modern_sdl_api

    # Check SDL controller manager is initialised.
    invoke-static {}, Lorg/libsdl/app/SDL;->isControllerManagerReady()Z
    move-result v0
    if-nez v0, :gxr_manager_ready

    const-string v0, "SteamLinkGXR"
    const-string v1, "Galaxy XR select ignored: SDL controller manager is not ready"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return v0

    :gxr_manager_ready
    # Register the synthetic pad once.
    sget-boolean v0, Lorg/libsdl/app/GxrSdlBridge;->sGxrPadAdded:Z
    if-nez v0, :gxr_pad_ready

    # nativeAddJoystick(deviceId, name, desc, vendorId, productId,
    #                   buttonMask, nbuttons, nhats, naxes, hasDpad,
    #                   hasButtons, hasNonButtonAxes, hasStick)
    const v0,  0x475852                            # device_id   = GXR_DEVICE_ID
    const-string v1,  "Galaxy XR Spatial Select"
    const-string v2,  "Samsung Galaxy XR spatial navigation"
    const v3,  0x4e8                               # vendor_id   (0x04E8 Samsung)
    const v4,  0x4758                              # product_id  ('GX')
    const/4 v5,  0x1                               # button_mask = 1
    const/4 v6,  0x0
    const/4 v7,  0x0
    const/4 v8,  0x0
    const/4 v9,  0x0
    const/4 v10, 0x0
    const/4 v11, 0x0
    const/4 v12, 0x0
    invoke-static/range {v0 .. v12}, Lorg/libsdl/app/SDLControllerManager;->nativeAddJoystick(ILjava/lang/String;Ljava/lang/String;IIIIIIZZZZ)V

    const/4 v0, 0x1
    sput-boolean v0, Lorg/libsdl/app/GxrSdlBridge;->sGxrPadAdded:Z
    const-string v0, "SteamLinkGXR"
    const-string v1, "Registered Galaxy XR spatial select on SDL gamepad path"
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :gxr_pad_ready
    # Send PAD_A down or up.  deviceId=0x475852, keyCode=0x60 (BUTTON_A), scancode=0.
    const v0,  0x475852
    const/16 v1, 0x60      # SDL BUTTON_A
    const/4 v2,  0x0       # scancode

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

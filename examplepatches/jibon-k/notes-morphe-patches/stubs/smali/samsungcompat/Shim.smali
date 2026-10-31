.class public final Lsamsungcompat/Shim;
.super Ljava/lang/Object;

.field public static f0_composer_image_not_found:I
.field public static f1_SEM_PLATFORM_INT:I
.field public static f2_SEM_FIRST_SDK_INT:I
.field public static f3_semDisplayDeviceType:I
.field public static f4_semMobileKeyboardCovered:I
.field public static f5_accessibleName:Ljava/lang/String;
.field public static f6_accessibleDescription:Ljava/lang/String;
.field public static f7_accessibleName:Ljava/lang/String;
.field public static f8_accessibleParent:Ljavax/accessibility/Accessible;
.field public static f9_accessibleName:Ljava/lang/String;
.field public static f10_accessibleDescription:Ljava/lang/String;
.field public static f11_accessibleName:Ljava/lang/String;
.field public static f12_accessibleParent:Ljavax/accessibility/Accessible;
.field public static f13_accessibleName:Ljava/lang/String;
.field public static f14_consumer:Lorg/apache/poi/java/awt/image/ImageConsumer;
.field public static f15_anchor:Lorg/apache/poi/xssf/usermodel/XSSFAnchor;
.field public static f16_drawing:Lorg/apache/poi/xssf/usermodel/XSSFDrawing;
.field public static f17_processingEnv:Ljavax/annotation/processing/ProcessingEnvironment;
.field public static f18_SEM_CURRENT:Landroid/os/UserHandle;
.field public static f19_SEM_OWNER:Landroid/os/UserHandle;
.field public static f20_SEM_ALL:Landroid/os/UserHandle;
.field public static f21_coverMode:I
.field public static f22_semDesktopModeEnabled:I
.field public static f23_SEM_INT:I

.method static constructor <clinit>()V
    .locals 2
    const/4 v0, 0x0
    invoke-static {v0}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;
    move-result-object v0
    sput-object v0, Lsamsungcompat/Shim;->f19_SEM_OWNER:Landroid/os/UserHandle;
    const v0, -0x186a0
    invoke-static {v0}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;
    move-result-object v0
    sput-object v0, Lsamsungcompat/Shim;->f20_SEM_ALL:Landroid/os/UserHandle;
    return-void
.end method

.method public static m0_semSetAnchor(Landroid/app/Dialog;II)V
    .locals 2
    return-void
.end method

.method public static m1_semSetPopOverOptions(Landroid/app/ActivityOptions;[I[I[Landroid/graphics/Point;[I)Landroid/app/ActivityOptions;
    .locals 2
    return-object p0
.end method

.method public static m2_semSetChooserPopOverPosition(Landroid/app/ActivityOptions;I)Landroid/app/ActivityOptions;
    .locals 2
    return-object p0
.end method

.method public static m3_semSetPendingIntentAfterUnlock(Landroid/app/KeyguardManager;Landroid/app/PendingIntent;Landroid/content/Intent;)V
    .locals 2
    return-void
.end method

.method public static m4_semSetBlurInfo(Landroid/view/View;Landroid/view/SemBlurInfo;)V
    .locals 2
    return-void
.end method

.method public static m5_semSetAnchor(Landroid/app/Dialog;Landroid/view/View;)V
    .locals 2
    return-void
.end method

.method public static m6_semSetAnchor(Landroid/app/Dialog;Landroid/view/View;I)V
    .locals 2
    return-void
.end method

.method public static m7_semGetMyUserId()I
    .locals 2
    invoke-static {}, Landroid/os/Process;->myUid()I
    move-result v0
    const v1, 0x186a0
    div-int/2addr v0, v1
    return v0
.end method

.method public static m8_semSetUserDataRecoveryEnabled(Landroid/database/sqlite/SQLiteOpenHelper;Z)V
    .locals 2
    return-void
.end method

.method public static m9_semGetApplicationIconForIconTray(Landroid/content/pm/PackageManager;Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 2
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    move-result-object v0
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getApplicationIcon(Landroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;
    move-result-object v0
    return-object v0
.end method

.method public static m10_semSetBiometricType(Landroid/hardware/biometrics/BiometricPrompt$Builder;I)Landroid/hardware/biometrics/BiometricPrompt$Builder;
    .locals 2
    return-object p0
.end method

.method public static m11_semIsRecordActive(Landroid/media/AudioManager;I)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m12_semGetStreamType(I)I
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m13_semSetSituationType(Landroid/media/SoundPool;ILjava/lang/String;)V
    .locals 2
    return-void
.end method

.method public static m14_semGetSituationVolume(Landroid/media/AudioManager;II)F
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m15_semSeekTo(Landroid/media/MediaPlayer;II)V
    .locals 2
    return-void
.end method

.method public static m16_semGoToSleep(Landroid/os/PowerManager;J)V
    .locals 2
    return-void
.end method

.method public static m17_semWakeUp(Landroid/os/PowerManager;JILjava/lang/String;)V
    .locals 2
    return-void
.end method

.method public static m18_semGetCallingUserId()I
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m19_semGetSemUserInfo(Landroid/os/UserManager;I)Landroid/content/pm/SemUserInfo;
    .locals 2
    new-instance v0, Landroid/content/pm/SemUserInfo;
    invoke-direct {v0}, Landroid/content/pm/SemUserInfo;-><init>()V
    return-object v0
.end method

.method public static m20_semIsGuestUser(Landroid/os/UserManager;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m21_semGetIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I
    .locals 2
    invoke-static {p0, p1, p2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    move-result v0
    return v0
.end method

.method public static m22_semGetPath(Landroid/os/storage/StorageVolume;)Ljava/lang/String;
    .locals 2
    const-string v0, ""
    return-object v0
.end method

.method public static m23_semGetHoverPopup(Landroid/view/View;Z)Lcom/samsung/android/widget/SemHoverPopupWindow;
    .locals 2
    new-instance v0, Lcom/samsung/android/widget/SemHoverPopupWindow;
    invoke-direct {v0}, Lcom/samsung/android/widget/SemHoverPopupWindow;-><init>()V
    return-object v0
.end method

.method public static m24_semSetHoverPopupType(Landroid/view/View;I)V
    .locals 2
    return-void
.end method

.method public static m25_semSetHoverScrollEnabled(Landroid/widget/AbsListView;Z)V
    .locals 2
    return-void
.end method

.method public static m26_semForceHideSoftInput(Landroid/view/inputmethod/InputMethodManager;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m27_semIsInputMethodShown(Landroid/view/inputmethod/InputMethodManager;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m28_semIsAccessoryKeyboard(Landroid/view/inputmethod/InputMethodManager;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m29_semMinimizeSoftInput(Landroid/view/inputmethod/InputMethodManager;Landroid/os/IBinder;I)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m30_semGetSupportedVibrationType(Landroid/os/Vibrator;)I
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m31_semGetVibrationIndex(I)I
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m32_semCreateWaveform(IILandroid/os/VibrationEffect$SemMagnitudeType;)Landroid/os/VibrationEffect;
    .locals 2
    const/4 v0, 0x2
    invoke-static {v0}, Landroid/os/VibrationEffect;->createPredefined(I)Landroid/os/VibrationEffect;
    move-result-object v0
    return-object v0
.end method

.method public static m33_semGetNumberOfSupportedPatterns(Landroid/os/Vibrator;)I
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m34_semRequestAccessibilityFocus(Landroid/view/View;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m35_semSetActionModeMenuItemEnabled(Landroid/widget/TextView;IZ)V
    .locals 2
    return-void
.end method

.method public static m36_semSetPointerIcon(Landroid/view/View;ILandroid/view/PointerIcon;)V
    .locals 2
    return-void
.end method

.method public static m37_semSetRoundedCornerColor(Landroid/view/View;II)V
    .locals 2
    return-void
.end method

.method public static m38_semSetRoundedCorners(Landroid/view/View;ILandroid/util/Pair;)V
    .locals 2
    return-void
.end method

.method public static m39_semIsPopOver(Landroid/content/res/Configuration;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m40_semExitMultiWindowMode(Landroid/app/Activity;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m41_semAddExtensionFlags(Landroid/view/WindowManager$LayoutParams;I)V
    .locals 2
    return-void
.end method

.method public static m42_semGetPrefixCharForSpan(Landroid/text/TextPaint;Ljava/lang/CharSequence;[C)[C
    .locals 2
    return-object p2
.end method

.method public static m43_semSetMultiSelectionEnabled(Landroid/widget/TextView;Z)V
    .locals 2
    return-void
.end method

.method public static m44_semGetIdentifier(Landroid/os/UserHandle;)I
    .locals 2
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I
    move-result v0
    return v0
.end method

.method public static m45_semGetDeviceOwner(Landroid/app/admin/DevicePolicyManager;)Ljava/lang/String;
    .locals 2
    const-string v0, ""
    return-object v0
.end method

.method public static m46_semIsManagedProfile(Landroid/os/UserManager;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m47_staticFieldOffset(Lsun/misc/Unsafe;Ljava/lang/reflect/Field;)J
    .locals 2
    const-wide/16 v0, 0x0
    return-wide v0
.end method

.method public static m48_staticFieldBase(Lsun/misc/Unsafe;Ljava/lang/reflect/Field;)Ljava/lang/Object;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m49_copyMemory(Lsun/misc/Unsafe;Ljava/lang/Object;JLjava/lang/Object;JJ)V
    .locals 2
    return-void
.end method

.method public static m50_reallocateMemory(Lsun/misc/Unsafe;JJ)J
    .locals 2
    return-wide p3
.end method

.method public static m51_setMemory(Lsun/misc/Unsafe;Ljava/lang/Object;JJB)V
    .locals 2
    return-void
.end method

.method public static m52_throwException(Lsun/misc/Unsafe;Ljava/lang/Throwable;)V
    .locals 2
    return-void
.end method

.method public static m53_log(Lio/netty/util/internal/logging/Log4J2Logger;Lorg/apache/logging/log4j/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    return-void
.end method

.method public static m54_isEnabled(Lio/netty/util/internal/logging/Log4J2Logger;Lorg/apache/logging/log4j/Level;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m55_log(Lio/netty/util/internal/logging/Log4J2Logger;Lorg/apache/logging/log4j/Level;Ljava/lang/String;)V
    .locals 2
    return-void
.end method

.method public static m56_log(Lio/netty/util/internal/logging/Log4J2Logger;Lorg/apache/logging/log4j/Level;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    return-void
.end method

.method public static m57_log(Lio/netty/util/internal/logging/Log4J2Logger;Lorg/apache/logging/log4j/Level;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    return-void
.end method

.method public static m58_log(Lio/netty/util/internal/logging/Log4J2Logger;Lorg/apache/logging/log4j/Level;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    return-void
.end method

.method public static m59_getName(Lio/netty/util/internal/logging/Log4J2Logger;)Ljava/lang/String;
    .locals 2
    const-string v0, ""
    return-object v0
.end method

.method public static m60_setName(Lorg/apache/commons/beanutils/MappedPropertyDescriptor;Ljava/lang/String;)V
    .locals 2
    return-void
.end method

.method public static m61_getContext(Lorg/apache/commons/logging/impl/Log4jApiLogFactory$LogAdapter;Ljava/lang/Class;)Lorg/apache/logging/log4j/spi/LoggerContext;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m62_runOneComponent(Lorg/apache/poi/java/awt/GraphicsCallback$PeerPaintCallback;Lorg/apache/poi/java/awt/Component;Lorg/apache/poi/java/awt/Rectangle;Lorg/apache/poi/java/awt/Graphics;Lorg/apache/poi/java/awt/Shape;I)V
    .locals 2
    return-void
.end method

.method public static m63_firePropertyChange(Lorg/apache/poi/java/awt/Container$AccessibleAWTContainer;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    return-void
.end method

.method public static m64_runComponents(Lorg/apache/poi/java/awt/GraphicsCallback$PaintCallback;[Lorg/apache/poi/java/awt/Component;Lorg/apache/poi/java/awt/Graphics;I)V
    .locals 2
    return-void
.end method

.method public static m65_runComponents(Lorg/apache/poi/java/awt/GraphicsCallback$PaintAllCallback;[Lorg/apache/poi/java/awt/Component;Lorg/apache/poi/java/awt/Graphics;I)V
    .locals 2
    return-void
.end method

.method public static m66_runComponents(Lorg/apache/poi/java/awt/GraphicsCallback$PaintHeavyweightComponentsCallback;[Lorg/apache/poi/java/awt/Component;Lorg/apache/poi/java/awt/Graphics;I)V
    .locals 2
    return-void
.end method

.method public static m67_isPostEventQueueEmpty()Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m68_setAccessibleParent(Lorg/apache/poi/java/awt/List$AccessibleAWTList$AccessibleAWTListChild;Ljavax/accessibility/Accessible;)V
    .locals 2
    return-void
.end method

.method public static m69_firePropertyChange(Lorg/apache/poi/java/awt/TextComponent$AccessibleAWTTextComponent;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    return-void
.end method

.method public static m70_isLinearRGBspace(Lorg/apache/poi/java/awt/color/ColorSpace;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m71_isLinearGRAYspace(Lorg/apache/poi/java/awt/color/ColorSpace;)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m72_getGray8TosRGB8LUT(Lorg/apache/poi/java/awt/color/ICC_ColorSpace;)[B
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m73_getGray16TosRGB8LUT(Lorg/apache/poi/java/awt/color/ICC_ColorSpace;)[B
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m74_getLinearGray16ToOtherGray8LUT(Lorg/apache/poi/java/awt/color/ICC_ColorSpace;)[B
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m75_getLinearGray16ToOtherGray16LUT(Lorg/apache/poi/java/awt/color/ICC_ColorSpace;)[S
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m76_access$700()Lorg/apache/poi/sun/util/logging/PlatformLogger;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m77_access$800(Lorg/apache/poi/sun/awt/AppContext;)Ljava/lang/ThreadGroup;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m78_access$900()Lorg/apache/poi/sun/awt/AppContext;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m79_getConnectPermission(Ljava/net/URL;)Ljava/security/Permission;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m80_getAnchor(Lorg/apache/poi/xssf/usermodel/XSSFPicture;)Lorg/apache/poi/xssf/usermodel/XSSFAnchor;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m81_getDrawing(Lorg/apache/poi/xssf/usermodel/XSSFPicture;)Lorg/apache/poi/xssf/usermodel/XSSFDrawing;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m82_underlyingXmlObject(Lorg/apache/xmlbeans/FilterXmlObject;)Lorg/apache/xmlbeans/XmlObject;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m83_set(Lorg/apache/xmlbeans/impl/xb/xsdschema/All;Lorg/apache/xmlbeans/XmlObject;)Lorg/apache/xmlbeans/XmlObject;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m84_invalidate(Landroidx/room/paging/LimitOffsetDataSource;)V
    .locals 2
    return-void
.end method

.method public static m85_computeInitialLoadPosition(Landroidx/paging/PositionalDataSource$LoadInitialParams;I)I
    .locals 2
    return p1
.end method

.method public static m86_computeInitialLoadSize(Landroidx/paging/PositionalDataSource$LoadInitialParams;II)I
    .locals 2
    return p2
.end method

.method public static m87_getApplicationContext(Lcom/google/android/appfunctions/service/MainAppFunctionService;)Landroid/content/Context;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m88_visit(Lcom/google/auto/common/AnnotationOutput$SourceFormVisitor;Ljavax/lang/model/element/AnnotationValue;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    return-object p2
.end method

.method public static m89_visit(Lcom/google/auto/common/AnnotationValues$AnnotationMirrorVisitor;Ljavax/lang/model/element/AnnotationValue;)Ljava/lang/Object;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m90_visit(Lcom/google/auto/common/AnnotationValues$ArrayVisitor;Ljavax/lang/model/element/AnnotationValue;)Ljava/lang/Object;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m91_visit(Lcom/google/auto/common/AnnotationValues$EnumVisitor;Ljavax/lang/model/element/AnnotationValue;)Ljava/lang/Object;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m92_visit(Lcom/google/auto/common/AnnotationValues$TypeMirrorVisitor;Ljavax/lang/model/element/AnnotationValue;)Ljava/lang/Object;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m93_visit(Lcom/google/auto/common/MoreTypes$CastingUncheckedVisitor;Ljavax/lang/model/type/TypeMirror;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    return-object p2
.end method

.method public static m94_visit(Lcom/google/auto/common/Overrides$ExplicitOverrides$TypeSubstVisitor;Ljavax/lang/model/type/TypeMirror;)Ljava/lang/Object;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m95_semIsProductDev()Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m96_check_orphaned(Lorg/openxmlformats/schemas/wordprocessingml/x2006/main/impl/CTCommentImpl;)V
    .locals 2
    return-void
.end method

.method public static m97_get_store(Lorg/openxmlformats/schemas/wordprocessingml/x2006/main/impl/CTCommentImpl;)Lorg/apache/xmlbeans/impl/values/TypeStore;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m98_arraySetterHelper(Lorg/openxmlformats/schemas/wordprocessingml/x2006/main/impl/CTCommentImpl;[Lorg/apache/xmlbeans/XmlObject;Lorg/apache/poi/javax/xml/namespace/QName;)V
    .locals 2
    return-void
.end method

.method public static m99_check_orphaned(Lorg/openxmlformats/schemas/wordprocessingml/x2006/main/impl/CTRunTrackChangeImpl;)V
    .locals 2
    return-void
.end method

.method public static m100_get_store(Lorg/openxmlformats/schemas/wordprocessingml/x2006/main/impl/CTRunTrackChangeImpl;)Lorg/apache/xmlbeans/impl/values/TypeStore;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public static m101_arraySetterHelper(Lorg/openxmlformats/schemas/wordprocessingml/x2006/main/impl/CTRunTrackChangeImpl;[Lorg/apache/xmlbeans/XmlObject;Lorg/apache/poi/javax/xml/namespace/QName;)V
    .locals 2
    return-void
.end method

.method public static m102_getHoverPopupWindow(Landroid/view/View;)Landroid/widget/HoverPopupWindow;
    .locals 2
    new-instance v0, Landroid/widget/HoverPopupWindow;
    invoke-direct {v0}, Landroid/widget/HoverPopupWindow;-><init>()V
    return-object v0
.end method

.method public static m103_setHoverPopupType(Landroid/view/View;I)V
    .locals 2
    return-void
.end method

.method public static m104_semGetWifiDisplayStatus(Landroid/hardware/display/DisplayManager;)Landroid/hardware/display/SemWifiDisplayStatus;
    .locals 2
    new-instance v0, Landroid/hardware/display/SemWifiDisplayStatus;
    invoke-direct {v0}, Landroid/hardware/display/SemWifiDisplayStatus;-><init>()V
    return-object v0
.end method

.method public static m105_semSetDurationInterval(Landroid/media/MediaRecorder;I)V
    .locals 2
    return-void
.end method

.method public static m106_semGetSystemFeatureLevel(Landroid/content/pm/PackageManager;Ljava/lang/String;)I
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static m107_semGetFontPathOfCurrentFontStyle(Landroid/content/Context;I)Ljava/lang/String;
    .locals 2
    const-string v0, ""
    return-object v0
.end method


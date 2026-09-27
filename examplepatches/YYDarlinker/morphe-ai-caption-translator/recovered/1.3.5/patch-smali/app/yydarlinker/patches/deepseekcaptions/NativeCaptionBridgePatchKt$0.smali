.class public final synthetic Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lcom/android/tools/smali/dexlib2/iface/ClassDef;

.field public final synthetic f$1:Lcom/android/tools/smali/dexlib2/iface/Field;

.field public final synthetic f$2:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/android/tools/smali/dexlib2/iface/ClassDef;Lcom/android/tools/smali/dexlib2/iface/Field;Ljava/util/List;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$0;->f$0:Lcom/android/tools/smali/dexlib2/iface/ClassDef;

    iput-object p2, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$0;->f$1:Lcom/android/tools/smali/dexlib2/iface/Field;

    iput-object p3, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$0;->f$2:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$0;->f$0:Lcom/android/tools/smali/dexlib2/iface/ClassDef;

    iget-object v1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$0;->f$1:Lcom/android/tools/smali/dexlib2/iface/Field;

    iget-object p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$0;->f$2:Ljava/util/List;

    check-cast p1, Lcom/android/tools/smali/dexlib2/iface/ClassDef;

    invoke-static {v0, v1, p0, p1}, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt;->installNativeCaptionBridge$lambda$78(Lcom/android/tools/smali/dexlib2/iface/ClassDef;Lcom/android/tools/smali/dexlib2/iface/Field;Ljava/util/List;Lcom/android/tools/smali/dexlib2/iface/ClassDef;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

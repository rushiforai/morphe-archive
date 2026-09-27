.class public final synthetic Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    check-cast p1, Lapp/morphe/patcher/patch/BytecodePatchContext;

    invoke-static {p1}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->$r8$lambda$WW8PMZrp50C9x8GjsjISP8nATO0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

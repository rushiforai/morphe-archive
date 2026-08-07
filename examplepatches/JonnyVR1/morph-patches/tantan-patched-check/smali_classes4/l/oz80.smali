.class public final synthetic Ll/oz80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Landroid/util/Pair;

    check-cast p3, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    invoke-static {p1, p2, p3}, Ll/b090;->m0(Ljava/lang/Boolean;Landroid/util/Pair;Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;)Lkotlin/Triple;

    move-result-object p0

    return-object p0
.end method

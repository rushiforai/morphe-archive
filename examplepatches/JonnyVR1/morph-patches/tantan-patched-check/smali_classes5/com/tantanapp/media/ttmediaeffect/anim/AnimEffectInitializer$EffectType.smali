.class public final enum Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EffectType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

.field public static final enum MMSVGA:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

    .line 2
    .line 3
    const-string v1, "MMSVGA"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;->MMSVGA:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

    .line 10
    .line 11
    filled-new-array {v0}, [Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;->$VALUES:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;
    .locals 1

    .line 1
    const-class v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;->$VALUES:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;

    .line 8
    .line 9
    return-object v0
.end method

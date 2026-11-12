.class public abstract Ltl6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const/16 v1, 0x2f

    invoke-static {v1}, Lvep;->B(I)[I

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_d
    if-ge v3, v2, :cond_be

    aget v4, v1, v3

    packed-switch v4, :pswitch_data_c2

    const/4 v0, 0x0

    throw v0

    :pswitch_16
    const-string v4, "ZTE V0840"

    goto/16 :goto_b7

    :pswitch_1a
    const-string v4, "ZTE BLADE A0620"

    goto/16 :goto_b7

    :pswitch_1e
    const-string v4, "vivo 1820"

    goto/16 :goto_b7

    :pswitch_22
    const-string v4, "TECNO K8"

    goto/16 :goto_b7

    :pswitch_26
    const-string v4, "TECNO KB2"

    goto/16 :goto_b7

    :pswitch_2a
    const-string v4, "i60"

    goto/16 :goto_b7

    :pswitch_2e
    const-string v4, "TVBOX-5G"

    goto/16 :goto_b7

    :pswitch_32
    const-string v4, "LT P10I"

    goto/16 :goto_b7

    :pswitch_36
    const-string v4, "C3700"

    goto/16 :goto_b7

    :pswitch_3a
    const-string v4, "C3600"

    goto/16 :goto_b7

    :pswitch_3e
    const-string v4, "Lenovo L38011"

    goto/16 :goto_b7

    :pswitch_42
    const-string v4, "Z60"

    goto/16 :goto_b7

    :pswitch_46
    const-string v4, "itel A44 Power"

    goto/16 :goto_b7

    :pswitch_4a
    const-string v4, "itel S32"

    goto/16 :goto_b7

    :pswitch_4e
    const-string v4, "Infinix HOT 4 Pro"

    goto/16 :goto_b7

    :pswitch_52
    const-string v4, "STF-L09"

    goto/16 :goto_b7

    :pswitch_56
    const-string v4, "LND-L29"

    goto/16 :goto_b7

    :pswitch_5a
    const-string v4, "LLD-L31"

    goto/16 :goto_b7

    :pswitch_5e
    const-string v4, "LLD-L21"

    goto/16 :goto_b7

    :pswitch_62
    const-string v4, "LLD-AL20"

    goto/16 :goto_b7

    :pswitch_66
    const-string v4, "KSA-LX9"

    goto/16 :goto_b7

    :pswitch_6a
    const-string v4, "JAT-LX1"

    goto :goto_b7

    :pswitch_6d
    const-string v4, "JAT-L41"

    goto :goto_b7

    :pswitch_70
    const-string v4, "JAT-L29"

    goto :goto_b7

    :pswitch_73
    const-string v4, "GLK-AL00"

    goto :goto_b7

    :pswitch_76
    const-string v4, "DLI-L42"

    goto :goto_b7

    :pswitch_79
    const-string v4, "COR-L29"

    goto :goto_b7

    :pswitch_7c
    const-string v4, "COR-AL00"

    goto :goto_b7

    :pswitch_7f
    const-string v4, "BND-L21"

    goto :goto_b7

    :pswitch_82
    const-string v4, "BND-AL10"

    goto :goto_b7

    :pswitch_85
    const-string v4, "BLN-L21"

    goto :goto_b7

    :pswitch_88
    const-string v4, "BKK-LX2"

    goto :goto_b7

    :pswitch_8b
    const-string v4, "BKK-L21"

    goto :goto_b7

    :pswitch_8e
    const-string v4, "AUM-L41"

    goto :goto_b7

    :pswitch_91
    const-string v4, "AUM-L29"

    goto :goto_b7

    :pswitch_94
    const-string v4, "AUM-AL20"

    goto :goto_b7

    :pswitch_97
    const-string v4, "M7 Power"

    goto :goto_b7

    :pswitch_9a
    const-string v4, "GIONEE S11 lite"

    goto :goto_b7

    :pswitch_9d
    const-string v4, "GIONEE S10 lite"

    goto :goto_b7

    :pswitch_a0
    const-string v4, "GIONEE S10L"

    goto :goto_b7

    :pswitch_a3
    const-string v4, "GIONEE S10B"

    goto :goto_b7

    :pswitch_a6
    const-string v4, "GIONEE S10"

    goto :goto_b7

    :pswitch_a9
    const-string v4, "GIONEE M7L"

    goto :goto_b7

    :pswitch_ac
    const-string v4, "GIONEE M7"

    goto :goto_b7

    :pswitch_af
    const-string v4, "GIONEE F6L"

    goto :goto_b7

    :pswitch_b2
    const-string v4, "GIONEE F205"

    goto :goto_b7

    :pswitch_b5
    const-string v4, "MBOX"

    :goto_b7
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_d

    :cond_be
    sput-object v0, Ltl6;->a:Ljava/util/HashSet;

    return-void

    nop

    :pswitch_data_c2
    .packed-switch 0x1
        :pswitch_b5
        :pswitch_b2
        :pswitch_af
        :pswitch_ac
        :pswitch_a9
        :pswitch_a6
        :pswitch_a3
        :pswitch_a0
        :pswitch_9d
        :pswitch_9a
        :pswitch_97
        :pswitch_94
        :pswitch_91
        :pswitch_8e
        :pswitch_8b
        :pswitch_88
        :pswitch_85
        :pswitch_82
        :pswitch_7f
        :pswitch_7c
        :pswitch_79
        :pswitch_76
        :pswitch_73
        :pswitch_70
        :pswitch_6d
        :pswitch_6a
        :pswitch_66
        :pswitch_62
        :pswitch_5e
        :pswitch_5a
        :pswitch_56
        :pswitch_52
        :pswitch_4e
        :pswitch_4a
        :pswitch_46
        :pswitch_42
        :pswitch_3e
        :pswitch_3a
        :pswitch_36
        :pswitch_32
        :pswitch_2e
        :pswitch_2a
        :pswitch_26
        :pswitch_22
        :pswitch_1e
        :pswitch_1a
        :pswitch_16
    .end packed-switch
.end method

.method public static a()Z
    .registers 2

    sget-object v0, Ltl6;->a:Ljava/util/HashSet;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

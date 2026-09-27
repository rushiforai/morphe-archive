.class public final Lkotlin/jvm/internal/ClassReference$Companion;
.super Ljava/lang/Object;
.source "ClassReference.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/jvm/internal/ClassReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nClassReference.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ClassReference.kt\nkotlin/jvm/internal/ClassReference$Companion\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,293:1\n1#2:294\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0014\u0010\t\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000b\u001a\u00020\nH\u0082\u0080\u0004J\u0014\u0010\u000c\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000b\u001a\u00020\nH\u0082\u0080\u0004J\u0018\u0010\r\u001a\u0004\u0018\u00010\n2\n\u0010\u000e\u001a\u0006\u0012\u0002\u0008\u00030\u0006H\u0086\u0080\u0004J\u0018\u0010\u000f\u001a\u0004\u0018\u00010\n2\n\u0010\u000e\u001a\u0006\u0012\u0002\u0008\u00030\u0006H\u0086\u0080\u0004J \u0010\u0010\u001a\u00020\u00112\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u00012\n\u0010\u000e\u001a\u0006\u0012\u0002\u0008\u00030\u0006H\u0086\u0080\u0004R\'\u0010\u0004\u001a\u001a\u0012\u0010\u0012\u000e\u0012\n\u0008\u0001\u0012\u0006\u0012\u0002\u0008\u00030\u00070\u0006\u0012\u0004\u0012\u00020\u00080\u0005X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lkotlin/jvm/internal/ClassReference$Companion;",
        "",
        "<init>",
        "()V",
        "FUNCTION_CLASSES",
        "",
        "Ljava/lang/Class;",
        "Lkotlin/Function;",
        "",
        "classFqNameOf",
        "",
        "type",
        "simpleNameOf",
        "getClassSimpleName",
        "jClass",
        "getClassQualifiedName",
        "isInstance",
        "",
        "value",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference$Companion;-><init>()V

    return-void
.end method

.method private final classFqNameOf(Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    .line 113
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p0

    const-string v0, "kotlin.Boolean"

    const-string v1, "kotlin.Long"

    const-string v2, "kotlin.Char"

    const-string v3, "kotlin.Byte"

    const-string v4, "kotlin.Short"

    const-string v5, "kotlin.Float"

    const-string v6, "kotlin.Double"

    const-string v7, "kotlin.Int"

    sparse-switch p0, :sswitch_data_354

    packed-switch p0, :pswitch_data_402

    packed-switch p0, :pswitch_data_41a

    packed-switch p0, :pswitch_data_424

    goto/16 :goto_34f

    :pswitch_22
    const-string p0, "kotlin.jvm.functions.Function9"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c

    goto/16 :goto_34f

    .line 156
    :cond_2c
    const-string p0, "kotlin.Function9"

    return-object p0

    .line 113
    :pswitch_2f
    const-string p0, "kotlin.jvm.functions.Function8"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_39

    goto/16 :goto_34f

    .line 155
    :cond_39
    const-string p0, "kotlin.Function8"

    return-object p0

    .line 113
    :pswitch_3c
    const-string p0, "kotlin.jvm.functions.Function7"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_46

    goto/16 :goto_34f

    .line 154
    :cond_46
    const-string p0, "kotlin.Function7"

    return-object p0

    .line 113
    :pswitch_49
    const-string p0, "kotlin.jvm.functions.Function6"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    goto/16 :goto_34f

    .line 153
    :cond_53
    const-string p0, "kotlin.Function6"

    return-object p0

    .line 113
    :pswitch_56
    const-string p0, "kotlin.jvm.functions.Function5"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_60

    goto/16 :goto_34f

    .line 152
    :cond_60
    const-string p0, "kotlin.Function5"

    return-object p0

    .line 113
    :pswitch_63
    const-string p0, "kotlin.jvm.functions.Function4"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6d

    goto/16 :goto_34f

    .line 151
    :cond_6d
    const-string p0, "kotlin.Function4"

    return-object p0

    .line 113
    :pswitch_70
    const-string p0, "kotlin.jvm.functions.Function3"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7a

    goto/16 :goto_34f

    .line 150
    :cond_7a
    const-string p0, "kotlin.Function3"

    return-object p0

    .line 113
    :pswitch_7d
    const-string p0, "kotlin.jvm.functions.Function2"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_87

    goto/16 :goto_34f

    .line 149
    :cond_87
    const-string p0, "kotlin.Function2"

    return-object p0

    .line 113
    :pswitch_8a
    const-string p0, "kotlin.jvm.functions.Function1"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_94

    goto/16 :goto_34f

    .line 148
    :cond_94
    const-string p0, "kotlin.Function1"

    return-object p0

    .line 113
    :pswitch_97
    const-string p0, "kotlin.jvm.functions.Function0"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a1

    goto/16 :goto_34f

    .line 147
    :cond_a1
    const-string p0, "kotlin.Function0"

    return-object p0

    .line 113
    :pswitch_a4
    const-string p0, "kotlin.jvm.functions.Function22"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ae

    goto/16 :goto_34f

    .line 169
    :cond_ae
    const-string p0, "kotlin.Function22"

    return-object p0

    .line 113
    :pswitch_b1
    const-string p0, "kotlin.jvm.functions.Function21"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bb

    goto/16 :goto_34f

    .line 168
    :cond_bb
    const-string p0, "kotlin.Function21"

    return-object p0

    .line 113
    :pswitch_be
    const-string p0, "kotlin.jvm.functions.Function20"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c8

    goto/16 :goto_34f

    .line 167
    :cond_c8
    const-string p0, "kotlin.Function20"

    return-object p0

    .line 113
    :pswitch_cb
    const-string p0, "kotlin.jvm.functions.Function19"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d5

    goto/16 :goto_34f

    .line 166
    :cond_d5
    const-string p0, "kotlin.Function19"

    return-object p0

    .line 113
    :pswitch_d8
    const-string p0, "kotlin.jvm.functions.Function18"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e2

    goto/16 :goto_34f

    .line 165
    :cond_e2
    const-string p0, "kotlin.Function18"

    return-object p0

    .line 113
    :pswitch_e5
    const-string p0, "kotlin.jvm.functions.Function17"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ef

    goto/16 :goto_34f

    .line 164
    :cond_ef
    const-string p0, "kotlin.Function17"

    return-object p0

    .line 113
    :pswitch_f2
    const-string p0, "kotlin.jvm.functions.Function16"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fc

    goto/16 :goto_34f

    .line 163
    :cond_fc
    const-string p0, "kotlin.Function16"

    return-object p0

    .line 113
    :pswitch_ff
    const-string p0, "kotlin.jvm.functions.Function15"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_109

    goto/16 :goto_34f

    .line 162
    :cond_109
    const-string p0, "kotlin.Function15"

    return-object p0

    .line 113
    :pswitch_10c
    const-string p0, "kotlin.jvm.functions.Function14"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_116

    goto/16 :goto_34f

    .line 161
    :cond_116
    const-string p0, "kotlin.Function14"

    return-object p0

    .line 113
    :pswitch_119
    const-string p0, "kotlin.jvm.functions.Function13"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_123

    goto/16 :goto_34f

    .line 160
    :cond_123
    const-string p0, "kotlin.Function13"

    return-object p0

    .line 113
    :pswitch_126
    const-string p0, "kotlin.jvm.functions.Function12"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_130

    goto/16 :goto_34f

    .line 159
    :cond_130
    const-string p0, "kotlin.Function12"

    return-object p0

    .line 113
    :pswitch_133
    const-string p0, "kotlin.jvm.functions.Function11"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13d

    goto/16 :goto_34f

    .line 158
    :cond_13d
    const-string p0, "kotlin.Function11"

    return-object p0

    .line 113
    :pswitch_140
    const-string p0, "kotlin.jvm.functions.Function10"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14a

    goto/16 :goto_34f

    .line 157
    :cond_14a
    const-string p0, "kotlin.Function10"

    return-object p0

    .line 113
    :sswitch_14d
    const-string p0, "kotlin.jvm.internal.IntCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_157

    goto/16 :goto_34f

    .line 176
    :cond_157
    const-string p0, "kotlin.Int.Companion"

    return-object p0

    .line 113
    :sswitch_15a
    const-string p0, "java.lang.Throwable"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_164

    goto/16 :goto_34f

    .line 139
    :cond_164
    const-string p0, "kotlin.Throwable"

    return-object p0

    .line 113
    :sswitch_167
    const-string p0, "kotlin.jvm.internal.BooleanCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_171

    goto/16 :goto_34f

    .line 170
    :cond_171
    const-string p0, "kotlin.Boolean.Companion"

    return-object p0

    .line 113
    :sswitch_174
    const-string p0, "java.lang.Iterable"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17e

    goto/16 :goto_34f

    .line 133
    :cond_17e
    const-string p0, "kotlin.collections.Iterable"

    return-object p0

    .line 113
    :sswitch_181
    const-string p0, "java.lang.String"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18b

    goto/16 :goto_34f

    .line 138
    :cond_18b
    const-string p0, "kotlin.String"

    return-object p0

    .line 113
    :sswitch_18e
    const-string p0, "java.lang.Object"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_198

    goto/16 :goto_34f

    .line 136
    :cond_198
    const-string p0, "kotlin.Any"

    return-object p0

    .line 113
    :sswitch_19b
    const-string p0, "java.lang.Number"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a5

    goto/16 :goto_34f

    .line 135
    :cond_1a5
    const-string p0, "kotlin.Number"

    return-object p0

    .line 113
    :sswitch_1a8
    const-string p0, "java.lang.Double"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b2

    goto/16 :goto_34f

    :cond_1b2
    return-object v6

    :sswitch_1b3
    const-string p0, "kotlin.jvm.internal.StringCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1bd

    goto/16 :goto_34f

    .line 179
    :cond_1bd
    const-string p0, "kotlin.String.Companion"

    return-object p0

    .line 113
    :sswitch_1c0
    const-string p0, "java.util.ListIterator"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1ca

    goto/16 :goto_34f

    .line 142
    :cond_1ca
    const-string p0, "kotlin.collections.ListIterator"

    return-object p0

    .line 113
    :sswitch_1cd
    const-string p0, "java.util.Iterator"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d7

    goto/16 :goto_34f

    .line 141
    :cond_1d7
    const-string p0, "kotlin.collections.Iterator"

    return-object p0

    .line 113
    :sswitch_1da
    const-string p0, "kotlin.jvm.internal.FloatCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e4

    goto/16 :goto_34f

    .line 175
    :cond_1e4
    const-string p0, "kotlin.Float.Companion"

    return-object p0

    .line 113
    :sswitch_1e7
    const-string p0, "java.lang.Long"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f1

    goto/16 :goto_34f

    :cond_1f1
    return-object v1

    :sswitch_1f2
    const-string p0, "java.lang.Enum"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1fc

    goto/16 :goto_34f

    .line 130
    :cond_1fc
    const-string p0, "kotlin.Enum"

    return-object p0

    .line 113
    :sswitch_1ff
    const-string p0, "java.lang.Byte"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_209

    goto/16 :goto_34f

    :cond_209
    return-object v3

    :sswitch_20a
    const-string p0, "java.lang.Boolean"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_214

    goto/16 :goto_34f

    :cond_214
    return-object v0

    :sswitch_215
    const-string p0, "kotlin.jvm.internal.EnumCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21f

    goto/16 :goto_34f

    .line 174
    :cond_21f
    const-string p0, "kotlin.Enum.Companion"

    return-object p0

    .line 113
    :sswitch_222
    const-string p0, "java.lang.Character"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22c

    goto/16 :goto_34f

    :cond_22c
    return-object v2

    :sswitch_22d
    const-string p0, "short"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_237

    goto/16 :goto_34f

    :cond_237
    return-object v4

    :sswitch_238
    const-string p0, "float"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_242

    goto/16 :goto_34f

    :cond_242
    return-object v5

    :sswitch_243
    const-string p0, "kotlin.jvm.internal.ShortCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24d

    goto/16 :goto_34f

    .line 178
    :cond_24d
    const-string p0, "kotlin.Short.Companion"

    return-object p0

    .line 113
    :sswitch_250
    const-string p0, "java.util.List"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25a

    goto/16 :goto_34f

    .line 143
    :cond_25a
    const-string p0, "kotlin.collections.List"

    return-object p0

    .line 113
    :sswitch_25d
    const-string p0, "boolean"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_267

    goto/16 :goto_34f

    :cond_267
    return-object v0

    :sswitch_268
    const-string p0, "long"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_272

    goto/16 :goto_34f

    :cond_272
    return-object v1

    :sswitch_273
    const-string p0, "char"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27d

    goto/16 :goto_34f

    :cond_27d
    return-object v2

    :sswitch_27e
    const-string p0, "byte"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_288

    goto/16 :goto_34f

    :cond_288
    return-object v3

    :sswitch_289
    const-string p0, "int"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_293

    goto/16 :goto_34f

    :cond_293
    return-object v7

    :sswitch_294
    const-string p0, "java.util.Map$Entry"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29e

    goto/16 :goto_34f

    .line 144
    :cond_29e
    const-string p0, "kotlin.collections.Map.Entry"

    return-object p0

    .line 113
    :sswitch_2a1
    const-string p0, "kotlin.jvm.internal.LongCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2ab

    goto/16 :goto_34f

    .line 177
    :cond_2ab
    const-string p0, "kotlin.Long.Companion"

    return-object p0

    .line 113
    :sswitch_2ae
    const-string p0, "kotlin.jvm.internal.CharCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2b8

    goto/16 :goto_34f

    .line 172
    :cond_2b8
    const-string p0, "kotlin.Char.Companion"

    return-object p0

    .line 113
    :sswitch_2bb
    const-string p0, "java.lang.Short"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c5

    goto/16 :goto_34f

    :cond_2c5
    return-object v4

    :sswitch_2c6
    const-string p0, "java.lang.Float"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d0

    goto/16 :goto_34f

    :cond_2d0
    return-object v5

    :sswitch_2d1
    const-string p0, "java.util.Collection"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2db

    goto/16 :goto_34f

    .line 140
    :cond_2db
    const-string p0, "kotlin.collections.Collection"

    return-object p0

    .line 113
    :sswitch_2de
    const-string p0, "java.lang.CharSequence"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e8

    goto/16 :goto_34f

    .line 126
    :cond_2e8
    const-string p0, "kotlin.CharSequence"

    return-object p0

    .line 113
    :sswitch_2eb
    const-string p0, "kotlin.jvm.internal.ByteCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2f4

    goto :goto_34f

    .line 171
    :cond_2f4
    const-string p0, "kotlin.Byte.Companion"

    return-object p0

    .line 113
    :sswitch_2f7
    const-string p0, "double"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_300

    goto :goto_34f

    :cond_300
    return-object v6

    :sswitch_301
    const-string p0, "java.util.Set"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_30a

    goto :goto_34f

    .line 146
    :cond_30a
    const-string p0, "kotlin.collections.Set"

    return-object p0

    .line 113
    :sswitch_30d
    const-string p0, "java.util.Map"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_316

    goto :goto_34f

    .line 145
    :cond_316
    const-string p0, "kotlin.collections.Map"

    return-object p0

    .line 113
    :sswitch_319
    const-string p0, "java.lang.Comparable"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_322

    goto :goto_34f

    .line 128
    :cond_322
    const-string p0, "kotlin.Comparable"

    return-object p0

    .line 113
    :sswitch_325
    const-string p0, "java.lang.annotation.Annotation"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32e

    goto :goto_34f

    .line 122
    :cond_32e
    const-string p0, "kotlin.Annotation"

    return-object p0

    .line 113
    :sswitch_331
    const-string p0, "java.lang.Cloneable"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_33a

    goto :goto_34f

    .line 127
    :cond_33a
    const-string p0, "kotlin.Cloneable"

    return-object p0

    .line 113
    :sswitch_33d
    const-string p0, "java.lang.Integer"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_346

    goto :goto_34f

    :cond_346
    return-object v7

    :sswitch_347
    const-string p0, "kotlin.jvm.internal.DoubleCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_351

    :goto_34f
    const/4 p0, 0x0

    return-object p0

    .line 173
    :cond_351
    const-string p0, "kotlin.Double.Companion"

    return-object p0

    :sswitch_data_354
    .sparse-switch
        -0x7ae0c43d -> :sswitch_347
        -0x7a988a96 -> :sswitch_33d
        -0x793eea9d -> :sswitch_331
        -0x75fda146 -> :sswitch_325
        -0x5dab6ad2 -> :sswitch_319
        -0x52743c64 -> :sswitch_30d
        -0x5274255e -> :sswitch_301
        -0x4f08842f -> :sswitch_2f7
        -0x46781814 -> :sswitch_2eb
        -0x3f507f75 -> :sswitch_2de
        -0x2906f7a2 -> :sswitch_2d1
        -0x1f76ce78 -> :sswitch_2c6
        -0x1ec16c58 -> :sswitch_2bb
        -0xeb0f022 -> :sswitch_2ae
        -0xc5a9408 -> :sswitch_2a1
        -0x9d7d2b6 -> :sswitch_294
        0x197ef -> :sswitch_289
        0x2e6108 -> :sswitch_27e
        0x2e9356 -> :sswitch_273
        0x32c67c -> :sswitch_268
        0x3db6c28 -> :sswitch_25d
        0x3ec5a5e -> :sswitch_250
        0x49a71c6 -> :sswitch_243
        0x5d0225c -> :sswitch_238
        0x685847c -> :sswitch_22d
        0x9415455 -> :sswitch_222
        0xd7b22d3 -> :sswitch_215
        0x148d6054 -> :sswitch_20a
        0x17c0bc5c -> :sswitch_1ff
        0x17c1f055 -> :sswitch_1f2
        0x17c521d0 -> :sswitch_1e7
        0x1cc457e6 -> :sswitch_1da
        0x1dcad22e -> :sswitch_1cd
        0x226988ec -> :sswitch_1c0
        0x23b44f83 -> :sswitch_1b3
        0x2d605225 -> :sswitch_1a8
        0x3ec1b19d -> :sswitch_19b
        0x3f697993 -> :sswitch_18e
        0x473e3665 -> :sswitch_181
        0x4c0855c6 -> :sswitch_174
        0x52797ada -> :sswitch_167
        0x612cf26c -> :sswitch_15a
        0x6fe35bb3 -> :sswitch_14d
    .end sparse-switch

    :pswitch_data_402
    .packed-switch -0x6bf3d83c
        :pswitch_140
        :pswitch_133
        :pswitch_126
        :pswitch_119
        :pswitch_10c
        :pswitch_ff
        :pswitch_f2
        :pswitch_e5
        :pswitch_d8
        :pswitch_cb
    .end packed-switch

    :pswitch_data_41a
    .packed-switch -0x6bf3d81d
        :pswitch_be
        :pswitch_b1
        :pswitch_a4
    .end packed-switch

    :pswitch_data_424
    .packed-switch 0x4c695eb
        :pswitch_97
        :pswitch_8a
        :pswitch_7d
        :pswitch_70
        :pswitch_63
        :pswitch_56
        :pswitch_49
        :pswitch_3c
        :pswitch_2f
        :pswitch_22
    .end packed-switch
.end method

.method private final simpleNameOf(Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    .line 183
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p0

    const-string v0, "Boolean"

    const-string v1, "Long"

    const-string v2, "Char"

    const-string v3, "Byte"

    const-string v4, "Short"

    const-string v5, "Float"

    const-string v6, "Double"

    const-string v7, "Int"

    const-string v8, "Companion"

    sparse-switch p0, :sswitch_data_342

    packed-switch p0, :pswitch_data_3f0

    packed-switch p0, :pswitch_data_408

    packed-switch p0, :pswitch_data_412

    goto/16 :goto_33f

    :pswitch_24
    const-string p0, "kotlin.jvm.functions.Function9"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e

    goto/16 :goto_33f

    .line 226
    :cond_2e
    const-string p0, "Function9"

    return-object p0

    .line 183
    :pswitch_31
    const-string p0, "kotlin.jvm.functions.Function8"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b

    goto/16 :goto_33f

    .line 225
    :cond_3b
    const-string p0, "Function8"

    return-object p0

    .line 183
    :pswitch_3e
    const-string p0, "kotlin.jvm.functions.Function7"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    goto/16 :goto_33f

    .line 224
    :cond_48
    const-string p0, "Function7"

    return-object p0

    .line 183
    :pswitch_4b
    const-string p0, "kotlin.jvm.functions.Function6"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_55

    goto/16 :goto_33f

    .line 223
    :cond_55
    const-string p0, "Function6"

    return-object p0

    .line 183
    :pswitch_58
    const-string p0, "kotlin.jvm.functions.Function5"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_62

    goto/16 :goto_33f

    .line 222
    :cond_62
    const-string p0, "Function5"

    return-object p0

    .line 183
    :pswitch_65
    const-string p0, "kotlin.jvm.functions.Function4"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6f

    goto/16 :goto_33f

    .line 221
    :cond_6f
    const-string p0, "Function4"

    return-object p0

    .line 183
    :pswitch_72
    const-string p0, "kotlin.jvm.functions.Function3"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7c

    goto/16 :goto_33f

    .line 220
    :cond_7c
    const-string p0, "Function3"

    return-object p0

    .line 183
    :pswitch_7f
    const-string p0, "kotlin.jvm.functions.Function2"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_89

    goto/16 :goto_33f

    .line 219
    :cond_89
    const-string p0, "Function2"

    return-object p0

    .line 183
    :pswitch_8c
    const-string p0, "kotlin.jvm.functions.Function1"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_96

    goto/16 :goto_33f

    .line 218
    :cond_96
    const-string p0, "Function1"

    return-object p0

    .line 183
    :pswitch_99
    const-string p0, "kotlin.jvm.functions.Function0"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a3

    goto/16 :goto_33f

    .line 217
    :cond_a3
    const-string p0, "Function0"

    return-object p0

    .line 183
    :pswitch_a6
    const-string p0, "kotlin.jvm.functions.Function22"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b0

    goto/16 :goto_33f

    .line 239
    :cond_b0
    const-string p0, "Function22"

    return-object p0

    .line 183
    :pswitch_b3
    const-string p0, "kotlin.jvm.functions.Function21"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bd

    goto/16 :goto_33f

    .line 238
    :cond_bd
    const-string p0, "Function21"

    return-object p0

    .line 183
    :pswitch_c0
    const-string p0, "kotlin.jvm.functions.Function20"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ca

    goto/16 :goto_33f

    .line 237
    :cond_ca
    const-string p0, "Function20"

    return-object p0

    .line 183
    :pswitch_cd
    const-string p0, "kotlin.jvm.functions.Function19"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d7

    goto/16 :goto_33f

    .line 236
    :cond_d7
    const-string p0, "Function19"

    return-object p0

    .line 183
    :pswitch_da
    const-string p0, "kotlin.jvm.functions.Function18"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e4

    goto/16 :goto_33f

    .line 235
    :cond_e4
    const-string p0, "Function18"

    return-object p0

    .line 183
    :pswitch_e7
    const-string p0, "kotlin.jvm.functions.Function17"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f1

    goto/16 :goto_33f

    .line 234
    :cond_f1
    const-string p0, "Function17"

    return-object p0

    .line 183
    :pswitch_f4
    const-string p0, "kotlin.jvm.functions.Function16"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fe

    goto/16 :goto_33f

    .line 233
    :cond_fe
    const-string p0, "Function16"

    return-object p0

    .line 183
    :pswitch_101
    const-string p0, "kotlin.jvm.functions.Function15"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10b

    goto/16 :goto_33f

    .line 232
    :cond_10b
    const-string p0, "Function15"

    return-object p0

    .line 183
    :pswitch_10e
    const-string p0, "kotlin.jvm.functions.Function14"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_118

    goto/16 :goto_33f

    .line 231
    :cond_118
    const-string p0, "Function14"

    return-object p0

    .line 183
    :pswitch_11b
    const-string p0, "kotlin.jvm.functions.Function13"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_125

    goto/16 :goto_33f

    .line 230
    :cond_125
    const-string p0, "Function13"

    return-object p0

    .line 183
    :pswitch_128
    const-string p0, "kotlin.jvm.functions.Function12"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_132

    goto/16 :goto_33f

    .line 229
    :cond_132
    const-string p0, "Function12"

    return-object p0

    .line 183
    :pswitch_135
    const-string p0, "kotlin.jvm.functions.Function11"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13f

    goto/16 :goto_33f

    .line 228
    :cond_13f
    const-string p0, "Function11"

    return-object p0

    .line 183
    :pswitch_142
    const-string p0, "kotlin.jvm.functions.Function10"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14c

    goto/16 :goto_33f

    .line 227
    :cond_14c
    const-string p0, "Function10"

    return-object p0

    .line 183
    :sswitch_14f
    const-string p0, "kotlin.jvm.internal.IntCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_159

    goto/16 :goto_33f

    :cond_159
    return-object v8

    :sswitch_15a
    const-string p0, "java.lang.Throwable"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_164

    goto/16 :goto_33f

    .line 209
    :cond_164
    const-string p0, "Throwable"

    return-object p0

    .line 183
    :sswitch_167
    const-string p0, "kotlin.jvm.internal.BooleanCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_171

    goto/16 :goto_33f

    :cond_171
    return-object v8

    :sswitch_172
    const-string p0, "java.lang.Iterable"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17c

    goto/16 :goto_33f

    .line 203
    :cond_17c
    const-string p0, "Iterable"

    return-object p0

    .line 183
    :sswitch_17f
    const-string p0, "java.lang.String"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_189

    goto/16 :goto_33f

    .line 208
    :cond_189
    const-string p0, "String"

    return-object p0

    .line 183
    :sswitch_18c
    const-string p0, "java.lang.Object"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_196

    goto/16 :goto_33f

    .line 206
    :cond_196
    const-string p0, "Any"

    return-object p0

    .line 183
    :sswitch_199
    const-string p0, "java.lang.Number"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a3

    goto/16 :goto_33f

    .line 205
    :cond_1a3
    const-string p0, "Number"

    return-object p0

    .line 183
    :sswitch_1a6
    const-string p0, "java.lang.Double"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b0

    goto/16 :goto_33f

    :cond_1b0
    return-object v6

    :sswitch_1b1
    const-string p0, "kotlin.jvm.internal.StringCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1bb

    goto/16 :goto_33f

    :cond_1bb
    return-object v8

    :sswitch_1bc
    const-string p0, "java.util.ListIterator"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c6

    goto/16 :goto_33f

    .line 212
    :cond_1c6
    const-string p0, "ListIterator"

    return-object p0

    .line 183
    :sswitch_1c9
    const-string p0, "java.util.Iterator"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d3

    goto/16 :goto_33f

    .line 211
    :cond_1d3
    const-string p0, "Iterator"

    return-object p0

    .line 183
    :sswitch_1d6
    const-string p0, "kotlin.jvm.internal.FloatCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e0

    goto/16 :goto_33f

    :cond_1e0
    return-object v8

    :sswitch_1e1
    const-string p0, "java.lang.Long"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1eb

    goto/16 :goto_33f

    :cond_1eb
    return-object v1

    :sswitch_1ec
    const-string p0, "java.lang.Enum"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f6

    goto/16 :goto_33f

    .line 200
    :cond_1f6
    const-string p0, "Enum"

    return-object p0

    .line 183
    :sswitch_1f9
    const-string p0, "java.lang.Byte"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_203

    goto/16 :goto_33f

    :cond_203
    return-object v3

    :sswitch_204
    const-string p0, "java.lang.Boolean"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20e

    goto/16 :goto_33f

    :cond_20e
    return-object v0

    :sswitch_20f
    const-string p0, "kotlin.jvm.internal.EnumCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_219

    goto/16 :goto_33f

    :cond_219
    return-object v8

    :sswitch_21a
    const-string p0, "java.lang.Character"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_224

    goto/16 :goto_33f

    :cond_224
    return-object v2

    :sswitch_225
    const-string p0, "short"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22f

    goto/16 :goto_33f

    :cond_22f
    return-object v4

    :sswitch_230
    const-string p0, "float"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23a

    goto/16 :goto_33f

    :cond_23a
    return-object v5

    :sswitch_23b
    const-string p0, "kotlin.jvm.internal.ShortCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_245

    goto/16 :goto_33f

    :cond_245
    return-object v8

    :sswitch_246
    const-string p0, "java.util.List"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_250

    goto/16 :goto_33f

    .line 213
    :cond_250
    const-string p0, "List"

    return-object p0

    .line 183
    :sswitch_253
    const-string p0, "boolean"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25d

    goto/16 :goto_33f

    :cond_25d
    return-object v0

    :sswitch_25e
    const-string p0, "long"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_268

    goto/16 :goto_33f

    :cond_268
    return-object v1

    :sswitch_269
    const-string p0, "char"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_273

    goto/16 :goto_33f

    :cond_273
    return-object v2

    :sswitch_274
    const-string p0, "byte"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27e

    goto/16 :goto_33f

    :cond_27e
    return-object v3

    :sswitch_27f
    const-string p0, "int"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_289

    goto/16 :goto_33f

    :cond_289
    return-object v7

    :sswitch_28a
    const-string p0, "java.util.Map$Entry"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_294

    goto/16 :goto_33f

    .line 214
    :cond_294
    const-string p0, "Entry"

    return-object p0

    .line 183
    :sswitch_297
    const-string p0, "kotlin.jvm.internal.LongCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a1

    goto/16 :goto_33f

    :cond_2a1
    return-object v8

    :sswitch_2a2
    const-string p0, "kotlin.jvm.internal.CharCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2ac

    goto/16 :goto_33f

    :cond_2ac
    return-object v8

    :sswitch_2ad
    const-string p0, "java.lang.Short"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2b7

    goto/16 :goto_33f

    :cond_2b7
    return-object v4

    :sswitch_2b8
    const-string p0, "java.lang.Float"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c2

    goto/16 :goto_33f

    :cond_2c2
    return-object v5

    :sswitch_2c3
    const-string p0, "java.util.Collection"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2cd

    goto/16 :goto_33f

    .line 210
    :cond_2cd
    const-string p0, "Collection"

    return-object p0

    .line 183
    :sswitch_2d0
    const-string p0, "java.lang.CharSequence"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2da

    goto/16 :goto_33f

    .line 196
    :cond_2da
    const-string p0, "CharSequence"

    return-object p0

    .line 183
    :sswitch_2dd
    const-string p0, "kotlin.jvm.internal.ByteCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e6

    goto :goto_33f

    :cond_2e6
    return-object v8

    :sswitch_2e7
    const-string p0, "double"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2f0

    goto :goto_33f

    :cond_2f0
    return-object v6

    :sswitch_2f1
    const-string p0, "java.util.Set"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2fa

    goto :goto_33f

    .line 216
    :cond_2fa
    const-string p0, "Set"

    return-object p0

    .line 183
    :sswitch_2fd
    const-string p0, "java.util.Map"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_306

    goto :goto_33f

    .line 215
    :cond_306
    const-string p0, "Map"

    return-object p0

    .line 183
    :sswitch_309
    const-string p0, "java.lang.Comparable"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_312

    goto :goto_33f

    .line 198
    :cond_312
    const-string p0, "Comparable"

    return-object p0

    .line 183
    :sswitch_315
    const-string p0, "java.lang.annotation.Annotation"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_31e

    goto :goto_33f

    .line 192
    :cond_31e
    const-string p0, "Annotation"

    return-object p0

    .line 183
    :sswitch_321
    const-string p0, "java.lang.Cloneable"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32a

    goto :goto_33f

    .line 197
    :cond_32a
    const-string p0, "Cloneable"

    return-object p0

    .line 183
    :sswitch_32d
    const-string p0, "java.lang.Integer"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_336

    goto :goto_33f

    :cond_336
    return-object v7

    :sswitch_337
    const-string p0, "kotlin.jvm.internal.DoubleCompanionObject"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_341

    :goto_33f
    const/4 p0, 0x0

    return-object p0

    :cond_341
    return-object v8

    :sswitch_data_342
    .sparse-switch
        -0x7ae0c43d -> :sswitch_337
        -0x7a988a96 -> :sswitch_32d
        -0x793eea9d -> :sswitch_321
        -0x75fda146 -> :sswitch_315
        -0x5dab6ad2 -> :sswitch_309
        -0x52743c64 -> :sswitch_2fd
        -0x5274255e -> :sswitch_2f1
        -0x4f08842f -> :sswitch_2e7
        -0x46781814 -> :sswitch_2dd
        -0x3f507f75 -> :sswitch_2d0
        -0x2906f7a2 -> :sswitch_2c3
        -0x1f76ce78 -> :sswitch_2b8
        -0x1ec16c58 -> :sswitch_2ad
        -0xeb0f022 -> :sswitch_2a2
        -0xc5a9408 -> :sswitch_297
        -0x9d7d2b6 -> :sswitch_28a
        0x197ef -> :sswitch_27f
        0x2e6108 -> :sswitch_274
        0x2e9356 -> :sswitch_269
        0x32c67c -> :sswitch_25e
        0x3db6c28 -> :sswitch_253
        0x3ec5a5e -> :sswitch_246
        0x49a71c6 -> :sswitch_23b
        0x5d0225c -> :sswitch_230
        0x685847c -> :sswitch_225
        0x9415455 -> :sswitch_21a
        0xd7b22d3 -> :sswitch_20f
        0x148d6054 -> :sswitch_204
        0x17c0bc5c -> :sswitch_1f9
        0x17c1f055 -> :sswitch_1ec
        0x17c521d0 -> :sswitch_1e1
        0x1cc457e6 -> :sswitch_1d6
        0x1dcad22e -> :sswitch_1c9
        0x226988ec -> :sswitch_1bc
        0x23b44f83 -> :sswitch_1b1
        0x2d605225 -> :sswitch_1a6
        0x3ec1b19d -> :sswitch_199
        0x3f697993 -> :sswitch_18c
        0x473e3665 -> :sswitch_17f
        0x4c0855c6 -> :sswitch_172
        0x52797ada -> :sswitch_167
        0x612cf26c -> :sswitch_15a
        0x6fe35bb3 -> :sswitch_14f
    .end sparse-switch

    :pswitch_data_3f0
    .packed-switch -0x6bf3d83c
        :pswitch_142
        :pswitch_135
        :pswitch_128
        :pswitch_11b
        :pswitch_10e
        :pswitch_101
        :pswitch_f4
        :pswitch_e7
        :pswitch_da
        :pswitch_cd
    .end packed-switch

    :pswitch_data_408
    .packed-switch -0x6bf3d81d
        :pswitch_c0
        :pswitch_b3
        :pswitch_a6
    .end packed-switch

    :pswitch_data_412
    .packed-switch 0x4c695eb
        :pswitch_99
        :pswitch_8c
        :pswitch_7f
        :pswitch_72
        :pswitch_65
        :pswitch_58
        :pswitch_4b
        :pswitch_3e
        :pswitch_31
        :pswitch_24
    .end packed-switch
.end method


# virtual methods
.method public final getClassQualifiedName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "jClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 272
    invoke-virtual {p1}, Ljava/lang/Class;->isAnonymousClass()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    return-object v1

    .line 273
    :cond_d
    invoke-virtual {p1}, Ljava/lang/Class;->isLocalClass()Z

    move-result v0

    if-eqz v0, :cond_14

    return-object v1

    .line 274
    :cond_14
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    const-string v2, "getName(...)"

    if-eqz v0, :cond_4a

    .line 275
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    .line 277
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/ClassReference$Companion;->classFqNameOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_44

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "Array"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_44
    if-nez v1, :cond_49

    .line 279
    const-string p0, "kotlin.Array"

    return-object p0

    :cond_49
    return-object v1

    .line 281
    :cond_4a
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/ClassReference$Companion;->classFqNameOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_5b

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p0

    :cond_5b
    return-object p0
.end method

.method public final getClassSimpleName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "jClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 254
    invoke-virtual {p1}, Ljava/lang/Class;->isAnonymousClass()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    return-object v1

    .line 255
    :cond_d
    invoke-virtual {p1}, Ljava/lang/Class;->isLocalClass()Z

    move-result v0

    if-eqz v0, :cond_67

    .line 256
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    .line 257
    invoke-virtual {p1}, Ljava/lang/Class;->getEnclosingMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v2, 0x2

    const/16 v3, 0x24

    if-eqz v0, :cond_3e

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v1, v2, v1}, Lkotlin/text/StringsKt;->substringAfter$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3d

    goto :goto_3e

    :cond_3d
    return-object v0

    .line 258
    :cond_3e
    :goto_3e
    invoke-virtual {p1}, Ljava/lang/Class;->getEnclosingConstructor()Ljava/lang/reflect/Constructor;

    move-result-object p1

    if-eqz p1, :cond_5f

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1, v2, v1}, Lkotlin/text/StringsKt;->substringAfter$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 259
    :cond_5f
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {p0, v3, v1, v2, v1}, Lkotlin/text/StringsKt;->substringAfter$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 261
    :cond_67
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    const-string v2, "getName(...)"

    if-eqz v0, :cond_9b

    .line 262
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    .line 264
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    const-string v3, "Array"

    if-eqz v0, :cond_97

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/ClassReference$Companion;->simpleNameOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_97

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_97
    if-nez v1, :cond_9a

    return-object v3

    :cond_9a
    return-object v1

    .line 268
    :cond_9b
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/ClassReference$Companion;->simpleNameOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_ac

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    :cond_ac
    return-object p0
.end method

.method public final isInstance(Ljava/lang/Object;Ljava/lang/Class;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    const-string p0, "jClass"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 285
    # getter for: Lkotlin/jvm/internal/ClassReference;->FUNCTION_CLASSES:Ljava/util/Map;
    invoke-static {}, Lkotlin/jvm/internal/ClassReference;->access$getFUNCTION_CLASSES$cp()Ljava/util/Map;

    move-result-object p0

    const-string v0, "null cannot be cast to non-null type kotlin.collections.Map<K of kotlin.collections.MapsKt__MapsKt.get, V of kotlin.collections.MapsKt__MapsKt.get>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-eqz p0, :cond_21

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    .line 286
    invoke-static {p1, p0}, Lkotlin/jvm/internal/TypeIntrinsics;->isFunctionOfArity(Ljava/lang/Object;I)Z

    move-result p0

    return p0

    .line 288
    :cond_21
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result p0

    if-eqz p0, :cond_2f

    invoke-static {p2}, Lkotlin/jvm/JvmClassMappingKt;->getKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p2

    .line 289
    :cond_2f
    invoke-virtual {p2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

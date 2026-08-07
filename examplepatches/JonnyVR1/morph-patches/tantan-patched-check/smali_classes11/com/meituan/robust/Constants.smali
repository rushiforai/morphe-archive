.class public Lcom/meituan/robust/Constants;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ADD_ANNOTATION:Ljava/lang/String; = "com.meituan.robust.patch.annotaion.Add"

.field public static final ARRAY_TYPE:Ljava/lang/String; = "["

.field public static final ASPECTJ_AROUND_CLASS:Ljava/lang/String; = "org.aspectj.runtime.internal.AroundClosure"

.field public static AddAnnotationClass:Ljava/lang/Class; = null

.field public static final BOOLEAN:Ljava/lang/String; = "boolean"

.field public static final BYTE:Ljava/lang/String; = "byte"

.field public static final CHAR:Ljava/lang/String; = "char"

.field public static final CLASSES_DEX_NAME:Ljava/lang/String; = "classes.dex"

.field public static final CONSTRUCTOR:Ljava/lang/String; = "Constructor"

.field public static final DEFAULT_MAPPING_FILE:Ljava/lang/String; = "/robust/mapping.txt"

.field public static final DOUBLE:Ljava/lang/String; = "double"

.field public static final FLOAT:Ljava/lang/String; = "float"

.field public static final GET_REAL_PARAMETER:Ljava/lang/String; = "getRealParameter"

.field public static final INLINE_PATCH_SUFFIX:Ljava/lang/String; = "InLinePatch"

.field public static final INSERT_FIELD_NAME:Ljava/lang/String; = "changeQuickRedirect"

.field public static final INT:Ljava/lang/String; = "int"

.field public static final INTERFACE_NAME:Ljava/lang/String; = "com.meituan.robust.ChangeQuickRedirect"

.field public static final LAMBDA_MODIFY:Ljava/lang/String; = "com.meituan.robust.patch.RobustModify"

.field public static final LANG_BOOLEAN:Ljava/lang/String; = "java.lang.Boolean"

.field public static final LANG_BYTE:Ljava/lang/String; = "java.lang.Byte"

.field public static final LANG_CHARACTER:Ljava/lang/String; = "Character"

.field public static final LANG_DOUBLE:Ljava/lang/String; = "java.lang.Double"

.field public static final LANG_FLOAT:Ljava/lang/String; = "java.lang.Float"

.field public static final LANG_INT:Ljava/lang/String; = "java.lang.Integer"

.field public static final LANG_LONG:Ljava/lang/String; = "java.lang.Long"

.field public static final LANG_SHORT:Ljava/lang/String; = "java.lang.Short"

.field public static final LANG_VOID:Ljava/lang/String; = "java.lang.Void"

.field public static final LIB_NAME_ARRAY:[Ljava/lang/String;

.field public static final LONG:Ljava/lang/String; = "long"

.field public static final METHOD_MAP_OUT_PATH:Ljava/lang/String; = "/outputs/robust/methodsMap.robust"

.field public static final METHOD_MAP_PATH:Ljava/lang/String; = "/robust/methodsMap.robust"

.field public static final MODIFY_ANNOTATION:Ljava/lang/String; = "com.meituan.robust.patch.annotaion.Modify"

.field public static ModifyAnnotationClass:Ljava/lang/Class; = null

.field public static final NO_NEED_REFLECT_CLASS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final OBJECT_TYPE:C = 'L'

.field public static final OBSCURE:Ljava/lang/Boolean;

.field public static final ORIGINCLASS:Ljava/lang/String; = "originClass"

.field public static final PACKNAME_END:Ljava/lang/String; = ";"

.field public static final PACKNAME_START:Ljava/lang/String;

.field public static final PATACH_DEX_NAME:Ljava/lang/String; = "patch.dex"

.field public static final PATACH_JAR_NAME:Ljava/lang/String; = "patch.jar"

.field public static final PATCH_CONTROL_SUFFIX:Ljava/lang/String; = "Control"

.field public static final PATCH_EXECUTE:Ljava/lang/String; = "patch execute ,other extension will be ignore "

.field public static final PATCH_PACKAGENAME:Ljava/lang/String; = "com.meituan.robust.patch"

.field public static final PATCH_SUFFIX:Ljava/lang/String; = "Patch"

.field public static final PATCH_TEMPLATE_FULL_NAME:Ljava/lang/String; = "com.meituan.robust.utils.PatchTemplate"

.field public static final PRIMITIVE_TYPE:Ljava/lang/String; = "ZCBSIJFDV"

.field public static final RFileClassSet:Ljava/util/Set;

.field public static final ROBUST_APK_HASH_FILE_NAME:Ljava/lang/String; = "robust.apkhash"

.field public static final ROBUST_ASSIST_SUFFIX:Ljava/lang/String; = "RobustAssist"

.field public static final ROBUST_GENERATE_DIRECTORY:Ljava/lang/String; = "outputs/robust"

.field public static final ROBUST_PUBLIC_SUFFIX:Ljava/lang/String; = "RobustPublic"

.field public static final ROBUST_UTILS_FULL_NAME:Ljava/lang/String; = "com.meituan.robust.utils.EnhancedRobustUtils"

.field public static final ROBUST_XML:Ljava/lang/String; = "robust.xml"

.field public static final SHORT:Ljava/lang/String; = "short"

.field public static final SMALI_INVOKE_SUPER_COMMAND:Ljava/lang/String; = "invoke-super"

.field public static final SMALI_INVOKE_VIRTUAL_COMMAND:Ljava/lang/String; = "invoke-virtual"

.field public static final STATICFLAG:Ljava/lang/String; = "staticRobust"

.field public static final VOID:Ljava/lang/String; = "void"

.field public static final ZIP_FILE_NAME:Ljava/lang/String; = "meituan.jar"

.field public static isLogging:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "smali-2.1.2.jar"

    .line 2
    .line 3
    const-string v1, "dx.jar"

    .line 4
    .line 5
    const-string v2, "baksmali-2.1.2.jar"

    .line 6
    .line 7
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/meituan/robust/Constants;->LIB_NAME_ARRAY:[Ljava/lang/String;

    .line 12
    .line 13
    const/16 v0, 0x4c

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Lcom/meituan/robust/Constants;->PACKNAME_START:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    sput-object v0, Lcom/meituan/robust/Constants;->OBSCURE:Ljava/lang/Boolean;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    sput-boolean v0, Lcom/meituan/robust/Constants;->isLogging:Z

    .line 27
    .line 28
    new-instance v0, Ljava/util/HashSet;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/meituan/robust/Constants;->RFileClassSet:Ljava/util/Set;

    .line 34
    .line 35
    const-string v1, "R$array"

    .line 36
    .line 37
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    const-string v1, "R$xml"

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    const-string v1, "R$styleable"

    .line 46
    .line 47
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    const-string v1, "R$style"

    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    const-string v1, "R$string"

    .line 56
    .line 57
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    const-string v1, "R$raw"

    .line 61
    .line 62
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    const-string v1, "R$menu"

    .line 66
    .line 67
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    const-string v1, "R$layout"

    .line 71
    .line 72
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    const-string v1, "R$integer"

    .line 76
    .line 77
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    const-string v1, "R$id"

    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    const-string v1, "R$drawable"

    .line 86
    .line 87
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    const-string v1, "R$dimen"

    .line 91
    .line 92
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    const-string v1, "R$color"

    .line 96
    .line 97
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    const-string v1, "R$bool"

    .line 101
    .line 102
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    const-string v1, "R$attr"

    .line 106
    .line 107
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    const-string v1, "R$anim"

    .line 111
    .line 112
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    const-string v0, "android.os.Bundle"

    .line 116
    .line 117
    const-string v1, "android.os.BaseBundle"

    .line 118
    .line 119
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    sput-object v0, Lcom/meituan/robust/Constants;->NO_NEED_REFLECT_CLASS:Ljava/util/List;

    .line 128
    .line 129
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

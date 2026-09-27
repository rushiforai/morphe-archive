.class public final Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;
.super Lapp/morphe/patcher/OpcodesFilter;
.source "CaptionResourceMapping.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0018\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;",
        "Lapp/morphe/patcher/OpcodesFilter;",
        "type",
        "Lapp/yydarlinker/patches/shared/CaptionResourceType;",
        "name",
        "",
        "location",
        "Lapp/morphe/patcher/InstructionLocation;",
        "<init>",
        "(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;Lapp/morphe/patcher/InstructionLocation;)V",
        "matches",
        "",
        "enclosingMethod",
        "Lcom/android/tools/smali/dexlib2/iface/Method;",
        "instruction",
        "Lcom/android/tools/smali/dexlib2/iface/instruction/Instruction;",
        "app.yydarlinker:patches"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final name:Ljava/lang/String;

.field private final type:Lapp/yydarlinker/patches/shared/CaptionResourceType;


# direct methods
.method public constructor <init>(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;Lapp/morphe/patcher/InstructionLocation;)V
    .registers 5

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "location"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 66
    invoke-direct {p0, v0, p3}, Lapp/morphe/patcher/OpcodesFilter;-><init>(Ljava/util/List;Lapp/morphe/patcher/InstructionLocation;)V

    .line 67
    iput-object p1, p0, Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;->type:Lapp/yydarlinker/patches/shared/CaptionResourceType;

    .line 68
    iput-object p2, p0, Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public matches(Lcom/android/tools/smali/dexlib2/iface/Method;Lcom/android/tools/smali/dexlib2/iface/instruction/Instruction;)Z
    .registers 6

    const-string v0, "enclosingMethod"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "instruction"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    invoke-super {p0, p1, p2}, Lapp/morphe/patcher/OpcodesFilter;->matches(Lcom/android/tools/smali/dexlib2/iface/Method;Lcom/android/tools/smali/dexlib2/iface/instruction/Instruction;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_12

    return v0

    .line 73
    :cond_12
    instance-of p1, p2, Lcom/android/tools/smali/dexlib2/iface/instruction/WideLiteralInstruction;

    if-eqz p1, :cond_2a

    .line 74
    check-cast p2, Lcom/android/tools/smali/dexlib2/iface/instruction/WideLiteralInstruction;

    invoke-interface {p2}, Lcom/android/tools/smali/dexlib2/iface/instruction/WideLiteralInstruction;->getWideLiteral()J

    move-result-wide p1

    iget-object v1, p0, Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;->type:Lapp/yydarlinker/patches/shared/CaptionResourceType;

    iget-object p0, p0, Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;->name:Ljava/lang/String;

    # invokes: Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceId(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;)J
    invoke-static {v1, p0}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->access$captionResourceId(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;)J

    move-result-wide v1

    cmp-long p0, p1, v1

    if-nez p0, :cond_2a

    const/4 p0, 0x1

    return p0

    :cond_2a
    return v0
.end method

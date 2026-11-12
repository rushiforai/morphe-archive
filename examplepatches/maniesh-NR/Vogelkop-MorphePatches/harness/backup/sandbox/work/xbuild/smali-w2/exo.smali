.class public final Lexo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lcxo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final g:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Lhuo;

.field public final d:Ljzo;

.field public final e:Lwwo;

.field public final f:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcxo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lexo;->Companion:Lcxo;

    new-instance v0, Lk72;

    sget-object v1, Lrrb;->a:Lrrb;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/4 v1, 0x6

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    aput-object v3, v1, v2

    const/4 v2, 0x5

    aput-object v0, v1, v2

    sput-object v1, Lexo;->g:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Lhuo;Ljzo;Lwwo;Ljava/util/List;)V
    .registers 10

    and-int/lit8 v0, p1, 0x3c

    const/16 v1, 0x3c

    if-ne v1, v0, :cond_27

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_f

    const-string p2, "2.14.0"

    :cond_f
    iput-object p2, p0, Lexo;->a:Ljava/lang/String;

    and-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_1c

    invoke-static {}, Lfcp;->f()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lexo;->b:Ljava/lang/String;

    goto :goto_1e

    :cond_1c
    iput-object p3, p0, Lexo;->b:Ljava/lang/String;

    :goto_1e
    iput-object p4, p0, Lexo;->c:Lhuo;

    iput-object p5, p0, Lexo;->d:Ljzo;

    iput-object p6, p0, Lexo;->e:Lwwo;

    iput-object p7, p0, Lexo;->f:Ljava/util/List;

    return-void

    :cond_27
    sget-object p0, Lbxo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Lhuo;Ljzo;Lwwo;Ljava/util/List;)V
    .registers 7

    .line 46
    invoke-static {}, Lfcp;->f()Ljava/lang/String;

    move-result-object v0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v1, "2.14.0"

    iput-object v1, p0, Lexo;->a:Ljava/lang/String;

    iput-object v0, p0, Lexo;->b:Ljava/lang/String;

    iput-object p1, p0, Lexo;->c:Lhuo;

    iput-object p2, p0, Lexo;->d:Ljzo;

    iput-object p3, p0, Lexo;->e:Lwwo;

    iput-object p4, p0, Lexo;->f:Ljava/util/List;

    return-void
.end method

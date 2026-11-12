.class public final Ld7p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lb7p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:Lp8p;

.field public final e:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lb7p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ld7p;->Companion:Lb7p;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;J)V
    .registers 9

    and-int/lit8 v0, p2, 0x7

    const/4 v1, 0x0

    const/4 v2, 0x7

    if-ne v2, v0, :cond_27

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld7p;->a:Ljava/lang/String;

    iput-object p3, p0, Ld7p;->b:Ljava/lang/String;

    iput-wide p4, p0, Ld7p;->c:J

    iput-object v1, p0, Ld7p;->d:Lp8p;

    new-instance p1, La7p;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, La7p;-><init>(Ld7p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ld7p;->e:Lzyk;

    new-instance p1, La7p;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, La7p;-><init>(Ld7p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    return-void

    .line 87
    :cond_27
    sget-object p0, Lz6p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    .line 88
    invoke-static {p2, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Lp8p;)V
    .registers 7

    iget-object v0, p1, Lp8p;->a:Ljava/lang/String;

    invoke-virtual {p1}, Lp8p;->b()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lt0i;->b:Lp0i;

    instance-of v2, v1, Lq0i;

    const/4 v3, 0x0

    if-nez v2, :cond_2c

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_1a

    invoke-static {v1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1b

    :cond_1a
    move-object v2, v3

    :goto_1b
    const-string v4, "{}"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2b

    const-string v4, "[]"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    :cond_2b
    move-object v1, v3

    :cond_2c
    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_31

    move-object v3, v1

    :cond_31
    check-cast v3, Ljava/lang/String;

    iget-wide v1, p1, Lp8p;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ld7p;->a:Ljava/lang/String;

    iput-object v3, p0, Ld7p;->b:Ljava/lang/String;

    iput-wide v1, p0, Ld7p;->c:J

    iput-object p1, p0, Ld7p;->d:Lp8p;

    new-instance p1, La7p;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, La7p;-><init>(Ld7p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ld7p;->e:Lzyk;

    new-instance p1, La7p;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, La7p;-><init>(Ld7p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    return-void
.end method

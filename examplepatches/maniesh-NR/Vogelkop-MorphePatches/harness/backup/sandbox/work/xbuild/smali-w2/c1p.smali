.class public final Lc1p;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:La1p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public final m:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, La1p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lc1p;->Companion:La1p;

    return-void
.end method

.method public constructor <init>(III)V
    .registers 5

    .line 91
    sget-object v0, Lwlp;->b:Lurj;

    .line 92
    const-string v0, "initialize"

    .line 93
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 94
    iput p1, p0, Lc1p;->g:I

    iput p2, p0, Lc1p;->h:I

    iput p3, p0, Lc1p;->i:I

    .line 95
    sget-object p1, Lfcp;->c:Lc30;

    const/4 p2, 0x0

    if-eqz p1, :cond_17

    .line 96
    sget-object p1, Lkn;->a:[Lkn;

    const-string p1, "admob"

    goto :goto_18

    :cond_17
    move-object p1, p2

    :goto_18
    iput-object p1, p0, Lc1p;->j:Ljava/lang/String;

    .line 97
    sget-object p1, Lfcp;->c:Lc30;

    if-eqz p1, :cond_21

    .line 98
    iget-object p1, p1, Lc30;->b:Ljava/lang/String;

    goto :goto_22

    :cond_21
    move-object p1, p2

    :goto_22
    iput-object p1, p0, Lc1p;->k:Ljava/lang/String;

    .line 99
    sget-object p1, Lfcp;->c:Lc30;

    if-eqz p1, :cond_2f

    .line 100
    const-class p1, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    goto :goto_30

    :cond_2f
    move-object p1, p2

    :goto_30
    iput-object p1, p0, Lc1p;->l:Ljava/lang/String;

    .line 101
    sget-object p1, Lfcp;->c:Lc30;

    if-eqz p1, :cond_38

    .line 102
    const-string p2, "2.14.0.0"

    :cond_38
    iput-object p2, p0, Lc1p;->m:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;ILjava/lang/String;)V
    .registers 12

    and-int/lit8 v0, p2, 0x7

    const/4 v1, 0x0

    const/4 v2, 0x7

    if-ne v2, v0, :cond_55

    invoke-direct {p0}, Lp8p;-><init>()V

    iput p3, p0, Lc1p;->g:I

    iput p5, p0, Lc1p;->h:I

    iput p7, p0, Lc1p;->i:I

    and-int/lit8 p3, p2, 0x8

    if-nez p3, :cond_1d

    sget-object p1, Lfcp;->c:Lc30;

    if-eqz p1, :cond_1c

    sget-object p1, Lkn;->a:[Lkn;

    const-string p1, "admob"

    goto :goto_1d

    :cond_1c
    move-object p1, v1

    :cond_1d
    :goto_1d
    iput-object p1, p0, Lc1p;->j:Ljava/lang/String;

    and-int/lit8 p1, p2, 0x10

    if-nez p1, :cond_2e

    sget-object p1, Lfcp;->c:Lc30;

    if-eqz p1, :cond_2a

    iget-object p1, p1, Lc30;->b:Ljava/lang/String;

    goto :goto_2b

    :cond_2a
    move-object p1, v1

    :goto_2b
    iput-object p1, p0, Lc1p;->k:Ljava/lang/String;

    goto :goto_30

    :cond_2e
    iput-object p4, p0, Lc1p;->k:Ljava/lang/String;

    :goto_30
    and-int/lit8 p1, p2, 0x20

    if-nez p1, :cond_43

    sget-object p1, Lfcp;->c:Lc30;

    if-eqz p1, :cond_3f

    const-class p1, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    goto :goto_40

    :cond_3f
    move-object p1, v1

    :goto_40
    iput-object p1, p0, Lc1p;->l:Ljava/lang/String;

    goto :goto_45

    :cond_43
    iput-object p6, p0, Lc1p;->l:Ljava/lang/String;

    :goto_45
    and-int/lit8 p2, p2, 0x40

    if-nez p2, :cond_52

    sget-object p1, Lfcp;->c:Lc30;

    if-eqz p1, :cond_4f

    const-string v1, "2.14.0.0"

    :cond_4f
    iput-object v1, p0, Lc1p;->m:Ljava/lang/String;

    return-void

    :cond_52
    iput-object p8, p0, Lc1p;->m:Ljava/lang/String;

    return-void

    :cond_55
    sget-object p0, Lz0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p2, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

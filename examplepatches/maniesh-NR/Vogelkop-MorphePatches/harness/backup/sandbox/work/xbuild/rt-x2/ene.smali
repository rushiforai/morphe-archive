.class public final enum Lene;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lene;",
        ">;"
    }
.end annotation

.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ldne;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:Ll4c;

.field public static final synthetic c:[Lene;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lene;

    const/4 v1, 0x0

    const-string v2, "ft"

    const-string v3, "FT"

    invoke-direct {v0, v3, v1, v2}, Lene;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lene;

    const/4 v2, 0x1

    const-string v3, "aet"

    const-string v4, "AET"

    invoke-direct {v1, v4, v2, v3}, Lene;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lene;

    const/4 v3, 0x2

    const-string v4, "ap"

    const-string v5, "AP"

    invoke-direct {v2, v5, v3, v4}, Lene;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lene;

    const/4 v4, 0x3

    const-string v5, "aaw"

    const-string v6, "AAW"

    invoke-direct {v3, v6, v4, v5}, Lene;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2, v3}, [Lene;

    move-result-object v0

    sput-object v0, Lene;->c:[Lene;

    new-instance v0, Lh58;

    new-instance v0, Ldne;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lene;->Companion:Ldne;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lvme;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lvme;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Lene;->b:Ll4c;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lene;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lene;
    .registers 2

    const-class v0, Lene;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lene;

    return-object p0
.end method

.method public static values()[Lene;
    .registers 1

    sget-object v0, Lene;->c:[Lene;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lene;

    return-object v0
.end method

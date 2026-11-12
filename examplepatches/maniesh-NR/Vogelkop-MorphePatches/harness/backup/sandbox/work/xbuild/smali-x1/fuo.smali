.class public final enum Lfuo;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lfuo;",
        ">;"
    }
.end annotation

.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lqto;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:Ll4c;

.field public static final enum c:Lfuo;

.field public static final enum d:Lfuo;

.field public static final enum e:Lfuo;

.field public static final synthetic f:[Lfuo;

.field public static final synthetic g:Lh58;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lfuo;

    const-string v1, "Banner"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lfuo;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lfuo;->c:Lfuo;

    new-instance v1, Lfuo;

    const-string v2, "Video"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lfuo;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lfuo;->d:Lfuo;

    new-instance v2, Lfuo;

    const-string v3, "Native"

    const/4 v5, 0x4

    invoke-direct {v2, v3, v4, v5}, Lfuo;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lfuo;->e:Lfuo;

    filled-new-array {v0, v1, v2}, [Lfuo;

    move-result-object v0

    sput-object v0, Lfuo;->f:[Lfuo;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lfuo;->g:Lh58;

    new-instance v0, Lqto;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfuo;->Companion:Lqto;

    sget-object v0, Lf7c;->b:Lf7c;

    sget-object v1, La43;->K:La43;

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Lfuo;->b:Ll4c;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lfuo;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lfuo;
    .registers 2

    const-class v0, Lfuo;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lfuo;

    return-object p0
.end method

.method public static values()[Lfuo;
    .registers 1

    sget-object v0, Lfuo;->f:[Lfuo;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfuo;

    return-object v0
.end method

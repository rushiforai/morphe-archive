.class public final enum Lnt8;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic g:[Lnt8;

.field public static final synthetic h:Lh58;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:I

.field public final f:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    const/4 v0, 0x0

    new-array v0, v0, [Lnt8;

    sput-object v0, Lnt8;->g:[Lnt8;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lnt8;->h:Lh58;

    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;II[Ljava/lang/String;)V
    .registers 9

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lnt8;->a:Ljava/lang/String;

    iput-object p4, p0, Lnt8;->b:Ljava/lang/String;

    iput-object p5, p0, Lnt8;->c:Ljava/lang/String;

    iput p6, p0, Lnt8;->d:I

    iput p7, p0, Lnt8;->e:I

    new-instance p1, Ljava/util/ArrayList;

    array-length p2, p8

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    array-length p2, p8

    const/4 p3, 0x0

    move p4, p3

    :goto_16
    if-ge p4, p2, :cond_2b

    aget-object p5, p8, p4

    const/4 p6, 0x1

    new-array p6, p6, [C

    const/16 p7, 0x20

    aput-char p7, p6, p3

    invoke-static {p5, p6}, Lkotlin/text/StringsKt;->X(Ljava/lang/CharSequence;[C)Ljava/util/List;

    move-result-object p5

    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p4, p4, 0x1

    goto :goto_16

    :cond_2b
    iput-object p1, p0, Lnt8;->f:Ljava/util/ArrayList;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnt8;
    .registers 2

    const-class v0, Lnt8;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnt8;

    return-object p0
.end method

.method public static values()[Lnt8;
    .registers 1

    sget-object v0, Lnt8;->g:[Lnt8;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnt8;

    return-object v0
.end method

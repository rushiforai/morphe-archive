.class public final Ljon;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ljava/util/Set;


# instance fields
.field public final a:Ldj9;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const-string v4, "PW"

    const-string v5, "US"

    const-string v0, "BS"

    const-string v1, "BZ"

    const-string v2, "KY"

    const-string v3, "PR"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ljon;->b:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Ldj9;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljon;->a:Ldj9;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Enum;
    .registers 8

    instance-of v0, p1, Lion;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lion;

    iget v1, v0, Lion;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lion;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lion;

    invoke-direct {v0, p0, p1}, Lion;-><init>(Ljon;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lion;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lion;->w:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_2a

    iget-object p0, v0, Lion;->t:Ljon;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_74

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lwwc;->a:Ljava/util/Locale;

    const-string v2, "mu"

    invoke-virtual {p1, v2}, Ljava/util/Locale;->getUnicodeLocaleType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_3f

    const-string p1, ""

    :cond_3f
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const v5, 0x26e25feb

    if-eq v2, v5, :cond_58

    const v5, 0x278a2abe

    if-ne v2, v5, :cond_60

    const-string v2, "celsius"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_60

    sget-object p1, Lcel;->a:Lcel;

    goto :goto_64

    :cond_58
    const-string v2, "fahrenhe"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_62

    :cond_60
    move-object p1, v4

    goto :goto_64

    :cond_62
    sget-object p1, Lcel;->b:Lcel;

    :goto_64
    if-eqz p1, :cond_67

    return-object p1

    :cond_67
    iput-object p0, v0, Lion;->t:Ljon;

    iput v3, v0, Lion;->w:I

    iget-object p1, p0, Ljon;->a:Ldj9;

    invoke-static {p1, v0}, La26;->k(Lno7;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_74

    return-object v1

    :cond_74
    :goto_74
    check-cast p1, Lcj9;

    iget-object p1, p1, Lcj9;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_96

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_96

    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Ljon;->b:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_94

    sget-object v4, Lcel;->b:Lcel;

    goto :goto_96

    :cond_94
    sget-object v4, Lcel;->a:Lcel;

    :cond_96
    :goto_96
    if-eqz v4, :cond_99

    return-object v4

    :cond_99
    sget-object p0, Lcel;->a:Lcel;

    return-object p0
.end method

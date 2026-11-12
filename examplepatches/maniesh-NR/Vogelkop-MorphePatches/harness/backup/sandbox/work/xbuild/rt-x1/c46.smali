.class public final Lc46;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:Lc46;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lc46;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lc46;->a:Lc46;

    return-void
.end method


# virtual methods
.method public final serializer()Lkotlinx/serialization/KSerializer;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Lyqi;

    const-class p0, Li46;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    const-class p0, Lf46;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    const-class v1, Lg46;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    const-class v3, Lh46;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    const/4 v4, 0x3

    move-object v5, v3

    new-array v3, v4, [Litb;

    const/4 v6, 0x0

    aput-object p0, v3, v6

    const/4 p0, 0x1

    aput-object v1, v3, p0

    const/4 v1, 0x2

    aput-object v5, v3, v1

    invoke-static {}, Lg46;->values()[Lg46;

    move-result-object v5

    new-instance v7, Li58;

    const-string v8, "com.opera.celopay.model.money.Currency.Fiat"

    invoke-direct {v7, v8, v5}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    invoke-static {}, Lh46;->values()[Lh46;

    move-result-object v5

    new-instance v8, Li58;

    const-string v9, "com.opera.celopay.model.money.Currency.Token"

    invoke-direct {v8, v9, v5}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    new-array v4, v4, [Lkotlinx/serialization/KSerializer;

    sget-object v5, Ld46;->a:Ld46;

    aput-object v5, v4, v6

    aput-object v7, v4, p0

    aput-object v8, v4, v1

    new-array v5, v6, [Ljava/lang/annotation/Annotation;

    const-string v1, "com.opera.celopay.model.money.Currency"

    invoke-direct/range {v0 .. v5}, Lyqi;-><init>(Ljava/lang/String;Ls15;[Litb;[Lkotlinx/serialization/KSerializer;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

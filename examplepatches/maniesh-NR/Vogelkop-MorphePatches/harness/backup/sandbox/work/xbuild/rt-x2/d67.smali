.class public final synthetic Ld67;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Ld67;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld67;

    const-string v1, "getRain_api_key()Ljava/lang/String;"

    const/4 v2, 0x0

    const-class v3, Lg57;

    const-string v4, "rain_api_key"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Ld67;->b:Ld67;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lg57;

    iget-object p0, p1, Lg57;->D:Ljava/lang/String;

    return-object p0
.end method

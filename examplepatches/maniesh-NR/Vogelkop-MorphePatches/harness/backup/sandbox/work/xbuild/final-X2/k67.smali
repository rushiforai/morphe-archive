.class public final synthetic Lk67;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Lk67;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lk67;

    const-string v1, "getUse_fake_gnosis_api()Ljava/lang/Boolean;"

    const/4 v2, 0x0

    const-class v3, Lg57;

    const-string v4, "use_fake_gnosis_api"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lk67;->b:Lk67;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lg57;

    iget-object p0, p1, Lg57;->o:Ljava/lang/Boolean;

    return-object p0
.end method

.class public final synthetic Lr57;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Lr57;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lr57;

    const-string v1, "getEnable_apple_pay()Ljava/lang/Boolean;"

    const/4 v2, 0x0

    const-class v3, Lg57;

    const-string v4, "enable_apple_pay"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lr57;->b:Lr57;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lg57;

    iget-object p0, p1, Lg57;->z:Ljava/lang/Boolean;

    return-object p0
.end method

.class public final synthetic Lh67;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Lh67;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lh67;

    const-string v1, "getSimulate_save_error_cloud_storage()Ljava/lang/Boolean;"

    const/4 v2, 0x0

    const-class v3, Lg57;

    const-string v4, "simulate_save_error_cloud_storage"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lh67;->b:Lh67;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lg57;

    iget-object p0, p1, Lg57;->i:Ljava/lang/Boolean;

    return-object p0
.end method

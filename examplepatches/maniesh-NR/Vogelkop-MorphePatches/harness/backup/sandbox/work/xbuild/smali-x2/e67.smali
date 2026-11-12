.class public final synthetic Le67;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Le67;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Le67;

    const-string v1, "getReport_to_osp_dump()Ljava/lang/Boolean;"

    const/4 v2, 0x0

    const-class v3, Lg57;

    const-string v4, "report_to_osp_dump"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Le67;->b:Le67;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lg57;

    iget-object p0, p1, Lg57;->B:Ljava/lang/Boolean;

    return-object p0
.end method

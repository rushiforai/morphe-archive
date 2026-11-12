.class public final synthetic Ll67;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Ll67;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ll67;

    const-string v1, "getUse_gnosis_sandbox()Z"

    const/4 v2, 0x0

    const-class v3, Lg57;

    const-string v4, "use_gnosis_sandbox"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Ll67;->b:Ll67;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lg57;

    iget-boolean p0, p1, Lg57;->u:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

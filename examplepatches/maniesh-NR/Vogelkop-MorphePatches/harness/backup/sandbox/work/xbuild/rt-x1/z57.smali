.class public final synthetic Lz57;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Lz57;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lz57;

    const-string v1, "getForce_enable_lock_screen()Z"

    const/4 v2, 0x0

    const-class v3, Lg57;

    const-string v4, "force_enable_lock_screen"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lz57;->b:Lz57;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lg57;

    iget-boolean p0, p1, Lg57;->t:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

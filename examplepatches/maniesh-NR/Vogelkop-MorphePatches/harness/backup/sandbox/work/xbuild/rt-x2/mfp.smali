.class public final synthetic Lmfp;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Lmfp;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lmfp;

    const-string v1, "getPatch()I"

    const/4 v2, 0x0

    const-class v3, Lvfp;

    const-string v4, "patch"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lmfp;->b:Lmfp;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lvfp;

    iget p0, p1, Lvfp;->c:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

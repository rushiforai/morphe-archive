.class public final synthetic Llfp;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Llfp;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Llfp;

    const-string v1, "getMinor()I"

    const/4 v2, 0x0

    const-class v3, Lvfp;

    const-string v4, "minor"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Llfp;->b:Llfp;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lvfp;

    iget p0, p1, Lvfp;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

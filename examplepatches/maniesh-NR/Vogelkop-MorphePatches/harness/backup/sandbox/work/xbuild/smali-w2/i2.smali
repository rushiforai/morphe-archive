.class public final synthetic Li2;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Li2;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Li2;

    const-string v1, "getName()Ljava/lang/String;"

    const/4 v2, 0x0

    const-class v3, Ll2;

    const-string v4, "name"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Li2;->b:Li2;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Ll2;

    invoke-interface {p1}, Ll2;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

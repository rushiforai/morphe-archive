.class public final Lysn;
.super Luik;
.source "SourceFile"


# static fields
.field public static final d:Lbc6;


# instance fields
.field public b:Ljava/lang/String;

.field public c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lbc6;

    const/16 v1, 0x18

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbc6;-><init>(II)V

    filled-new-array {v0}, [Lbc6;

    move-result-object v0

    aget-object v0, v0, v2

    sput-object v0, Lysn;->d:Lbc6;

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 5

    sget-object v0, Lysn;->d:Lbc6;

    invoke-virtual {p1, v0}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p1

    iget-object v0, p0, Lysn;->b:Ljava/lang/String;

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2}, Lbp;->E(ILjava/lang/String;Z)V

    iget-boolean p0, p0, Lysn;->c:Z

    const/16 v0, 0x10

    invoke-virtual {p1, v0, v2, p0}, Lbp;->A(IIZ)V

    return-void
.end method

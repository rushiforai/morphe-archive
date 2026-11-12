.class public final Li3d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldvb;

.field public final b:I

.field public final c:I

.field public final d:Z


# direct methods
.method public constructor <init>(IILjava/lang/String;Z)V
    .registers 5

    invoke-static {p3}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Li3d;->a:Ldvb;

    iput p1, p0, Li3d;->b:I

    iput p2, p0, Li3d;->c:I

    iput-boolean p4, p0, Li3d;->d:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 5

    .line 16
    sget-object v0, Lk3d;->a:Landroid/graphics/PointF;

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 17
    invoke-direct {p0, p2, v0, p1, v1}, Li3d;-><init>(IILjava/lang/String;Z)V

    return-void
.end method

.method public static a(Ljava/lang/String;)Ldvb;
    .registers 3

    new-instance v0, Ldvb;

    const-string v1, "**"

    filled-new-array {v1, p0, v1}, [Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ldvb;-><init>([Ljava/lang/String;)V

    return-object v0
.end method

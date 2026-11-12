.class public final Lsm7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field public final a:Lpc;

.field public final b:Ltf;

.field public final c:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Ltf;->i:I

    return-void
.end method

.method public constructor <init>(Lpc;Ltf;F)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsm7;->a:Lpc;

    iput-object p2, p0, Lsm7;->b:Ltf;

    iput p3, p0, Lsm7;->c:F

    return-void
.end method


# virtual methods
.method public final compareTo(Ljava/lang/Object;)I
    .registers 2

    check-cast p1, Lsm7;

    iget p0, p0, Lsm7;->c:F

    iget p1, p1, Lsm7;->c:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    return p0
.end method

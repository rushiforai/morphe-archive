.class public abstract Lv5k;
.super Lu5k;
.source "SourceFile"


# instance fields
.field public final c:I


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lijc;Le6k;I)V
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Lu5k;-><init>(Ljava/lang/Class;Lijc;Le6k;)V

    iput p4, p0, Lv5k;->c:I

    return-void
.end method


# virtual methods
.method public abstract B(Landroid/view/ViewGroup;)Lab2;
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 4

    iget v0, p0, Lv5k;->c:I

    if-ne p2, v0, :cond_9

    invoke-virtual {p0, p1}, Lv5k;->B(Landroid/view/ViewGroup;)Lab2;

    move-result-object p0

    return-object p0

    :cond_9
    const/4 p0, 0x0

    return-object p0
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    iget p0, p0, Lv5k;->c:I

    return p0
.end method

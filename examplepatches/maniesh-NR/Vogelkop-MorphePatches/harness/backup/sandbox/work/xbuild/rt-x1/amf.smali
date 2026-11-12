.class public final Lamf;
.super Li41;
.source "SourceFile"


# static fields
.field public static final l:Lamf;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lamf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lamf;->l:Lamf;

    return-void
.end method


# virtual methods
.method public final A()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public final F(Landroid/view/ViewGroup;)V
    .registers 2

    const/16 p0, 0x8

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lamf;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x4efee5b1    # 2.138233E9f

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

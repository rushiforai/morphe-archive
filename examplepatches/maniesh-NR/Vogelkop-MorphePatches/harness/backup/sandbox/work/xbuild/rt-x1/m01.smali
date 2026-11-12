.class public final Lm01;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lyv;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lyv;->b:Lyv;

    return-void
.end method

.method public constructor <init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 12

    const-wide/16 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 12
    invoke-direct/range {v0 .. v6}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;IJ)V

    return-void
.end method

.method public constructor <init>(Lyv;Ljava/lang/String;Ljava/lang/String;IJ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm01;->a:Lyv;

    iput-object p2, p0, Lm01;->b:Ljava/lang/String;

    iput-object p3, p0, Lm01;->c:Ljava/lang/String;

    iput-byte p4, p0, Lm01;->d:B

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_32

    if-eqz p1, :cond_34

    const-class v0, Lm01;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_34

    check-cast p1, Lm01;

    iget-byte v0, p0, Lm01;->d:B

    iget-byte v1, p1, Lm01;->d:B

    if-ne v0, v1, :cond_34

    iget-object v0, p0, Lm01;->a:Lyv;

    iget-object v1, p1, Lm01;->a:Lyv;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p0, Lm01;->b:Ljava/lang/String;

    iget-object v1, p1, Lm01;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object p0, p0, Lm01;->c:Ljava/lang/String;

    iget-object p1, p1, Lm01;->c:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_34

    :cond_32
    const/4 p0, 0x1

    return p0

    :cond_34
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-byte v0, p0, Lm01;->d:B

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lm01;->a:Lyv;

    const/4 v2, 0x0

    iget-object v3, p0, Lm01;->b:Ljava/lang/String;

    iget-object p0, p0, Lm01;->c:Ljava/lang/String;

    filled-new-array {v1, v2, v3, p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

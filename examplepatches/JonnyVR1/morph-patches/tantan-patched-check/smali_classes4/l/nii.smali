.class public Ll/nii;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nii$b;
    }
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:J

.field public d:J

.field public e:I

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0xc800

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Ll/nii;->a:J

    .line 8
    .line 9
    const-wide/32 v0, 0x3200000

    .line 10
    .line 11
    .line 12
    iput-wide v0, p0, Ll/nii;->b:J

    .line 13
    .line 14
    const-wide/16 v0, 0x7530

    .line 15
    .line 16
    iput-wide v0, p0, Ll/nii;->c:J

    .line 17
    .line 18
    const-wide/32 v0, 0x1d4c0

    .line 19
    .line 20
    .line 21
    iput-wide v0, p0, Ll/nii;->d:J

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput v0, p0, Ll/nii;->e:I

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/nii;->f:Ljava/util/List;

    .line 32
    .line 33
    return-void
.end method

.method public synthetic constructor <init>(Ll/nii$a;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ll/nii;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/nii;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/nii;->b:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic b(Ll/nii;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/nii;->a:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic c(Ll/nii;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/nii;->e:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic d(Ll/nii;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nii;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nii;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/nii;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public g()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/nii;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/nii;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/nii;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/nii;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

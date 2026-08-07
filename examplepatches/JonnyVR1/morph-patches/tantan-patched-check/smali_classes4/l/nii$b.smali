.class public Ll/nii$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nii;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ll/nii;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nii;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ll/nii;-><init>(Ll/nii$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/nii$b;->a:Ll/nii;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ll/nii;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nii$b;->a:Ll/nii;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/util/List;)Ll/nii$b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/nii$b;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nii$b;->a:Ll/nii;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/nii;->d(Ll/nii;Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c(J)Ll/nii$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nii$b;->a:Ll/nii;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ll/nii;->a(Ll/nii;J)J

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public d(J)Ll/nii$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nii$b;->a:Ll/nii;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ll/nii;->b(Ll/nii;J)J

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public e(I)Ll/nii$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nii$b;->a:Ll/nii;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/nii;->c(Ll/nii;I)I

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

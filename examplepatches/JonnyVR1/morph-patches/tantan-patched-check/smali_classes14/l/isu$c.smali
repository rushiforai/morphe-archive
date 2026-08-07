.class public Ll/isu$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/isu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Ll/x20;

.field public c:Ll/x20;

.field public d:Ll/x20;

.field public e:Z

.field public f:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/isu$c;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/isu;
    .locals 2

    .line 1
    new-instance v0, Ll/isu;

    .line 2
    .line 3
    iget-object v1, p0, Ll/isu$c;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/isu;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/isu$c;->b:Ll/x20;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/isu;->e0(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/isu$c;->c:Ll/x20;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/isu;->g0(Ll/x20;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/isu$c;->d:Ll/x20;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/isu;->f0(Ll/x20;)V

    .line 21
    .line 22
    .line 23
    iget-boolean v1, p0, Ll/isu$c;->e:Z

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/isu;->d0(Z)V

    .line 26
    .line 27
    .line 28
    iget p0, p0, Ll/isu$c;->f:I

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ll/isu;->c0(I)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public b(Z)Ll/isu$c;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/isu$c;->e:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Ll/isu$c;
    .locals 0

    .line 1
    iput p1, p0, Ll/isu$c;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/x20;)Ll/isu$c;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isu$c;->b:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/x20;)Ll/isu$c;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isu$c;->c:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/isu;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/isu$c;->a()Ll/isu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget p0, p0, Ll/isu$c;->f:I

    .line 6
    .line 7
    int-to-double v1, p0

    .line 8
    invoke-virtual {v0, v1, v2}, Ll/isu;->i0(D)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

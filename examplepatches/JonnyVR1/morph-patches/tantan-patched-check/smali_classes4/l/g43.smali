.class public Ll/g43;
.super Ll/eoi0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/g43$a;
    }
.end annotation


# instance fields
.field public e:Ll/g43$a;

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ll/eoi0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g43;->g:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/g43;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/g43;->i:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Ll/g43;->f:I

    .line 11
    .line 12
    iput-object p5, p0, Ll/g43;->j:Ljava/lang/String;

    .line 13
    .line 14
    new-instance p1, Landroid/os/Debug$MemoryInfo;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/os/Debug$MemoryInfo;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Landroid/os/Debug;->getMemoryInfo(Landroid/os/Debug$MemoryInfo;)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/g43$a;

    .line 23
    .line 24
    iget v2, p1, Landroid/os/Debug$MemoryInfo;->dalvikPss:I

    .line 25
    .line 26
    iget v3, p1, Landroid/os/Debug$MemoryInfo;->nativePss:I

    .line 27
    .line 28
    iget v4, p1, Landroid/os/Debug$MemoryInfo;->otherPss:I

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/os/Debug$MemoryInfo;->getTotalPss()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    move-object v1, p0

    .line 35
    invoke-direct/range {v0 .. v5}, Ll/g43$a;-><init>(Ll/g43;IIII)V

    .line 36
    .line 37
    .line 38
    iput-object v0, v1, Ll/g43;->e:Ll/g43$a;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g43;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g43;->e:Ll/g43$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g43$a;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g43;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g43;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

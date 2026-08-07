.class public final Ll/zhd;
.super Ll/bid;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bid;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/zhd;->b:Ljava/lang/String;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/zhd;->d:Z

    .line 8
    .line 9
    iput p1, p0, Ll/zhd;->c:I

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Ll/bid;-><init>(I)V

    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Ll/zhd;->d:Z

    .line 14
    iput p3, p0, Ll/zhd;->c:I

    .line 15
    iput-object p2, p0, Ll/zhd;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zhd;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/zhd;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zhd;->d:Z

    .line 2
    .line 3
    return p0
.end method

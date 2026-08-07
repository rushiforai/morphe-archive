.class public final Ll/dml$k;
.super Ll/gc20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "k"
.end annotation


# instance fields
.field public final b:Z

.field public final c:I

.field public final d:I

.field public final synthetic e:Ll/dml;


# direct methods
.method public constructor <init>(Ll/dml;ZII)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/dml$k;->e:Ll/dml;

    .line 2
    .line 3
    iget-object p1, p1, Ll/dml;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {p1, v0, v1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "OkHttp %s ping %08x%08x"

    .line 18
    .line 19
    invoke-direct {p0, v0, p1}, Ll/gc20;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput-boolean p2, p0, Ll/dml$k;->b:Z

    .line 23
    .line 24
    iput p3, p0, Ll/dml$k;->c:I

    .line 25
    .line 26
    iput p4, p0, Ll/dml$k;->d:I

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dml$k;->e:Ll/dml;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/dml$k;->b:Z

    .line 4
    .line 5
    iget v2, p0, Ll/dml$k;->c:I

    .line 6
    .line 7
    iget p0, p0, Ll/dml$k;->d:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Ll/dml;->l0(ZII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

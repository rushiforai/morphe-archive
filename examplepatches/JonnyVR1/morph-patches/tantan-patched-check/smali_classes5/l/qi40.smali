.class public Ll/qi40;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Ljava/lang/String;

.field public e:Z


# direct methods
.method public constructor <init>(III)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/qi40;->d:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/qi40;->e:Z

    .line 10
    .line 11
    iput p1, p0, Ll/qi40;->a:I

    .line 12
    .line 13
    iput p2, p0, Ll/qi40;->b:I

    .line 14
    .line 15
    iput p3, p0, Ll/qi40;->c:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;Z)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput p1, p0, Ll/qi40;->a:I

    .line 20
    iput p2, p0, Ll/qi40;->b:I

    .line 21
    iput p3, p0, Ll/qi40;->c:I

    .line 22
    iput-object p4, p0, Ll/qi40;->d:Ljava/lang/String;

    .line 23
    iput-boolean p5, p0, Ll/qi40;->e:Z

    return-void
.end method

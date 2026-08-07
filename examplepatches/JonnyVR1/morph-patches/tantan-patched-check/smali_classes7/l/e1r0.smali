.class public Ll/e1r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/c2r0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/e1r0$b;
    }
.end annotation


# static fields
.field public static g:Z


# instance fields
.field private a:Ljava/text/SimpleDateFormat;

.field private b:Ll/u1r0;

.field private c:Ll/e1r0$b;

.field private d:Ll/e1r0$b;

.field private e:Ll/x1r0;

.field private final f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/u1r0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 5
    .line 6
    const-string v1, "hh:mm:ss aaa"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/e1r0;->a:Ljava/text/SimpleDateFormat;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/e1r0;->c:Ll/e1r0$b;

    .line 15
    .line 16
    iput-object v0, p0, Ll/e1r0;->d:Ll/e1r0$b;

    .line 17
    .line 18
    iput-object v0, p0, Ll/e1r0;->e:Ll/x1r0;

    .line 19
    .line 20
    const-string v0, "[Slim] "

    .line 21
    .line 22
    iput-object v0, p0, Ll/e1r0;->f:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, p0, Ll/e1r0;->b:Ll/u1r0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/e1r0;->d()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic a(Ll/e1r0;)Ljava/text/SimpleDateFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1r0;->a:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/e1r0;)Ll/e1r0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1r0;->c:Ll/e1r0$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/e1r0;)Ll/u1r0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1r0;->b:Ll/u1r0;

    .line 2
    .line 3
    return-object p0
.end method

.method private d()V
    .locals 2

    .line 1
    new-instance v0, Ll/e1r0$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, p0, v1}, Ll/e1r0$b;-><init>(Ll/e1r0;Z)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/e1r0;->c:Ll/e1r0$b;

    .line 8
    .line 9
    new-instance v0, Ll/e1r0$b;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, p0, v1}, Ll/e1r0$b;-><init>(Ll/e1r0;Z)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/e1r0;->d:Ll/e1r0$b;

    .line 16
    .line 17
    iget-object v0, p0, Ll/e1r0;->b:Ll/u1r0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/e1r0;->c:Ll/e1r0$b;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v1}, Ll/u1r0;->n(Ll/z1r0;Ll/d2r0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/e1r0;->b:Ll/u1r0;

    .line 25
    .line 26
    iget-object v1, p0, Ll/e1r0;->d:Ll/e1r0$b;

    .line 27
    .line 28
    invoke-virtual {v0, v1, v1}, Ll/u1r0;->z(Ll/z1r0;Ll/d2r0;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/e1r0$a;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/e1r0$a;-><init>(Ll/e1r0;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/e1r0;->e:Ll/x1r0;

    .line 37
    .line 38
    return-void
.end method

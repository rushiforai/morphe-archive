.class public Ll/bae0;
.super Ll/fk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bae0$a;,
        Ll/bae0$b;
    }
.end annotation


# instance fields
.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:Ll/bae0$b;


# direct methods
.method public constructor <init>(Ll/bae0$a;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/fk2;-><init>(Ll/gk2;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/bae0;->c:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/bae0$a;->b(Ll/bae0$a;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/bae0;->d:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1}, Ll/bae0$a;->a(Ll/bae0$a;)Ll/bae0$b;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/bae0;->e:Ll/bae0$b;

    .line 18
    .line 19
    return-void
.end method

.method public static b(ILjava/lang/String;)Ll/bae0;
    .locals 1

    .line 1
    new-instance v0, Ll/bae0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bae0$a;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/bae0$a;->c()Ll/bae0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

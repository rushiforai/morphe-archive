.class public Ll/fbg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fbg$a;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/fbg$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/fbg$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/fbg;->a:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p1, Ll/fbg$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/fbg;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget v0, p1, Ll/fbg$a;->c:I

    .line 13
    .line 14
    iput v0, p0, Ll/fbg;->c:I

    .line 15
    .line 16
    iget-object v0, p1, Ll/fbg$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/fbg;->d:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p1, p1, Ll/fbg$a;->e:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p1, p0, Ll/fbg;->e:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public static a()Ll/fbg$a;
    .locals 2

    .line 1
    new-instance v0, Ll/fbg$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/fbg$a;-><init>(Ll/gbg;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

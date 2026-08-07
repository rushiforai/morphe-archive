.class public final Ll/z3v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/a4v0;


# direct methods
.method public constructor <init>(Ll/a4v0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z3v0;->a:Ll/a4v0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->j6:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/a4v0;->d()Ljava/util/regex/Pattern;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p0, p0, Ll/z3v0;->a:Ll/a4v0;

    .line 43
    .line 44
    invoke-static {p0}, Ll/a4v0;->b(Ll/a4v0;)Ll/u9v0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p0, p1}, Ll/u9v0;->i(I)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ll/b7w0;

    .line 2
    .line 3
    sget-object v0, Ll/sgs0;->j6:Ll/dgs0;

    .line 4
    .line 5
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/z3v0;->a:Ll/a4v0;

    .line 22
    .line 23
    invoke-static {v0}, Ll/a4v0;->b(Ll/a4v0;)Ll/u9v0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 28
    .line 29
    iget-object v1, v1, Ll/a7w0;->b:Ll/t6w0;

    .line 30
    .line 31
    iget v1, v1, Ll/t6w0;->e:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/u9v0;->i(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/z3v0;->a:Ll/a4v0;

    .line 37
    .line 38
    invoke-static {p0}, Ll/a4v0;->b(Ll/a4v0;)Ll/u9v0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 43
    .line 44
    iget-object p1, p1, Ll/a7w0;->b:Ll/t6w0;

    .line 45
    .line 46
    iget-wide v0, p1, Ll/t6w0;->f:J

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ll/u9v0;->j(J)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

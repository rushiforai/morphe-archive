.class public Ll/wtf;
.super Ll/zr2;
.source "SourceFile"


# instance fields
.field private c:Ll/htf;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/zr2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/wtf;->c:Ll/htf;

    .line 6
    .line 7
    new-instance v0, Ll/htf;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/htf;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/wtf;->c:Ll/htf;

    .line 13
    .line 14
    new-instance v0, Ll/vtf;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/vtf;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/jtf;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/jtf;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/wtf;->c:Ll/htf;

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 33
    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {v0, v1, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Ll/wtf;->c:Ll/htf;

    .line 40
    .line 41
    const/4 v3, 0x1

    .line 42
    invoke-virtual {v0, v2, v3}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v1}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Ll/wtf;->c:Ll/htf;

    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v1}, Ll/lt2;->registerInitialFilter(Ll/jt2;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ll/wtf;->c:Ll/htf;

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ll/lt2;->registerInitialFilter(Ll/jt2;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v0}, Ll/lt2;->registerTerminalFilter(Ll/jt2;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getFolder()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p1, "mask.png"

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/wtf;->c:Ll/htf;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/k13;->Q1(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.class Ll/mx3$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qe00;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mx3;->i(Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;[I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/List;

.field final synthetic b:Ljava/util/Map;

.field final synthetic c:[I

.field final synthetic d:Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;

.field final synthetic e:Ll/mx3;


# direct methods
.method public constructor <init>(Ll/mx3;Ljava/util/List;Ljava/util/Map;[ILcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mx3$c;->e:Ll/mx3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mx3$c;->a:Ljava/util/List;

    .line 4
    .line 5
    iput-object p3, p0, Ll/mx3$c;->b:Ljava/util/Map;

    .line 6
    .line 7
    iput-object p4, p0, Ll/mx3$c;->c:[I

    .line 8
    .line 9
    iput-object p5, p0, Ll/mx3$c;->d:Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/mx3$c;->e:Ll/mx3;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mx3;->b(Ll/mx3;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "download onFailed: "

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p0, p1}, Lcom/immomo/resdownloader/log/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onProcess(ID)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSuccess()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/mx3$c;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_2

    .line 10
    .line 11
    iget-object v2, p0, Ll/mx3$c;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, [Ljava/lang/String;

    .line 18
    .line 19
    array-length v3, v2

    .line 20
    const/4 v4, 0x1

    .line 21
    move v5, v0

    .line 22
    move v6, v4

    .line 23
    :goto_1
    if-ge v5, v3, :cond_1

    .line 24
    .line 25
    aget-object v7, v2, v5

    .line 26
    .line 27
    invoke-static {}, Ll/af00;->b()Ll/af00;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    invoke-virtual {v8, v7}, Ll/af00;->c(Ljava/lang/String;)Ljava/io/File;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    if-eqz v7, :cond_0

    .line 36
    .line 37
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eqz v7, :cond_0

    .line 42
    .line 43
    move v7, v4

    .line 44
    goto :goto_2

    .line 45
    :cond_0
    move v7, v0

    .line 46
    :goto_2
    and-int/2addr v6, v7

    .line 47
    add-int/lit8 v5, v5, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    iget-object v2, p0, Ll/mx3$c;->b:Ljava/util/Map;

    .line 51
    .line 52
    iget-object v3, p0, Ll/mx3$c;->c:[I

    .line 53
    .line 54
    aget v3, v3, v1

    .line 55
    .line 56
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Ll/mx3$c;->e:Ll/mx3;

    .line 68
    .line 69
    invoke-static {v2}, Ll/mx3;->b(Ll/mx3;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    new-instance v3, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v4, "  download \u8fd4\u56de\u7ed3\u679c: "

    .line 76
    .line 77
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v4, p0, Ll/mx3$c;->c:[I

    .line 81
    .line 82
    aget v4, v4, v1

    .line 83
    .line 84
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v4, "->"

    .line 88
    .line 89
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    new-array v4, v0, [Ljava/lang/Object;

    .line 100
    .line 101
    invoke-static {v2, v3, v4}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    add-int/lit8 v1, v1, 0x1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_2
    iget-object v0, p0, Ll/mx3$c;->d:Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;

    .line 108
    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    iget-object p0, p0, Ll/mx3$c;->b:Ljava/util/Map;

    .line 112
    .line 113
    invoke-interface {v0, p0}, Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;->a(Ljava/util/Map;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    return-void
.end method

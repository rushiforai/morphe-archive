.class public Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/pxd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pxd0<",
            "Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "_"

    .line 9
    .line 10
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p2, ""

    .line 28
    .line 29
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->a:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v1, Ll/pxd0;

    .line 55
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p1, "_saved_count"

    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    new-instance v4, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;

    .line 77
    .line 78
    new-instance p1, Ljava/util/TreeMap;

    .line 79
    .line 80
    invoke-direct {p1}, Ljava/util/TreeMap;-><init>()V

    .line 81
    .line 82
    .line 83
    const/4 p2, 0x0

    .line 84
    invoke-direct {v4, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;-><init>(Ljava/util/TreeMap;Ll/fb20;)V

    .line 85
    .line 86
    .line 87
    const/4 v5, 0x1

    .line 88
    const-string v6, "preferences"

    .line 89
    .line 90
    const-class v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;

    .line 91
    .line 92
    invoke-direct/range {v1 .. v6}, Ll/pxd0;-><init>(Ljava/lang/Class;Ljava/lang/String;Ll/pxd0$a;ZLjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b:Ll/pxd0;

    .line 96
    .line 97
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    invoke-static {}, Ll/yau;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b:Ll/pxd0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/pxd0;->a()Ll/pxd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;)Ljava/util/TreeMap;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, v0}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x1

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;)Ljava/util/TreeMap;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2, v0}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;)Ljava/util/TreeMap;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    add-int/2addr v2, v3

    .line 43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v4, v0, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;)Ljava/util/TreeMap;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v2, v0, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b:Ll/pxd0;

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Ll/pxd0;->b(Ll/pxd0$a;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public b(I)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gtz p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b:Ll/pxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pxd0;->a()Ll/pxd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;

    .line 12
    .line 13
    invoke-static {}, Ll/yau;->m()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;)Ljava/util/TreeMap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    add-int/lit8 p1, p1, -0x1

    .line 22
    .line 23
    invoke-static {p1}, Ll/yau;->l(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0, p1, v1}, Ll/d3t;->c(Ljava/util/TreeMap;Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/util/TreeMap;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    add-int/2addr v0, p1

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    return v0
.end method

.method public c()I
    .locals 2

    .line 1
    invoke-static {}, Ll/yau;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b:Ll/pxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pxd0;->a()Ll/pxd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;)Ljava/util/TreeMap;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, v0}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;)Ljava/util/TreeMap;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, v0}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public d()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b:Ll/pxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pxd0;->a()Ll/pxd0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue$CountData;)Ljava/util/TreeMap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->i0(Ljava/util/List;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

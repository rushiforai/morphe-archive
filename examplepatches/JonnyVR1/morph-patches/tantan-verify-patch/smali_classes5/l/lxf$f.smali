.class public Ll/lxf$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lxf;->j(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jxf;

.field public final synthetic b:Ll/ltl$a;

.field public final synthetic c:Ll/lxf;


# direct methods
.method public constructor <init>(Ll/lxf;Ll/jxf;Ll/ltl$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lxf$f;->c:Ll/lxf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lxf$f;->a:Ll/jxf;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lxf$f;->b:Ll/ltl$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "preload resource failed"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_4

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Ll/lxf$f;->a:Ll/jxf;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p1, Ll/jxf;->a:Z

    .line 31
    .line 32
    iget-object p0, p0, Ll/lxf$f;->b:Ll/ltl$a;

    .line 33
    .line 34
    if-eqz p0, :cond_5

    .line 35
    .line 36
    invoke-interface {p0, p1}, Ll/ltl$a;->a(Ll/jxf;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ljava/util/Map$Entry;

    .line 45
    .line 46
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ljava/lang/Boolean;

    .line 51
    .line 52
    if-eqz v2, :cond_3

    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_1

    .line 59
    .line 60
    :cond_3
    iget-object p1, p0, Ll/lxf$f;->a:Ll/jxf;

    .line 61
    .line 62
    iput-boolean v1, p1, Ll/jxf;->a:Z

    .line 63
    .line 64
    iput-object v0, p1, Ll/jxf;->f:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p0, p0, Ll/lxf$f;->b:Ll/ltl$a;

    .line 67
    .line 68
    if-eqz p0, :cond_5

    .line 69
    .line 70
    invoke-interface {p0, p1}, Ll/ltl$a;->c(Ll/jxf;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_4
    :goto_0
    iget-object p1, p0, Ll/lxf$f;->a:Ll/jxf;

    .line 75
    .line 76
    iput-boolean v1, p1, Ll/jxf;->a:Z

    .line 77
    .line 78
    iput-object v0, p1, Ll/jxf;->f:Ljava/lang/String;

    .line 79
    .line 80
    iget-object p0, p0, Ll/lxf$f;->b:Ll/ltl$a;

    .line 81
    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    invoke-interface {p0, p1}, Ll/ltl$a;->c(Ll/jxf;)V

    .line 85
    .line 86
    .line 87
    :cond_5
    return-void
.end method

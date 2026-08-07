.class public Ll/p35;
.super Ll/o2;
.source "SourceFile"


# static fields
.field public static final f:Ljava/util/regex/Pattern;

.field public static final g:Ljava/util/regex/Pattern;


# instance fields
.field public d:Z

.field public e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "^(1|true|t|yes|y|on)$"

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ll/p35;->f:Ljava/util/regex/Pattern;

    .line 9
    .line 10
    const-string v0, "^(0|false|f|no|n|off|)$"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/p35;->g:Ljava/util/regex/Pattern;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSTemplateModeType;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/o2;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSTemplateModeType;)V

    .line 2
    .line 3
    .line 4
    iput-object p5, p0, Ll/p35;->e:Ljava/lang/String;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    if-nez p4, :cond_0

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/p35;->d:Z

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object p2, Ll/p35;->f:Ljava/util/regex/Pattern;

    .line 13
    .line 14
    invoke-virtual {p2, p4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->matches()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Ll/p35;->d:Z

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    sget-object p2, Ll/p35;->g:Ljava/util/regex/Pattern;

    .line 29
    .line 30
    invoke-virtual {p2, p4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->matches()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    iput-boolean p1, p0, Ll/p35;->d:Z

    .line 41
    .line 42
    :cond_2
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/o2;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->k:Ljava/util/Map;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/p35;->b()V

    .line 13
    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_4

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/util/Map$Entry;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/data/OMSAction;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSAction;->params:Ljava/util/Map;

    .line 43
    .line 44
    const-string v4, "id"

    .line 45
    .line 46
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Ljava/lang/CharSequence;

    .line 51
    .line 52
    iget-object v4, p0, Ll/o2;->b:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 67
    .line 68
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 69
    .line 70
    iget-boolean v1, p0, Ll/p35;->d:Z

    .line 71
    .line 72
    if-ne v0, v1, :cond_2

    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    :cond_2
    if-nez v2, :cond_3

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/p35;->b()V

    .line 78
    .line 79
    .line 80
    :cond_3
    return v2

    .line 81
    :cond_4
    invoke-virtual {p0}, Ll/p35;->b()V

    .line 82
    .line 83
    .line 84
    return v2
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o2;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    iget-object p0, p0, Ll/p35;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->d0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

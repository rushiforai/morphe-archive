.class public Ll/knc0;
.super Ll/c4k0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c4k0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/data/OMSAction;)Z
    .locals 10

    .line 1
    sget-boolean v0, Ll/x5l0;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/c4k0;->b()V

    .line 7
    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    iget-object v0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->k:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/data/OMSAction;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAction;->preCondition:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_1

    .line 40
    .line 41
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/data/OMSPreCondition;

    .line 46
    .line 47
    new-instance v4, Ll/p35;

    .line 48
    .line 49
    iget-object v5, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 50
    .line 51
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSPreCondition;->id:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v7, v0, Lcom/p1/mobile/putong/data/OMSPreCondition;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 54
    .line 55
    iget-object v8, v0, Lcom/p1/mobile/putong/data/OMSPreCondition;->condition:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v9, v0, Lcom/p1/mobile/putong/data/OMSPreCondition;->fail_content:Ljava/lang/String;

    .line 58
    .line 59
    invoke-direct/range {v4 .. v9}, Ll/p35;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSTemplateModeType;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4}, Ll/o2;->a()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    move v0, v2

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    move v0, v1

    .line 71
    :goto_0
    if-nez v3, :cond_4

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 74
    .line 75
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 76
    .line 77
    if-nez v3, :cond_2

    .line 78
    .line 79
    new-instance v3, Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    new-instance v4, Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-direct {v4, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 88
    .line 89
    .line 90
    move-object v3, v4

    .line 91
    :goto_1
    if-eqz v0, :cond_3

    .line 92
    .line 93
    const-string v4, "true"

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_3
    const-string v4, "false"

    .line 97
    .line 98
    :goto_2
    const-string v5, "is_checked"

    .line 99
    .line 100
    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 104
    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v4, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 108
    .line 109
    iget-object v4, v4, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 110
    .line 111
    iget-object v4, v4, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 112
    .line 113
    iget-object v4, v4, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {p1, v4, v3}, Ll/el50;->g(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 116
    .line 117
    .line 118
    :cond_4
    if-nez v0, :cond_5

    .line 119
    .line 120
    return v1

    .line 121
    :cond_5
    invoke-static {}, Ll/hxf;->n()V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    const-string v0, "dialog"

    .line 129
    .line 130
    invoke-static {p1, v0, v2, v2}, Ll/hxf;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Ll/c4k0;->b()V

    .line 134
    .line 135
    .line 136
    return v1
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "realperson"

    .line 2
    .line 3
    return-object p0
.end method

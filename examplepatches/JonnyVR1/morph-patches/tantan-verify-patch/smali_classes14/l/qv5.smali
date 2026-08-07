.class public Ll/qv5;
.super Ll/pv5;
.source "SourceFile"


# static fields
.field public static final A:Ljava/lang/String;

.field public static final B:Ljava/lang/String;

.field public static final C:Ljava/lang/String;

.field public static final D:Ljava/lang/String;

.field public static final E:Ljava/lang/String;

.field public static final F:Ljava/lang/String;

.field public static a:Ll/wyd0;

.field public static b:Ll/wyd0;

.field public static final c:Ljava/lang/String;

.field public static final d:Ljava/lang/String;

.field public static final e:Ljava/lang/String;

.field public static final f:Ljava/lang/String;

.field public static final g:Ljava/lang/String;

.field public static final h:Ljava/lang/String;

.field public static final i:Ljava/lang/String;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/lang/String;

.field public static final m:Ljava/lang/String;

.field public static final n:Ljava/lang/String;

.field public static final o:Ljava/lang/String;

.field public static final p:Ljava/lang/String;

.field public static final q:Ljava/lang/String;

.field public static final r:Ljava/lang/String;

.field public static final s:Ljava/lang/String;

.field public static final t:Ljava/lang/String;

.field public static final u:Ljava/lang/String;

.field public static final v:Ljava/lang/String;

.field public static final w:Ljava/lang/String;

.field public static final x:Ljava/lang/String;

.field public static final y:Ljava/lang/String;

.field public static final z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    const-string v1, "tantanapp"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "unstableName"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/qv5;->a:Ll/wyd0;

    .line 12
    .line 13
    new-instance v0, Ll/wyd0;

    .line 14
    .line 15
    const-string v1, "protocal"

    .line 16
    .line 17
    const-string v2, "https"

    .line 18
    .line 19
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Ll/qv5;->b:Ll/wyd0;

    .line 23
    .line 24
    sget-object v0, Ll/qv5;->a:Ll/wyd0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/String;

    .line 31
    .line 32
    sput-object v0, Ll/qv5;->c:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Ll/qv5;->b:Ll/wyd0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/String;

    .line 41
    .line 42
    sput-object v0, Ll/qv5;->d:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "https://core.tantanapp.com"

    .line 45
    .line 46
    sput-object v0, Ll/qv5;->e:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "https://account.tantanapp.com"

    .line 49
    .line 50
    sput-object v0, Ll/qv5;->f:Ljava/lang/String;

    .line 51
    .line 52
    const-string v0, "https://cloud.tantanapp.com"

    .line 53
    .line 54
    sput-object v0, Ll/qv5;->g:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "https://client-tracking.tantanapp.com"

    .line 57
    .line 58
    sput-object v0, Ll/qv5;->h:Ljava/lang/String;

    .line 59
    .line 60
    const-string v0, "https://client-tracking_new.tantanapp.com"

    .line 61
    .line 62
    sput-object v0, Ll/qv5;->i:Ljava/lang/String;

    .line 63
    .line 64
    const-string v0, "https://asset.tantanapp.com"

    .line 65
    .line 66
    sput-object v0, Ll/qv5;->j:Ljava/lang/String;

    .line 67
    .line 68
    const-string v0, "https://autoupdate.tantanapp.com"

    .line 69
    .line 70
    sput-object v0, Ll/qv5;->k:Ljava/lang/String;

    .line 71
    .line 72
    const-string v0, "https://abtest.tantanapp.com"

    .line 73
    .line 74
    sput-object v0, Ll/qv5;->l:Ljava/lang/String;

    .line 75
    .line 76
    const-string v0, "https://ai-growth.tantanapp.com"

    .line 77
    .line 78
    sput-object v0, Ll/qv5;->m:Ljava/lang/String;

    .line 79
    .line 80
    const-string v0, "https://growth.tantanapp.com"

    .line 81
    .line 82
    sput-object v0, Ll/qv5;->n:Ljava/lang/String;

    .line 83
    .line 84
    const-string v0, "https://m.tantanapp.com"

    .line 85
    .line 86
    sput-object v0, Ll/qv5;->o:Ljava/lang/String;

    .line 87
    .line 88
    const-string v1, "https://my-tantan.tantanapp.com"

    .line 89
    .line 90
    sput-object v1, Ll/qv5;->p:Ljava/lang/String;

    .line 91
    .line 92
    const-string v1, "https://i.tantanapp.com"

    .line 93
    .line 94
    sput-object v1, Ll/qv5;->q:Ljava/lang/String;

    .line 95
    .line 96
    const-string v1, "https://live-web.tantanapp.com"

    .line 97
    .line 98
    sput-object v1, Ll/qv5;->r:Ljava/lang/String;

    .line 99
    .line 100
    const-string v1, "https://ai-suggest.tantanapp.com"

    .line 101
    .line 102
    sput-object v1, Ll/qv5;->s:Ljava/lang/String;

    .line 103
    .line 104
    const-string v1, "https://openapi.tantanapp.com"

    .line 105
    .line 106
    sput-object v1, Ll/qv5;->t:Ljava/lang/String;

    .line 107
    .line 108
    const-string v1, "https://gif.tantanapp.com"

    .line 109
    .line 110
    sput-object v1, Ll/qv5;->u:Ljava/lang/String;

    .line 111
    .line 112
    const-string v1, "https://accounts.tantanapp.com"

    .line 113
    .line 114
    sput-object v1, Ll/qv5;->v:Ljava/lang/String;

    .line 115
    .line 116
    const-string v1, "https://devices.tantanapp.com"

    .line 117
    .line 118
    sput-object v1, Ll/qv5;->w:Ljava/lang/String;

    .line 119
    .line 120
    const-string v1, "http://feedback.tantanapp.com"

    .line 121
    .line 122
    sput-object v1, Ll/qv5;->x:Ljava/lang/String;

    .line 123
    .line 124
    const-string v1, "https://order.tantanapp.com"

    .line 125
    .line 126
    sput-object v1, Ll/qv5;->y:Ljava/lang/String;

    .line 127
    .line 128
    const-string v1, "https://decommercialize.tantanapp.com"

    .line 129
    .line 130
    sput-object v1, Ll/qv5;->z:Ljava/lang/String;

    .line 131
    .line 132
    const-string v1, "https://oms.tantanapp.com"

    .line 133
    .line 134
    sput-object v1, Ll/qv5;->A:Ljava/lang/String;

    .line 135
    .line 136
    const-string v1, "https://intl-live-activity.tantanapp.com"

    .line 137
    .line 138
    sput-object v1, Ll/qv5;->B:Ljava/lang/String;

    .line 139
    .line 140
    const-string v1, "https://live-realtime.tantanapp.com"

    .line 141
    .line 142
    sput-object v1, Ll/qv5;->C:Ljava/lang/String;

    .line 143
    .line 144
    sput-object v0, Ll/qv5;->D:Ljava/lang/String;

    .line 145
    .line 146
    const-string v0, "https://intlweb.tantanapp.com"

    .line 147
    .line 148
    sput-object v0, Ll/qv5;->E:Ljava/lang/String;

    .line 149
    .line 150
    const-string v0, "https://h5-static-overseas.tantanapp.com"

    .line 151
    .line 152
    sput-object v0, Ll/qv5;->F:Ljava/lang/String;

    .line 153
    .line 154
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pv5;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/qv5;->d()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "://"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, "."

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/qv5;->c()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, ".com"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static b()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Lcom/p1/mobile/putong/common/R$string;->U0:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static c()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "tantanapp"

    .line 2
    .line 3
    return-object v0
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qv5;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static e(Z)V
    .locals 2

    .line 1
    const-string v0, "sp_protocal"

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/qv5;->b:Ll/wyd0;

    .line 6
    .line 7
    const-string v1, "https"

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/rr2;->b()Ll/rr2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/rr2;->e(Ljava/lang/String;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object p0, Ll/qv5;->b:Ll/wyd0;

    .line 21
    .line 22
    const-string v1, "http"

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/rr2;->b()Ll/rr2;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, v0, v1}, Ll/rr2;->e(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

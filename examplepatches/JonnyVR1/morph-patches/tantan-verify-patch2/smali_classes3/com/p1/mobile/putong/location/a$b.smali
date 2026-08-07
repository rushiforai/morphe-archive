.class public Lcom/p1/mobile/putong/location/a$b;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/location/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/location/Location;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "tantanlt"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/location/a$b;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "tantan"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/location/a$b;->b:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p3}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 14
    const-string p1, "tantanlt"

    iput-object p1, p0, Lcom/p1/mobile/putong/location/a$b;->a:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/location/a$b;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/putong/location/Location;)Z
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/location/Location;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmpl-double p0, v0, v2

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    cmpl-double p0, p0, v0

    .line 22
    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/putong/location/Location;)Lcom/p1/mobile/putong/location/Location;
    .locals 2
    .param p2    # Lcom/p1/mobile/putong/location/Location;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/location/a$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/location/Location;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/location/Location;->K(D)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/location/Location;->M(D)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/location/Location;->J(F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/location/Location;->w()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/location/Location;->L(I)V

    .line 36
    .line 37
    .line 38
    return-object p1
.end method

.method public c()Lcom/p1/mobile/putong/location/Location;
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/hxd0;->pref()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/hxd0;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/hxd0;->defaultValue:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/location/Location;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string v1, ","

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/putong/location/a$b;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/location/a;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :catch_0
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    array-length v1, v0

    .line 38
    const/4 v2, 0x3

    .line 39
    if-eq v1, v2, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Ll/hxd0;->defaultValue:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/location/Location;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    const/4 v1, 0x0

    .line 47
    :try_start_1
    aget-object v2, v0, v1

    .line 48
    .line 49
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    const/4 v4, 0x1

    .line 54
    aget-object v4, v0, v4

    .line 55
    .line 56
    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    const/4 v6, 0x2

    .line 61
    aget-object v0, v0, v6

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    new-instance v6, Lcom/p1/mobile/putong/location/Location;

    .line 68
    .line 69
    iget-object v7, p0, Lcom/p1/mobile/putong/location/a$b;->b:Ljava/lang/String;

    .line 70
    .line 71
    invoke-direct {v6, v7}, Lcom/p1/mobile/putong/location/Location;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v6, v2, v3}, Lcom/p1/mobile/putong/location/Location;->K(D)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6, v4, v5}, Lcom/p1/mobile/putong/location/Location;->M(D)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v6, v0}, Lcom/p1/mobile/putong/location/Location;->J(F)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v6, v1}, Lcom/p1/mobile/putong/location/Location;->L(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    .line 88
    .line 89
    return-object v6

    .line 90
    :catchall_0
    move-exception v0

    .line 91
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/hxd0;->defaultValue:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast p0, Lcom/p1/mobile/putong/location/Location;

    .line 97
    .line 98
    return-object p0
.end method

.method public bridge synthetic checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/location/a$b;->a(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/putong/location/Location;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic copyed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/location/a$b;->b(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/putong/location/Location;)Lcom/p1/mobile/putong/location/Location;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/location/Location;)Landroid/content/SharedPreferences$Editor;
    .locals 4

    .line 1
    const-string v0, ","

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/location/a$b;->a:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/location/a;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    goto :goto_0

    .line 46
    :catch_0
    move-exception v1

    .line 47
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    :goto_0
    invoke-virtual {p0}, Ll/hxd0;->pref()Landroid/content/SharedPreferences;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object p0, p0, Ll/hxd0;->id:Ljava/lang/String;

    .line 95
    .line 96
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0
.end method

.method public bridge synthetic retrieveValue()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a$b;->c()Lcom/p1/mobile/putong/location/Location;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic saveValue(Ljava/lang/Object;)Landroid/content/SharedPreferences$Editor;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a$b;->d(Lcom/p1/mobile/putong/location/Location;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

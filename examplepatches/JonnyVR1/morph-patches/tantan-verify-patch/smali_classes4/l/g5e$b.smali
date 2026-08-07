.class public Ll/g5e$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g5e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ll/fpp0;

.field public b:Ll/fpp0;

.field public c:Ll/fpp0;

.field public d:Ll/fpp0;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/fpp0;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/f5e;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/g5e$b;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/g5e$b;->f:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(Ll/f5e;)Ll/g5e$b;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/g5e$b;->f:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public b()Ll/g5e;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g5e$b;->a:Ll/fpp0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/fpp0;->d:Ll/fpp0;

    .line 6
    .line 7
    iput-object v0, p0, Ll/g5e$b;->a:Ll/fpp0;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/g5e$b;->b:Ll/fpp0;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Ll/fpp0;->e:Ll/fpp0;

    .line 14
    .line 15
    iput-object v0, p0, Ll/g5e$b;->b:Ll/fpp0;

    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Ll/g5e$b;->c:Ll/fpp0;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    sget-object v0, Ll/fpp0;->f:Ll/fpp0;

    .line 22
    .line 23
    iput-object v0, p0, Ll/g5e$b;->c:Ll/fpp0;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Ll/g5e$b;->d:Ll/fpp0;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    sget-object v0, Ll/fpp0;->g:Ll/fpp0;

    .line 30
    .line 31
    iput-object v0, p0, Ll/g5e$b;->d:Ll/fpp0;

    .line 32
    .line 33
    :cond_3
    iget-object v0, p0, Ll/g5e$b;->e:Ljava/util/List;

    .line 34
    .line 35
    iget-object v1, p0, Ll/g5e$b;->a:Ll/fpp0;

    .line 36
    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/g5e$b;->e:Ljava/util/List;

    .line 41
    .line 42
    iget-object v1, p0, Ll/g5e$b;->b:Ll/fpp0;

    .line 43
    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/g5e$b;->e:Ljava/util/List;

    .line 48
    .line 49
    iget-object v1, p0, Ll/g5e$b;->c:Ll/fpp0;

    .line 50
    .line 51
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/g5e$b;->e:Ljava/util/List;

    .line 55
    .line 56
    iget-object v1, p0, Ll/g5e$b;->d:Ll/fpp0;

    .line 57
    .line 58
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/g5e$b;->e:Ljava/util/List;

    .line 62
    .line 63
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Ll/g5e;

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-direct {v0, p0, v1}, Ll/g5e;-><init>(Ll/g5e$b;Ll/g5e$a;)V

    .line 70
    .line 71
    .line 72
    return-object v0
.end method

.method public c(JJ)Ll/g5e$b;
    .locals 6

    .line 1
    new-instance v0, Ll/fpp0;

    .line 2
    .line 3
    sget-object v5, Lcom/tantanapp/beatles/file/diskusage/WarningLevel;->URGENT_ALERT:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;

    .line 4
    .line 5
    move-wide v1, p1

    .line 6
    move-wide v3, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/fpp0;-><init>(JJLcom/tantanapp/beatles/file/diskusage/WarningLevel;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/g5e$b;->d:Ll/fpp0;

    .line 11
    .line 12
    return-object p0
.end method

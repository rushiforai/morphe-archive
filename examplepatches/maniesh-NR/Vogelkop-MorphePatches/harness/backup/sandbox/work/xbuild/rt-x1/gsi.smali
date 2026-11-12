.class public final Lgsi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu3l;


# instance fields
.field public final d:Lesi;

.field public final e:Lu4l;

.field public final f:Landroid/content/res/Resources;

.field public final g:I

.field public final h:Ljava/util/LinkedHashMap;


# direct methods
.method public constructor <init>(Lesi;Lu4l;Landroid/content/res/Resources;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgsi;->d:Lesi;

    iput-object p2, p0, Lgsi;->e:Lu4l;

    iput-object p3, p0, Lgsi;->f:Landroid/content/res/Resources;

    iget p1, p2, Lu4l;->a:I

    iput p1, p0, Lgsi;->g:I

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lgsi;->h:Ljava/util/LinkedHashMap;

    return-void
.end method


# virtual methods
.method public final a(Lb2l;)Z
    .registers 6

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    const/4 v0, 0x0

    if-nez p1, :cond_e

    return v0

    :cond_e
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lgsi;->h:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3f

    iget-object v3, p0, Lgsi;->e:Lu4l;

    invoke-virtual {v3, p1}, Lu4l;->a(I)Lm4l;

    move-result-object p1

    invoke-virtual {p1}, Lm4l;->c()Lpxh;

    move-result-object p1

    iget-object v3, p0, Lgsi;->f:Landroid/content/res/Resources;

    invoke-virtual {p1, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lgsi;->d:Lesi;

    invoke-virtual {p0, p1}, Lesi;->a(Ljava/lang/String;)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_38

    const/4 v0, 0x1

    :cond_38
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3f
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lgsi;

    if-eqz v0, :cond_18

    check-cast p1, Lgsi;

    iget v0, p1, Lgsi;->g:I

    iget v1, p0, Lgsi;->g:I

    if-ne v1, v0, :cond_18

    iget-object p0, p0, Lgsi;->d:Lesi;

    iget-object p1, p1, Lgsi;->d:Lesi;

    invoke-virtual {p0, p1}, Lesi;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lgsi;->g:I

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lgsi;->d:Lesi;

    invoke-virtual {p0}, Lesi;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

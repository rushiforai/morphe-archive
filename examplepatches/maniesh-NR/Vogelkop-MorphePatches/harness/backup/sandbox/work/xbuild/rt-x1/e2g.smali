.class public final Le2g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Boolean;

.field public final b:Ljava/lang/Boolean;

.field public final c:Ljava/lang/Boolean;

.field public final d:Ljava/lang/Boolean;

.field public final e:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le2g;->a:Ljava/lang/Boolean;

    iput-object p2, p0, Le2g;->b:Ljava/lang/Boolean;

    iput-object p3, p0, Le2g;->c:Ljava/lang/Boolean;

    iput-object p4, p0, Le2g;->d:Ljava/lang/Boolean;

    iput-object p5, p0, Le2g;->e:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3c

    instance-of v0, p1, Le2g;

    if-eqz v0, :cond_3a

    check-cast p1, Le2g;

    iget-object v0, p0, Le2g;->a:Ljava/lang/Boolean;

    iget-object v1, p1, Le2g;->a:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Le2g;->b:Ljava/lang/Boolean;

    iget-object v1, p1, Le2g;->b:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Le2g;->c:Ljava/lang/Boolean;

    iget-object v1, p1, Le2g;->c:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Le2g;->d:Ljava/lang/Boolean;

    iget-object v1, p1, Le2g;->d:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object p0, p0, Le2g;->e:Ljava/lang/Boolean;

    iget-object p1, p1, Le2g;->e:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    :cond_3a
    const/4 p0, 0x0

    return p0

    :cond_3c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    const/16 v0, 0x4d5

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Le2g;->a:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Le2g;->b:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Le2g;->c:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Le2g;->d:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Le2g;->e:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4cf

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 8

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "PartialRecordSettings(sia="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", privateMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Le2g;->a:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", conversationChips="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", trackUserGeoData="

    const-string v4, ", trackUserResponse="

    iget-object v5, p0, Le2g;->b:Ljava/lang/Boolean;

    iget-object v6, p0, Le2g;->c:Ljava/lang/Boolean;

    invoke-static {v2, v5, v3, v6, v4}, Lcom/appsflyer/internal/j;->e(Ljava/lang/StringBuilder;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    const-string v3, ", initilizeWithSearchChat="

    const-string v4, ", alwaysShowImageSuggestions="

    iget-object v5, p0, Le2g;->d:Ljava/lang/Boolean;

    iget-object p0, p0, Le2g;->e:Ljava/lang/Boolean;

    invoke-static {v2, v5, v3, p0, v4}, Lcom/appsflyer/internal/j;->e(Ljava/lang/StringBuilder;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    const-string p0, ", isShowInputBoxGradientEnabled="

    const-string v3, ", enableOneAIBackend="

    invoke-static {v2, v1, p0, v0, v3}, Lcom/appsflyer/internal/j;->e(Ljava/lang/StringBuilder;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", enableOneAIRenderer="

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

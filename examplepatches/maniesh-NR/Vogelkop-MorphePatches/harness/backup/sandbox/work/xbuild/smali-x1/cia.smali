.class public final Lcia;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldia;


# direct methods
.method public constructor <init>(Ldia;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcia;->a:Ldia;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_14

    instance-of v0, p1, Lcia;

    if-eqz v0, :cond_12

    check-cast p1, Lcia;

    iget-object p0, p0, Lcia;->a:Ldia;

    iget-object p1, p1, Lcia;->a:Ldia;

    invoke-virtual {p0, p1}, Ldia;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lcia;->a:Ldia;

    invoke-virtual {p0}, Ldia;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ActionsV1PauseAudioCommentaryData(error="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcia;->a:Ldia;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

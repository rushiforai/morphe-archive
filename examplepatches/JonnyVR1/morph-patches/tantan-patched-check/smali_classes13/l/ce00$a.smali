.class Ll/ce00$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fbl0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ce00;->M1(Ll/hwl$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ce00;


# direct methods
.method public constructor <init>(Ll/ce00;Ll/hwl$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ce00$a;->a:Ll/ce00;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(JLl/sti0;II)V
    .locals 6

    .line 1
    new-instance v0, Ll/uti0;

    .line 2
    .line 3
    iget-object p4, p0, Ll/ce00$a;->a:Ll/ce00;

    .line 4
    .line 5
    iget-object v1, p4, Ll/fr2;->a:Ll/c410;

    .line 6
    .line 7
    iget-object v2, p4, Ll/fr2;->d:Ll/uow;

    .line 8
    .line 9
    move-wide v4, p1

    .line 10
    move-object v3, p3

    .line 11
    invoke-direct/range {v0 .. v5}, Ll/uti0;-><init>(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;Ll/sti0;J)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ce00$a;->a:Ll/ce00;

    .line 15
    .line 16
    iget-object p1, p1, Ll/ce00;->D:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 17
    .line 18
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p1, p2, v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p0, "----onVideoChannelAddedExt: userID="

    .line 46
    .line 47
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 58
    .line 59
    invoke-virtual {p1, p2, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public b(JI)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/ce00$a;->a:Ll/ce00;

    .line 2
    .line 3
    iget-object p3, p3, Ll/ce00;->D:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 4
    .line 5
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p3, v0}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    check-cast p3, Ll/uti0;

    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p3}, Ll/uti0;->G()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p3, p0, Ll/ce00$a;->a:Ll/ce00;

    .line 21
    .line 22
    iget-object p3, p3, Ll/ce00;->D:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 23
    .line 24
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p3, v0}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, "----onVideoChannelRemoveExt: userID="

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 64
    .line 65
    invoke-virtual {p3, p1, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

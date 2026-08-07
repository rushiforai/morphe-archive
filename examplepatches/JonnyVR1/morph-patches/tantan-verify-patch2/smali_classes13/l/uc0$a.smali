.class Ll/uc0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fbl0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uc0;->M1(Ll/hwl$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/uc0;


# direct methods
.method public constructor <init>(Ll/uc0;Ll/hwl$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/uc0$a;->a:Ll/uc0;

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
    iget-object p4, p0, Ll/uc0$a;->a:Ll/uc0;

    .line 2
    .line 3
    iget-object p4, p4, Ll/uc0;->y:Ll/tc0;

    .line 4
    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    const/4 p5, 0x1

    .line 8
    invoke-virtual {p4, p5}, Ll/tc0;->Y7(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    new-instance v0, Ll/uti0;

    .line 12
    .line 13
    iget-object p4, p0, Ll/uc0$a;->a:Ll/uc0;

    .line 14
    .line 15
    iget-object v1, p4, Ll/fr2;->a:Ll/c410;

    .line 16
    .line 17
    iget-object v2, p4, Ll/fr2;->d:Ll/uow;

    .line 18
    .line 19
    move-wide v4, p1

    .line 20
    move-object v3, p3

    .line 21
    invoke-direct/range {v0 .. v5}, Ll/uti0;-><init>(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;Ll/sti0;J)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/uc0$a;->a:Ll/uc0;

    .line 25
    .line 26
    iget-object p1, p1, Ll/uc0;->E:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 27
    .line 28
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p1, p2, v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, "----onVideoChannelAddedExt: userID="

    .line 56
    .line 57
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 68
    .line 69
    invoke-virtual {p1, p2, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public b(JI)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/uc0$a;->a:Ll/uc0;

    .line 2
    .line 3
    iget-object p3, p3, Ll/uc0;->E:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

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
    iget-object p3, p0, Ll/uc0$a;->a:Ll/uc0;

    .line 21
    .line 22
    iget-object p3, p3, Ll/uc0;->E:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

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
    iget-object p3, p0, Ll/uc0$a;->a:Ll/uc0;

    .line 32
    .line 33
    iget-object p3, p3, Ll/uc0;->E:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 34
    .line 35
    invoke-virtual {p3}, Ljava/util/AbstractMap;->size()I

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    if-nez p3, :cond_1

    .line 40
    .line 41
    iget-object p3, p0, Ll/uc0$a;->a:Ll/uc0;

    .line 42
    .line 43
    iget-object p3, p3, Ll/uc0;->y:Ll/tc0;

    .line 44
    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p3, v0}, Ll/tc0;->Y7(I)V

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p0, "----onVideoChannelRemoveExt: userID="

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 84
    .line 85
    invoke-virtual {p3, p1, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

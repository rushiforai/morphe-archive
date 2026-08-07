.class public final Ll/s3h0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a\u001d\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u00022\u0006\u0010\u0001\u001a\u00020\u0000\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "",
        "anchorId",
        "Lrx/c;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;",
        "c",
        "(Ljava/lang/String;)Lrx/c;",
        "livingroom_intlGmsRelease"
    }
    k = 0x2
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static a(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    .line 6
    .line 7
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    .line 7
    .line 8
    return-object p0
.end method

.method public static final c(Ljava/lang/String;)Lrx/c;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "/live-campaigns/superRichUserBirthday/anchors/"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "/details/superRichUserBirthdayTask"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "getSuperGodPageDetails"

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v0, p0}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v0, Ll/q3h0;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/q3h0;-><init>()V

    .line 60
    .line 61
    .line 62
    new-instance v1, Ll/r3h0;

    .line 63
    .line 64
    invoke-direct {v1, v0}, Ll/r3h0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

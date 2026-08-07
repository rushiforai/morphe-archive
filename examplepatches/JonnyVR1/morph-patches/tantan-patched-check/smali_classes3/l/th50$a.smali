.class public Ll/th50$a;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/th50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/data/OMSData;",
        ">;"
    }
.end annotation


# static fields
.field public static h:Z

.field public static i:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/pkq;

    .line 2
    .line 3
    new-instance v1, Ll/vod;

    .line 4
    .line 5
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v1, p2, p3, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object p2, Lcom/p1/mobile/putong/data/OMSData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    .line 16
    new-instance p3, Ll/mh50;

    .line 17
    .line 18
    invoke-direct {p3}, Ll/mh50;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    invoke-direct {v0, v1, v2, p2, p3}, Ll/pkq;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/JsonAdapter;Ll/pcj;)V

    .line 23
    .line 24
    .line 25
    new-instance p2, Ll/th50$a$a;

    .line 26
    .line 27
    invoke-direct {p2, p1}, Ll/th50$a$a;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string p1, "OMSData"

    .line 31
    .line 32
    invoke-direct {p0, p1, v0, p2}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic B()Lcom/p1/mobile/putong/data/OMSData;
    .locals 1

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->n()Ll/th50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/th50;->y(Ll/th50;)Ll/wyd0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSData;->new_()Lcom/p1/mobile/putong/data/OMSData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0
.end method

.method public static bridge synthetic C()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/th50$a;->i:Z

    return v0
.end method

.method public static bridge synthetic D()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/th50$a;->h:Z

    return v0
.end method

.method public static bridge synthetic E(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/th50$a;->i:Z

    return-void
.end method


# virtual methods
.method public F(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Ll/th50$a;->i:Z

    .line 3
    .line 4
    sput-boolean p1, Ll/th50$a;->h:Z

    .line 5
    .line 6
    invoke-super {p0}, Ll/mof0;->z()Lrx/c;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/FeedBackBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public monitor(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "monitor"
    .end annotation

    .line 1
    return-void
.end method

.method public monitorContent(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "monitorContent"
    .end annotation

    .line 1
    new-instance p0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/Date;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-wide/16 p1, 0x0

    .line 11
    .line 12
    const/4 p3, 0x0

    .line 13
    const-string p4, "feedback"

    .line 14
    .line 15
    invoke-static {p0, p4, p1, p2, p3}, Ll/qu2;->E(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

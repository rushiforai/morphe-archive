.class final Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;
.super Ljava/lang/Object;
.source "RebuildProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Plan"
.end annotation


# instance fields
.field final events:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;",
            ">;"
        }
    .end annotation
.end field

.field final issues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;",
            ">;"
        }
    .end annotation
.end field

.field final json:Ljava/lang/String;

.field final reboundEvents:I


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 75
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0, p1, p2, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 77
    invoke-direct {p0, p1, p2, p3, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;I)V

    return-void
.end method

.method constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;",
            ">;I)V"
        }
    .end annotation

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->events:Ljava/util/List;

    .line 80
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->json:Ljava/lang/String;

    .line 81
    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    .line 82
    iput p4, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->reboundEvents:I

    return-void
.end method


# virtual methods
.method at(J)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;
    .registers 6

    .line 86
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->events:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;

    iget-wide v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    cmp-long v1, p1, v1

    if-ltz v1, :cond_6

    iget-wide v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    cmp-long v1, p1, v1

    if-gez v1, :cond_6

    return-object v0

    :cond_1f
    const/4 p0, 0x0

    return-object p0
.end method

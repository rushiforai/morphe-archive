.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public d:Lcom/p1/mobile/putong/feed/data/Moment;

.field public e:Z

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Ljava/lang/String;

.field public k:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

.field public l:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

.field public m:I

.field public n:I

.field public o:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public p:I

.field public q:Ljava/lang/String;

.field public r:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public s:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

.field public t:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

.field public u:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

.field public v:Lcom/p1/mobile/putong/feed/data/SingleTopic;

.field public w:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public x:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation
.end field

.field public y:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public z:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 69
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 71
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 72
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 73
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 74
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 75
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 76
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 77
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 60
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 61
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 62
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 63
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 64
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 65
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 66
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;III)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 9
    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 20
    .line 21
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 22
    .line 23
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 26
    .line 27
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 28
    .line 29
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p2, p3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    const/4 p3, 0x1

    .line 36
    invoke-static {p2, p3}, Ll/f7i;->l(Lcom/p1/mobile/putong/data/User;Z)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 41
    .line 42
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p2, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1, p3}, Ll/f7i;->k(Lcom/p1/mobile/putong/data/User;Z)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 55
    .line 56
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V
    .locals 0

    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;III)V

    .line 79
    iput p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V
    .locals 2

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 205
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 207
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 208
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 209
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 210
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 211
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 212
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 213
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 214
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 215
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->l:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentViewerBox;)V
    .locals 2

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 180
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 181
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 182
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 183
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 184
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 185
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 186
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 187
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 188
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 189
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 190
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->u:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/NearbyOnline;)V
    .locals 2

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 156
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 157
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 158
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 159
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 160
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 161
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 162
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 163
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 164
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 165
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 166
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->s:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;)V
    .locals 2

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 168
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 169
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 170
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 171
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 172
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 173
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 174
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 175
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 176
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 177
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 178
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->t:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/SingleTopic;)V
    .locals 2

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 143
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 144
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 145
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 146
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 147
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 148
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 149
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 150
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 151
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 153
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->v:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 154
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->w:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;)V
    .locals 2

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 94
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 96
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 97
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 98
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 99
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 100
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 101
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 102
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 104
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V
    .locals 2

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 81
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 83
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 84
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 85
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 86
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 87
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 88
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 89
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 91
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->j:Ljava/lang/String;

    const/4 p1, 0x1

    .line 92
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->i:Z

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILl/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/lang/String;",
            "I",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)V"
        }
    .end annotation

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v0, 0x0

    .line 193
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 194
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 195
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 196
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 197
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 198
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    const/4 v0, -0x1

    .line 199
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 201
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 202
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->q:Ljava/lang/String;

    .line 203
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 119
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 121
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 122
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 123
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 124
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 125
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 126
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 127
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 128
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 129
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->r:Ll/pf60;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;I)V"
        }
    .end annotation

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v0, 0x0

    .line 132
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 134
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 135
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 136
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 137
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    const/4 v0, -0x1

    .line 138
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 140
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 141
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 106
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v0, 0x0

    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v0, 0x0

    .line 108
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 109
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 110
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 111
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 112
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 113
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 115
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->o:Ll/pf60;

    .line 116
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->q:Ljava/lang/String;

    .line 117
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    return-void
.end method

.method public constructor <init>(Ll/pf60;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")V"
        }
    .end annotation

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 217
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    const/4 v1, 0x0

    .line 218
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v1, 0x0

    .line 219
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e:Z

    .line 220
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f:I

    .line 221
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g:I

    .line 222
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 223
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 224
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 225
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    .line 226
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 227
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->z:Ll/pf60;

    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->o:Ll/pf60;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleBanner:Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->l:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->k()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->l()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->u:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->s:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->r:Ll/pf60;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public k()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 6
    .line 7
    const-string v0, "seeAd"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->mFeedSeeMoreFollowingMomentInfo:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->z:Ll/pf60;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->v:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->t:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

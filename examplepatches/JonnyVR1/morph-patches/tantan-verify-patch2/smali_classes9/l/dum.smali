.class public Ll/dum;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Ll/njt;

.field public c:Landroid/view/ViewGroup;

.field public final d:Z

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

.field public g:Ll/ner;

.field public h:Ll/oo2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field

.field public i:Ll/u3z;

.field public j:Ll/x6t;

.field public k:Ll/t8s;

.field public l:Lcom/tantan/live/eventbus/LiveEventBus;

.field public m:Ll/w3o0;

.field public n:Ll/e9m0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/e9m0<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/oo2;Ll/ner;ZLcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;",
            "TD;",
            "Ll/ner;",
            "Z",
            "Lcom/tantan/live/eventbus/LiveEventBus;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dum;->f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/dum;->h:Ll/oo2;

    .line 13
    .line 14
    iput-object p3, p0, Ll/dum;->g:Ll/ner;

    .line 15
    .line 16
    iput-boolean p4, p0, Ll/dum;->d:Z

    .line 17
    .line 18
    new-instance p1, Ll/u3z;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/u3z;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/dum;->i:Ll/u3z;

    .line 24
    .line 25
    new-instance p1, Ll/x6t;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Ll/x6t;-><init>(Ll/dum;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/dum;->j:Ll/x6t;

    .line 31
    .line 32
    new-instance p1, Ll/t8s;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/t8s;-><init>(Ll/dum;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/dum;->k:Ll/t8s;

    .line 38
    .line 39
    iput-object p5, p0, Ll/dum;->l:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 40
    .line 41
    new-instance p1, Ll/w3o0;

    .line 42
    .line 43
    invoke-direct {p1, p0}, Ll/w3o0;-><init>(Ll/dum;)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/dum;->m:Ll/w3o0;

    .line 47
    .line 48
    new-instance p1, Ll/e9m0;

    .line 49
    .line 50
    invoke-direct {p1, p0}, Ll/e9m0;-><init>(Ll/dum;)V

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Ll/dum;->n:Ll/e9m0;

    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public a(Ll/njt;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dum;->b:Ll/njt;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dum;->c:Landroid/view/ViewGroup;

    .line 4
    .line 5
    instance-of p2, p1, Ll/b4o0;

    .line 6
    .line 7
    if-nez p2, :cond_2

    .line 8
    .line 9
    instance-of p2, p1, Ll/tqo0;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    instance-of p1, p1, Ll/ojp0;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/dum;->n:Ll/e9m0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/e9m0;->init()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p0, p0, Ll/dum;->j:Ll/x6t;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/x6t;->init()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/dum;->m:Ll/w3o0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/w3o0;->init()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

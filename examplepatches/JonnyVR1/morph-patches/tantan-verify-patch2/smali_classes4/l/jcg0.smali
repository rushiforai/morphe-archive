.class public final Ll/jcg0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jcg0$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final a:Ljava/lang/String;

.field final b:Ll/ab50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ab50<",
            "TE;>;"
        }
    .end annotation
.end field

.field final c:Ll/v3f$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v3f$b<",
            "TE;*>;"
        }
    .end annotation
.end field

.field final d:Lcom/tantan/eventbus/ThreadMode;

.field final e:I

.field final f:Z

.field private g:Ll/jcg0$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/jcg0$b<",
            "TE;>;"
        }
    .end annotation
.end field

.field volatile h:Z


# direct methods
.method public constructor <init>(Ll/v3f$b;Ljava/lang/String;Ll/ncg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v3f$b<",
            "TE;*>;",
            "Ljava/lang/String;",
            "Ll/ncg0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/jcg0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iget-object p2, p3, Ll/ncg0;->a:Lcom/tantan/eventbus/ThreadMode;

    .line 7
    .line 8
    iput-object p2, p0, Ll/jcg0;->d:Lcom/tantan/eventbus/ThreadMode;

    .line 9
    .line 10
    iget p2, p3, Ll/ncg0;->b:I

    .line 11
    .line 12
    iput p2, p0, Ll/jcg0;->e:I

    .line 13
    .line 14
    iget-boolean p2, p3, Ll/ncg0;->c:Z

    .line 15
    .line 16
    iput-boolean p2, p0, Ll/jcg0;->f:Z

    .line 17
    .line 18
    new-instance p2, Ll/jcg0$a;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/jcg0$a;-><init>(Ll/jcg0;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/jcg0;->b:Ll/ab50;

    .line 24
    .line 25
    iput-object p1, p0, Ll/jcg0;->c:Ll/v3f$b;

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Ll/jcg0;->h:Z

    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic a(Ll/jcg0;)Ll/jcg0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jcg0;->g:Ll/jcg0$b;

    return-object p0
.end method


# virtual methods
.method public b(Ll/jcg0$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jcg0$b<",
            "TE;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jcg0;->g:Ll/jcg0$b;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jcg0;->c:Ll/v3f$b;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/v3f$b;->o(Ll/jcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

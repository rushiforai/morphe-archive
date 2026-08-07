.class public Lcom/p1/mobile/android/app/Frag$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Frag;->duringCreated(Ll/pcj;Z)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:Ll/kcg0;

.field public b:Ll/kcg0;

.field public c:Z

.field public d:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Z

.field public final synthetic g:Ll/pcj;

.field public final synthetic h:Z

.field public final synthetic i:Lcom/p1/mobile/android/app/Frag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag;Ll/pcj;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Frag$b;->i:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/app/Frag$b;->g:Ll/pcj;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/android/app/Frag$b;->h:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/android/app/Frag$b;->d:Ljava/lang/Object;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/Frag$b;->e:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Frag$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag$b;->c()V

    return-void
.end method


# virtual methods
.method public b(Ll/gcg0;)V
    .locals 2

    .line 1
    instance-of v0, p1, Ll/nwd0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/nwd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/nwd0;->h()Ll/gcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b;->i:Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Lcom/p1/mobile/android/app/Frag$b$a;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/android/app/Frag$b$a;-><init>(Lcom/p1/mobile/android/app/Frag$b;Ll/gcg0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag$b;->b:Ll/kcg0;

    .line 27
    .line 28
    new-instance v0, Ll/q4j;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/q4j;-><init>(Lcom/p1/mobile/android/app/Frag$b;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b;->a:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b;->a:Ll/kcg0;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b;->b:Ll/kcg0;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b;->b:Ll/kcg0;

    .line 27
    .line 28
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag$b;->b(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

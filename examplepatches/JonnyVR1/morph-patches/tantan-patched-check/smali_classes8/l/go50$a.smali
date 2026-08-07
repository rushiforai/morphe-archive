.class public final Ll/go50$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/go50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/go50$a$b;,
        Ll/go50$a$a;
    }
.end annotation


# instance fields
.field public final a:Ll/ft5;

.field public final b:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public final c:Ljava/lang/Object;

.field public d:Z

.field public e:I

.field public final f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "TT",
            "Left;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:I

.field public final i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "TTRight;>;"
        }
    .end annotation
.end field

.field public final synthetic j:Ll/go50;


# direct methods
.method public constructor <init>(Ll/go50;Ll/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/go50$a;->j:Ll/go50;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/lang/Object;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/go50$a;->c:Ljava/lang/Object;

    .line 12
    .line 13
    iput-object p2, p0, Ll/go50$a;->b:Ll/gcg0;

    .line 14
    .line 15
    new-instance p1, Ll/ft5;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/go50$a;->a:Ll/ft5;

    .line 21
    .line 22
    new-instance p1, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/go50$a;->f:Ljava/util/Map;

    .line 28
    .line 29
    new-instance p1, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/go50$a;->i:Ljava/util/Map;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/go50$a;->b:Ll/gcg0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/go50$a;->a:Ll/ft5;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/go50$a$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/go50$a$a;-><init>(Ll/go50$a;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/go50$a$b;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/go50$a$b;-><init>(Ll/go50$a;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/go50$a;->a:Ll/ft5;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Ll/go50$a;->a:Ll/ft5;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ll/go50$a;->j:Ll/go50;

    .line 29
    .line 30
    iget-object v2, v2, Ll/go50;->a:Lrx/c;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/go50$a;->j:Ll/go50;

    .line 36
    .line 37
    iget-object p0, p0, Ll/go50;->b:Lrx/c;

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

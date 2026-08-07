.class public final Ll/yn50$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/yn50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/vk90;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field public final b:Ll/yn50$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yn50$d<",
            "TT;TR;>;"
        }
    .end annotation
.end field

.field public c:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ll/yn50$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;",
            "Ll/yn50$d<",
            "TT;TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yn50$b;->a:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yn50$b;->b:Ll/yn50$d;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/yn50$b;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long p1, p1, v0

    .line 8
    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/yn50$b;->c:Z

    .line 13
    .line 14
    iget-object p1, p0, Ll/yn50$b;->b:Ll/yn50$d;

    .line 15
    .line 16
    iget-object p0, p0, Ll/yn50$b;->a:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/yn50$d;->k(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    const-wide/16 v0, 0x1

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Ll/yn50$d;->i(J)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

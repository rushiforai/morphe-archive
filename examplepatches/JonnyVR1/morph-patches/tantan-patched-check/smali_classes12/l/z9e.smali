.class public Ll/z9e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ll/ioh0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ioh0;

    .line 5
    .line 6
    const-string v1, "SDKResource"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ioh0;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/z9e;->a:Ll/ioh0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/ioh0$b;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z9e;->a:Ll/ioh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/ioh0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/ioh0$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p1, p0, Ll/ioh0$b;->a:Z

    .line 8
    .line 9
    iget-object p2, p0, Ll/ioh0$b;->c:Ljava/lang/String;

    .line 10
    .line 11
    const-string p3, "Event_Resource_Down"

    .line 12
    .line 13
    invoke-static {p3, p1, p2}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public b(Ll/ioh0$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z9e;->a:Ll/ioh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ioh0;->e(Ll/ioh0$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

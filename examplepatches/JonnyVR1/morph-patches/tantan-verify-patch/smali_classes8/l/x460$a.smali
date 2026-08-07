.class public Ll/x460$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y460$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x460;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/c;Ll/f2e0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y460$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(JLjava/util/concurrent/TimeUnit;)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/x460$a;->a:J

    .line 2
    .line 3
    iput-object p3, p0, Ll/x460$a;->b:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/y460$c;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Long;

    .line 4
    .line 5
    check-cast p3, Ll/f2e0$a;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ll/x460$a;->b(Ll/y460$c;Ljava/lang/Long;Ll/f2e0$a;)Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public b(Ll/y460$c;Ljava/lang/Long;Ll/f2e0$a;)Ll/kcg0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y460$c<",
            "TT;>;",
            "Ljava/lang/Long;",
            "Ll/f2e0$a;",
            ")",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x460$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/x460$a$a;-><init>(Ll/x460$a;Ll/y460$c;Ljava/lang/Long;)V

    .line 4
    .line 5
    .line 6
    iget-wide p1, p0, Ll/x460$a;->a:J

    .line 7
    .line 8
    iget-object p0, p0, Ll/x460$a;->b:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-virtual {p3, v0, p1, p2, p0}, Ll/f2e0$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

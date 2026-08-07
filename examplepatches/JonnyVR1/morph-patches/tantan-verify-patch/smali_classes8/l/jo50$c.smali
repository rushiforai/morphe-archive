.class public Ll/jo50$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jo50;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Lrx/Notification<",
        "*>;",
        "Lrx/Notification<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/jo50;


# direct methods
.method public constructor <init>(Ll/jo50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jo50$c;->a:Ll/jo50;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Lrx/Notification<",
            "*>;>;)",
            "Ll/gcg0<",
            "-",
            "Lrx/Notification<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/jo50$c$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p1}, Ll/jo50$c$a;-><init>(Ll/jo50$c;Ll/gcg0;Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jo50$c;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

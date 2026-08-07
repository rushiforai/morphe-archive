.class public Ll/ao50$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ao50;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/ao50;


# direct methods
.method public constructor <init>(Ll/ao50;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ao50$a;->b:Ll/ao50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ao50$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ao50$a;->a:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ao50$a;->b:Ll/ao50;

    .line 10
    .line 11
    iget-object v0, v0, Ll/ao50;->a:Lrx/c;

    .line 12
    .line 13
    iget-object p0, p0, Ll/ao50$a;->a:Ll/gcg0;

    .line 14
    .line 15
    invoke-static {p0}, Ll/icg0;->c(Ll/gcg0;)Ll/gcg0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

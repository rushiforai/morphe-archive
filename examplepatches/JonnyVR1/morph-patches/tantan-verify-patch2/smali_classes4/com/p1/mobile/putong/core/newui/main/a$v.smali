.class public Lcom/p1/mobile/putong/core/newui/main/a$v;
.super Ll/k930$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/main/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "v"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k930$b<",
        "Lcom/p1/mobile/putong/core/newui/main/a;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k930$b;-><init>(Ll/k930;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k930$b;->a:Ll/k930;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->X5(Lcom/p1/mobile/putong/core/newui/main/a;)Ll/iam;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->t0(ZLjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

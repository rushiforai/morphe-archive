.class public Ll/b1w$a;
.super Ll/b1w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b1w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/b1w;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/b1w$a;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b1w;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/a;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginstrategy/a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/b1w;->a:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, Ll/c2n;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/c2n;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.class public final Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/preview/act/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:I

.field public d:Ll/kxh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/kxh<",
            "Ll/ixh;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/jxh;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41000000    # 8.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->c:I

    .line 11
    .line 12
    return-void
.end method

.method public static a()Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Lcom/p1/mobile/putong/feed/newui/preview/act/a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->c:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->u(I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->e:Ll/jxh;

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b(Lcom/p1/mobile/putong/feed/newui/preview/act/a;Ll/jxh;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->d:Ll/kxh;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->a:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->j:Ljava/lang/String;

    .line 25
    .line 26
    return-object v0
.end method

.method public c(Ll/kxh;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kxh<",
            "Ll/ixh;",
            ">;)",
            "Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->d:Ll/kxh;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/jxh;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->e:Ll/jxh;

    .line 2
    .line 3
    return-object p0
.end method

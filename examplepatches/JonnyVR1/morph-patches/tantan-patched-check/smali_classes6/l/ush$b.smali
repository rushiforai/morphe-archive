.class public Ll/ush$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ush;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:I

.field public c:Ll/l4g0;

.field public d:Ljava/lang/String;

.field public e:Ll/uul;

.field public f:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ush$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput p2, p0, Ll/ush$b;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ll/ush;
    .locals 3

    .line 1
    new-instance v0, Ll/ush;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ush$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/ush;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/ush$b;->b:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/ush;->M(I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/ush$b;->d:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p0, Ll/ush$b;->c:Ll/l4g0;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/ush;->K(Ljava/lang/String;Ll/l4g0;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/ush$b;->f:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/ush;->L(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/ush$b;->e:Ll/uul;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/ush;->J(Ll/uul;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/ush$b;->i:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/ush;->I(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/ush$b;->g:Ll/y20;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/ush;->H(Ll/y20;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/ush$b;->h:Ll/y20;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ll/ush;->G(Ll/y20;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public b(Ll/uul;)Ll/ush$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ush$b;->e:Ll/uul;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;Ll/l4g0;)Ll/ush$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ush$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ush$b;->c:Ll/l4g0;

    .line 4
    .line 5
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)Ll/ush$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ush$b;->f:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    return-object p0
.end method

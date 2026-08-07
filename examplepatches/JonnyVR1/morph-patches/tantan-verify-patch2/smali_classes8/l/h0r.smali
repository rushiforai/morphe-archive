.class public Ll/h0r;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:I

.field public d:Ll/btx;

.field public e:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

.field public f:Ljava/lang/String;

.field public g:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(IILcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/h0r;->a:Z

    .line 6
    .line 7
    iput p1, p0, Ll/h0r;->c:I

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/h0r;->b:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p3, p0, Ll/h0r;->e:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Ll/h0r;->a:Z

    .line 22
    iput p1, p0, Ll/h0r;->c:I

    .line 23
    iput-object p2, p0, Ll/h0r;->b:Ljava/lang/String;

    .line 24
    iput-object p3, p0, Ll/h0r;->e:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h0r;->e:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/btx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h0r;->d:Ll/btx;

    .line 2
    .line 3
    return-void
.end method

.method public c(Z)Ll/h0r;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/h0r;->a:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/h0r;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h0r;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lrx/c;)Ll/h0r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/h0r;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/h0r;->g:Lrx/c;

    .line 2
    .line 3
    return-object p0
.end method

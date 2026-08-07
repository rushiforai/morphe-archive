.class public Ll/dgw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z6m;


# static fields
.field public static final b:Ll/z6m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/dgw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dgw;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/dgw;->b:Ll/z6m;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d()Ll/z6m;
    .locals 1

    .line 1
    sget-object v0, Ll/dgw;->b:Ll/z6m;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    invoke-static {p0}, Ll/ue6;->s0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p1, Ll/c9c0;->I:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {}, Ll/gra;->z()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string p0, "#FF700A"

    .line 20
    .line 21
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    :cond_0
    const-string p1, "\u89e3\u9501\u65b0\u914d\u5bf9"

    .line 26
    .line 27
    invoke-static {p1, p0}, Ll/c17;->s0(Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

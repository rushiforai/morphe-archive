.class public Ll/jfw;
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
    new-instance v0, Ll/jfw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jfw;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jfw;->b:Ll/z6m;

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
    sget-object v0, Ll/jfw;->b:Ll/z6m;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->previewText:Ljava/lang/String;

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget p2, Ll/c9c0;->i0:I

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {p0, p1}, Ll/c17;->s0(Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

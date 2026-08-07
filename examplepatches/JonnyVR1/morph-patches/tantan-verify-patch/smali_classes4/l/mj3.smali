.class public Ll/mj3;
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
    new-instance v0, Ll/mj3;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mj3;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/mj3;->b:Ll/z6m;

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
    sget-object v0, Ll/mj3;->b:Ll/z6m;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isBusinessAI1V1(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
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
    const-string p1, "AI\u4f34\u4fa3"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/c17;->s0(Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

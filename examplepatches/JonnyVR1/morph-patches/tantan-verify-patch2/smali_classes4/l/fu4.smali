.class public Ll/fu4;
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
    new-instance v0, Ll/fu4;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fu4;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fu4;->b:Ll/z6m;

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
    sget-object v0, Ll/fu4;->b:Ll/z6m;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/tcu;->d()Ll/z6m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Ll/z6m;->a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 p2, 0x0

    .line 10
    if-nez p0, :cond_2

    .line 11
    .line 12
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/eu4;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    return p2

    .line 25
    :cond_0
    iget-object p0, p1, Ll/sj6;->k:Ll/n100;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "e_answer_question_tip"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_1

    .line 50
    .line 51
    iget-object p0, p1, Ll/sj6;->k:Ll/n100;

    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Ll/n100;->b(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const-string p0, "p_messages_view"

    .line 73
    .line 74
    new-array p1, p2, [Ll/sfj0$a;

    .line 75
    .line 76
    invoke-static {v1, p0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    const/4 p0, 0x1

    .line 80
    return p0

    .line 81
    :cond_2
    return p2
.end method

.method public b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    sget p0, Ll/z6m;->a:I

    .line 2
    .line 3
    const-string p1, "\u56de\u7b54\u4e86\u4f60\u7684\u95ee\u9898"

    .line 4
    .line 5
    invoke-static {p1, p0}, Ll/c17;->s0(Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

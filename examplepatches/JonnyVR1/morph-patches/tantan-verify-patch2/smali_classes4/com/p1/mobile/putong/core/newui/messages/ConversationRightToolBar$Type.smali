.class final enum Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

.field public static final enum allMatch:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

.field public static final enum filter:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

.field public static final enum loveLetter:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

.field public static final enum search:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;


# instance fields
.field public final createFun:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->loveLetter:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->filter:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->allMatch:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->search:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 2
    .line 3
    new-instance v1, Ll/lk6;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/lk6;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "loveLetter"

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;-><init>(Ljava/lang/String;ILl/pcj;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->loveLetter:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 15
    .line 16
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 17
    .line 18
    new-instance v1, Ll/mk6;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/mk6;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "filter"

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;-><init>(Ljava/lang/String;ILl/pcj;)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->filter:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 32
    .line 33
    new-instance v1, Ll/nk6;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/nk6;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v2, "allMatch"

    .line 39
    .line 40
    const/4 v3, 0x2

    .line 41
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;-><init>(Ljava/lang/String;ILl/pcj;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->allMatch:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 45
    .line 46
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 47
    .line 48
    new-instance v1, Ll/ok6;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/ok6;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v2, "search"

    .line 54
    .line 55
    const/4 v3, 0x3

    .line 56
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;-><init>(Ljava/lang/String;ILl/pcj;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->search:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->$values()[Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->$VALUES:[Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 66
    .line 67
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILl/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->createFun:Ll/pcj;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->$VALUES:[Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar$Type;

    .line 8
    .line 9
    return-object v0
.end method

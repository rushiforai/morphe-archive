.class Lcom/ss/bytertc/base/utils/ContextManager$SingletonHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/utils/ContextManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SingletonHelper"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/ss/bytertc/base/utils/ContextManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/utils/ContextManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/bytertc/base/utils/ContextManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/ss/bytertc/base/utils/ContextManager$SingletonHelper;->INSTANCE:Lcom/ss/bytertc/base/utils/ContextManager;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000()Lcom/ss/bytertc/base/utils/ContextManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/base/utils/ContextManager$SingletonHelper;->INSTANCE:Lcom/ss/bytertc/base/utils/ContextManager;

    .line 2
    .line 3
    return-object v0
.end method

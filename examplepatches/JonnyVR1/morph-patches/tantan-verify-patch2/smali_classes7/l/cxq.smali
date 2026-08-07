.class public Ll/cxq;
.super Ljava/lang/Object;

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# static fields
.field public static final INSTANCE:Ll/cxq;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/cxq;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cxq;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cxq;->INSTANCE:Ll/cxq;

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


# virtual methods
.method public invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {}, Lkotlin/reflect/jvm/internal/KClassImpl$Data;->q()Ljava/lang/reflect/Type;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

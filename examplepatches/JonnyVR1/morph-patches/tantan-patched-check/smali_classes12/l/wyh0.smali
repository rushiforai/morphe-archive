.class public final Ll/wyh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\"\u0010\u000f\u001a\u00020\t8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0007\u0010\n\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000e\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/wyh0;",
        "",
        "<init>",
        "()V",
        "Lcom/hellogroup/mk/business/widget/MKTabLayout;",
        "layout",
        "",
        "a",
        "(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V",
        "Lcom/hellogroup/mk/business/widget/MKTabLayout$b;",
        "Lcom/hellogroup/mk/business/widget/MKTabLayout$b;",
        "getSNoIndicator",
        "()Lcom/hellogroup/mk/business/widget/MKTabLayout$b;",
        "setSNoIndicator",
        "(Lcom/hellogroup/mk/business/widget/MKTabLayout$b;)V",
        "sNoIndicator",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Ll/wyh0;

.field private static a:Lcom/hellogroup/mk/business/widget/MKTabLayout$b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/wyh0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wyh0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/wyh0;->INSTANCE:Ll/wyh0;

    .line 7
    .line 8
    sget-object v0, Ll/wyh0$a;->INSTANCE:Ll/wyh0$a;

    .line 9
    .line 10
    sput-object v0, Ll/wyh0;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout$b;

    .line 11
    .line 12
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

.method public static final a(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V
    .locals 1
    .param p0    # Lcom/hellogroup/mk/business/widget/MKTabLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/wyh0;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout$b;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->setSelectedTabSlidingIndicator(Lcom/hellogroup/mk/business/widget/MKTabLayout$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

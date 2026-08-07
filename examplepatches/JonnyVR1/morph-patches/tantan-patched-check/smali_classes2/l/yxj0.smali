.class public Ll/yxj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/re00;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/yxj0$a;,
        Ll/yxj0$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/re00<",
        "TModel;TModel;>;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Ll/yxj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yxj0<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/yxj0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yxj0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/yxj0;->INSTANCE:Ll/yxj0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()Ll/yxj0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/yxj0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/yxj0;->INSTANCE:Ll/yxj0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/Object;IILl/u560;)Ll/re00$a;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;II",
            "Ll/u560;",
            ")",
            "Ll/re00$a<",
            "TModel;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/re00$a;

    .line 2
    .line 3
    new-instance p2, Ll/d950;

    .line 4
    .line 5
    invoke-direct {p2, p1}, Ll/d950;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p3, Ll/yxj0$b;

    .line 9
    .line 10
    invoke-direct {p3, p1}, Ll/yxj0$b;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, p2, p3}, Ll/re00$a;-><init>(Ll/kzq;Ll/t5c;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public b(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

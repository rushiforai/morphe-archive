.class public Ll/yxj0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/se00;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/yxj0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/se00<",
        "TModel;TModel;>;"
    }
.end annotation


# static fields
.field private static final a:Ll/yxj0$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yxj0$a<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/yxj0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yxj0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/yxj0$a;->a:Ll/yxj0$a;

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

.method public static a()Ll/yxj0$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/yxj0$a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/yxj0$a;->a:Ll/yxj0$a;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public b(Ll/qs10;)Ll/re00;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qs10;",
            ")",
            "Ll/re00<",
            "TModel;TModel;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/yxj0;->c()Ll/yxj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.class public Ll/b5d0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/ColorDrawable;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Ll/xgw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/xgw<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/UserInfoRenderData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/b5d0;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/b5d0;->b:Ljava/util/HashMap;

    .line 14
    .line 15
    new-instance v0, Ll/xgw;

    .line 16
    .line 17
    const/16 v1, 0x32

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ll/xgw;-><init>(I)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Ll/b5d0;->c:Ll/xgw;

    .line 23
    .line 24
    return-void
.end method

.method public static a()V
    .locals 1

    .line 1
    sget-object v0, Ll/b5d0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/b5d0;->b:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/b5d0;->c:Ll/xgw;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/xgw;->c()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

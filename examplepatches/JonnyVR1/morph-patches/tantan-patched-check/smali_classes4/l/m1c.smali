.class public Ll/m1c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/m1c$b;
    }
.end annotation


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/f6m;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/m1c;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/m1c;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/m1c$a;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ll/m1c;-><init>()V

    return-void
.end method

.method public static b()Ll/m1c;
    .locals 1

    .line 1
    invoke-static {}, Ll/m1c$b;->a()Ll/m1c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a(Ll/f6m;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/xni0;->a()Ll/yni0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/m1c$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/m1c$a;-><init>(Ll/m1c;Ll/f6m;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

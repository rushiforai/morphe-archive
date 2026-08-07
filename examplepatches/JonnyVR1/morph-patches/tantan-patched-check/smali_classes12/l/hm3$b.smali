.class final Ll/hm3$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hm3;->p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Ll/hm3;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ll/hm3;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hm3$b;->a:Ll/hm3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hm3$b;->b:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hm3$b;->a:Ll/hm3;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hm3$b;->b:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/hm3;->z(Ll/hm3;Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

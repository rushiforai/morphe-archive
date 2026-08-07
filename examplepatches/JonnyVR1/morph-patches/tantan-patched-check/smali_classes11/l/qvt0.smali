.class public final synthetic Ll/qvt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rvt0;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/rvt0;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qvt0;->a:Ll/rvt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qvt0;->b:Lorg/json/JSONObject;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qvt0;->a:Ll/rvt0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qvt0;->b:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/rvt0;->k(Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

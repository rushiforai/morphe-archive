.class public final synthetic Ll/o5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/x5f;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:I

.field public final synthetic d:Landroid/content/Context;

.field public final synthetic e:Ll/usi;


# direct methods
.method public synthetic constructor <init>(Ll/x5f;Lorg/json/JSONObject;ILandroid/content/Context;Ll/usi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o5f;->a:Ll/x5f;

    iput-object p2, p0, Ll/o5f;->b:Lorg/json/JSONObject;

    iput p3, p0, Ll/o5f;->c:I

    iput-object p4, p0, Ll/o5f;->d:Landroid/content/Context;

    iput-object p5, p0, Ll/o5f;->e:Ll/usi;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o5f;->a:Ll/x5f;

    iget-object v1, p0, Ll/o5f;->b:Lorg/json/JSONObject;

    iget v2, p0, Ll/o5f;->c:I

    iget-object v3, p0, Ll/o5f;->d:Landroid/content/Context;

    iget-object p0, p0, Ll/o5f;->e:Ll/usi;

    invoke-static {v0, v1, v2, v3, p0}, Ll/x5f;->i(Ll/x5f;Lorg/json/JSONObject;ILandroid/content/Context;Ll/usi;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

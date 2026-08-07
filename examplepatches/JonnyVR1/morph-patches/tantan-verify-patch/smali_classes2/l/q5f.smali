.class public final synthetic Ll/q5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x5f;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lorg/json/JSONObject;

.field public final synthetic d:I

.field public final synthetic e:Ll/usi;


# direct methods
.method public synthetic constructor <init>(Ll/x5f;Landroid/content/Context;Lorg/json/JSONObject;ILl/usi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q5f;->a:Ll/x5f;

    iput-object p2, p0, Ll/q5f;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/q5f;->c:Lorg/json/JSONObject;

    iput p4, p0, Ll/q5f;->d:I

    iput-object p5, p0, Ll/q5f;->e:Ll/usi;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/q5f;->a:Ll/x5f;

    iget-object v1, p0, Ll/q5f;->b:Landroid/content/Context;

    iget-object v2, p0, Ll/q5f;->c:Lorg/json/JSONObject;

    iget v3, p0, Ll/q5f;->d:I

    iget-object p0, p0, Ll/q5f;->e:Ll/usi;

    invoke-static {v0, v1, v2, v3, p0}, Ll/x5f;->q(Ll/x5f;Landroid/content/Context;Lorg/json/JSONObject;ILl/usi;)V

    return-void
.end method

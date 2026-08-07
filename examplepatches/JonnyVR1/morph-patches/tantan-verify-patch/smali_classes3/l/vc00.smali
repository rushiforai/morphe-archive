.class public final synthetic Ll/vc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wc00;

.field public final synthetic b:Ll/ve20;

.field public final synthetic c:Ll/lf2;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/wc00;Ll/ve20;Ll/lf2;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vc00;->a:Ll/wc00;

    iput-object p2, p0, Ll/vc00;->b:Ll/ve20;

    iput-object p3, p0, Ll/vc00;->c:Ll/lf2;

    iput-object p4, p0, Ll/vc00;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/vc00;->e:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vc00;->a:Ll/wc00;

    iget-object v1, p0, Ll/vc00;->b:Ll/ve20;

    iget-object v2, p0, Ll/vc00;->c:Ll/lf2;

    iget-object v3, p0, Ll/vc00;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/vc00;->e:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, v3, p0}, Ll/wc00;->q(Ll/wc00;Ll/ve20;Ll/lf2;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

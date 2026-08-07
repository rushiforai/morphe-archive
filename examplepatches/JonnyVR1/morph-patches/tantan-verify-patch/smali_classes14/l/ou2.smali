.class public final synthetic Ll/ou2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ou2;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/ou2;->b:Lorg/json/JSONObject;

    iput-wide p3, p0, Ll/ou2;->c:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ou2;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/ou2;->b:Lorg/json/JSONObject;

    iget-wide v2, p0, Ll/ou2;->c:J

    invoke-static {v0, v1, v2, v3}, Ll/qu2;->c(Ljava/lang/String;Lorg/json/JSONObject;J)V

    return-void
.end method

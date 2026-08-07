.class public final Ll/p8v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lorg/json/JSONObject;

.field public final b:Ll/s4t0;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;Ll/s4t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p8v0;->a:Lorg/json/JSONObject;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p8v0;->b:Ll/s4t0;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/p8v0;)Ll/s4t0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p8v0;->b:Ll/s4t0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/p8v0;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p8v0;->a:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

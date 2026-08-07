.class public final Ll/fku0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lorg/json/JSONObject;

.field public final b:Ll/qru0;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;Ll/qru0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fku0;->a:Lorg/json/JSONObject;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fku0;->b:Ll/qru0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/qru0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fku0;->b:Ll/qru0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fku0;->a:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

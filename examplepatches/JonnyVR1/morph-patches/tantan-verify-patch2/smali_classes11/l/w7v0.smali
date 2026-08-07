.class public final synthetic Ll/w7v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# instance fields
.field public final synthetic a:Ll/g8v0;


# direct methods
.method public synthetic constructor <init>(Ll/g8v0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w7v0;->a:Ll/g8v0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/w7v0;->a:Ll/g8v0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/g8v0;->c:Ljava/util/Map;

    .line 4
    .line 5
    check-cast p1, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-static {v0, p1}, Ll/r8v0;->a(Ljava/util/Map;Lorg/json/JSONObject;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

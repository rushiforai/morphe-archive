.class public final synthetic Ll/y4t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# instance fields
.field public final synthetic a:Ll/z4t0;


# direct methods
.method public synthetic constructor <init>(Ll/z4t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y4t0;->a:Ll/z4t0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y4t0;->a:Ll/z4t0;

    .line 2
    .line 3
    check-cast p1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/z4t0;->b(Lorg/json/JSONObject;)Ljava/lang/Void;

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

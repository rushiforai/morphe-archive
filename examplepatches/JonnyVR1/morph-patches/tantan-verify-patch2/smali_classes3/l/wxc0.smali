.class public final synthetic Ll/wxc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/adj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/hyc0;

    invoke-interface {p1}, Ll/hyc0;->asString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

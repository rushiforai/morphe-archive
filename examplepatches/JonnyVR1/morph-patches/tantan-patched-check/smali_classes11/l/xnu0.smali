.class public final synthetic Ll/xnu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wit0;


# direct methods
.method public synthetic constructor <init>(Ll/wit0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xnu0;->a:Ll/wit0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    new-instance v0, Ll/l01;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/xnu0;->a:Ll/wit0;

    .line 7
    .line 8
    const-string v1, "onSdkImpression"

    .line 9
    .line 10
    invoke-interface {p0, v1, v0}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

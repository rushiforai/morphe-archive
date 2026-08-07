.class public final synthetic Ll/x080;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/b180;


# direct methods
.method public synthetic constructor <init>(Ll/b180;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x080;->a:Ll/b180;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x080;->a:Ll/b180;

    invoke-static {p0}, Ll/b180;->O3(Ll/b180;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

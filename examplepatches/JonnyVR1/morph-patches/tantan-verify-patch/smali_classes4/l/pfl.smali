.class public final synthetic Ll/pfl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/yfl;


# direct methods
.method public synthetic constructor <init>(Ll/yfl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pfl;->a:Ll/yfl;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pfl;->a:Ll/yfl;

    invoke-static {p0}, Ll/yfl;->e(Ll/yfl;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

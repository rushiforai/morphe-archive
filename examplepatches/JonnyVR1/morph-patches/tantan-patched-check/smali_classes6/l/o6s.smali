.class public final synthetic Ll/o6s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/p6s;


# direct methods
.method public synthetic constructor <init>(Ll/p6s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o6s;->a:Ll/p6s;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o6s;->a:Ll/p6s;

    invoke-static {p0}, Ll/p6s;->o0(Ll/p6s;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

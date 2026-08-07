.class public final synthetic Ll/ls9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/gwl;


# direct methods
.method public synthetic constructor <init>(Ll/gwl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ls9;->a:Ll/gwl;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ls9;->a:Ll/gwl;

    invoke-interface {p0}, Ll/gwl;->Z0()V

    return-void
.end method

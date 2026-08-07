.class public final synthetic Ll/c650;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/d650;


# direct methods
.method public synthetic constructor <init>(Ll/d650;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c650;->a:Ll/d650;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c650;->a:Ll/d650;

    invoke-virtual {p0}, Ll/d650;->dismiss()V

    return-void
.end method

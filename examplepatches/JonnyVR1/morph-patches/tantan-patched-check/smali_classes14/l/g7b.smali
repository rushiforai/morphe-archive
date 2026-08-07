.class public final synthetic Ll/g7b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/j7b;


# direct methods
.method public synthetic constructor <init>(Ll/j7b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g7b;->a:Ll/j7b;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g7b;->a:Ll/j7b;

    invoke-static {p0}, Ll/j7b;->h3(Ll/j7b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

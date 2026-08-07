.class public final synthetic Ll/i080;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/j080;


# direct methods
.method public synthetic constructor <init>(Ll/j080;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i080;->a:Ll/j080;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i080;->a:Ll/j080;

    invoke-static {p0}, Ll/j080;->P3(Ll/j080;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

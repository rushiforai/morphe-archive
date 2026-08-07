.class public final synthetic Ll/jug;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/mug;


# direct methods
.method public synthetic constructor <init>(Ll/mug;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jug;->a:Ll/mug;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jug;->a:Ll/mug;

    invoke-static {p0}, Ll/mug;->a(Ll/mug;)V

    return-void
.end method

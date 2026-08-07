.class public final synthetic Ll/qpu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/spu;


# direct methods
.method public synthetic constructor <init>(Ll/spu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qpu;->a:Ll/spu;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qpu;->a:Ll/spu;

    invoke-static {p0}, Ll/spu;->i3(Ll/spu;)V

    return-void
.end method

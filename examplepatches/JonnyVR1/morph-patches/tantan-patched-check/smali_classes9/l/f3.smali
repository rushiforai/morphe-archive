.class public final synthetic Ll/f3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/g4;


# direct methods
.method public synthetic constructor <init>(Ll/g4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f3;->a:Ll/g4;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f3;->a:Ll/g4;

    invoke-virtual {p0}, Ll/g4;->p4()Lrx/c;

    move-result-object p0

    return-object p0
.end method

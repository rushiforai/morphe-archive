.class public final synthetic Ll/can;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jan;


# direct methods
.method public synthetic constructor <init>(Ll/jan;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/can;->a:Ll/jan;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/can;->a:Ll/jan;

    invoke-static {p0}, Ll/jan;->f3(Ll/jan;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

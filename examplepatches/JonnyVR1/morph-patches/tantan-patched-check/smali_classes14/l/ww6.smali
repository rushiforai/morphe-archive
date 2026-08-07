.class public final synthetic Ll/ww6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dx6;


# direct methods
.method public synthetic constructor <init>(Ll/dx6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ww6;->a:Ll/dx6;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww6;->a:Ll/dx6;

    invoke-static {p0}, Ll/dx6;->c3(Ll/dx6;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

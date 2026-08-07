.class public final synthetic Ll/w99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/z99;


# direct methods
.method public synthetic constructor <init>(Ll/z99;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w99;->a:Ll/z99;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w99;->a:Ll/z99;

    invoke-static {p0}, Ll/z99;->b3(Ll/z99;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

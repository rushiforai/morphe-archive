.class public final synthetic Ll/a4a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/f4a;


# direct methods
.method public synthetic constructor <init>(Ll/f4a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a4a;->a:Ll/f4a;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a4a;->a:Ll/f4a;

    invoke-static {p0}, Ll/f4a;->o3(Ll/f4a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

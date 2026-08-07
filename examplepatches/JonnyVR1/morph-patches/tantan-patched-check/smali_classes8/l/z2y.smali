.class public final synthetic Ll/z2y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/b3y;


# direct methods
.method public synthetic constructor <init>(Ll/b3y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z2y;->a:Ll/b3y;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z2y;->a:Ll/b3y;

    invoke-static {p0}, Ll/b3y;->a(Ll/b3y;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

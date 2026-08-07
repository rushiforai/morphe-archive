.class public final synthetic Ll/end;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/hnd;


# direct methods
.method public synthetic constructor <init>(Ll/hnd;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/end;->a:Ll/hnd;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/end;->a:Ll/hnd;

    invoke-static {p0}, Ll/hnd;->j(Ll/hnd;)V

    return-void
.end method

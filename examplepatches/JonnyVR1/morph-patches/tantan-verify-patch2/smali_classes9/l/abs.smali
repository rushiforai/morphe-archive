.class public final synthetic Ll/abs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/bbs;


# direct methods
.method public synthetic constructor <init>(Ll/bbs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/abs;->a:Ll/bbs;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/abs;->a:Ll/bbs;

    invoke-static {p0}, Ll/bbs;->d(Ll/bbs;)V

    return-void
.end method

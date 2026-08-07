.class public final synthetic Ll/xq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bpw;


# instance fields
.field public final synthetic a:Ll/dr;


# direct methods
.method public synthetic constructor <init>(Ll/dr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xq;->a:Ll/dr;

    return-void
.end method


# virtual methods
.method public final onError(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xq;->a:Ll/dr;

    invoke-static {p0, p1, p2}, Ll/dr;->a(Ll/dr;II)V

    return-void
.end method

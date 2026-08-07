.class public final synthetic Ll/emj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/fmj;

.field public final synthetic b:D

.field public final synthetic c:D


# direct methods
.method public synthetic constructor <init>(Ll/fmj;DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/emj;->a:Ll/fmj;

    iput-wide p2, p0, Ll/emj;->b:D

    iput-wide p4, p0, Ll/emj;->c:D

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/emj;->a:Ll/fmj;

    iget-wide v1, p0, Ll/emj;->b:D

    iget-wide v3, p0, Ll/emj;->c:D

    invoke-static {v0, v1, v2, v3, v4}, Ll/fmj;->a(Ll/fmj;DD)Lrx/c;

    move-result-object p0

    return-object p0
.end method

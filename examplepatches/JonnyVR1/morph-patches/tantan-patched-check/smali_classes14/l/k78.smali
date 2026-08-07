.class public final synthetic Ll/k78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k78;->a:Ljava/lang/String;

    iput-wide p2, p0, Ll/k78;->b:D

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k78;->a:Ljava/lang/String;

    iget-wide v1, p0, Ll/k78;->b:D

    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Na(Ljava/lang/String;D)V

    return-void
.end method

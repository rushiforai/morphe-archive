.class public final synthetic Ll/kzz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:D


# direct methods
.method public synthetic constructor <init>(D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/kzz;->a:D

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/kzz;->a:D

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p1}, Ll/qzz;->e(DLjava/lang/Long;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

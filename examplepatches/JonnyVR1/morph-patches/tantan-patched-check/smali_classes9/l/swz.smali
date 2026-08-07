.class public final synthetic Ll/swz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yxz;

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(Ll/yxz;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/swz;->a:Ll/yxz;

    iput-wide p2, p0, Ll/swz;->b:D

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/swz;->a:Ll/yxz;

    iget-wide v1, p0, Ll/swz;->b:D

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p1}, Ll/yxz;->Z2(Ll/yxz;DLl/uxj0;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

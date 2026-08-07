.class public Ll/yxz$d;
.super Ll/pn50;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yxz;->U3()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Ll/yxz;


# direct methods
.method public constructor <init>(Ll/yxz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz$d;->b:Ll/yxz;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/pn50;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/pn50;->b(II)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/yxz$d;->b:Ll/yxz;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/qzz;->e0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

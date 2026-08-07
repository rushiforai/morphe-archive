.class public Ll/lgz$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ujh0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lgz;->v2(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/lgz;


# direct methods
.method public constructor <init>(Ll/lgz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lgz$a;->a:Ll/lgz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public E0(ZFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public G0()V
    .locals 0

    .line 1
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lgz$a;->a:Ll/lgz;

    .line 2
    .line 3
    iget-object v0, v0, Ll/lgz;->P1:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/lgz$a;->a:Ll/lgz;

    .line 16
    .line 17
    iget-object p0, p0, Ll/lgz;->P1:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

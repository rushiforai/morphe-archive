.class public Ll/d3z$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d3z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/d3z;


# direct methods
.method public constructor <init>(Ll/d3z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d3z$d;->a:Ll/d3z;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d3z$d;->a:Ll/d3z;

    .line 2
    .line 3
    invoke-static {v0}, Ll/d3z;->U(Ll/d3z;)Ll/u1z;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/u1z;->E1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/d3z$d;->a:Ll/d3z;

    .line 14
    .line 15
    invoke-static {p0}, Ll/d3z;->W(Ll/d3z;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

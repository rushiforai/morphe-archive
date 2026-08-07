.class public final Ll/xrg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mug0;


# direct methods
.method public constructor <init>(Ll/mug0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xrg0;->a:Ll/mug0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xrg0;->a:Ll/mug0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mug0;->a(Ll/mug0;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/mug0;->startASR(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/xrg0;->a:Ll/mug0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/mug0;->g:Ll/xrg0;

    .line 14
    .line 15
    return-void
.end method

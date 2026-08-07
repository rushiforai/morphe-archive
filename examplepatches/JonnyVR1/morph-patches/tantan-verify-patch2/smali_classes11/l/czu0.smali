.class public final synthetic Ll/czu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/o2v0;

.field public final synthetic b:Ll/p1m;


# direct methods
.method public synthetic constructor <init>(Ll/o2v0;Ll/p1m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/czu0;->a:Ll/o2v0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/czu0;->b:Ll/p1m;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/czu0;->a:Ll/o2v0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/czu0;->b:Ll/p1m;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/o2v0;->o(Ll/p1m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

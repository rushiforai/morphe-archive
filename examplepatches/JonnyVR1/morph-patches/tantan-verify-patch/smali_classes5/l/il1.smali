.class public final synthetic Ll/il1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ll1;

.field public final synthetic b:Ll/p0k0$b;


# direct methods
.method public synthetic constructor <init>(Ll/ll1;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/il1;->a:Ll/ll1;

    iput-object p2, p0, Ll/il1;->b:Ll/p0k0$b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/il1;->a:Ll/ll1;

    iget-object p0, p0, Ll/il1;->b:Ll/p0k0$b;

    invoke-static {v0, p0}, Ll/ll1;->m0(Ll/ll1;Ll/p0k0$b;)V

    return-void
.end method

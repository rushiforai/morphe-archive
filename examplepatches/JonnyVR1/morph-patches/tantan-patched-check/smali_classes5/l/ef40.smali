.class public final synthetic Ll/ef40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/if40;


# direct methods
.method public synthetic constructor <init>(Ll/if40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ef40;->a:Ll/if40;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ef40;->a:Ll/if40;

    invoke-static {p0}, Ll/if40;->o0(Ll/if40;)V

    return-void
.end method

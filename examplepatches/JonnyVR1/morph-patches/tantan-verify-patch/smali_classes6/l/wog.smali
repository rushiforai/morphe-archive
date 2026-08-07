.class public final synthetic Ll/wog;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/lpg;


# direct methods
.method public synthetic constructor <init>(Ll/lpg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wog;->a:Ll/lpg;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wog;->a:Ll/lpg;

    invoke-static {p0}, Ll/lpg;->l(Ll/lpg;)V

    return-void
.end method

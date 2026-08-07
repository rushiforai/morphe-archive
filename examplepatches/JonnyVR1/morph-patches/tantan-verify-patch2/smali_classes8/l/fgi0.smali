.class public final synthetic Ll/fgi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/igi0;

.field public final synthetic b:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Ll/igi0;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fgi0;->a:Ll/igi0;

    iput-object p2, p0, Ll/fgi0;->b:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fgi0;->a:Ll/igi0;

    iget-object p0, p0, Ll/fgi0;->b:Ll/xc00;

    invoke-static {v0, p0}, Ll/igi0;->L(Ll/igi0;Ll/xc00;)V

    return-void
.end method

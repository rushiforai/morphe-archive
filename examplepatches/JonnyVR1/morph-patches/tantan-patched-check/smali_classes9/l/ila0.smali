.class public final synthetic Ll/ila0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ima0;


# direct methods
.method public synthetic constructor <init>(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ila0;->a:Ll/ima0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ila0;->a:Ll/ima0;

    invoke-static {p0}, Ll/ima0;->s(Ll/ima0;)V

    return-void
.end method

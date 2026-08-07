.class public final synthetic Ll/eis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bjs;

.field public final synthetic b:Ll/xxj;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eis;->a:Ll/bjs;

    iput-object p2, p0, Ll/eis;->b:Ll/xxj;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eis;->a:Ll/bjs;

    iget-object p0, p0, Ll/eis;->b:Ll/xxj;

    invoke-static {v0, p0}, Ll/bjs;->c4(Ll/bjs;Ll/xxj;)V

    return-void
.end method

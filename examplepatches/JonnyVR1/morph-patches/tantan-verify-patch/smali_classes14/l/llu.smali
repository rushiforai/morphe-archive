.class public final synthetic Ll/llu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vlu;

.field public final synthetic b:Ll/xxj;


# direct methods
.method public synthetic constructor <init>(Ll/vlu;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/llu;->a:Ll/vlu;

    iput-object p2, p0, Ll/llu;->b:Ll/xxj;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/llu;->a:Ll/vlu;

    iget-object p0, p0, Ll/llu;->b:Ll/xxj;

    invoke-static {v0, p0}, Ll/vlu;->c3(Ll/vlu;Ll/xxj;)V

    return-void
.end method

.class public final synthetic Ll/jll0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/lll0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/lll0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jll0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/jll0;->b:Ll/lll0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jll0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/jll0;->b:Ll/lll0;

    invoke-static {v0, p0}, Ll/lll0;->a(Ljava/lang/String;Ll/lll0;)V

    return-void
.end method
